<?php 
   $url = url()->full();
?>

<?php $__env->startSection('meta'); ?>
    <meta name="title" content="<?php echo e($category->name); ?> | Look Tucumán">
    <meta name="description" content="<?php if($category->descripcion): ?> <?php echo e($category->descripcion); ?> <?php else: ?> <?php echo e($category->name); ?> en Tucumán, encuentra todo lo que necesitas para tu negocio de estética en Look Tucumán <?php endif; ?>">
    <meta property="og:locale" content="es_AR">
    <meta property="og:description" content="<?php if($category->descripcion): ?> <?php echo e($category->descripcion); ?> <?php else: ?> <?php echo e($category->name); ?> en Tucumán, encuentra todo lo que necesitas para tu negocio de estética en Look Tucumán <?php endif; ?>">
    <meta property="og:site_name" content="Look Tucumán">
    <meta name="author" content="Look Tucumán">
    <meta property="og:image" content="<?php if($category->imagenceo): ?> https://www.looktucuman.com/storage/<?php echo e($category->imagenceo); ?> <?php else: ?> https://www.looktucuman.com/storage/<?php echo e(Voyager::setting('site.ogimage')); ?> <?php endif; ?>">
    <title><?php echo e($category->name); ?> | Look Tucumán</title>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
<section class="min-height">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12 col-lg-4 col-xl-3 p-0">
                <?php echo $__env->make("category.filter", \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            </div>
            <div class="col-12 col-lg-8 col-xl-9 py-5">
                <div class="row gy-3 gx-2 justify-content-center">
                    <div class="col-12">
				  	<?php if(is_null($category->parent_id)): ?>
				  		<?php $prdcatname = $category->name; ?>
				  	<?php else: ?>
				  		<?php $cat_parent =  $category->get_parent()->first(); ?>
				  		<?php $prdcatname = $cat_parent->name; ?>
				  	<?php endif; ?>

                        <h2 class="text-center"><?php echo e($category->name); ?></h2>
                    </div>
                    <?php $n1=1; ?>
                    <?php if(count($productos)>0): ?>
					<?php $__currentLoopData = $productos; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $post): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
               	 		<?php echo e(Voyager::h_listview($post["title"], $post["id"], $post["imagen"], null, $post["precios"], 'small', $prdcatname)); ?>

                        <?php $n1++; ?>
                   <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                   <div class="col-12">
					<nav aria-label="Page navigation">
					  <ul class="pagination">
						    <?php echo e($render->render()); ?>

					  </ul>
					</nav>
                   </div>
                   <?php else: ?>
                    <div class="alert alert-info">Seccion sin contenido.</div>
                   <?php endif; ?>
                    <?php /*<div class="col-12">
                        <div class="d-flex justify-content-center">
                            <a href="#" class="btn btn-primary">Cargando más publicaciones...</a>
                        </div>
                    </div> */ ?>
                </div>
            </div>
        </div>
    </div>
</section>
<?php $__env->startSection('jsfooter'); ?>

<script>
    let priceShow = document.getElementById("price-show")
    let priceChange = document.getElementById("price-change")
    let filterContainer = document.getElementById("filter-container")

    priceShow.innerHTML = priceChange.value
    priceChange.oninput = function() {
        priceShow.innerHTML = this.value
    }

    window.onload = () => {
        if(window.innerWidth >= 992){
            filterContainer.classList.add("show")
        }
    }

	$('#price-change').change(function() {
		var xhttp = new XMLHttpRequest();
		var price = $(this).val();
		
		xhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200) {
	        	window.location = "";
		    }
		};
		xhttp.open("GET", "/filtro-category?argument=price_rangue&max_price="+price, true);
		xhttp.send();
	});

    function orderatribute(o) {
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200) {
	        	window.location = "";
		    }
		};
		xhttp.open("GET", "/filtro-category?argument=catOrden&atribute="+o, true);
		xhttp.send();
    }

</script>
<?php $__env->appendSection(); ?>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/html/terminados/nuevo/looktucuman/resources/views/category/index.blade.php ENDPATH**/ ?>