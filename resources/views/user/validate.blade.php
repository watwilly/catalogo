@extends('layouts.app')

@section('meta')
  <title>Validacion de  cuenta</title>
@stop


@section('content')
<div class="container contop b-white pt-5 mb-5">
    <div class="@if($status == 'true') success @else error @endif col-md-12 text-center">
        @if($status == 'true')
            <div class="col-md-12">
                <h1>¡Felicidades, tu cuenta ha sido validada!</h1>
                <div class="text-center"><i class="fa fa-smile-o"></i></div>
                <p>¡Bienvenido a nuestra tienda en línea! Ahora puedes comprar nuestros productos con confianza y seguridad.</p>
            </div>
            <div class="col-md-12">
                <a href="/" class="btn btn-warning">Ir de compras</a>
            </div>
        @else
            <div class="col-md-12">
                <h1>¡Lo sentimos, ocurrió un error!</h1>
                <div class="text-center"><i class="fa fa-frown-o"></i></div>
                <p>Parece que hay un problema con tu cuenta. ¿Ya la habías validado o no está registrada? ¡No te preocupes, podemos solucionarlo!</p>
            </div>
            <div class="col-md-12">
                <a href="/auth/user/register" class="btn btn-warning">Registrarme</a>
                <a href="/auth/user/login" class="btn btn-success">Ingresar</a>
            </div>
        @endif
    </div>
</div>

@endsection