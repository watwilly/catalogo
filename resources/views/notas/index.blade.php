@extends('layouts.app')
@section("meta")
<meta name="title" content="Novedades en Look Tucumán | Insumos de Estética Mayorista">
<meta name="description" content="Enterate de las últimas novedades en Look Tucumán, tu distribuidora de confianza de insumos de estética mayorista en Tucumán.">
<meta property="og:locale" content="es_AR">
<meta property="og:title" content="Novedades en Look Tucumán | Insumos de Estética Mayorista">
<meta property="og:description" content="Enterate de las últimas novedades en Look Tucumán, tu distribuidora de confianza de insumos de estética mayorista en Tucumán.">
<meta property="og:site_name" content="Look Tucumán">
<meta name="author" content="Look Tucumán">
<meta property="og:image" content="https://www.looktucuman.com/images/novedades.jpg">
<title>Novedades en Look Tucumán | Insumos de Estética Mayorista</title>
@stop
@section('content')
<section class="mb-5"  >
    <div class="p-6 bg-dark bars-primary-3 d-flex flex-wrap align-items-center">
        <h2 class="text-center text-lg-start ms-0 ms-lg-6 section__title section__title--5 text-light text-shadow">{{$category->name}}</h2>
    </div>
</section>
<section class="container">
    <div class="row mb-5">
    @foreach($notas as $nota)
        <div class="col-md-3">
           <a href="/nota/{{$nota->id}}/{{str_slug($nota->titulo,'-')}}">
            <img src="/storage/{{$nota->imagen}}" class="img-fluid mb-3">
            <h6>{{$nota->titulo}}</h6>
            </a>
        </div>
    @endforeach
    </div>
</section>
@endsection