<?php $__env->startSection('meta'); ?>
  <meta name="title" content="Distribuidora de insumos mayoristas de estética | <?php echo e(Voyager::setting('site.title')); ?>" >
  <meta name="description" content="Somos una distribuidora de insumos mayoristas de estética con los mejores productos y precios del mercado.">
  <meta name="keywords" content="distribuidora, insumos, mayoristas, estética, productos, precios, calidad, belleza, salud, cuidado" >
  <meta property="og:locale" content="es_ar" >
  <meta property="og:title" content="Distribuidora de insumos mayoristas de estética | <?php echo e(Voyager::setting('site.title')); ?>" >
  <meta property="og:description" content="Somos una distribuidora de insumos mayoristas de estética con los mejores productos y precios del mercado. }" >
  <meta property="og:site_name" content="<?php echo e(Voyager::setting('site.title')); ?>" >
  <title>Distribuidora de insumos mayoristas de estética | <?php echo e(Voyager::setting('site.title')); ?></title>


    <meta  property=og:image content="https://www.distlooktucuman.com.ar/storage/<?php echo e(Voyager::setting('site.ogimage')); ?>" >

    <title><?php echo e(Voyager::setting('site.title')); ?></title>
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
      "logo": "https://www.distlooktucuman.com.ar/storage/<?php echo e(Voyager::setting('site.logo')); ?>",
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
<?php $__env->stopSection(); ?>


<?php $__env->startSection('content'); ?>
<?php if($sliders->count() > 0): ?>
  <div class="section slider slider--main">
      <div class="slider__container">
          <?php $__currentLoopData = $sliders; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $showSlider): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <div class="slider__item">
                <img src="/storage/<?php echo e($showSlider->image); ?>" alt="<?php echo e($showSlider->tittle); ?>" class="slider__background">
                <div class="slider__foreground text-center">
                    <?php if($showSlider->tittle): ?><h2 class="display-lg-2 section__title fw-bold slider__title slider__title--primary"><?php echo e($showSlider->tittle); ?></h2><?php endif; ?>
                    <?php if($showSlider->link): ?><a href="<?php echo e($showSlider->link); ?>" class="mt-2 mt-md-5 btn btn-primary">Ver más</a><?php endif; ?>
                </div>
            </div>
          <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
      </div>
  </div>
<?php endif; ?>

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
              <?php $__currentLoopData = $visitas; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $visita): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                  <?php 
                    $imagen =  \App\Models\PostImagenes::select('imagen')->where("posts_id",$visita->id)->orderBy('id', 'ASC')->take(1)->first();
                  ?>
                  <?php if($imagen): ?>
                    <div class="card card-hover mx-2">
                        <img data-src-load="<?php echo e(Voyager::get_image($imagen->imagen, 'medium')); ?>" class="card-img-top index-img" alt="<?php echo e($visita->title); ?>">
                        <div class="card-body d-flex flex-column justify-content-between">
                            <h5 class="card-title m-0 h6"><?php echo e($visita->title); ?></h5>
                            <p class="card-text m-0 section__title fw-bold">
                              ARS $<?php echo e($visita->precios); ?>

                            </p>
                        </div>
                        <div class="card-footer">
                            <p class="card-text text-muted">+<?php echo e($visita->cant_visita); ?> visitaron este producto</p>
                        </div>
                        <a href="/publicacion/<?php echo e(str_slug($visita->name,'-')); ?>/<?php echo e(str_slug($visita->title)); ?>/<?php echo e($visita->id); ?>" class="stretched-link"></a>
                    </div>
                  <?php endif; ?>
              <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
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
              <?php $__currentLoopData = $ofertas; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $oferta): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <?php 
                  $imgOfertas =  $oferta->postimagenes()->select('imagen')->orderBy('id', 'ASC')->take(1)->first();
                ?>
                 <?php if($imgOfertas): ?>
                    <div class="card card-hover mx-2">
                       <img data-src-load="<?php echo e(Voyager::get_image($imgOfertas->imagen, 'medium')); ?>" class="card-img-top index-img" alt="<?php echo e($oferta->title); ?>">
                        <div class="card-body d-flex flex-column justify-content-between">
                            <h5 class="card-title m-0  h6"><?php echo e($oferta->title); ?></h5>
                          
                               <?php /* <small class="text-success section__title fw-bold"><?php echo $disccount ?>% OFF</small>
                                <p class="card-text m-0 section__title fw-bold">
                                    ARS $<?php echo $final ?>
                                    <small class="text-decoration-line-through text-muted">$<?php echo $price ?></small>
                                </p>
                                 */ ?>
                                <p class="card-text m-0 section__title fw-bold">
                                    ARS $<?php echo e($oferta->precios); ?>

                                </p>
                        
                        </div>
                        <?php /*<div class="card-footer">
                            <p class="card-text text-muted">+1500 visitaron este producto</p>
                        </div> */ ?>
                        <a href="/publicacion/<?php echo e(str_slug($oferta->name,'-')); ?>/<?php echo e(str_slug($oferta->title)); ?>/<?php echo e($oferta->id); ?>" class="stretched-link"></a>
                    </div>
                    <?php endif; ?>
              <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </div>
        </div>
    </div>
