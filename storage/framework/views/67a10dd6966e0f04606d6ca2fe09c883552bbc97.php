<?php $__env->startSection('meta'); ?>
  <title>Validacion de  cuenta</title>
<?php $__env->stopSection(); ?>


<?php $__env->startSection('content'); ?>
<div class="container mt-5 mb-5  b-white">
  <div class=" <?php if($status == 'true'): ?> success <?php else: ?> error <?php endif; ?> col-md-12 text-center">
    <?php if($status == 'true'): ?>
      <div class="col-md-12">
        <h1>SU CUENTA HA SIDO VALIDADA</h1>
        <div class="text-center"><i class="fa fa-smile-o"></i></div>
          <p>¡Gracias por validar tu cuenta! Ahora puedes disfrutar de una experiencia de compra fácil, segura y con la mejor selección de productos en nuestro sitio. No te pierdas nuestras promociones y descuentos exclusivos para ti. ¡Haz tu pedido ahora y recíbelo en la comodidad de tu hogar!</p>
      </div>
      <div class="col-md-12">
        <a href="/" class="btn btn-warning">Comprar</a>
      </div>
    <?php else: ?>
      <div class="col-md-12">
        <h1>OCURRIO UN ERROR</h1>
        <div class="text-center"><i class=" fa fa-frown-o"></i></div>
        <p>Al parecer esta cuenta ya esta validada o no esta registrada en nuestro sistema</p>
      </div>
      <div class="col-md-12">
        <a href="/auth/user/register" class="btn btn-warning">Registrarme </a>
        <a href="/auth/user/login" class="btn btn-success">Ingresar</a>
      </div>
    <?php endif; ?>
  </div>
</div>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/html/terminados/nuevo/looktucuman/resources/views/user/validate.blade.php ENDPATH**/ ?>