<div class="col-11 col-sm-6 col-md-4 col-lg-3">
    <div class="card card-hover mx-2 list-product">
        <img src="<?php echo e(Voyager::get_image($imagen, $cropp_type, $storage)); ?>" class="card-img-top" alt="<?php echo e($title); ?>" title="<?php echo e($title); ?>">
        <div class="card-body d-flex flex-column justify-content-between">
            <h5 class="card-title m-0  h6"><?php echo e($title); ?></h5>
                <?php /*
                <small class="text-success section__title fw-bold"><?php echo $disccount ?>% OFF</small>
                <p class="card-text m-0 section__title fw-bold">
                    ARS $<?php echo $final ?>
                    <small class="text-decoration-line-through text-muted">$<?php echo $price ?></small>
                </p>
                 */ ?>
                <p class="card-text m-0 section__title fw-bold">
                    ARS $<?php echo e($precios); ?>

                </p>
        </div>
        <a href="/publicacion/<?php echo e(str_slug($prd_catname, '-')); ?>/<?php echo e(str_slug($title)); ?>/<?php echo e($id); ?>" class="stretched-link"></a>
    </div>
</div>




<?php /**PATH /var/www/html/terminados/nuevo/looktucuman/resources/views/shared/prd_listview.blade.php ENDPATH**/ ?>