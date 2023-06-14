@extends('layouts.app')

@section('meta')
<meta name="title" content="{{ $post->title }} - Look Tucumán" />
<meta name="description" content="{{ str_limit(strip_tags($post->body), 160) }}" />
<meta name="keywords" content="{{ $post->category_name }}, {{ $post->subcategory_name }}, insumos de estetica, mayorista" />
<meta property="og:title" content="{{ $post->title }} - Look Tucumán" />
<meta property="og:description" content="{{ str_limit(strip_tags($post->body), 160) }}" />
<meta property="og:image" content="@if($post->imagen) https://www.looktucuman.com.ar/storage/{{ $post->imagen }} @else https://www.looktucuman.com.ar/storage/{{ Voyager::setting('site.ogimage') }} @endif" />
<meta property="og:url" content="{{ url()->current() }}" />
<meta property="og:site_name" content="Look Tucumán - Venta Mayorista de Insumos de Estética" />
<meta property="og:type" content="article" />
<title>{{ $post->title }} - Look Tucumán</title>
@stop

@section('content')
<section class="min-height">
    <div class="container">
        <div class="col-12 mt-3 d-none d-md-block">
            <nav aria-label="breadcrumb" class="bg-secondary rounded-pill py-3 px-5">
                <ol class="breadcrumb m-0">
                    @if(!is_null($post->category_id))
                      <li class="breadcrumb-item section__title fw-bold"><a href="/categoria/{{$post->category_id}}/{{str_slug($post->category_name)}}">{{$post->category_name}}</a></li>
                    @endif
                    @if(!is_null($post->subcategoryId))
                      <li class="breadcrumb-item section__title fw-bold"><a href="/categoria/{{$post->subcategoryId}}/{{str_slug($post->subcategory_name)}}">{{$post->subcategory_name}}</a></li>
                    @endif
                    @if(!is_null($post->ma_name))
                      <li class="breadcrumb-item section__title fw-bold active" aria-current="page">{{$post->ma_name}}</li>
                    @endif
                    @if(!is_null($post->mo_name))
                      <li class="breadcrumb-item section__title fw-bold active" aria-current="page">{{$post->mo_name}}</li>
                    @endif
                </ol>
            </nav>
        </div>

        <div class="product my-3">
            @if($imagenes->count() > 0)
              <div class="product__view">
                  <div class="container-fluid shadow rounded bg-white">
                      <div class="slider slider--main slider-show">
                        @foreach($imagenes as $imagen)
                          <img src="{{Voyager::get_image($imagen->imagen, NULL, $imagen->storage)}}" alt="{{$post->title}}" class="slider__frame slider__frame--slide">
                          <?php $thubnail[] = $imagen; ?>
                        @endforeach
                      </div>
                      <div class="slider slider-nav">
                        @foreach($thubnail as $th)
                          <img src="{{Voyager::get_image($th->imagen, 'small', $imagen->storage)}}" alt="{{$post->title}}" class="slider__frame slider__frame--nav">
                        @endforeach
                      </div>
                  </div>
              </div>
            @else
            <div class="product__view">
                  <div class="container-fluid shadow rounded bg-white">
                      <div class="slider slider--main slider-show">
                          <img src="{{Voyager::get_image($post->old_img, NULL)}}" alt="{{$post->title}}" class="slider__frame slider__frame--slide">
                      </div>
                  </div>
              </div>
            @endif
            <div class="product__price">
                <div class="container-fluid py-3 h-100 shadow rounded bg-white">
                    <div class="row align-items-center">
                        <div class="col-3 col-sm-2 col-lg-3">
                            <a href="/categoria/{{$post->category_id}}/{{str_slug($post->category_name)}}">
                                <img src="/storage/{{setting('site.logo')}}" alt="" class="rounded-circle shadow img-fluid">
                            </a>
                        </div>
                        <div class="col-9 col-sm-10 col-lg-9">
                            <a href="/categoria/{{$post->category_id}}/{{str_slug($post->category_name)}}" class="custom-link link-secondary">
                                <h4 class="section__lead h6 text-truncate">{{$post->category_name}}</h4>
                            </a>
                        </div>
                    </div>

                    <hr class="my-4">

                    <!-- Titulo de la publicación -->
                    <h4 class="mb-4">{{$post->title}}</h4>

                    <!--<span class="text-success section__title fw-bold">10% OFF</span>-->
                    <h5 class="mb-4 section__title fw-bold">
                        @if($post->precios == 1 or $post->precios == 0) PRECIO A CONVENIR @else ARS ${{$post->precios}} @endif
                        <!--<small class="text-decoration-line-through text-muted">$10000</small>-->
                    </h5>
                      <span class="rounded-pill bg-success text-light section__title h6 fw-bold px-5 py-2">NUEVO</span>
                  
                    <hr class="my-4">

                    <h6>Información del vendedor:</h6>
                    <div class="d-block rounded-pill bg-light border border-gray h6 fw-bold px-3 py-2">
                        <i class="fas fa-mail-bulk"></i>
                        consultas@distlooktucuman.com.ar
                    </div>
                    <div class="d-block rounded-pill bg-light border border-gray h6 fw-bold px-3 py-2">
                        <a><i class="fas fa-phone-alt"></i>
                        +54 9 381-506-4935</a>
                    </div>

                    @if($colores->count() !== 0)
                      <hr class="my-4"> 
                      <h6>Colores disponibles:</h6>
                      <div class="d-flex flex-wrap justify-content-center">
                          @foreach($colores as $colores)
                            <?php
                              $atributo_color = $colores->colores()->first();
                            ?>
                            <a href="#" id="color{{$atributo_color->id}}" onclick="get_atribute({{$atributo_color->id}}, 'color', {{$post->id}} )" class="picker-color rounded-circle border border-3 border-dark card-hover" style="background-color: {{$atributo_color->color}};"></a>
                          @endforeach
                        </div>
                    @endif

                    @if($talles->count() !== 0)
                      <hr class="my-4">
                      <h6>Talles disponibles:</h6>
                      <div class="d-flex flex-wrap justify-content-center">
                        @foreach($talles as $talles)
                          @php
                            $atributo_talle = $talles->talles()->first();
                          @endphp
                          <a href="#" id="talle{{$atributo_talle->id}}"  onclick="get_atribute({{$atributo_talle->id}}, 'talle', {{$post->id}} )" data-toast="1" class="toast-btn-toggle rounded bg-dark text-light h6 p-2 me-2 mb-2">{{$atributo_talle->talle}}</a>
                        @endforeach
                      </div>
                    @endif
                   <hr class="my-4">
                   
                        <div class="col-12 col-md-12 col-lg-12">
                            <div class="form-floating">
                                <select class="form-select" id="cantidad"  aria-label="Floating label select example">
                                  <option value="1">1</option>
                                  <option value="2">2</option>
                                  <option value="3">3</option>
                                  <option value="4">4</option>
                                  <option value="5">5</option>
                                  <option value="7">7</option>
                                  <option value="8">8</option>
                                </select>
                                <label for="input_condition">Cantidad</label>
                            </div>
                        </div>
                        <hr class="my-4">
                        <div class="d-grid gap-2">
                            <a @if(Auth::check()) href="#carrito"  onclick="addCart({{$post->id}});" @else href="/auth/user/login" @endif class="btn btn-primary">Agregar al carrito</a>
                            <a  @if(Auth::check()) href="#now" onclick="buynow({{$post->id}});" @else href="/auth/user/login" @endif class="btn btn-outline-primary">Comprar ahora</a>
                        </div>
                </div>
            </div>
            <div class="product__description">
                <div class="container-fluid py-3 shadow rounded bg-white">
                  <h5 class="border-bottom border-gray mb-3">Descripción de la publicación</h5>
                   
                      <ul class="list-group list-group-flush h5 mb-3">
                          @if(!is_null($post->ma_name))
                            <li class="list-group-item d-flex flex-column flex-md-row justify-content-between">
                                <span class="text-muted fw-normal">Marca</span>
                                <b>{{$post->ma_name}}</b>
                            </li>
                          @endif

                          @if(!is_null($post->mo_name))
                          <li class="list-group-item d-flex flex-column flex-md-row justify-content-between">
                              <span class="text-muted fw-normal">Modelo</span>
                              <b>{{$post->mo_name}}</b>
                          </li>
                          @endif
                      
                      </ul>
                    
                    @php
                      $body = str_replace("\n", "<p>", $post->body);
                    @endphp
                    <p>{!! $body !!}</p>

                    <div class="row g-3 mt-3">
                        <div class="col-12 col-md-6 col-lg-4">
                            <a href="#" onclick="window.open('https://www.facebook.com/sharer.php?u={{url()->current()}}','Compartir', 'toolbar=0, status=0, width=650, height=450');" class="d-block w-100 btn btn-blue">
                                <i class="fab fa-facebook-square"></i> Compartir
                            </a>
                        </div>
                        <div class="col-12 col-md-6 col-lg-4">
                            <a href=" https://api.whatsapp.com/send?text= Mira que bueno esta, {{url()->current()}}" class="d-block w-100 btn btn-green text-white">
                                <i class="fab fa-whatsapp"></i> Compartir
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <?php /*
            <div class="product__questions">
                <div class="container-fluid py-3 shadow rounded bg-white">
                    <h5 class="border-bottom border-gray mb-3">Consultas al vendedor</h5>
                    <div class="mb-3 row g-2 align-items-center">
                        <div class="col-12 col-md-8 col-lg-10">
                            <input type="text" name="consulta" maxlength="255" id="consulta" class="form-control" placeholder="Escribí aquí tu consulta...">
                        </div>
                        <div class="col-12 col-md-4 col-lg-2">
                          @if(Auth::check())
                            <button class="btn btn-outline-info w-100" onclick="btnbconsulta();">Enviar</button>
                          @else
                            <a href="/auth/user/login" class="btn btn-outline-info w-100">Enviar</a>
                          @endif
                        </div>
                    </div>
                 
                    <h5 class="mb-3 mt-5">Últimas Consultas </h5>
                    <div id="autoload">
                      @if($consultas->count()>0)
                        @foreach($consultas as $consulta)
                            <div class="alert alert-gray">
                                <h6 class="text-black">{{$consulta->mensaje}}</h6>
                                @if($consulta->answered)
                                <p class="ms-4" style="word-break: break-all;">{{$consulta->answered}}</p>
                                @endif
                                <span class="d-block text-end">{{$consulta->created_at->todateString()}}</span>
                            </div>
                        @endforeach
                      @else
                        <div class="alert alert-info">Nadie ha comentado nada, se el primero en hacerlo.</div>
                      @endif
                    </div>  
                </div>
            </div>
             */ ?>

            <div class="product__similars">
                <div class="container-fluid py-3 shadow rounded bg-white">
                    <h5 class="border-bottom border-gray mb-3">Publicaciones Similares</h5>

                    <div class="slider slick-theme slider--home">
                        <div class="slider__container list-product">
                          @if($simil->count()>0)
                            @foreach($simil as $simils)
                              <?php 
                                $imgsimil = $simils->postimagenes()->limit(1)->first();
                                $las_storage = NULL;
                                $laspImg = NULL;
                                if ($imgsimil) {
                                    $laspImg = $imgsimil->imagen;
                                    $las_storage = $imgsimil->storage;
                                }
                              ?>
                                <div class="card card-hover mx-2">
                                    <img src="{{voyager::get_image($laspImg,'small',$las_storage)}}" class="card-img-top" alt="{{$simils->title}}">
                                    <div class="card-body d-flex flex-column justify-content-between">
                                        <h5 class="card-title m-0 text-truncate h6">{{str_limit($simils->title,37)}}</h5>
                                        <p class="card-text m-0 section__title fw-bold">
                                            ARS ${{$simils->precios}}
                                        </p>
                                    </div>
                                    <a href="/publicacion/{{str_slug($simils->name,'-')}}/{{str_slug($simils->title)}}/{{$simils->id}}" class="stretched-link"></a>
                                </div>
                              @endforeach
                            @endif
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>


