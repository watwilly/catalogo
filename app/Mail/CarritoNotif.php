<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Voyager;

class CarritoNotif extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public $user;
    public $pedido;

    public function __construct($user, $pedido)
    {
        $this->user = $user;
        $this->pedido = $pedido;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->view('emails.carritontif')
            ->from(Voyager::setting('site.from'))
            ->subject('Tienes un pedido pendiente - '.$this->user->name);
    }
}
