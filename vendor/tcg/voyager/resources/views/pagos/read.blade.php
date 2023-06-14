@extends('voyager::master')

@section('page_title','View '.$dataType->display_name_singular)

@section('page_header')

@stop

@section('content')

    <div class="container">
        <div class="datos-carrito bg-light border my-4 p-5">
            <h5 class="text-center mb-5 pb-2">Datos del pago</h5>

            <div class="row">
                <div class="col-sm-6">
                    <ul>
                        <li><span>Nombre y Apellido:</span> {{$payment_data["user"]->name}} {{$payment_data["user"]->apellido}}</li>
                        <li><span>Email:</span> {{$payment_data["user"]->email}}</li>
                        <li><span>Estado:</span> {{$dataTypeContent->status}}</li>
                        <li><span>Referencia Externa:</span> {{$dataTypeContent->external_reference}}</li>
                    </ul>

                </div>
                <div class="col-sm-6">
                    <ul>
                        <li><span>Fecha:</span> {{$dataTypeContent->created_at->todateString()}}</li>
                        <li><span>Pasarela:</span> {{$dataTypeContent->pasarela}}</li>
                        <li><span>Preference Id:</span> {{$dataTypeContent->preference_id}}</li>
                    </ul>
                </div>
                <?php /* @if($payment_data["detalles"])
                    <div class="col-sm-6">
                        <ul>
                            <li><span>Nombre en la Tarjeta:</span> {{$detalles->holder_name}}</li>
                            <li><span>Neto Recibido:</span> ${{$detalles->net_amount}}</li>
                            <li><span>Total pagado por el usuario:</span> ${{$detalles->total_paid_amount}}</li>
                            <li><span>Metodo de Pago:</span> {{$detalles->payment_type_id}}</li>
                        </ul>
                    </div>
                    <div class="col-sm-6">
                        <ul>
                            <li><span>Cuotas:</span> {{$detalles->installments}}</li>
                            <li><span>Comicion cobrada por Mercado Pago:</span> ${{$detalles->mercadopago_fee}}</li>
                        </ul>
                    </div>
                @endif  */ ?>
                <div class="col-sm-12">
                    @if($dataTypeContent->status=='approved')
                        @if($dataTypeContent->pasarela=="CASH")
                            <div class="alert alert-success">Este <b>PAGO</b> esta con estado <b>Aprobado</b> como el metodo de pago es en efectivo comuniquese con el comprador para concretar la transaccion</div>
                        @else
                            <div class="alert alert-success">Este <b>PAGO</b> esta con estado <b>Aprobado</b> lo que significa que ha sido pagado y el dinero se encuentra <b>en su cuenta de Mercado Pago</b></div>
                        @endif
                    @endif
                </div>
            </div>
        </div>
        <?php $factura = $payment_data["factura"]; ?>
        @if($factura)
        <div class="datos-carrito bg-light border my-4 p-5">
            <h5 class="text-center mb-5 pb-2">Dato de Facturacion</h5>

            <div class="row">
                <div class="col-sm-6">
                    <ul>
                        <li><span>Nombre:</span> {{$factura->nombre}} </li>
                        <li><span>Apellido:</span> {{$factura->apellido}} </li>
                        <li><span>Email:</span> {{$factura->email}}</li>
                        <li><span>Telefono:</span> {{$factura->telefono}}</li>
                    </ul>

                </div>
                <div class="col-sm-6">
                    <ul>
                        <li><span>Domicilio:</span> {{$factura->domicilio}}</li>
                        <li><span>Mensaje:</span> {{$factura->mensaje}}</li>
                    </ul>
                </div>

            </div>
        </div>
        @endif
        <div class="productos-carrito bg-light border p-5 mb-4">
            <h5 class="text-center mb-5 pb-2">Productos pagado</h5>
            <div class="row encabezados-carrito text-center py-2 bg-dark text-white">
                <div class="col-md-4"><span>Producto</span></div>
                <div class="col-md-2"><span>Atributos</span></div>
                <div class="col-md-2"><span>Cantidad</span></div>
                <div class="col-md-2"><span>Precio Unitario</span></div>
                <div class="col-md-2"><span>Subtotal</span></div>
            </div>

            <?php
              $total = 0;
              $old_price=null;
              $compra = $payment_data["compra"];
            ?>
            @foreach($compra as $detalle)

            <?php 
                if ($detalle->descuento) {
                    $price = voyager::returnDescuento($detalle->precio, $detalle->descuento);
                }else{
                    $price = $detalle->precio;
                }

                if ($detalle->cantidad_promocion&&$detalle->cantidad>=$detalle->cantidad_promocion) {
                    $old_price=$price;
                    $price=$detalle->precio_promocion;
                }

                $firstImg = json_decode($detalle->images);

                $topTotal = Voyager::return_total($price, $detalle->cantidad);

                $talle = $detalle->talleId()->first();
                $color = $detalle->colorId()->first();
            ?>

            <div class="row bg-white border border-top-0 d-flex align-items-center py-2">
                <div class="col-md-4 col-12 d-flex align-items-center">
                    @if(count($firstImg)>0)<div class="col-md-3 col-xs-5">
                        <img src="{{Voyager::get_image($firstImg[0],'small')}}" alt="Producto" class="img-responsive py-2">
                    </div>@endif
                    <div class="col-md-9 col-7">
                        <p class="mb-0">{{$detalle->producto_name}}</p>
                    </div>
                </div>
                <div class="col-md-2 col-4 d-flex flex-column align-items-center">
                    <div>@if(!is_null($talle))Talle:  {{$talle->talle}} @endif</div>
                    <div class="d-flex align-items-center">
                        @if(!is_null($color))
                        <span class="pr-1">Color:</span> 
                         <span class="color" style="background-color:  {{$color->color}}; "></span>
                        @else
                            <span class="color">NN</span>
                        @endif
                    </div>
                </div>
                <div class="col-md-2 col-4 d-flex justify-content-center cantidad">
                    {{$detalle->cantidad}}
                </div>
                <div class="col-md-2 col-4 d-flex justify-content-center unitario">
                    @if($detalle->cantidad_promocion&&$detalle->cantidad>=$detalle->cantidad_promocion)
                        <del>${{$old_price}}</del>
                        <b>${{$detalle->precio_promocion}}</b>
                        <small>Descuento por cantidad</small>
                    @else
                        ${{$price}}
                    @endif
                </div>
                <div class="col-md-2 col-4 d-flex justify-content-center subtotal">
                    <div>${{$topTotal}}</div>
                </div>
            </div>
            <?php $total +=$topTotal; ?>
            @endforeach
        </div>
        <div class="d-flex flex-wrap total mt-3 border">
            <div class="col-md-10 col-xs-7 mb-0 py-2 text-right">Total</div>
            <div class="col-md-2 col-xs-5 mb-0 text-center py-2">${{$total}}</div>
        </div>
    </div>

