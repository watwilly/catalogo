<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Auth;
use \App\Models\Carritos as carritos;
use \App\Models\CarritoItems as items;
//use \MercadoPago\SDK as mpsdk;
use \Carbon\Carbon as carbon; 
use \App\Models\PostImagenes as postimagenes;
use \App\Models\Payments as paid;
use \App\Models\PaymentCompras as compras;
//use \App\Models\PaymentDetails as details;
use \App\Mail\ConfPayment as confpayment;
use \App\Models\PaymentFacturacion as facturacion;
use Mail;
use DB;

class PaymentController extends Controller
{
    public function checkout()
    {	
    	$user = Auth::user();

		$carrito = $this->getCarrito()["carrito"];
		if (is_null($carrito)) {
			return redirect()->back()->with(["status"=>"danger","msg"=>"No se pudo traer el carrito intente de nuevo mas tarde"]);
		}
		$items = $carrito->carritoitemsId()->select("carrito_detalle.id","carrito_detalle.post_id","carrito_detalle.cantidad", "p.title", "p.precios", "carrito_detalle.created_at")
    	->join("carrito as c", "carrito_detalle.carrito_id", "=", "c.id" )
    	->join("posts as p", "carrito_detalle.post_id","=","p.id")
		->where("p.status", "PUBLISHED")
		->orderBy("carrito_detalle.created_at", "DESC")
    	->get();

    	if ($items->count() == 0) {
    		return redirect()->back()->with(["status"=>"danger","msg"=>"El item no esta disponible o ha sido eliminado"]);
    	}

    	return view('auth.payment.checkout', compact("items","user"));
    }

	/**
	 * This method is only to proccess cash payment 
	 */
    public function payment(Request $request)
    {
    	$user = Auth::user();
		$minimo = setting('site.monto_minimo');
 		
		$carrito = $this->getCarrito()["carrito"];
		if (!$carrito) {
			return response()->json(["status"=>"danger","msg"=>"No se pudo traer el carrito intente de nuevo mas tarde"]);
		}
		$trying = isset($carrito->trypayment) ? $carrito->trypayment + 1 : 1;
		$carrito->trypayment = $trying;
		$carrito->save();

		$items = $this->getCarrito()["items"];

 		if ($items->count()==0) {
 			return response()->json(["status"=>"danger","msg"=>"Ocurrio un error al traer el item que quieres comprar intente de nuevo mas tarde"]);
 		}

		$totPayment=0; 

		foreach ($items as $item) {
			$product = $item->postId()->select('id','title', 'body','descuento','precios', 'marca_id','modelo_id', 'cantidad_promocion','precio_promocion')->where('status','PUBLISHED')->first();

			if($product){
				$imagenes = $product->postimagenes()->select('imagen')->get();
				$array_imagenes = [];
				if ($imagenes->count()>0) {
					foreach ($imagenes as $img) {
					  $array_imagenes[]=$img->imagen;
					}
				}

				$subtotal = $product->precios * $item->cantidad;
				
				$product_buyer[]=[
					"producto_name"=>$product->title,
					"images"=>json_encode($array_imagenes),
					"cantidad"=>$item->cantidad,
					"precio"=>$product->precios,
					"color_id"=>$item->color_id,
					"talle_id"=>$item->talle_id,
					"descuento"=>$product->descuento,
					"body"=>$product->body,
					'marca_id'=>$product->marca_id,
					'modelo_id'=>$product->modelo_id,
					'cantidad_promocion'=>$product->cantidad_promocion,
					'precio_promocion'=>$product->precio_promocion
				];
				$totPayment += $subtotal; 
			}else{
				$message = "El producto con el ID ".$item->post_id." del carrito ya no esta disponible, lo hemos quitado, intente de nuevo.";
				$item->delete();
				return response()->json(['status'=>"danger", "msg"=>$message]);
			}
		}
		if ($totPayment<=0) {
			return response()->json(['status'=>"danger", "msg"=>"Ocurrio un error al calcular el total a pagar porque el monto calculado es ".$totPayment]);
		}

		if($totPayment<$minimo){
			return response()->json(['status'=>"error", "msg"=>"Su compra no supera el monto minimo de ".$minimo ]);
		}

		$external_reference = "u".$user->id."t".trim($totPayment)."d". str_replace(" ", "", carbon::now()).mt_rand();

		try {
			$pago = new paid();
			$pago->pasarela="CASH";
			$pago->monto=$totPayment;
			$pago->status='approved';
			$pago->payment_method='cash_money';
			$pago->external_reference=$external_reference;
			$pago->metodo_entrega=$request->shipment_method;
			$pago->preference_id="cash-".$external_reference;
			$sp = $user->comprador_paymentId()->save($pago);

		    foreach ($product_buyer as $prd) {
				$pagoscompras = new compras();
				$pagoscompras->user_id=$user->id ;
				$pagoscompras->producto_name= $prd["producto_name"];
				$pagoscompras->images= $prd["images"];
				$pagoscompras->cantidad= $prd["cantidad"];
				$pagoscompras->color_id= $prd["color_id"];
				$pagoscompras->talle_id= $prd["talle_id"];
				$pagoscompras->descuento= $prd["descuento"];
				//$pagoscompras->body=$prd["body"] ;
				$pagoscompras->precio= $prd["precio"];
				$pagoscompras->cantidad_promocion= $prd["cantidad_promocion"];
				$pagoscompras->precio_promocion= $prd["precio_promocion"];
				$sp->comprasId()->save($pagoscompras);
			}

			$carrito->status="approved";
			$carrito->external_reference = $external_reference;
			$carrito->save();
		    
			$facturacion = new facturacion();
			$facturacion->nombre=$request->nombre;
			$facturacion->apellido=$request->apellido;
			$facturacion->empresa=$request->empresa;
			$facturacion->email=$request->email;
			$facturacion->telefono=$request->telefono;
			$facturacion->domicilio=$request->direccion;
			$facturacion->mensaje=$request->mensaje;
			$sp->pagosfacturaId()->save($facturacion);

			$uri="https://".$_SERVER['HTTP_HOST']."/payment-success?ref=".$external_reference."&transaction=cash&status=success";
			$compras=$sp->comprasId()->get();
			if($user->email){
				Mail::to($user->email)->send(new confpayment($user,$compras)); 
			}

			return response()->json(
				[
				"status" =>"success", 
				"url" => $uri
				]
			);
		} catch (\Throwable $th) {
			return response()->json(['status'=>"danger", "msg"=>$th->getMessage()]);
		}


    }

