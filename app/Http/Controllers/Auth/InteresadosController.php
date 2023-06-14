<?php

namespace App\Http\Controllers\Auth;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use App\Mail\interesadosresponse as answered;
use \App\Models\Interesados as interesados; 
use Illuminate\Mail\Message;
use Mail;
use Response;
use Auth;
use DB;

class InteresadosController extends Controller
{	

    public function index(Request $request)
    {	    
        $user = Auth::user();

        $concultas = DB::table("interesados as i")->select("i.id","i.mensaje","p.title", "i.answered", "i.created_at as fecha")
        ->join("posts as p", "i.post_id","=","p.id")
        ->where("i.user_id", $user->id);

        if ($fecha=$request->fecha) {
            $concultas->whereDate("i.created_at",$fecha);
        }
        if ($name=$request->name) {
            $concultas->where("posts.title", "LIKE","%".$name."%");
        }
        if ($orden=$request->orden) {
            $concultas->orderBy("i.created_at",$orden);
        }else{
            $concultas->orderBy("i.created_at","DESC");
        }
    	$interesados = $concultas->get();

        return view('auth.intereses.index')
            ->with('interesados', $interesados);
    }

   /* public function answered(Request $request)
    {
    	$question = interesados::select("interesados.id","interesados.answered", "p.id as pId", "p.title","interesados.mensaje", "u.email as interesadoemail")->where('interesados.id',$request->consultaId)
    	->join("users as u", "interesados.user_id", "=","u.id")
        ->join("posts as p", "interesados.post_id","=","p.id")->whereNull("interesados.answered")->first();

    	if (!$question) {
    		return Response()->json(["status"=>"error","msg"=>"Esta pregunta no esta disponible o ha sido respondida"]);
    	}
        $title = $question->title;
    	$question->answered = $request->answered;
    	$response = $question->save();


        Mail::to($question->interesadoemail)
            ->send(new answered($question->mensaje, $title, $request->answered));
    	
        if ($response) {
    		return Response()->json(["status"=>"success","msg"=>"Su respuesta ha sido enviada"]);
    	}
    	return Response()->json(["status"=>"error","msg"=>"Ocurrio un error intente de nuevo mas tarde"]);

    }*/
}
