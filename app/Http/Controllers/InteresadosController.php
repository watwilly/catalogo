<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use \App\Models\Post as post;
use \App\Models\Interesados as interesados;
use App\Mail\interesados as emailInteresados;
use Mail;
use Voyager;
use Auth;

class InteresadosController extends Controller
{
 
    public function store(Request $request)
    {
        $post = post::select("id","title")->where("id", $request->postId)->first();

        if (is_null($post)) {
            return response()->json(["status"=>"error","msg"=>"La publicacion no esta disponible, recqargue su navegador y intente de nuevo"]);
        }


        if (!$request->consulta) {
            return response()->json(["status"=>"error","msg"=>"Escriba la consulta"]);
        }

        $user = Auth::user();

        $consulta = new interesados();
        $consulta->user_id=$user->id;
        $consulta->mensaje = $request->consulta;
        $create=$post->interesadosId()->save($consulta);
        
        if ($create) {
            Mail::to(setting('site.erc'))
                ->send(new emailInteresados(setting('site.erc'), $request->consulta, $post, $user, $create));
            
            return response()->json(["status"=>"success","msg"=>"Hemos enviado tu consulta al vendedor"]);
        }
        return response()->json(["status"=>"error","msg"=>"Ocurrio un error al enviar la consulta intente de nuevo mas tarde"]);

    }

    public function autoload($pubId)
    {
        $post = post::select("id")->where("id", $pubId)->first();
        if (is_null($post)) {
            return false;
        }
        $consultas = $post->interesadosId()->orderBy("created_at", 'DESC')->get();

        return view("interesados.autoload", compact("consultas"));
    }
}
