<?php

namespace TCG\Voyager\Http\Controllers\Traits;

/**
 * 
 */
use DB;
use \App\Models\Post as product;
use Carbon\Carbon as carbon;
use Barryvdh\DomPDF\Facade\Pdf;

trait TraitPost
{
    protected function TRchangue_prices($postId, $new_price)
    {   
        $id = intval($postId);
        $price = intval($new_price);

        if(!is_int($id)){
            return ["status"=>"error", "message"=>"El id del producto tiene que ser numerico"];
        }

        if(!is_int($price)){
            return ["status"=>"error", "message"=>"El precio tiene que ser numerico"];
        }

        $post = product::select("id","precios")->where("id", $id)->first();

        if($post->precios == $price){
            return ["status"=>"info", "message"=>"Ingrese un precio distinto al que tiene el producto actualmente"];
        }

        $post->precios = $price;
        $post->update();

        return ["status"=>"success", "message"=>"El precio ha sido actualizado"];

    }

    protected function TRchangue_status($params)
    {
        if(!$params){
            return ["status"=>"error", "message"=>"Envie los parametros"];
        }

        $get_params = explode("-", $params);

        if(!is_array($get_params)){
            return ["status"=>"error", "message"=>"No hay parametros"];
        }

        $status = $get_params[0];
        $id = $get_params[1];

        $post = product::select("id","status")->where("id", $id)->first();

        if(!$post){
            return ["status"=>"error", "message"=>"No se ha encontrado el producto"];
        }

        $post->status = $status;
        $post->save();

        return ["status"=>"success", "message"=>"El estado ha sido cambiado"];

    }

    protected function TRpostetiqueta($id)
    {
        $id = intval($id);
        if(!is_int($id)){
            throw new \Exception("El id tiene que ser numerico", 1);
        }

        $product = product::select("id", "title", "precios")->where("id",$id)->first();;

        if(!$product){
            throw new \Exception("No se encontro el producto", 1);
            
        }

        try {
            $view = View('voyager::posts.etiqueta', [
                "fecha"=>carbon::now()->todateString(),
                "titulo"=>$product->title,
                "precio"=>$product->precios
            ]);
            
            $pdf = PDF::loadHtml($view);
            return $pdf->stream();

        } catch (\Throwable $th) {
            throw new \Exception("Ocurrio un error: ".$th->getMessage(), 1);
            
        }

    }

    public function TRprintslabels($categoryId=null, $title=null)
    {
        $query = product::select("id", "title", "precios")->where("status", "PUBLISHED");

        if ($categoryId) {
            $query->where(function($query) use ($categoryId) {
                $query->where("category_id", $categoryId)
                      ->orWhere("subcategoryId", $categoryId);
            });
        }
        if($title){
            $cadena = str_slug($title, ' ');
            $array = explode(" ", $cadena);
            foreach ($array as $valores) {
                $condicion[] = ["title", "LIKE", "%".$valores."%"];
            }
            $query->where($condicion); #Esta condicion se aplica al like
        }
        $url = url()->full();
        $products = $query->orderBy("updated_at","DESC")->paginate(100)->setPath($url);
        
        if ($products->isEmpty()) {
            throw new \Exception("No hay productos");
        }
        
        return $products;
    }

    public function TRpostetiquetas($productos)
    {
        try {
            $data = json_decode($productos);

            if (count($data)>0) {

                $view = View('voyager::posts.etiquetas', [
                    "fecha"=>carbon::now()->todateString(),
                    "productos"=>$data
                ]);
                return $view;
                $pdf = PDF::loadHtml($view);
                return $pdf->stream();

            }
            throw new \Exception("No hay productos para imprimir", 1);

        } catch (\Throwable $th) {
            throw new \Exception("Ocurrio un error: ".$th->getMessage(), 1);
        }
    }

    public function TFdeletepost($post_id)
    {
        $product = product::where("id", $post_id)->first();
        if(!$product){
            return [
                "status"=>"info",
                "message"=>"Publicacion no encontrada"
            ];
        }
        $imagenes = $product->postscolores()->count() > 0 ? $product->postscolores()->delete() : null;
        $visitas = $product->postvisitas()->count() > 0 ? $product->postvisitas()->delete() : null;
        $inCarrito = $product->detallesId()->count()> 0 ? $product->detallesId()->delete() : null;
        
        $delete = $product->delete();

        $prepareMsg = "Se elimino ";

        if ($imagenes) {
            $prepareMsg .=" las imagenes, ";
        }
        if ($visitas) {
            $prepareMsg .=" las visitas, ";
        }

        if ($inCarrito) {
            $prepareMsg .="los carritos ";
        }

        if($delete){
            $prepareMsg .="la publicacion ";
        }
        return [
            "status"=>"success",
            "message"=>$prepareMsg
        ];
    }
}
