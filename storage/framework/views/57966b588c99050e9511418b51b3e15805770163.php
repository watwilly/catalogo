<?php $__env->startSection('meta'); ?>
    <title>Cuenta</title>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('content'); ?>
 <section class="min-height">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12 col-lg-4 col-xl-3 p-0 d-none d-lg-block">
              <?php echo $__env->make('auth.colder', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            </div>
            <div class="col-12 col-lg-8 col-xl-9 py-5">
                <div class="grid rows-2 rows-lg-1 cols-1 cols-lg-2 justify-content-stretch align-items-center">
                    <div class="grid-item p-0 justify-self-center justify-self-lg-start">
                        <h2 class="m-0">Mi Cuenta</h2>
                    </div>
                </div>

                <div class="row gx-3 gy-2 mt-1">
                    <?php if($user->active == 0): ?>
                        <div class="alert alert-info col-md-12 col-xs-12 col-sm-12">Tienes que validar tu email <b><a href="#" onclick="emailValidacion();">Enviar email de validacion</a></b></div>
                    <?php endif; ?>
                    <div class="col-12">
                        <h4 class="lead text-center text-lg-start">Datos de la cuenta</h4>
                    </div>
                    <form action="/user_edit" method="post" class="row gx-3 gy-3 mt-" >
                        <?php echo csrf_field(); ?>
                        <div class="col-12 col-lg-12">
                            <div class="form-floating">
                                <input type="email" class="form-control" id="input_email" placeholder="Ejemplo" <?php if($user->email): ?> disabled readonly <?php else: ?> name="email" <?php endif; ?> value="<?php echo e($user->email); ?>">
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


                        <div class="col-12 col-md-6 col-lg-6">
                            <div class="form-floating">
                                <input type="text" name="name" class="form-control" id="input_name" value="<?php echo e($user->name); ?>" placeholder="Ejemplo">
                                <label for="input_name">Nombre</label>
                            </div>
                        </div>

                        <div class="col-12 col-md-6 col-lg-6">
                            <div class="form-floating">
                                <input type="text" name="apellido" class="form-control" id="input_lastname" value="<?php echo e($user->apellido); ?>" placeholder="Ejemplo">
                                <label for="input_lastname">Apellido</label>
                            </div>
                        </div>


                        <div class="col-12 col-md-6 col-lg-6">
                            <div class="form-floating">
                                <input name="telefono" type="tel" value="<?php echo e($user->telefono); ?>" class="form-control" id="input_phone" placeholder="Ejemplo">
                                <label for="input_phone">Teléfono</label>
                            </div>
                        </div>

                        <div class="col-12 col-md-6 col-lg-6">
                            <div class="form-floating">
                                <input type="text" name="direccion" value="<?php echo e($user->direccion); ?>"  class="form-control" id="input_address" placeholder="Ejemplo">
                                <label for="input_address">Domicilio</label>
                            </div>
                        </div>

                        <div class="col-12"></div>

                        <div class="col-12">
                            <h4 class="lead mt-6 text-center text-lg-start">Cambiar contraseña
                                <br>
                                <small class="text-muted">ATENCIÓN: llene este solo campo si desea modificar su contraseña</small>
                            </h4>
                        </div>

                        <div class="col-12 col-md-6 col-lg-4">
                            <div class="form-floating">
                                <input type="password" name="newPassword" class="form-control" id="input_password" placeholder="Ejemplo">
                                <label for="input_password">Nueva contraseña</label>
                            </div>
                        </div>

                        <div class="col-12 col-md-6 col-lg-4">
                            <div class="form-floating">
                                <input type="password" name="password_confirmation" class="form-control" id="input_confirm" placeholder="Ejemplo">
                                <label for="input_confirm">Confirmar contraseña</label>
                            </div>
                        </div>

                        <div class="col-12 d-flex mt-6">
                            <button class="btn btn-success mx-auto">Guardar cambios</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
</section>
<?php $__env->stopSection(); ?>


<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/html/terminados/nuevo/looktucuman/resources/views/auth/user/cuenta.blade.php ENDPATH**/ ?>