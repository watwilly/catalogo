<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use \App\Models\Post as post;
use App\Mail\reportes as emailreportes;
use \App\Models\Reportes as reportes;
use Session;
use Auth;
use Mail;
use Voyager;

class PostController extends Controller
{
	
	public function show(Request $request)
	{  
        $publicacion = post::select('posts.id','posts.category_id','subcategoryId','marca_id','modelo_id','title','body','precios','descuento', 'cantidad', 'categories.name as category_name', 'getsubcat.name as subcategory_name', 'posts.created_at', 'ma.name as ma_name', 'mo.name as mo_name', 'old_img')
        ->leftJoin('categories', 'posts.category_id', '=', 'categories.id')
        ->leftJoin('categories as getsubcat', 'posts.subcategoryId', '=', 'getsubcat.id')
        ->leftJoin('marcas as ma', 'posts.marca_id', '=', 'ma.id')
        ->leftJoin('modelos as mo', 'posts.modelo_id', '=', 'mo.id')
        ->where('posts.id', $request->id)->where('status', 'PUBLISHED')->take(1)->first();
       
        if (is_null($publicacion)) {
            return redirect('/')->with(['status'=>'danger', 'msg'=>'Producto no disponible o ha sido eliminado', 'operation_notif'=>'PUBLICACION NO DISPONIBLE']);
        }

        $talles = $publicacion->poststalles()->get();
        $colores = $publicacion->postscolores()->get();
        $imagenes = $publicacion->postimagenes()->select('id','imagen')->take(6)->get();

        if (!is_null($publicacion->subcategoryId)) {
            Session::put(['interest'=>$publicacion->subcategoryId]);
        }

        $simil = post::select('posts.id', 'title', 'precios', 'categories.name')
        ->join('categories', 'posts.category_id', '=', 'categories.id')
        ->where('posts.status', 'PUBLISHED')
        ->where('posts.id', '!=', $request->id)
        ->where('category_id', $publicacion->category_id)
        ->orderBy('posts.updated_at', 'DESC')->take(12)->get();

        //$consultas = $publicacion->interesadosId()->orderBy("created_at", 'DESC')->get();


        $visit = $publicacion->postvisitas()->take(1)->lockForUpdate();
        $cantidad = NULL;        
        if ($visit->count() > 0) {
        	$update = $visit->first();
        	$update->cant_visita = $update->cant_visita + 1;
        	$update->save();
            $cantidad = $update->cant_visita;
        }else{
        	$atribute = [
        		"cant_visita" => 1
        	];
        	$visit->create($atribute);
        }
        

        $this->dropallsession();

        $view ="post.show";
     
        return view($view)
        	->with('post', $publicacion)
            ->with('talles', $talles)
            ->with('colores', $colores)
           // ->with("consultas",$consultas)
            ->with("simil",$simil)
            ->with('cant_visitas',$cantidad )
            ->with('imagenes', $imagenes);

	}

   /* public function reportes(Request $request)
    {
        if ($request->detalle_reporte) {
            $post = post::select('id', 'user_id')->where('id', $request->post_id)->first();
            if (is_null($post)) {
                return redirect('/')->with(['status'=>'danger', 'msg'=>'Producto no disponible o ha sido eliminado']);
            }

            $atributos = [
                "user_id"=>$post->user_id,
                "post_id"=>$post->id,
                "detalle_reporte"=>$request->detalle_reporte
            ];

            $create = reportes::create($atributos);

            if ($create) {
            Mail::to(Voyager::setting('site.from'))
                ->send(new emailreportes($post->id, $post->user_id, $request->detalle_reporte));
                return redirect()->back()->with(['status'=>'success', 'msg'=>'Gracias por ayudarnos a controlar los contenidos de nuestro sitio, a la brevedad revisaremos tu reporte.']);
            }else{
                return redirect()->back()->with(['status'=>'danger', 'msg'=>'Ocurrio un error interno intente de nuevo mas tarde']);
            }

        }else{
            return redirect()->back()->with(['status'=>'danger', 'msg'=>'Ingrese el motivo por el cual reporta esta publicacion como inadecuada']);
        }
    }*/
}