<?php $__env->startSection('meta'); ?>
<meta name="title" content="<?php echo e($post->title); ?> - Look Tucumán" />
<meta name="description" content="<?php echo e(str_limit(strip_tags($post->body), 160)); ?>" />
<meta name="keywords" content="<?php echo e($post->category_name); ?>, <?php echo e($post->subcategory_name); ?>, insumos de estetica, mayorista" />
<meta property="og:title" content="<?php echo e($post->title); ?> - Look Tucumán" />
<meta property="og:description" content="<?php echo e(str_limit(strip_tags($post->body), 160)); ?>" />
<meta property="og:image" content="<?php if($post->imagen): ?> https://www.looktucuman.com.ar/storage/<?php echo e($post->imagen); ?> <?php else: ?> https://www.looktucuman.com.ar/storage/<?php echo e(Voyager::setting('site.ogimage')); ?> <?php endif; ?>" />
<meta property="og:url" content="<?php echo e(url()->current()); ?>" />
<meta property="og:site_name" content="Look Tucumán - Venta Mayorista de Insumos de Estética" />
<meta property="og:type" content="article" />
<title><?php echo e($post->title); ?> - Look Tucumán</title>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
<section class="min-height">
    <div class="container">
        <div class="col-12 mt-3 d-none d-md-block">
            <nav aria-label="breadcrumb" class="bg-secondary rounded-pill py-3 px-5">
                <ol class="breadcrumb m-0">
                    <?php if(!is_null($post->category_id)): ?>
                      <li class="breadcrumb-item section__title fw-bold"><a href="/categoria/<?php echo e($post->category_id); ?>/<?php echo e(str_slug($post->category_name)); ?>"><?php echo e($post->category_name); ?></a></li>
                    <?php endif; ?>
                    <?php if(!is_null($post->subcategoryId)): ?>
                      <li class="breadcrumb-item section__title fw-bold"><a href="/categoria/<?php echo e($post->subcategoryId); ?>/<?php echo e(str_slug($post->subcategory_name)); ?>"><?php echo e($post->subcategory_name); ?></a></li>
                    <?php endif; ?>
                    <?php if(!is_null($post->ma_name)): ?>
                      <li class="breadcrumb-item section__title fw-bold active" aria-current="page"><?php echo e($post->ma_name); ?></li>
                    <?php endif; ?>
                    <?php if(!is_null($post->mo_name)): ?>
                      <li class="breadcrumb-item section__title fw-bold active" aria-current="page"><?php echo e($post->mo_name); ?></li>
                    <?php endif; ?>
                </ol>
            </nav>
        </div>

        <div class="product my-3">
            <?php if($imagenes->count() > 0): ?>
              <div class="product__view">
                  <div class="container-fluid shadow rounded bg-white">
                      <div class="slider slider--main slider-show">
                        <?php $__currentLoopData = $imagenes; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $imagen): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                          <img src="<?php echo e(Voyager::get_image($imagen->imagen, NULL, $imagen->storage)); ?>" alt="<?php echo e($post->title); ?>" class="slider__frame slider__frame--slide">
                          <?php $thubnail[] = $imagen; ?>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                      </div>
                      <div class="slider slider-nav">
                        <?php $__currentLoopData = $thubnail; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $th): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                          <img src="<?php echo e(Voyager::get_image($th->imagen, 'small', $imagen->storage)); ?>" alt="<?php echo e($post->title); ?>" class="slider__frame slider__frame--nav">
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                      </div>
                  </div>
              </div>
            <?php else: ?>
            <div class="product__view">
                  <div class="container-fluid shadow rounded bg-white">
                      <div class="slider slider--main slider-show">
                          <img src="<?php echo e(Voyager::get_image($post->old_img, NULL)); ?>" alt="<?php echo e($post->title); ?>" class="slider__frame slider__frame--slide">
                      </div>
                  </div>
              </div>
            <?php endif; ?>
            <div class="product__price">
                <div class="container-fluid py-3 h-100 shadow rounded bg-white">
                    <div class="row align-items-center">
                        <div class="col-3 col-sm-2 col-lg-3">
                            <a href="/categoria/<?php echo e($post->category_id); ?>/<?php echo e(str_slug($post->category_name)); ?>">
                                <img src="/storage/<?php echo e(setting('site.logo')); ?>" alt="" class="rounded-circle shadow img-fluid">
                            </a>
                        </div>
                        <div class="col-9 col-sm-10 col-lg-9">
                            <a href="/categoria/<?php echo e($post->category_id); ?>/<?php echo e(str_slug($post->category_name)); ?>" class="custom-link link-secondary">
                                <h4 class="section__lead h6 text-truncate"><?php echo e($post->category_name); ?></h4>
                            </a>
                        </div>
                    </div>

                    <hr class="my-4">

                    <!-- Titulo de la publicación -->
                    <h4 class="mb-4"><?php echo e($post->title); ?></h4>

                    <!--<span class="text-success section__title fw-bold">10% OFF</span>-->
                    <h5 class="mb-4 section__title fw-bold">
                        <?php if($post->precios == 1 or $post->precios == 0): ?> PRECIO A CONVENIR <?php else: ?> ARS $<?php echo e($post->precios); ?> <?php endif; ?>
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

                    <?php if($colores->count() !== 0): ?>
                      <hr class="my-4"> 
                      <h6>Colores disponibles:</h6>
                      <div class="d-flex flex-wrap justify-content-center">
                          <?php $__currentLoopData = $colores; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $colores): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <?php
                              $atributo_color = $colores->colores()->first();
                            ?>
                            <a href="#" id="color<?php echo e($atributo_color->id); ?>" onclick="get_atribute(<?php echo e($atributo_color->id); ?>, 'color', <?php echo e($post->id); ?> )" class="picker-color rounded-circle border border-3 border-dark card-hover" style="background-color: <?php echo e($atributo_color->color); ?>;"></a>
                          <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </div>
                    <?php endif; ?>

                    <?php if($talles->count() !== 0): ?>
                      <hr class="my-4">
                      <h6>Talles disponibles:</h6>
                      <div class="d-flex flex-wrap justify-content-center">
                        <?php $__currentLoopData = $talles; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $talles): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                          <?php
                            $atributo_talle = $talles->talles()->first();
                          ?>
                          <a href="#" id="talle<?php echo e($atributo_talle->id); ?>"  onclick="get_atribute(<?php echo e($atributo_talle->id); ?>, 'talle', <?php echo e($post->id); ?> )" data-toast="1" class="toast-btn-toggle rounded bg-dark text-light h6 p-2 me-2 mb-2"><?php echo e($atributo_talle->talle); ?></a>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                      </div>
                    <?php endif; ?>
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
                            <a <?php if(Auth::check()): ?> href="#carrito"  onclick="addCart(<?php echo e($post->id); ?>);" <?php else: ?> href="/auth/user/login" <?php endif; ?> class="btn btn-primary">Agregar al carrito</a>
                            <a  <?php if(Auth::check()): ?> href="#now" onclick="buynow(<?php echo e($post->id); ?>);" <?php else: ?> href="/auth/user/login" <?php endif; ?> class="btn btn-outline-primary">Comprar ahora</a>
                        </div>
                </div>
            </div>
            <div class="product__description">
                <div class="container-fluid py-3 shadow rounded bg-white">
                  <h5 class="border-bottom border-gray mb-3">Descripción de la publicación</h5>
                   
                      <ul class="list-group list-group-flush h5 mb-3">
                          <?php if(!is_null($post->ma_name)): ?>
                            <li class="list-group-item d-flex flex-column flex-md-row justify-content-between">
                                <span class="text-muted fw-normal">Marca</span>
                                <b><?php echo e($post->ma_name); ?></b>
                            </li>
                          <?php endif; ?>

                          <?php if(!is_null($post->mo_name)): ?>
                          <li class="list-group-item d-flex flex-column flex-md-row justify-content-between">
                              <span class="text-muted fw-normal">Modelo</span>
                              <b><?php echo e($post->mo_name); ?></b>
                          </li>
                          <?php endif; ?>
                      
                      </ul>
                    
                    <?php
                      $body = str_replace("\n", "<p>", $post->body);
                    ?>
                    <p><?php echo $body; ?></p>

                    <div class="row g-3 mt-3">
                        <div class="col-12 col-md-6 col-lg-4">
                            <a href="#" onclick="window.open('https://www.facebook.com/sharer.php?u=<?php echo e(url()->current()); ?>','Compartir', 'toolbar=0, status=0, width=650, height=450');" class="d-block w-100 btn btn-blue">
                                <i class="fab fa-facebook-square"></i> Compartir
                            </a>
                        </div>
                        <div class="col-12 col-md-6 col-lg-4">
                            <a href=" https://api.whatsapp.com/send?text= Mira que bueno esta, <?php echo e(url()->current()); ?>" class="d-block w-100 btn btn-green text-white">
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
                          <?php if($simil->count()>0): ?>
                            <?php $__currentLoopData = $simil; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $simils): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
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
                                    <img src="<?php echo e(voyager::get_image($laspImg,'small',$las_storage)); ?>" class="card-img-top" alt="<?php echo e($simils->title); ?>">
                                    <div class="card-body d-flex flex-column justify-content-between">
                                        <h5 class="card-title m-0 text-truncate h6"><?php echo e(str_limit($simils->title,37)); ?></h5>
                                        <p class="card-text m-0 section__title fw-bold">
                                            ARS $<?php echo e($simils->precios); ?>

                                        </p>
                                    </div>
                                    <a href="/publicacion/<?php echo e(str_slug($simils->name,'-')); ?>/<?php echo e(str_slug($simils->title)); ?>/<?php echo e($simils->id); ?>" class="stretched-link"></a>
                                </div>
                              <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            <?php endif; ?>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>


