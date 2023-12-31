@extends('layouts.app')
@section('content')
@section('meta')
<meta name="title" content="Contacta con nuestra distribuidora de insumos de estética mayorista en Look Tucumán">
<meta name="description" content="¿Necesitas asesoramiento sobre nuestros productos? ¿Quieres hacer un pedido? ¡No dudes en contactarnos! En nuestra distribuidora de insumos de estética mayorista en Look Tucumán estamos siempre dispuestos a ayudarte.">
<meta name="keywords" content="contacto, distribuidora de insumos de estética, mayorista, Look Tucumán">
<meta property="og:title" content="Contacta con nuestra distribuidora de insumos de estética mayorista en Look Tucumán">
<meta property="og:description" content="¿Necesitas asesoramiento sobre nuestros productos? ¿Quieres hacer un pedido? ¡No dudes en contactarnos! En nuestra distribuidora de insumos de estética mayorista en Look Tucumán estamos siempre dispuestos a ayudarte.">
<meta property="og:site_name" content="Contacta con nuestra distribuidora de insumos de estética mayorista en Look Tucumán">
<meta property="og:type" content="website">
<title>Contacta con nuestra distribuidora de insumos de estética mayorista en Look Tucumán</title>

@stop
<section class="min-height">
    <div class="container mt-4">
        <h2 class="text-center">¡Gracias por visitar nuestra página web!</h2>
        <h6 class="lead text-center my-5">Si tienes alguna pregunta, comentario o sugerencia, por favor no dudes en ponerte en contacto con nosotros a través del formulario que aparece a continuación. Nos encantaría saber de ti y responderemos lo antes posible.</h6>

        <div class="row g-3 mb-3">
            <div class="col-12 col-lg-5">
                <div class="container-fluid py-3 h-100 shadow rounded bg-white">
                    <h4 class="section__lead">Información de contacto</h4>
                    <ul class="list-group list-group-flush ">
                        <li class="list-group-item d-flex flex-column flex-md-row justify-content-between">
                            <b><i class="fas fa-phone"></i> Teléfono</b>
                            <span>+54 9 381-506-4935</span>
                        </li>
                        <li class="list-group-item d-flex flex-column flex-md-row justify-content-between">
                            <b><i class="far fa-envelope"></i> E-mail</b>
                            <span>consultas@distlooktucuman.com.ar</span>
                        </li>
                        <li class="list-group-item d-flex flex-column flex-md-row justify-content-between">
                            <b><i class="fab fa-facebook-square"></i> Facebook</b>
                            <a href="https://www.facebook.com/Distribuidora-Look-Tucum%C3%A1n-409175346186462/" target="_blank" class="link-blue">Distribuidora Look Tucumán</a>
                        </li>
                        <li class="list-group-item d-flex flex-column flex-md-row justify-content-between">
                            <b><i class="fab fa-instagram"></i> Instagram</b>
                            <a href="https://www.instagram.com/distribuidoralooktucuman/" target="_blank" class="link-violet">@distribuidoralooktucuman</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-12 col-lg-7">
                <div class="container-fluid py-3 h-100 shadow rounded bg-white">
                    <h4 class="section__lead">Enviar un mensaje</h4>
                    <div class="row g-3">
                  <form action="/form-contacto" role="form" method="post" >
                      <input type="hidden" name="_token" value="{{ csrf_token() }}"></input>
                        <div class="col-12">
                            <div class="form-floating">
                                <input type="text" name="name" required  class="form-control" id="input_name" placeholder="Ejemplo">
                                <label for="input_name">Nombre y Apellido</label>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-floating">
                                <input type="email" name="email" required class="form-control" id="input_email" placeholder="Ejemplo">
                                <label for="input_email">E-mail</label>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-floating">
                                <textarea type="text" name="detalle" required  class="form-control" id="input_message" placeholder="Ejemplo" style="height: 200px;"></textarea>
                                <label for="input_message">¿Cuál es tu consulta?</label>
                            </div>
                        </div>
                        <div class="col-12">
                          <div class="g-recaptcha" data-sitekey="{{Voyager::setting('site.ccg')}}"></div>
                        </div>

                        <div class="col-12 d-flex justify-content-center">
                            <button class="btn btn-primary">Enviar mensaje</button>
                        </div>
                  </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


@endsection

