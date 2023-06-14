<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use \App\Models\Post as post;
use \App\Models\CarritoItems as detalle;
use \App\Models\Carritos as carrito;
use Auth;
use Session;

class CarritoController extends Controller
{
  public function selectpostAtribute(Request $request)
  {
 	Session([$request->atributo."_id"=>$request->atributo_id]);
  }

  public function index()
  {
  	$GetUsercarrito=$this->getCarrito();
	
	$carrito = $GetUsercarrito["carrito"];
	$items = $GetUsercarrito["items"];

  	return view("auth.carrito.index", compact("carrito", "items"));
  }

  public function addtoCart(Request $request)
  {
 	$post = post::select("id")->where('id',$request->post_id)->where("status","PUBLISHED")->first();
 	if (is_null($post)) {
 		return response()->json(["status"=>"danger","msg"=>"Ocurrio un error al agregar el producto al carrito de compras"]);
 	}

 	$user = Auth::user();
 	
	$carrito = $user->carritosId()->where("status","pending")->orderBy('created_at','DESC')->first(); 	

	if (is_null($carrito)) {
		$create = new carrito();
		$create->status ="pending";
		$carrito = $user->carritosId()->save($create);
	}
	$getColor = null;
	$getTalle = null;

	$color = $post->postscolores();
	$talle = $post->poststalles();

	$colorId = Session::get('color_id');
	$getColor = $color->where('color_id', $colorId)->first() ?: null;
	if (!$getColor && $color->count() > 0) {
		return response()->json(["status"=>"danger","msg"=>"Seleccione un color para poder continuar"]);
	}

	$talleId = Session::get('talle_id');
	$getTalle = $talle->where('talle_id', $talleId)->first() ?: null;
	if (!$getTalle && $color->count()>0) {
 		return response()->json(["status"=>"danger","msg"=>"Seleccione un Talle para poder continuar"]);
	}

	$items = $carrito->carritoitemsId()->where('post_id', $post->id)->first();

	$detalle = new detalle();
	$detalle->post_id = $post->id;

	if (!is_null($getTalle)) {
		$detalle->talle_id=$getTalle->talle_id;
	}
	if (!is_null($getColor)) {
		$detalle->color_id=$getColor->color_id;
	}	

	$detalle->cantidad=$request->cantidad;
	$items = $carrito->carritoitemsId()->save($detalle);	

	if ($items) {
 		Session::forget('color_id');
 		Session::forget('talle_id');
 		if ($request->rightnow) {
 			return response()->json(["url"=>"/checkout/pre-payment",  "status"=>"success","msg"=>"El producto ha sido agregado a su carrito de compras"]);
 		}
 		return response()->json(["status"=>"success","msg"=>"El producto ha sido agregado a su carrito de compras"]);
	}else{
 		return response()->json(["status"=>"danger","msg"=>"Ocurrio un error al agregar el producto al carrito de compras"]);
	}
  }

  public function update_cantidad(Request $request)
  {
	if (!$request->cantidad) {
		return Response()->json(["response"=>"notQuantity"]);
	}

 	$user = Auth::user();
	$carrito = $user->carritosId()->orderBy('created_at','DESC')->first(); 	

	if (is_null($carrito)) {
		return Response()->json(["response"=>false]);
	}
	$items = $carrito->carritoitemsId()->where('id',$request->item_id)->first();

	$items->cantidad=$request->cantidad;
	$update=$items->save();

	if ($update) {
		return Response()->json(["response"=>true]);
	}else{
		return Response()->json(["response"=>false]);
	}
  }

  public function delete($id)
  {
 	$user = Auth::user();
	$carrito = $user->carritosId()->orderBy('created_at','DESC')->first(); 	

	if (is_null($carrito)) {
 		return redirect()->back()->with(["status"=>"error","msg"=>"Ocurrio un error intente de nuevo mas tarde"]);
	}
	$items = $carrito->carritoitemsId()->where('id',$id)->first();

	if (is_null($items)) {
 		return redirect()->back()->with(["status"=>"error","msg"=>"Ocurrio un error intente de nuevo mas tarde"]);
	}

	$trash=$items->delete();

	if ($trash) {
 		return redirect()->back()->with(["status"=>"success","msg"=>"Item quitado del carrito"]);
	}else{
 		return redirect()->back()->with(["status"=>"error","msg"=>"Ocurrio un error intente de nuevo mas tarde"]);
	}
  }
}