<?php $__env->stopSection(); ?>

<?php $__env->startSection('jsheader'); ?>
   <?php if($imagenes->count() > 0): ?>
    <meta property="og:image" content="<?php if($imagen->storage !='online'): ?> https://www.distlooktucuman.com.ar<?php echo e(Voyager::get_image($imagen->imagen, 'small', $imagen->storage)); ?> <?php else: ?> <?php echo e(Voyager::get_image($imagen->imagen, 'small', $imagen->storage)); ?>  <?php endif; ?>"/>
    <meta name="twitter:image" content="<?php if($imagen->storage !='online'): ?> https://www.distlooktucuman.com.ar<?php echo e(Voyager::get_image($imagen->imagen, 'small', $imagen->storage)); ?> <?php else: ?> <?php echo e(Voyager::get_image($imagen->imagen, 'small', $imagen->storage)); ?>  <?php endif; ?>">
  <?php endif; ?> 
  <script type='application/ld+json'> 
      {
        "@context": "http://www.schema.org",
        "@type": "product",
        "sku": "<?php echo e(rand(0,200)); ?><?php echo e($post->id); ?><?php echo e(str_slug($post->categoryId,'-')); ?>",
        "mpn": "<?php echo e(rand(0,200)); ?><?php echo e($post->id); ?><?php echo e(str_slug($post->categoryId,'-')); ?>",
        "brand":{
          "@type": "Brand",
          "name": <?php if(!is_null($post->ma_name)): ?>"<?php echo e($post->ma_name); ?>" <?php else: ?> "Look Tucumán" <?php endif; ?>
        },
        "name": "<?php echo e($post->title); ?>",
        <?php if($imagenes->count() > 0): ?> "image": <?php if($imagen->storage !='online'): ?> "https://www.distlooktucuman.com.ar<?php echo e(Voyager::get_image($imagen->imagen, 'small', $imagen->storage)); ?>" <?php else: ?> "<?php echo e(Voyager::get_image($imagen->imagen, 'small', $imagen->storage)); ?>"  <?php endif; ?> , <?php endif; ?>
        "description": "<?php echo e(str_replace('-', '',  str_limit($post->body, 130))); ?>",
        "aggregateRating": {
          "@type": "aggregateRating",
          "ratingValue": "5.0",
          "reviewCount": "<?php echo e($cant_visitas); ?>"
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
<?php $__env->appendSection(); ?>

<?php $__env->startSection('jsfooter'); ?>
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
          autoload(<?php echo e($post->id); ?>);
        }
        toastr(response["status"],response["msg"]);
        hideload();
      }
    };
    xhttp.open("POST", "/interesados-consultas", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("consulta="+consulta+"&_token="+"<?php echo e(csrf_token()); ?>&postId="+<?php echo e($post->id); ?>);
 
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
    xhttp.send("atributo_id="+a+"&_token="+"<?php echo e(csrf_token()); ?>&atributo="+b+"&post_Id="+c);
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
    xhttp.send("post_id="+i+"&_token="+"<?php echo e(csrf_token()); ?>&cantidad="+cantidad+"&rightnow="+now);
 }

 function buynow(pubId) {
   addCart(pubId,true);
 }
</script>
<?php $__env->appendSection(); ?>


<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/html/terminados/nuevo/looktucuman/resources/views/post/show.blade.php ENDPATH**/ ?>