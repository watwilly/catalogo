<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use \App\Models\Slider as slider;
use \App\Models\Category as category;
use \App\Models\Post as post;
use DB;
use Session;
use \App\Mail\contacto as contacto;
use Mail;
use Voyager;
use \App\Models\PostVisitas as visitas;
use Carbon\Carbon;

class HomeController extends Controller
{   

    public function index()
    {   


        $this->dropallsession();

        $sliders = slider::where('active', 1)
               ->orderBy('created_at', 'desc')
               ->get();

        $categorias = category::where('posicion', 1)->orderBy('order', 'ASC')->get();
        

        $ofertas = post::select( DB::raw('posts.id, category_id, precios, title, categories.id as catid, categories.name, categories.posicion'))
            ->join('categories', 'posts.category_id', '=', 'categories.id')
            ->where('categories.posicion', 0)
            ->where('posts.status', 'PUBLISHED')
            ->where('posts.precios', '<', 2000)
            ->take(16)
            ->inRandomOrder()
            ->get();

        $now = Carbon::today()->subDay(3);
        $today = Carbon::today();

        $visitas = visitas::select('posts_visitas.id as visitaId', 'prd.id', 'category_id', 'precios', 'title', 'categories.id as catid', 'categories.name', 'posts_visitas.cant_visita')
            ->join('posts as prd', 'posts_visitas.posts_id', '=', 'prd.id')
            ->join('categories', 'prd.category_id', '=', 'categories.id')
            ->where('prd.status', 'PUBLISHED')
            ->whereDate('posts_visitas.updated_at','>=', $now)
            ->whereDate('posts_visitas.updated_at', '<=', $today)
            ->inRandomOrder()
            ->take(12)
            ->get();

     
        return view('home.index')
            ->with('visitas',$visitas)
            ->with('interes', $this->get_interes())
            ->with('categorias', $categorias)
            ->with('ofertas',$ofertas)
            ->with('sliders', $sliders);
    }

    public function listaLocalidades(Request $request)
    {
        $localidades = DB::table("localidades")->where('provincias_id', $request->elegido)
            ->get();

        foreach ($localidades as $localidad) {
           ?><option value="<?=$localidad->id?>" ><?=$localidad->localidad?></option><?php
        }
    }

    public function search(Request $request)
    {   
       if (!$request->data) {
            return redirect()->back()->with(['status'=>'info', 'msg'=>'Escriba algo para buscar']);
       }
        $cadena = str_slug($request->data, ' ');
        $array = explode(" ", $cadena);

        $query = post::query();
        $query->select('id', 'title', 'category_id', 'subcategoryId', 'marca_id', 'modelo_id','precios', 'old_img');
        $query->where('status', 'PUBLISHED');


        if ($seaCondition = Session::get('seaCondition')) {
            $query->where('condicion', $seaCondition);
        }

        if($cat_id = $request->category){
            $query->where('category_id', $cat_id);
        }

        if ($seaModel = Session::get('seaModel')) {
            $query->where('modelo_id', $seaModel);
        }

        if ($seaMarca = Session::get('seaMarca')) {
            $query->where('marca_id', $seaMarca);
        }

        foreach ($array as $valores) {
            $condicion[] = ["title", "LIKE", "%".$valores."%"];
        }
        $query->where($condicion); #Esta condicion se aplica al like

        if ($orden = Session::get('seaOrden')) {
            if ($orden == "AAZ") {
                $query->OrderBy('title', 'ASC');

            }elseif($orden == "ZAA"){
                $query->OrderBy('title', 'DESC');

            }else{
                $query->OrderBy('precios', $orden);
            }
        }else{
            $query->orderBy('created_at', 'DESC');
        }
        $url = url()->full();
        $buscador =  $query->paginate(24)->setPath($url);

        $marcas     =  [];
        $modelos    =  [];
        $categorias =  [];
        $productos  =  []; 
        
        if ($buscador->count() > 0) {
            foreach ($buscador as $resultado) {
                $marca    = $resultado->marca()->first();
                $modelo   = $resultado->modelo()->first();
                $category = $resultado->category()->first();
                $imagen =  $resultado->postimagenes()->select('imagen')->orderBy('orden', 'ASC')->take(1)->first();                                                      
                $cate_name = "seccion-tucuman";
            
                $setImg = $imagen ? $imagen->imagen : $resultado->old_img;


               if ($marca){
                    $marcas["marca-".$marca->id] = [
                        "id"=>$marca->id,
                        "name"=>$marca->name
                    ];
               }
               if ($modelo){
                    $modelos["modelo-".$modelo->id] = [
                        "id"=>$modelo->id,
                        "name"=>$modelo->name
                    ];
               }
               if ($category) {
                    $categorias["category-".$category->id] = [
                        "id"=>$category->id,
                        "name"=>$category->name
                    ];
                    $cate_name = $category->name;
               }

               $productos[] = [
                    "id"=>$resultado->id,
                    "title"=>$resultado->title,
                    "precios"=>$resultado->precios,
                    "imagen"=>$setImg,
                    "cat_name"=>$cate_name
               ];
            }
        }

            

        $this->dropCategorySession();

        return view('home.search')
            ->with('busqueda', str_slug($request->data, " "))
            ->with('marcas', $marcas)
            ->with('modelos', $modelos)
            ->with('paginate', $buscador)
            ->with('categorias', $categorias)
            ->with('productos', $productos);
    }

