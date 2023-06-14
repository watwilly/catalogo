<?php

namespace App\Models;

use Eloquent as Model;

class PostsAtributes extends Model
{

    public $table = 'postsAtributes';
    
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';



    public $fillable = [
        'post_id',
        'ml_atributeId',
        'name',
        'value'
    ];


    protected $casts = [
        'id' => 'integer',
        'post_id' => 'integer',
        'ml_atributeId'=>'string',
        'name' => 'string',
        'value'=>'string'
    ];


    public static $rules = [
        
    ];
 
    public function postId()
    {
        return $this->belongsTo(\App\Models\Post::class, 'post_id');
    }





}
