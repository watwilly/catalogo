<?php 

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;
use \App\Models\Carritos as carrito;

class SharedController extends Controller
{
    public function compartir_pedido($carrito_id)
    {	
        $carrito=carrito::where('id',$carrito_id)->where('status','<>','approved')->first();
        if (is_null($carrito)) {
            return redirect("/")->with(["operation_status"=>"error","operation_message"=>"Este carrito ya no esta disponible"]);
        }
        $detalle=$carrito->carritoitemsId()->get();
        return view('shared.carrito_compartido', compact("carrito","detalle"));
    }
}