@endsection

@section('jsheader')
   @if($imagenes->count() > 0)
    <meta property="og:image" content="@if($imagen->storage !='online') https://www.distlooktucuman.com.ar{{Voyager::get_image($imagen->imagen, 'small', $imagen->storage)}} @else {{Voyager::get_image($imagen->imagen, 'small', $imagen->storage)}}  @endif"/>
    <meta name="twitter:image" content="@if($imagen->storage !='online') https://www.distlooktucuman.com.ar{{Voyager::get_image($imagen->imagen, 'small', $imagen->storage)}} @else {{Voyager::get_image($imagen->imagen, 'small', $imagen->storage)}}  @endif">
  @endif 
  <script type='application/ld+json'> 
      {
        "@context": "http://www.schema.org",
        "@type": "product",
        "sku": "{{rand(0,200)}}{{$post->id}}{{str_slug($post->categoryId,'-')}}",
        "mpn": "{{rand(0,200)}}{{$post->id}}{{str_slug($post->categoryId,'-')}}",
        "brand":{
          "@type": "Brand",
          "name": @if(!is_null($post->ma_name))"{{$post->ma_name}}" @else "Look Tucumán" @endif
        },
        "name": "{{$post->title}}",
        @if($imagenes->count() > 0) "image": @if($imagen->storage !='online') "https://www.distlooktucuman.com.ar{{Voyager::get_image($imagen->imagen, 'small', $imagen->storage)}}" @else "{{Voyager::get_image($imagen->imagen, 'small', $imagen->storage)}}"  @endif , @endif
        "description": "{{str_replace('-', '',  str_limit($post->body, 130))}}",
        "aggregateRating": {
          "@type": "aggregateRating",
          "ratingValue": "5.0",
          "reviewCount": "{{$cant_visitas}}"
        },

        "review": {
          "@type": "Review",
          "reviewRating": {
            "@type": "Rating",
            "ratingValue": "4",
            "bestRating": "5"
          },
          "author": {
            "@type": "Person",
            "name": "Look Tucumán"
          }

          }
      }
  </script>