   /* public function input_payment($payment=null, $request=null)
    {	

    	if ($request['collection_id']==0) {
    		return false;
    	}
        $seller = $payment->vendedorId()->select("users.id","users.name","users.apellido","users.email","um.access_token")
        ->join("users_meli as um", "users.id","=","um.users_id")->first();

        if (is_null($seller)) {
        	return ["status"=>"error-seller"];
        }
        
        $item = items::select("id","status")->where("external_reference",$request["ref"])->first();

        $filters = [
            "external_reference" =>$request['ref'],
            "id"=> $request['collection_id']
        ];

    	mpsdk::initialize();
        $access_token=$seller->access_token;

        $data = mpsdk::get('/v1/payments/'.$request['collection_id'].'?access_token='.$access_token.'', $filters);
	    $code = intval($data["code"]);

	    $codes = [200,201];
	    if (!in_array($code, $codes)) {
	    	return ["status"=>"error-mp"];
	    }


	    $status = $data["body"]["status"];
	    $status_details = $data["body"]["status_detail"];
	    $orden_id = $data["body"]["id"];
	    $cuotas = $data["body"]["installments"];
	    $payment_method = $data["body"]["payment_method_id"];
	    $paymen_type = $data["body"]["payment_type_id"];
	    $merchant_order_id = $request["merchant_order_id"];


        if ($item) {
            $item->status = $status;
            $item->save();
        }
        

	    $payment->status = $status;
	    $payment->status_detail = $status_details;
	    $payment->orden_id = $orden_id;
	    $payment->cuotas = $cuotas;
	    $payment->payment_method = $payment_method;
	    $payment->payment_thype =  $paymen_type;
	    $payment->merchant_order_id = $merchant_order_id;
	    $payment->save();

	    $card_holder = NULL;
	    $expiration = NULL;
	    $first_six_digits = NULL;
	    $last_four_digits = NULL;

	    if (array_key_exists("card", $data["body"]) && count($data["body"]["card"])>0) {
		    $card_holder = $data["body"]["card"]["cardholder"]["name"];
		    $expiration = $data["body"]["card"]["expiration_month"]."/".$data["body"]["card"]["expiration_year"];
		    $first_six_digits = $data["body"]["card"]["first_six_digits"];
		    $last_four_digits = $data["body"]["card"]["last_four_digits"];
	    }
      	
      	$mercadopago_fee=0;
      	$aplicacion_fee=0;
      	$financing_fee=null;

      	foreach ($data["body"]["fee_details"] as $fee_details){
	        if ($fee_details["type"] == 'financing_fee') {
	          $financing_fee = $fee_details["amount"];
	        }
	        if ($fee_details["type"] == 'mercadopago_fee') {
	          $mercadopago_fee = $fee_details["amount"];
	        }
	        if ($fee_details["type"] == 'application_fee') {
	          $aplicacion_fee = $fee_details["amount"];
	        }
      	}

      	$net_received_amount = $data["body"]["transaction_details"]["net_received_amount"];
      	$total_paid_amount =$data["body"]["transaction_details"]["total_paid_amount"];
	    

      	$getdetails = $payment->detailsId()->first();

      	if (is_null($getdetails)) {
	    	$details = new details();
      	}else{
      		$details = $getdetails;
      	}
        $details->mercadopago_fee = $mercadopago_fee;
        $details->aplicacion_fee = $aplicacion_fee;
        $details->financing_fee = $financing_fee;
        $details->neto_recibido = $net_received_amount;
        $details->card_holder = $card_holder;
        $details->expiration = $expiration;
        $details->first_six_digits = $first_six_digits;
        $details->last_four_digits = $last_four_digits;
        $details->total_paid_amount = $total_paid_amount;
        $payment->detailsId()->save($details);

        if ($status=="approved") {
            Mail::to(Auth::user()->email)->send(new email_payment($payment, __("web.payment-compra"), __("web.payment-subtitle"), __("web.payment-g2") ));
		  if ($seller) {
            Mail::to($seller->email)->send(new email_payment($payment, __("web.payment-venta"), __("web.payment-subtitle-venta"), __("web.payment-g1") ));
          }
        }
    	return ["status"=>$status];
    }*/
    public function events(Request $request)
    {
    	$user = Auth::user();
    	$payment = $user->comprador_paymentId()->where("external_reference",$request->ref)->first();
    	if (!$payment) {
    		return redirect("/diff/error");
    	}

		//Si el pago es disrinto a cash es porque el pago es por algun medio de pago digital
		
		$status = ($request->transaction !== "cash")
		 	? $this->input_payment($payment, $request->all())["status"]
			: $payment->status;
			
		
    	return redirect("/diff/".$payment->status);
    }

