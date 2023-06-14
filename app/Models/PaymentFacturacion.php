<?php

namespace App\Models;

use Eloquent as Model;


class PaymentFacturacion extends Model
{

    public $table = 'pagos_facturacion';
    
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';

    public $fillable = [
        'pago_id',
        'nombre',
        'apellido',
        'empresa',
        'email',
        'telefono',
        'domicilio',
        'mensaje'
    ];
    protected $casts = [
        'id' => 'integer',
        'pago_id'=>'integer',
        'nombre'=>'string',
        'apellido'=>'string',
        'empresa'=>'string',
        'email'=>'string',
        'telefono'=>'string',
        'domicilio'=>'string',
        'mensaje'=>'string'
    ];

    public static $rules = [
        
    ];
    public function pagoId()
    {
        return $this->belongsTo(\App\Models\Payments::class, 'pago_id');
    } 

}
