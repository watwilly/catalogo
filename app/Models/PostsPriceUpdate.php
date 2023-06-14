<?php

namespace App\Models;

use Eloquent as Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class PostsPriceUpdate extends Model
{

    public $table = 'posts_price_update as ppu';
    

    public $fillable = [
        'post_id',
        'old_price',
        'new_price',
        'porcentaje',
        'fecha',
    ];


    protected $casts = [
        'id' => 'integer',
    ];


    public static $rules = [
        
    ];

    public function posts():BelongsTo
    {
        return $this->belongsTo(\App\Models\Post::class,'post_id');
    }

 
}
