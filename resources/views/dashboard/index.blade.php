@extends('layouts.app')
@section('content')

@section('meta')
    <title>Panel de Usuario</title>
@stop
<section class="min-height">
    <div class="container my-4">
        <h2 class="text-center mb-5">Panel de Usuario</h2>
        <div class="grid equal-cells  gap-3 rows-8 rows-md-4 rows-lg-3 cols-1 cols-md-2 cols-lg-3 justify-items-stretch align-items-stretch">
 
            <div class="grid-item p-3 card-hover bg-white border-start border-4 border-primary rounded">
                <h4 class="h5 mb-3 text-dark">
                    Mi Cuenta
                    <i class="fas float-end fa-user-cog"></i>
                </h4>
                <h6 class="lead">Administrar datos de contacto y credenciales</h6>
                <a href="/cuenta" class="link-secondary stretched-link"></a>
            </div>
            <div class="grid-item p-3 card-hover bg-white border-start border-4 border-primary rounded">
                <h4 class="h5 mb-3 text-dark">
                    Mis compras
                    <i class="far float-end fa-handshake"></i>
                </h4>
                <h6 class="lead">Historial de compras</h6>
                <a href="/compras" class="link-secondary stretched-link"></a>
            </div>
            <!--<div class="grid-item p-3 card-hover bg-white border-start border-4 border-primary rounded">
                <h4 class="h5 mb-3 text-dark">
                    Consultas a productos
                    <i class="far float-end fa-comments"></i>
                </h4>
                <h6 class="lead">Ver las consultas que realizaste en los productos</h6>
                <a href="/interesados" class="link-secondary stretched-link"></a>
            </div> -->
         
  
        </div>
    </div>
</section>
@endsection