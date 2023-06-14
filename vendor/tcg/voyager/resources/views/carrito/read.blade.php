@extends('voyager::master')

@section('page_title','View '.$dataType->display_name_singular)

@section('page_header')

@stop

@section('content')

    <div class="container">
        <div class="datos-carrito bg-light border my-4 p-5">
            <h5 class="text-center mb-5 pb-2">Datos de la compra</h5>

            <div class="row">
                <div class="col-sm-6">
                    <ul>
                        <li><span>Nombre y Apellido:</span> {{$user->name}} {{$user->apellidos}}</li>
                        <li><span>Email:</span> {{$user->email}}</li>
                        <li><span>Estado:</span> {{$dataTypeContent->status}}</li>
                        <li><span>Referencia Externa:</span> {{$dataTypeContent->external_reference}}</li>
                    </ul>

                </div>
                <div class="col-sm-6">
                    <ul>
                        <li><span>Fecha:</span> {{$dataTypeContent->created_at->todateString()}}</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="productos-carrito bg-light border p-5 mb-4">
            <h5 class="text-center mb-5 pb-2">Productos del Carrito</h5>
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
            ?>
            
            @foreach($detalles as $detalle)

            <?php 
                $producto = $detalle->postId()->select('id','title','descuento','precios','old_img','precio_promocion','cantidad_promocion')->where('status','PUBLISHED')->first();
            ?>
            @if($producto)
            <?php
                if ($producto->descuento) {
                    $price = $producto->returnDescuento($producto->precios, $producto->descuento);
                }else{
                    $price = $producto->precios;
                }
                if ($producto->cantidad_promocion&&$detalle->cantidad>=$producto->cantidad_promocion) {
                    $old_price=$price;
                    $price=$producto->precio_promocion;
                }
                $imgTop = $producto->postimagenes()->select('imagen')->limit(1)->first();
                $topTotal = Voyager::return_total($price, $detalle->cantidad);
                if ($imgTop) {
                    $cImage=$imgTop->imagen;
                }else{
                    $cImage=$producto->old_img;
                }
                $talle = $detalle->talleId()->first();
                $color = $detalle->colorId()->first();
            ?>

            <div class="row bg-white border border-top-0 d-flex align-items-center py-2">
                <div class="col-md-4 col-12 d-flex align-items-center">
                    <div class="col-md-3 col-xs-5">
                        <img src="{{Voyager::get_image($cImage,'small')}}" alt="Producto" class="img-responsive py-2">
                    </div>
                    <div class="col-md-9 col-7">
                        <p class="mb-0">{{$producto->title}}</p>
                    </div>
                </div>
                <div class="col-md-2 col-4 d-flex flex-column align-items-center">
                    <div>Talle: @if(!is_null($talle)) {{$talle->talle}} @endif</div>
                    <div class="d-flex align-items-center">
                        <span class="pr-1">Color:</span> 
                        @if(!is_null($color))
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
                    @if($producto->cantidad_promocion&&$detalle->cantidad>=$producto->cantidad_promocion)
                        <del>${{$old_price}}</del>
                        <b>${{$producto->precio_promocion}}</b>
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
            @endif
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