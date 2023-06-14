<?php $__env->startSection('meta'); ?>
    <meta name="title" content="Regístrate y obtén acceso a nuestra distribuidora de insumos de estética mayorista en Look Tucumán">
    <meta name="description" content="Regístrate en nuestra distribuidora de insumos de estética mayorista en Look Tucumán y obtén acceso a nuestros productos. ¡Descubre nuestra amplia variedad de insumos y mejora tu negocio!">
    <meta name="keywords" content="registro, distribuidora de insumos de estética, mayorista, Look Tucumán">
    <meta property="og:title" content="Regístrate y obtén acceso a nuestra distribuidora de insumos de estética mayorista en Look Tucumán">
    <meta property="og:description" content="Regístrate en nuestra distribuidora de insumos de estética mayorista en Look Tucumán y obtén acceso a nuestros productos. ¡Descubre nuestra amplia variedad de insumos y mejora tu negocio!">
    <meta property="og:site_name" content="Regístrate y obtén acceso a nuestra distribuidora de insumos de estética mayorista en Look Tucumán">
    <meta property="og:type" content="website">
    <title>Regístrate y obtén acceso a nuestra distribuidora de insumos de estética mayorista en Look Tucumán</title>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
<section class="py-6" style="min-height: 100vh;">
    <div class="container">
        <div class="row">
            <div class="col-12">
            </div>
            <div class="col-12 col-lg-12">
                <div class="row g-3 col-lg-10 m-auto">
                    <div class="col-lg-6 m-auto ">
                        <div class="col-lg-12">
                            <h2 class="text-center mb-5">Crea tu cuenta.</h2>
                        </div>
                        <form method="POST" class="row  mb-4" action="<?php echo e(route('register')); ?>" >
                            <?php echo csrf_field(); ?>
                            <div class="col-12 mb-3">
                                <div class="form-floating">
                                    <input type="text" name="name" value="<?php echo e(old('name')); ?>" required class="form-control" id="input_name" placeholder="Ejemplo">
                                    <label for="input_name">Nombre</label>
                                </div>
                                <?php $__errorArgs = ['name'];
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
                            <div class="col-12  mb-3">
                                <div class="form-floating">
                                    <input type="text" name="apellido" value="<?php echo e(old('apellido')); ?>" required class="form-control" id="input_lastname" placeholder="Ejemplo">
                                    <label for="input_lastname">Apellido</label>
                                </div>
                                <?php $__errorArgs = ['apellido'];
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
                            <div class="col-12  mb-3">
                                <div class="form-floating">
                                    <input type="email" name="email" value="<?php echo e(old('email')); ?>" required class="form-control" id="input_email" placeholder="Ejemplo">
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
                            <div class="col-12  mb-3">
                                <div class="form-floating">
                                    <input type="text" name="direccion" value="<?php echo e(old('direccion')); ?>" required class="form-control" id="direccion" placeholder="Av. Mate de luna 1654">
                                    <label for="input_email">Domicilio</label>
                                </div>
                                <?php $__errorArgs = ['direccion'];
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
                            <div class="col-12  mb-3">
                                <div class="form-floating">
                                    <select id="provincia_id" name="provincia_id" class="form-control">
                                        <option value="">Seleccione la provincia</option>
                                        <?php $__currentLoopData = $provincias; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $provincia): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <option value="<?php echo e($provincia->id); ?>"><?php echo e($provincia->provincia); ?></option>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    </select>
                                </div>
                                <?php $__errorArgs = ['provincia_id'];
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
                            <div class="col-12  mb-3">
                                <div class="form-floating">
                                    <select id="localidad_id" name="localidad_id" class="form-control">
                                        <option value="">Seleccione la localidad</option>
                                    </select>
                                </div>
                                <?php $__errorArgs = ['localidad_id'];
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
                            <div class="col-12  mb-3">
                                <div class="form-floating">
                                    <input type="number" name="cpa" value="<?php echo e(old('cpa')); ?>" required class="form-control" id="cpa" >
                                    <label for="input_email">Codigo postal</label>
                                </div>
                                <?php $__errorArgs = ['cpa'];
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

                            <div class="col-12  mb-3">
                                <div class="form-floating">
                                    <input type="number" name="telefono" value="<?php echo e(old('telefono')); ?>" required class="form-control" id="telefono" >
                                    <label for="input_email">Teléfono</label>
                                </div>
                                <?php $__errorArgs = ['telefono'];
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


                            <div class="col-12  mb-3">
                                <div class="form-floating">
                                    <input type="password" name="password"  required class="form-control" id="input_pass" placeholder="Ejemplo">
                                    <label for="input_pass">Contraseña</label>
                                </div>
                                <?php $__errorArgs = ['password'];
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
                            <div class="col-12 mb-5">
                                <div class="form-floating">
                                    <input type="password" name="password_confirmation" required  class="form-control" id="input_pass2" placeholder="Ejemplo">
                                    <label for="input_pass2">Repetir Contraseña</label>
                                </div>
                                <?php $__errorArgs = ['password_confirmation'];
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
                            <div class="col-12 mb-5">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="terminos" required id="flexCheckDefault">
                                    <label class="form-check-label" for="flexCheckDefault">
                                        Acepto los <a target="_blank" href="/nota/2/condiciones-de-uso-online">Términos y Condiciones</a> y <a  target="_blank" href="/nota/3/condiciones-de-uso-online">Politicas de Privacidad</a>
                                    </label>
                                </div>
                            </div>
                            <div class="col-12 mb-5">
                                <div class="g-recaptcha" data-sitekey="<?php echo e(Voyager::setting('site.ccg')); ?>"></div>
                                <?php $__errorArgs = ['g-recaptcha-response'];
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
                            <div class="col-12">
                                <div class="d-flex g-2 justify-content-center">
                                    <button class="btn btn-primary w-50">Registrarme</button>
                                </div>
                            </div>
                        </form>
                        <div class="col-12">
                            <div class="d-flex flex-column align-items-center">
                                <a href="/auth/user/login" class="section__link section__link--secondary">Ya tengo cuenta</a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</section>
 
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/html/terminados/nuevo/looktucuman/resources/views/auth/register.blade.php ENDPATH**/ ?>