    public function failure(Request $request)
    {
    	return redirect("/diff/cancelled");
    }
    public function diff($status)
    {
    	return view("auth.payment.paymentdiff", compact("status"));
    }


    /*public function ipn(Request $request)
    {	
    	
    	$paid = paid::where("external_reference", $request->external_reference)->first();
    	$seller = $paid->vendedorId()->select("users.id","um.access_token")->join("users_meli as um", "users.id","um.users_id")->first();

        if (is_null($seller)) {
            return false;
        }

  		if (isset($_GET["topic"])) {

	        mpsdk::initialize(); 
	        mpsdk::setAccessToken($seller->access_token); 
	        $merchant_order = null;
	        switch($_GET["topic"]) {
	            case "payment":
	                $payment = \MercadoPago\Payment::find_by_id($_GET["id"]);
	                $merchant_order = \MercadoPago\MerchantOrder::find_by_id($payment->order->id);
	                break;
	            case "merchant_order":
	                $merchant_order = \MercadoPago\MerchantOrder::find_by_id($_GET["id"]);
	                break;
	        }

      		$collection_id = 0;
		    foreach ($merchant_order->payments as $getpaid) {
		        $collection_id = $getpaid->id;

		        $call=$paid->intentosId()->where("paidId",$collection_id)->first();
		        if (is_null($call)) {
		        	$intentos = new intentos();
		        }else{
		        	$intentos = $call;
		        }
		        $intentos->paidId = $collection_id;
		        $intentos->transaction_amount = $getpaid->transaction_amount;
		        $intentos->total_paid_amount = $getpaid->total_paid_amount;
		        $intentos->status = $getpaid->status;
		        $intentos->status_detail = $getpaid->status_detail;
		        $intentos->operation_type = $getpaid->operation_type;
		        $intentos->date_approved = $getpaid->date_approved;
		        $intentos->date_created = $getpaid->date_created;
		        $intentos->last_modified = $getpaid->last_modified;
		        $intentos->amount_refunded = $getpaid->amount_refunded;

		        $paid->intentosId()->save($intentos);


		    }
            if ($collection_id>0) {
                
                $collection_id = $getpaid->id;
                $requestPayment = [
                    'collection_id'=>$collection_id,
                    'preference_id'=>$merchant_order->preference_id,
                    'ref'=>$merchant_order->external_reference,
                    'merchant_order_id'=>$merchant_order->id

                ];
                $npt = $this->input_payment($paid,$requestPayment);
                exit(json_encode($npt));
            }

  		}
    }*/
}
