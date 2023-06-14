<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use \App\Http\Controllers\Traits\TrCarritos;
class CarritosFunctionsController extends Controller
{   
    use TrCarritos;
    public function deleteold()
    {
        return $this->deleteoldcarts();
    }

    public function cartnotif()
    {
        return $this->TRcartnotif();
    }
}
