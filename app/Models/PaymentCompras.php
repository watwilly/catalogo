<?php

namespace App\Models;

use Eloquent as Model;

class PaymentCompras extends Model
{

    public $table = 'pagos_compras';
    
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';



    public $fillable = [
        'user_id',
        'pago_id',
        'producto_name',
        'images',
        'cantidad',
        'precio',
        'color_id',
        'talle_id',
        'descuento',
        'body',
        'marca_id',
        'modelo_id',
        'cantidad_promocion',
        'precio_promocion'
    ];


    protected $casts = [
        'id' => 'integer',
    ];


    public static $rules = [
        
    ];

    /*public function categoryId()
    {
        return $this->belongsTo(\App\Models\Category::class, 'category_id');
    }

    public function SubcategoryId()
    {
        return $this->belongsTo(\App\Models\Category::class, 'subcategory_id');
    }

    public function marcasId()
    {
        return $this->belongsTo(\App\Models\Marcas::class, 'marca_id');
    }*/
/*
    public function modelosId()
    {
        return $this->belongsTo(\App\Models\Modelos::class, 'modelo_id');
    }

*/
    public function talleId()
    {
        return $this->belongsTo(\App\Models\Talles::class, 'talle_id');
    }


    public function colorId()
    {
        return $this->belongsTo(\App\Models\Colores::class, 'color_id');
    }

    public function paymentsId()
    {
        return $this->belongsTo(\App\Models\Payments::class, 'pago_id');
    }








}
