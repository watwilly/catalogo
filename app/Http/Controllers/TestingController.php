<?php
namespace App\Http\Controllers;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Request;
use Mail;
use \App\Mail\ConfPayment as confpayment;

use \App\Models\Payments as pagos;
use Carbon\Carbon as carbon;
use \App\Models\Post as product;

class TestingController extends Controller
{

    /**
     * En esta prueba vamos a enviar mails a los administradores del sitio sobre los pedidos
     * que estan aprovados 
     * 
     */
    public function testing(Request $request)
    {   
        try {

        $productos = product::where("status", "DRAFT")->limit(50)->get();
        $prepareMsg = "Se elimino ";

        foreach ($productos as $product) {

            $imagenes = $product->postscolores()->count() > 0 ? $product->postscolores()->delete() : null;
            $visitas = $product->postvisitas()->count() > 0 ? $product->postvisitas()->delete() : null;
            $inCarrito = $product->detallesId()->count()> 0 ? $product->detallesId()->delete() : null;
            
            $delete = $product->delete();


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
        }

        $data =  [
            "status"=>"success",
            "message"=>$prepareMsg
        ];

        dd($data);

        } catch (\Throwable $th) {
            dd($th->getMessage());
        }
    }

}