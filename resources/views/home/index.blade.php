@extends('layouts.app')

@section('meta')
  <meta name="title" content="Distribuidora de insumos mayoristas de estética | {{Voyager::setting('site.title')}}" >
  <meta name="description" content="Somos una distribuidora de insumos mayoristas de estética con los mejores productos y precios del mercado.">
  <meta name="keywords" content="distribuidora, insumos, mayoristas, estética, productos, precios, calidad, belleza, salud, cuidado" >
  <meta property="og:locale" content="es_ar" >
  <meta property="og:title" content="Distribuidora de insumos mayoristas de estética | {{Voyager::setting('site.title')}}" >
  <meta property="og:description" content="Somos una distribuidora de insumos mayoristas de estética con los mejores productos y precios del mercado. }" >
  <meta property="og:site_name" content="{{Voyager::setting('site.title')}}" >
  <title>Distribuidora de insumos mayoristas de estética | {{Voyager::setting('site.title')}}</title>


    <meta  property=og:image content="https://www.distlooktucuman.com.ar/storage/{{Voyager::setting('site.ogimage')}}" >

    <title>{{Voyager::setting('site.title')}}</title>
    <script type="application/ld+json">
    {
      "@context": "https://schema.org",
      "@type": "WebSite",
      "url": "https://www.distlooktucuman.com.ar/",
      "potentialAction": {
        "@type": "SearchAction",
        "target": "https://www.distlooktucuman.com.ar/search?data={search_term_string}",
        "query-input": "required name=search_term_string"
      }
    }
    </script>
    <script type="application/ld+json">
    {
      "@context": "https://schema.org",
      "@type": "Organization",
      "url": "https://www.distlooktucuman.com.ar",
      "name":"Ventas Tucumán",
      "logo": "https://www.distlooktucuman.com.ar/storage/{{Voyager::setting('site.logo')}}",
        "sameAs": [
        "https://www.facebook.com/Distribuidora-Look-Tucum%C3%A1n-409175346186462/",
        "https://www.instagram.com/distribuidoralooktucuman/"
      ],
       "address": {
       "@type": "PostalAddress",
       "streetAddress": "Av. Belgrano y Necochea",
       "addressRegion": "TUC",
       "postalCode": "4000",
       "addressCountry": "AR"
     }
    }
    </script>
@stop


@section('content')
@if($sliders->count() > 0)
  <div class="section slider slider--main">
      <div class="slider__container">
          @foreach($sliders as $showSlider)
            <div class="slider__item">
                <img src="/storage/{{$showSlider->image}}" alt="{{$showSlider->tittle}}" class="slider__background">
                <div class="slider__foreground text-center">
                    @if($showSlider->tittle)<h2 class="display-lg-2 section__title fw-bold slider__title slider__title--primary">{{$showSlider->tittle}}</h2>@endif
                    @if($showSlider->link)<a href="{{$showSlider->link}}" class="mt-2 mt-md-5 btn btn-primary">Ver más</a>@endif
                </div>
            </div>
          @endforeach
      </div>
  </div>
@endif

<section class="section">
    <div class="container">
        <h1 class="section__title h3 text-center">
            <b>Distlook Tucumán:</b> Venta mayorista de insumos de estética de alta calidad con entrega eficiente.
            <br>
            ¡Compra con confianza hoy!
        </h1>
    </div>
</section>

<section class="section list-product">
    <div class="container">
        <div class="d-flex flex-wrap aling-items-center mb-4">
            <h4 class="section__lead">Te podría interesar</h4>
        </div>
        <div class="slider slick-theme slider--home">
            <div class="slider__container">
              @foreach($visitas as $visita)
                  <?php 
                    $imagen =  \App\Models\PostImagenes::select('imagen')->where("posts_id",$visita->id)->orderBy('id', 'ASC')->take(1)->first();
                  ?>
                  @if($imagen)
                    <div class="card card-hover mx-2">
                        <img data-src-load="{{Voyager::get_image($imagen->imagen, 'medium')}}" class="card-img-top index-img" alt="{{$visita->title}}">
                        <div class="card-body d-flex flex-column justify-content-between">
                            <h5 class="card-title m-0 h6">{{$visita->title}}</h5>
                            <p class="card-text m-0 section__title fw-bold">
                              ARS ${{$visita->precios}}
                            </p>
                        </div>
                        <div class="card-footer">
                            <p class="card-text text-muted">+{{$visita->cant_visita}} visitaron este producto</p>
                        </div>
                        <a href="/publicacion/{{str_slug($visita->name,'-')}}/{{str_slug($visita->title)}}/{{$visita->id}}" class="stretched-link"></a>
                    </div>
                  @endif
              @endforeach
            </div>
        </div>
    </div>
</section>