@stop

@section('css')
     <style>
        *{
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        .datos-carrito, .productos-carrito {
            background: #fff;
            border: 1px solid #e9ecef;
        }
        .datos-carrito ul {
            list-style: none;
            padding: 0;
        }
        .datos-carrito ul li {
            padding: 5px 0;
        }
        .datos-carrito ul li span {
            font-weight: 600;
        }
        .datos-carrito h5, .productos-carrito h5 {
            border-bottom: 1px solid #ddd;
            font-weight: 600;
            font-size: 17px;
        }
        .encabezados-carrito {
            border-bottom: 1px solid #ddd;
            background: #343A40;
            color: #fff;
        }
        .border {
            border: 1px solid #e9ecef;
        }
        .fila {
            border-top: 0;
        }
        .pr-1 {
            padding-right: 5px;
        }
        .pt-2, .py-2 {
            padding-top: .5rem !important;
        }
        .pb-2, .py-2 {
            padding-bottom: .5rem !important;
        }
        .mb-5, .my-5 {
            margin-bottom: 3rem !important;
        }
        .p-5 {
            padding: 3rem !important;
        }
        .mb-4, .my-4 {
            margin-bottom: 1.5rem !important;
        }
        .mt-4, .my-4 {
            margin-top: 1.5rem !important;
        }
        .m-0 {
            margin: 0 !important;
        }
        .mb-0 {
            margin-bottom: 0 !important;
        }
        .d-flex {
            display: flex;
        }
        .flex-wrap {
            flex-wrap: wrap;
        }
        .flex-column {
            flex-direction: column;
        }
        .align-items-center {
            align-items: center;
        }
        .justify-content-center {
            justify-content: center;
        }
        .total div:first-child {
            background: #343A40;
            color: #fff;
        }
        .total div:last-child {
            background: #fff;
            color: #333;
        }
        .productos-carrito .row > [class*="col-"]{
            margin: 0;
        }
        .color {
            display: inline-block;
            width: 20px;
            height: 20px;
            border: 1px solid #ddd;
        }
    </style>


@stop