    public function buenosprecios(Request $request)
    {  
        $url = url()->full();
        $query = post::select('id','title','category_id','precios')->where('status', 'PUBLISHED')->whereBetween('precios', [200, 3000]);


        if ($condicion = $request->condicion) {
            $query->where('condicion', $condicion);
        }

        if($cat_id = $request->category_id){
            $query->where('category_id', $cat_id);
        }
      
        if ($orden = $request->orden) {
            if ($orden == "AAZ") {
                $query->OrderBy('title', 'ASC');

            }elseif($orden == "ZAA"){
                $query->OrderBy('title', 'DESC');

            }else{
                $query->OrderBy('precios', $orden);
            }
        }else{
            $query->orderBy('created_at', 'DESC');
        }                
        $post = $query->paginate(22)->setPath($url);
        
        $marcas     =  [];
        $modelos    =  [];
        $categorias =  [];
        $productos  =  []; 

        foreach ($post as $result) {
            $category = $result->category()->first();
            if ($category) {
                $catename = $category->name;
            }else{
                $catename = NULL;
            }
            $imagen   = $result->postimagenes()->select('imagen', 'storage')->orderBy('orden', 'ASC')->take(1)->first();                                                      
                if ($imagen) {
                    $setImg = $imagen->imagen;
                    $storage = $imagen->storage;
                }else{
                    $setImg = NULL;
                    $storage = NULL;
                }
  
               if ($category) {
                    $categorias["category-".$category->id] = [
                        "id"=>$category->id,
                        "name"=>$category->name
                    ];
               }

               $productos[] = [
                    "id"=>$result->id,
                    "title"=>$result->title,
                    "precios"=>$result->precios,
                    "imagen"=>$setImg,
                    "storage"=>$storage,
                    "prdcatname"=>$catename
               ];
        }

       return view('home.buenosprecios')            
            ->with('busqueda', str_slug($request->data, " "))
            ->with('marcas', $marcas)
            ->with('modelos', $modelos)
            ->with('paginate', $post)
            ->with('categorias', $categorias)
            ->with('productos', $productos);
    }

    public function generatesitemap()
    {
        $pub =post::select('posts.id', 'title', 'precios','categories.name')
            ->join('categories','posts.category_id','=','categories.id')
            ->where('status', 'PUBLISHED')
            ->orderBy('.posts.updated_at', 'DESC')
            ->get();
        $categorias = category::orderBy('updated_at', 'DESC')->take(400)->get();
        
        $carbon = new \Carbon\Carbon(); 
        $now = $carbon->now();

        return view('home.sitemap')
         ->with('pub', $pub)
         ->with('now', $now)
         ->with('categorias', $categorias);
    }

    public function contacto()
    {
        return view('home.contacto');
    }
    public function fomcontacto(Request $request)
    {
        #Verify google recaptcha
        $url = "https://www.google.com/recaptcha/api/siteverify";
        $data = [
            "secret"=>setting('site.ccdg'),
            "response"=>$_POST["g-recaptcha-response"]
        ];
        $recaptcha = json_decode(Self::CallAPI("POST",$url, null, $data));
        if($recaptcha->success == false){
            return redirect()->back()->with(["status"=>"danger", "msg"=>"El captcha es obligatorio"]);
        }
        #end recaptcha


        Mail::to(Voyager::setting('site.from'))
            ->send(new contacto($request->name, $request->email, $request->detalle));

        return redirect()->back()->with(['status'=>'success', 'msg'=>'Su mensaje ha sido enviado con exito']);
          
    }

}