@append

@section('jsfooter')
<script>
/*
  function autoload(postId) {
    var request = new XMLHttpRequest();

    request.open('GET', '/autload-consultas/'+postId, true);

    request.onload = function() {
      if (request.status >= 200 && request.status < 400) {
        var resp = request.responseText;
        document.querySelector('#autoload').innerHTML = resp;
      }
    };

    request.send();
  }*/
/*
  function btnbconsulta() {
   var consulta = $("#consulta").val();

   if (consulta==""){
    var myElement = document.getElementById("consulta");
    myElement.setAttribute('style', 'border: 1px solid #dc3545');
    return;
   }
    showload();
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        var response = JSON.parse(this.responseText);
        if (response["status"]=="success"){
          autoload({{$post->id}});
        }
        toastr(response["status"],response["msg"]);
        hideload();
      }
    };
    xhttp.open("POST", "/interesados-consultas", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("consulta="+consulta+"&_token="+"{{csrf_token()}}&postId="+{{$post->id}});
 
 }
 */
 function get_atribute(a, b, c) {
    showload();
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        if (b=="talle"){
          d="Talle";
        }else{
          d="Color";
        }
        toastr("success","El "+d+" ha sido seleccionado");
        var myElement = document.getElementById(b+a);
        hideload();
      }
    };
    xhttp.open("POST", "/select-post-atribute", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("atributo_id="+a+"&_token="+"{{csrf_token()}}&atributo="+b+"&post_Id="+c);
 }

 function addCart(i,rightnow=null) {
   var cantidad = $("#cantidad").val();
   var now = rightnow

   if (cantidad==""){
    var myElement = document.getElementById("cantidad");
    myElement.setAttribute('style', 'border: 1px solid #dc3545');
    toastr("warning","Seleccione la cantidad");
    return;
   }
    showload();
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        var response = JSON.parse(this.responseText);
        toastr(response["status"],response["msg"]);
        
        if(now){
          window.location = response["url"];
        }

        hideload();
      }
    };
    xhttp.open("POST", "/addtoCart", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("post_id="+i+"&_token="+"{{csrf_token()}}&cantidad="+cantidad+"&rightnow="+now);
 }

 function buynow(pubId) {
   addCart(pubId,true);
 }
</script>
@append

