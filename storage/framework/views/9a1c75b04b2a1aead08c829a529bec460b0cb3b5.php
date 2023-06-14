<div class="sidemenu">
    <button class="btn btn-lg text-light sidemenu__close">&times;</button>
    <?php if(is_null($user)): ?>
        <h3 class="text-primary">distlooktucuman.com.ar</h3>
    <?php else: ?>
        <h3 class="text-primary"><?php echo e($user->name); ?> <?php echo e($user->apellido); ?></h3>
    <?php endif; ?>
    <hr class="my-5 bg-light">
    <div class="container-fluid">
        <div class="row g-2">
            <div class="col-6">
                <?php if(is_null($user)): ?>
                    <a href="/auth/user/login" class="d-block btn btn-outline-light">Iniciar Sesión</a>
                <?php else: ?>
                    <a href="/dashboard" class="d-block btn btn-outline-light">Mi Cuenta</a> 
                <?php endif; ?>
            </div>
            <div class="col-6">
                <?php if(is_null($user)): ?>
                    <a href="/auth/user/register" class="d-block btn btn-light">Registrarse</a>
                <?php else: ?>
                    <a href="/logout" class="d-block btn btn-light">Cerrar Sesión</a>
                <?php endif; ?>
            </div>
        </div>
    </div>
    <hr class="my-5 bg-light">
    <?php if(Auth::check()): ?>
        <ul class="nav flex-column">
            <li class="nav-item">
                <a href="/dashboard" class="nav-link link-light">Panel de Usuario</a>
            </li>
            <li class="nav-item">
                <a href="/cuenta" class="nav-link link-light">Cuenta</a>
            </li>
            <li class="nav-item">
                <a href="/interesados" class="nav-link link-light">Consultas</a>
            </li>
          
        </ul>
    <hr class="my-5 bg-light">
    <?php endif; ?>
    <?php echo e(menu("footer2")); ?>


</div><?php /**PATH /var/www/html/web/looktucuman/resources/views/layouts/sidebarmenu.blade.php ENDPATH**/ ?>