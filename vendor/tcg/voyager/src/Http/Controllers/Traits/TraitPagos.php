<?php

namespace TCG\Voyager\Http\Controllers\Traits;
use DB;
use Illuminate\Support\Facades\Cache;

trait TraitPagos
{
    protected function TRshowUser($dataTypeContent)
    {
        $compra = $dataTypeContent->comprasId()->orderBy("created_at","DESC")->get();
        $user = $dataTypeContent->userId()->select("id","name","apellido","email")->first();
        $factura= $dataTypeContent->pagosfacturaId()->first();


        return [
            "compra"=>$compra,
            "user"=>$user,
            "factura"=>$factura
        ];
    }
}