</section>

<section class="section list-product">
    <div class="container">
        <?php 
            $breadcrumbList = [];
        ?>
        <?php $__currentLoopData = $categorias; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $categoria): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
         
          <?php if(!is_null($categoria->parent_id)): ?>
            <?php $pro = $categoria->postpersubCategory();?>
          <?php else: ?>
            <?php $pro = $categoria->posts(); ?>
          <?php endif; ?>

          <?php 
            $pro->select('posts.id','title', 'body', 'marca_id', 'precios', 'posts.created_at', 'pv.cant_visita');
            $pro->where('status', 'PUBLISHED');
            $pro->leftjoin('posts_visitas as pv', 'posts.id','=','pv.posts_id');
            $pro = $pro->inRandomOrder()->limit(8)->get(); 
          ?>

          <div class="d-flex flex-wrap aling-items-center mb-4">
            <h4 class="section__lead"><?php echo e($categoria->name); ?></h4>
            <a href="/categoria/<?php echo e($categoria->id); ?>/<?php echo e(str_slug($categoria->name, '-')); ?>" class="btn btn-outline-secondary ms-auto">Ver más</a>
          </div>
          <div class="slider slick-theme slider--home">
              <div class="slider__container">
              <?php $__currentLoopData = $pro; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $productos): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <?php 
                      $imagenes =  $productos->postimagenes()->select('imagen')->orderBy('id', 'ASC')->take(1)->first();
                    ?>
                    <?php if($imagenes): ?>
                      <div class="card card-hover mx-2">
                          <img data-src-load="<?php echo e(Voyager::get_image($imagenes->imagen, 'medium')); ?>" class="card-img-top index-img" alt="<?php echo e($productos->title); ?>">
                          <div class="card-body d-flex flex-column justify-content-between">
                              <h5 class="card-title m-0  h6"><?php echo e($productos->title); ?></h5>
                              <p class="card-text m-0 section__title fw-bold">
                                  ARS $<?php echo e($productos->precios); ?>

                              </p>
                          </div>
                          <div class="card-footer">
                              <p class="card-text text-muted">+<?php echo e($productos->cant_visita); ?> visitaron este producto</p>
                          </div>
                          <a href="/publicacion/<?php echo e(str_slug($categoria->name,'-')); ?>/<?php echo e(str_slug($productos->title)); ?>/<?php echo e($productos->id); ?>" class="stretched-link"></a>
                      </div>
                    <?php endif; ?>
                    <?php
                    $breadcrumbList[]=[
                      "id"=>$productos->id,
                      "titulo"=>$productos->title,
                      "category"=>$categoria->name
                    ];
                    ?>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
              </div>
          </div>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    </div>
</section>

<?php $position = 1; ?>
<?php $__env->startSection('meta'); ?>
  
  <?php if(count($breadcrumbList) > 0): ?>
    <?php $n=1; ?>
    <script type="application/ld+json">
      {
        "@context": "https://schema.org",
        "@type": "BreadcrumbList",
        "itemListElement": [
          <?php $__currentLoopData = $breadcrumbList; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $index => $ruta): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            {
              "@type": "ListItem",
              "position": <?php echo e($n); ?>,
              "name": "<?php echo e(str_slug($ruta["titulo"])); ?>",
              "item": "https://distlooktucuman.com.ar/publicacion/<?php echo e(str_slug($ruta["category"])); ?>/<?php echo e(str_slug($ruta["titulo"])); ?>/<?php echo e($ruta["id"]); ?>"
            <?php if($ruta === end($breadcrumbList)): ?> } <?php else: ?> }, <?php endif; ?>
            <?php $n++;  ?>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        ]
      }
      </script>
  <?php endif; ?>

<?php $__env->appendSection(); ?>
<?php $__env->stopSection(); ?>


<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/html/terminados/nuevo/looktucuman/resources/views/home/index.blade.php ENDPATH**/ ?>