<?php

namespace App\Models;

use Eloquent as Model;

class Payments extends Model
{

    public $table = 'pagos';
    
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';



    public $fillable = [
        'user_id',
        'pasarela',
        'monto',
        'status',
        'payment_method',
        'external_reference',
        'orden_id',
        'preference_id',
        'metodo_entrega'
    ];


    protected $casts = [
        'id' => 'integer',
    ];


    public static $rules = [
        
    ];

    public function pagosfacturaId()
    {
        return $this->hasMany(\App\Models\PaymentFacturacion::class, 'pago_id');
    }
    public function userId()
    {
        return $this->belongsTo(\App\User::class, 'user_id');
    }
    public function compradorId()
    {
        return $this->belongsTo(\App\User::class, 'comprador_id');
    }
    /*public function detailsId()
    {
        return $this->hasMany(\App\Models\PaymentDetails::class, 'payment_id');
    }*/
    public function comprasId()
    {
        return $this->hasMany(\App\Models\PaymentCompras::class, 'pago_id');
    }
   /* public function intentosId()
    {
        return $this->hasMany(\App\Models\PaymentsIntentos::class, 'payment_id');
    }*/
}
