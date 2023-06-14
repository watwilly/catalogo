<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Voyager;

class ConfPayment extends Mailable
{
    use Queueable, SerializesModels;

    public $user;
    public $register;


    public function __construct($user,$register)
    {
        $this->user=$user;
        $this->register=$register;
    }


    public function build()
    {
        return $this->view('emails.confpayment')
            ->from(Voyager::setting('site.from'))
            ->bcc("consultas@distlooktucuman.com.ar")
            ->subject('Confirmacion de Pago - '.$this->user->name);
    }
}
