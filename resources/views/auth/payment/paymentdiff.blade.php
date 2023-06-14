@extends('layouts.app')

@section('meta')
    <title>{{$status}}</title>
@stop

@section('content')
 
<section class="mt-5 mb-5">
    <div class="container payment text-center mt-5">
        
        @if($status == "approved")
            <i class="fa success mb-3 fa-check-square"></i>
        @elseif($status == "pending")
            <i class="fa pending  mb-3 fa-clock"></i>
        @elseif($status == "cancelled")
            <i class="fa cancelled  mb-3 fa-window-close"></i>
        @endif
        <h2>@lang("web.$status")</h2>
        <h3 class="mb-5">Su pedido ha sido realizado. Nos contactaremos con Ud a la brevedad para coordinar pago y envío.</h3>
        <div class="row">
            <div class="col-md-5 m-auto">
                <a href="/" class="btn btn-info">Seguir comprando</a>
            </div>
        </div>
    </div>
</section>
@endsection