<section class="section list-product">
    <div class="container">
        <div class="d-flex flex-wrap aling-items-center mb-4">
            <h4 class="section__lead">¡Precios bajos! 🎉</h4>
            <a href="/promociones" class="btn btn-outline-secondary ms-auto">Ver más</a>
        </div>
        <div class="slider slick-theme slider--home">
            <div class="slider__container">
              @foreach($ofertas as $oferta)
                <?php 
                  $imgOfertas =  $oferta->postimagenes()->select('imagen')->orderBy('id', 'ASC')->take(1)->first();
                ?>
                 @if($imgOfertas)
                    <div class="card card-hover mx-2">
                       <img data-src-load="{{Voyager::get_image($imgOfertas->imagen, 'medium')}}" class="card-img-top index-img" alt="{{$oferta->title}}">
                        <div class="card-body d-flex flex-column justify-content-between">
                            <h5 class="card-title m-0  h6">{{$oferta->title}}</h5>
                          
                               <?php /* <small class="text-success section__title fw-bold"><?php echo $disccount ?>% OFF</small>
                                <p class="card-text m-0 section__title fw-bold">
                                    ARS $<?php echo $final ?>
                                    <small class="text-decoration-line-through text-muted">$<?php echo $price ?></small>
                                </p>
                                 */ ?>
                                <p class="card-text m-0 section__title fw-bold">
                                    ARS ${{$oferta->precios}}
                                </p>
                        
                        </div>
                        <?php /*<div class="card-footer">
                            <p class="card-text text-muted">+1500 visitaron este producto</p>
                        </div> */ ?>
                        <a href="/publicacion/{{str_slug($oferta->name,'-')}}/{{str_slug($oferta->title)}}/{{$oferta->id}}" class="stretched-link"></a>
                    </div>
                    @endif
              @endforeach
            </div>
        </div>
    </div>
</section>

<section class="section list-product">
    <div class="container">
        <?php 
            $breadcrumbList = [];
        ?>
        @foreach ($categorias as $categoria)
         
          @if(!is_null($categoria->parent_id))
            <?php $pro = $categoria->postpersubCategory();?>
          @else
            <?php $pro = $categoria->posts(); ?>
          @endif

          <?php 
            $pro->select('posts.id','title', 'body', 'marca_id', 'precios', 'posts.created_at', 'pv.cant_visita');
            $pro->where('status', 'PUBLISHED');
            $pro->leftjoin('posts_visitas as pv', 'posts.id','=','pv.posts_id');
            $pro = $pro->inRandomOrder()->limit(8)->get(); 
          ?>

          <div class="d-flex flex-wrap aling-items-center mb-4">
            <h4 class="section__lead">{{$categoria->name}}</h4>
            <a href="/categoria/{{$categoria->id}}/{{str_slug($categoria->name, '-')}}" class="btn btn-outline-secondary ms-auto">Ver más</a>
          </div>
          <div class="slider slick-theme slider--home">
              <div class="slider__container">
              @foreach($pro as $productos)
                    <?php 
                      $imagenes =  $productos->postimagenes()->select('imagen')->orderBy('id', 'ASC')->take(1)->first();
                    ?>
                    @if($imagenes)
                      <div class="card card-hover mx-2">
                          <img data-src-load="{{Voyager::get_image($imagenes->imagen, 'medium')}}" class="card-img-top index-img" alt="{{$productos->title}}">
                          <div class="card-body d-flex flex-column justify-content-between">
                              <h5 class="card-title m-0  h6">{{$productos->title}}</h5>
                              <p class="card-text m-0 section__title fw-bold">
                                  ARS ${{$productos->precios}}
                              </p>
                          </div>
                          <div class="card-footer">
                              <p class="card-text text-muted">+{{$productos->cant_visita}} visitaron este producto</p>
                          </div>
                          <a href="/publicacion/{{str_slug($categoria->name,'-')}}/{{str_slug($productos->title)}}/{{$productos->id}}" class="stretched-link"></a>
                      </div>
                    @endif
                    <?php
                    $breadcrumbList[]=[
                      "id"=>$productos->id,
                      "titulo"=>$productos->title,
                      "category"=>$categoria->name
                    ];
                    ?>
                @endforeach
              </div>
          </div>
        @endforeach
    </div>
</section>

<?php $position = 1; ?>
@section('meta')
  
  @if(count($breadcrumbList) > 0)
    <?php $n=1; ?>
    <script type="application/ld+json">
      {
        "@context": "https://schema.org",
        "@type": "BreadcrumbList",
        "itemListElement": [
          @foreach($breadcrumbList as $index => $ruta)
            {
              "@type": "ListItem",
              "position": {{$n}},
              "name": "{{str_slug($ruta["titulo"])}}",
              "item": "https://distlooktucuman.com.ar/publicacion/{{str_slug($ruta["category"])}}/{{str_slug($ruta["titulo"])}}/{{$ruta["id"]}}"
            @if($ruta === end($breadcrumbList)) } @else }, @endif
            <?php $n++;  ?>
        @endforeach
        ]
      }
      </script>
  @endif

@append
@endsection

