@extends('layouts.app')
@section('meta')
    <title>Detalle de Compre</title>
@stop
@section('content')
 <section class="min-height">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12 col-lg-4 col-xl-3 p-0 d-none d-lg-block">
              @include('auth.colder')
            </div>
            <div class="col-12 col-lg-8 col-xl-9 py-5">
                <div class="grid rows-2 rows-lg-1 cols-1 cols-lg-2 justify-content-stretch align-items-center">
                    <div class="grid-item p-0 justify-self-center justify-self-lg-start">
                        <h2 class="m-0">Detalle de compra</h2>
                    </div>
                    <div class="grid-item p-0 justify-self-center justify-self-lg-end">
                        <a href="/compras"  class="section__link section__link--secondary">Volver</a>
                    </div>
                </div>

                <div class="row gy-3 gx-2 mt-4 justify-content-center">
                    <?php 
                        $items_count = $items->count();
                    ?>
                    @if($items_count>0)
                        <div class="col-10 col-sm-6 col-md-4 col-lg-3">
                            @foreach($items as $item )
                                <?php 
                                    $subtotal = $item->precio * $item->cantidad;
                                    $imagenes = json_decode($item->images);

                                ?>

                                <div class="card card-hover mb-3 mx-2">
                                    |@if(count($imagenes)>0)<img src="/storage/{{$imagenes[0]}}" class="card-img-top" alt="...">@endif
                                    <div class="card-body d-flex flex-column justify-content-between">
                                        <h5 class="card-title m-0 text-truncate h6">{{str_limit($item->producto_name,38)}}</h5>
                                        <p class="card-text m-0 section__title fw-bold">
                                            {{$item->precio}} x {{$item->cantidad}} = {{$subtotal}}
                                        </p>
                                        <p class="card-text m-0 section__title fw-bold">
                                            ARS ${{$item->precio}}
                                        </p>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    @endif
                    <div class="col-12 col-sm-6 col-md-8 col-lg-9">
                        <div class="card card-hover mx-2">
                            <div class="card-body">
                                <h5 class="card-title">Detalles del pago</h5>
                                <ul class="list-group list-group-flush ">
                                   
                                    <?php /*<li class="list-group-item list-group-item-success d-flex justify-content-between">
                                        <b>Descuento</b>
                                        <span>ARS -$<?php echo $price * ($disccount / 100) ?></span>
                                    </li> */ ?>
                                    <?php /* <li class="list-group-item d-flex justify-content-between">
                                        <b>Envío</b>
                                        <span>ARS $500</span>
                                    </li> */ ?>
                                    <li class="list-group-item list-group-item-info d-flex justify-content-between">
                                        <?php 
                                            $total = $item->cantidad * $item->precio;
                                        ?>
                                        <b>Total pagado</b>
                                        <span>ARS ${{$payment->monto}}</span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between">
                                        <b>Fecha</b>
                                        <span>{{$payment->created_at->todateString()}}</span>
                                    </li>
                                    <li class="list-group-item d-flex flex-column flex-md-row justify-content-between">
                                        <b>Estado</b>
                                        <span class="status-{{$payment->status}}">{{$payment->status}}</span>
                                    </li>
                                    <li class="list-group-item d-flex flex-column flex-md-row justify-content-between">
                                        <b>Cantidad de productos</b>
                                        <span >{{$items_count}}</span>
                                    </li>
                                    <li class="list-group-item d-flex flex-column flex-md-row justify-content-between">
                                        <b>Referencia</b>
                                        <span>{{$payment->external_reference}}</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="card card-hover mx-2 mt-3">
                            <div class="card-body">
                                <h5 class="card-title">Datos de envio o entrega</h5>
                                <ul class="list-group list-group-flush ">
                                  
                                    <li class="list-group-item d-flex flex-column flex-md-row justify-content-between">
                                        <b>Metedo de entrega</b>
                                        <span>{{$payment->metodo_entrega}}</span>
                                    </li>
                                    @if($payment->payment_method)
                                    <li class="list-group-item d-flex flex-column flex-md-row justify-content-between">
                                        <b>Metodo de Pago</b>
                                        <span>{{$payment->payment_method}}</span>
                                    </li>
                                    @endif
                                   
                                </ul>
                            </div>
                        </div>
                        <?php 
                            $datos_facturacion = DB::table("pagos_facturacion")->select("id","nombre","apellido","empresa","email","telefono","domicilio","mensaje")
                            ->where("pago_id",$payment->id)->first();
                        ?>
                        @if($datos_facturacion)
                        <div class="card card-hover mx-2 mt-3">
                            <div class="card-body">
                                <h5 class="card-title">Datos de facturacion</h5>
                                <ul class="list-group list-group-flush ">
                                    <li class="list-group-item d-flex flex-column flex-md-row justify-content-between">
                                        <b>Nombre y Apellido</b>
                                        <span>{{$datos_facturacion->nombre}} {{$datos_facturacion->apellido}}</span>
                                    </li>
                                    @if($datos_facturacion->empresa)
                                    <li class="list-group-item d-flex flex-column flex-md-row justify-content-between">
                                        <b>Empresa</b>
                                        <span>{{$datos_facturacion->empresa}}</span>
                                    </li>
                                    @endif
                                    <li class="list-group-item d-flex flex-column flex-md-row justify-content-between">
                                        <b>E-mail</b>
                                        <span>{{$datos_facturacion->email}}</span>
                                    </li>
                                    <li class="list-group-item d-flex flex-column flex-md-row justify-content-between">
                                        <b>Domicilio</b>
                                        <span>{{$datos_facturacion->domicilio}}</span>
                                    </li>
                                    <li class="list-group-item d-flex flex-column flex-md-row justify-content-between">
                                        <b>Telefono</b>
                                        <span>{{$datos_facturacion->telefono}}</span>
                                    </li>
                                    @if($datos_facturacion->mensaje)
                                    <li class="list-group-item d-flex flex-column flex-md-row justify-content-between">
                                        <b>Mensaje</b>
                                        <span>{{$datos_facturacion->mensaje}}</span>
                                    </li>
                                    @endif
                                    
                                </ul>
                            </div>
                        </div>
                        @endif
                    
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

@endsection