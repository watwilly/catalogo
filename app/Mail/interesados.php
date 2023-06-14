<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Voyager;

class interesados extends Mailable
{
    use Queueable, SerializesModels;

    public $email;
    public $mensaje;
    public $post;
    public $user;
    public $create;

    public function __construct($email, $mensaje, $post, $user, $create)
    {
       $this->email = $email;
       $this->mensaje = $mensaje;
       $this->post = $post;
       $this->user = $user;
       $this->create = $create;
    }

    public function build()
    {
        return $this->from(Voyager::setting('site.from'))->markdown('emails.interesados')
            ->subject('Nuevo Comentario'. $this->post->title. '- distlooktucuman.com.ar');
    }
}
