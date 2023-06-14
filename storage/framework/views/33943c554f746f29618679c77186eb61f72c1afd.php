<?php $__env->startSection('meta'); ?>
<meta  name="title" content="Ingreso al sistema - distlooktucuman.com.ar" >
<meta  name="description" content="Ingrese al sistema de la aplicación para acceder a todas las funcionalidades. Se han tomado medidas de seguridad para proteger su cuenta.">
<meta  property="og:locale" content="es_ar" >
<meta  property="og:description" content="Ingrese al sistema de la aplicación para acceder a todas las funcionalidades. Se han tomado medidas de seguridad para proteger su cuenta.">
<meta  property="og:site_name" content="distlooktucuman.com.ar" >
<meta property="og:title" content="Ingreso al sistema - distlooktucuman.com.ar"/>
<title>Ingreso al sistema - distlooktucuman.com.ar</title>
  <?php $__env->stopSection(); ?>
<?php $__env->startSection('content'); ?>

<section class="py-6" style="min-height: 100vh;">
    <div class="container">
        <div class="row">
            <div class="col-12 col-lg-12">
                <h2 class="text-center mb-5">Ingreso al sistema - distlooktucuman.com.ar</h2>
            </div>
            <div class="col-12 m-auto col-lg-8">
                <div class="row g-3">
                    <div class="col-12 m-auto col-lg-6 p-5">
                        <div class="col-12 mb-3">
                            <h3 class="lead">Ingresar con tu email y contraseña</h3>
                        </div>
                        <form action="/auth/login" method="post">
                          <input type="hidden" name="_token" value="<?php echo e(csrf_token()); ?>"></input>
                          <div class="col-12 mb-3">
                              <div class="form-floating">
                                  <input type="email" name="email" class="form-control" id="input_email" placeholder="Ejemplo" value="<?php echo e(old("email")); ?>">
                                  <label for="input_email">E-mail</label>
                              </div>
                              <?php $__errorArgs = ['email'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                  <span class="invalid-feedback" role="alert">
                                      <strong><?php echo e($message); ?></strong>
                                  </span>
                              <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                          </div>
                          <div class="col-12 mb-3">
                              <div class="form-floating">
                                  <input type="password" name="password" class="form-control" id="input_pass" placeholder="Ejemplo">
                                  <label for="input_pass">Contraseña</label>
                              </div>
                              <?php $__errorArgs = ['password'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                  <span class="invalid-feedback " role="alert">
                                      <strong><?php echo e($message); ?></strong>
                                  </span>
                              <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                          </div>
                          <div class="col-12">
                              <div class="d-flex g-2 justify-content-center">
                                  <button class="btn btn-primary w-50">Ingresar</button>
                              </div>
                          </div>
                        </form>
                        <div class="col-12">
                            <div class="d-flex flex-column align-items-center">
                                <a href="<?php echo e(route('password.request')); ?>" class="section__link section__link--secondary">Olvidé mi Contraseña</a>
                                <a href="/auth/user/register" class="section__link section__link--secondary">Registrarme</a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</section>
 

<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/html/web/looktucuman/resources/views/user/login.blade.php ENDPATH**/ ?>