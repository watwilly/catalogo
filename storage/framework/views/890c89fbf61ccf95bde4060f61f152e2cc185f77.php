<?php $__env->startSection('meta'); ?>
    <title><?php echo e($status); ?></title>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
 
<section class="mt-5 mb-5">
    <div class="container payment text-center mt-5">
        
        <?php if($status == "approved"): ?>
            <i class="fa success mb-3 fa-check-square"></i>
        <?php elseif($status == "pending"): ?>
            <i class="fa pending  mb-3 fa-clock"></i>
        <?php elseif($status == "cancelled"): ?>
            <i class="fa cancelled  mb-3 fa-window-close"></i>
        <?php endif; ?>
        <h2><?php echo app('translator')->get("web.$status"); ?></h2>
        <h3 class="mb-5">Su pedido ha sido realizado. Nos contactaremos con Ud a la brevedad para coordinar pago y envío.</h3>
        <div class="row">
            <div class="col-md-5 m-auto">
                <a href="/" class="btn btn-info">Seguir comprando</a>
            </div>
        </div>
    </div>
</section>
<?php $__env->stopSection(); ?>


<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/html/terminados/nuevo/looktucuman/resources/views/auth/payment/paymentdiff.blade.php ENDPATH**/ ?>