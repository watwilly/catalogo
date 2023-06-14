<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use \App\Models\Category as categorias;
use \App\Models\Marcas as marcas;
use Session;
use Voyager;
class CategoryController extends Controller
{
	
	public function index(Request $request)
	{	
		$getCategory = categorias::where('id', $request->id)->first();
		if (is_null($getCategory)) {
            return redirect()->back()->with(['status'=>'danger', 'msg'=>'Esta categoría no esta disponible por el momento']);
		}

		if (is_null($getCategory->parent_id)) {
			$pub = $getCategory->posts();
		}else{
			$pub = $getCategory->postpersubCategory();
		}	
		$pub->select('id','title','precios','category_id','subcategoryId','marca_id','modelo_id');
		$pub->where('status', 'PUBLISHED');

		if ($cat_id = $request->category) {
			$pub->where('subcategoryId', $cat_id);
		}
		if ($cat_condicion = Session::get('catCondicion')) {
			$pub->where('condicion', $cat_condicion);
		}
		if ($cat_marca = Session::get('catMarca')) {
			$pub->where('marca_id', $cat_marca);
		}
		if ($cat_modelo = Session::get('catModelo')) {
			$pub->where('Modelos_id', $cat_modelo);
		}
		if ($price_rangue = Session::get('catPriceRangue')) {
			$pub->where('precios', '<=', $price_rangue);
		}
        if ($orden = Session::get('catOrden')) {
            if ($orden == "AAZ") {
                $pub->OrderBy('title', 'ASC');

            }elseif($orden == "ZAA"){
                $pub->OrderBy('title', 'DESC');

            }else{
                $pub->OrderBy('precios', $orden);
            }
        }else{
            $pub->orderBy('created_at', 'DESC');
        }
		$render = $pub->paginate(20);
       
        $marcas     =  [];
        $modelos    =  [];
        
        $categorias = $getCategory->subcategoryId()->select("id","name")->whereHas('postpersubCategory', function ($query) {
            $query->where('status', 'PUBLISHED');
        })->get();

        $productos  =  []; 



        if ($render->count() > 0) {
        	foreach ($render as $allpub) {
                $marca    = $allpub->marca()->first();
                $modelo   = $allpub->modelo()->first();
                $imagen   = $allpub->postimagenes()->select('imagen')->orderBy('orden', 'ASC')->take(1)->first();                                                      
                
                $setImg = $imagen ? $imagen->imagen:null;
             

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
               $productos[] = [
                    "id"=>$allpub->id,
                    "title"=>$allpub->title,
                    "precios"=>$allpub->precios,
                    "imagen"=>$setImg,
               ];

        	}
        }
        $this->dropSearchSession();
        
        return view('category.index')
        ->with('productos', $productos)
        ->with('render', $render)
        ->with('category',$getCategory)
        ->with('marcas', $marcas)
        ->with('modelos',$modelos)
        ->with('categorias', $categorias);
	}


    public function all()
    {
        $parent = categorias::whereNull('parent_id')->orderBy('name', 'ASC')->get();
        $marcas = marcas::orderBy('name', 'ASC')->get();
        return view('category.all')
            ->with('marcas', $marcas)
            ->with('parent', $parent);
    }
}
