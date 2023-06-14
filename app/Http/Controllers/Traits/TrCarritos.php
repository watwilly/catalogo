<?php

namespace App\Http\Controllers\Traits;
use Illuminate\Support\Facades\DB;
use App\Models\Carritos;
use App\Models\CarritoItems;
use Carbon\Carbon;
use App\Mail\CarritoNotif as notif;
use Mail;

trait TrCarritos
{
    protected function deleteoldcarts()
    {
        $fechaLimite = Carbon::now()->subDays(7);
    
        // Obtener los IDs de los carritos que tienen más de 3 días de creados
        $idsCarritosViejos = Carritos::where('created_at', '<=', $fechaLimite)
                                     ->pluck('id');
                                     
        // Eliminar los items de los carritos viejos
        CarritoItems::whereIn('carrito_id', $idsCarritosViejos)->delete();
        
        // Eliminar los carritos viejos
        Carritos::whereIn('id', $idsCarritosViejos)->delete();

    }
    protected function TRcartnotif()
    {
        $carritos = Carritos::select("carrito.id","carrito.user_id","carrito.status", "carrito.notif")->where("status", "pending")
        ->with(["carritoitemsId"=>function($query){
            $query->select("carrito_detalle.id","carrito_detalle.cantidad", "carrito_detalle.carrito_id","carrito_detalle.post_id", "p.title", "p.id as post_id", "p.precios")
            ->join("posts as p", "carrito_detalle.post_id", "=", "p.id");
        }])->with(["userId"=>function($query){
            $query->select("users.id", "users.email", "users.name", "users.apellido");
        }])->whereNull("carrito.notif")->orWhere("carrito.notif", "<",3)->inRandomOrder()->limit(20)->get();

        if ($carritos->count()>0) {

            foreach ($carritos as $carrito) {
                $user = $carrito->userId;
                $pedido = $carrito->carritoitemsId;
                
                Mail::to($user->email)->send(new notif($user, $pedido));
                
                $notif = isset($carrito->notif) ? $carrito->notif + 1 : 1;
                $carrito->notif = $notif;
                $carrito->save();

            }
        }
    }
}