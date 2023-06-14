<header class="header shadow-sm sticky-top bg-white">
    <div class="container-fluid py-2 ">
        <div class="row mb-2">
            <div class="col-lg-2 col-3  mb-2 m-auto">
                <a href="/" class="header__brand me-auto">
                    <img src="/storage/<?php echo e(Voyager::setting('site.logo')); ?>" width="116px" alt="" class="img-fluid">
                </a>
            </div>
            <div class="col-lg-8 col-12" >
                <form action="/search" method="get">
                    <div class="row g-2     align-items-center">
                        <div class="col-10 mb-3 col-md-8 col-lg-10">
                            <div class="form-floating">
                                <input type="search" <?php if(isset($_GET["data"])): ?> value="<?php echo e($_GET['data']); ?>"  <?php endif; ?> name="data"  class="form-control" id="input_search" placeholder="Ejemplo">
                                <label for="input_search" style="left: 45px;">¿Qué estás buscando?</label>
                            </div>
                        </div>
                        <div class="col-2 m-auto col-lg-2">
                            <button type="submit" class="btn btn-outline-secondary  "><i class="fas fa-search"></i></button>
                        </div>
                    </div>
                </form>

            </div>
            <div class="col-lg-2 col-12 flex-responsive right-responsive" >
                <a class="btn " style="font-size: 25px;" href="<?php if(Auth::check()): ?><?php echo e('/carrito'); ?><?php else: ?><?php echo e('/auth/user/login'); ?><?php endif; ?>">
                    <i class="fas fa-shopping-cart"></i> Carrito
                </a>
                <i class="sidemenu__open btn  d-lg-none "><i class="fas fa-bars"></i></i>
                <ul class="header-login px-3 t">
                    <?php if(Auth::check()): ?>
                        <?php 
                            $user = Auth::user();
                        ?>
                        <li class="nav-item   btn-login  ">
                            <a href="/dashboard" class="nav-link link-secondary " target="_self">
                            <i class="fa fa-user"></i> <?php echo e($user->name); ?>

                            </a>
                        </li>
                        <li class="nav-item    btn-registro ">
                            <a href="/logout" class="nav-link link-secondary " target="_self">
                            Salir
                            </a>
                        </li>
                    <?php else: ?>
                        <li class="nav-item   btn-login  ">
                            <a href="/auth/user/login" class="nav-link link-secondary " target="_self">
                            Ingresar
                            </a>
                        </li>
                        <li class="nav-item    btn-registro ">
                            <a href="/auth/user/register" class="nav-link link-secondary " target="_self">
                            Registrarme
                            </a>
                        </li>
                    <?php endif; ?>
                </ul>
            </div>
        </div>

        <div class="d-flex align-items-center">
			<?php echo e(menu('menu', 'bootstrap')); ?>

        </div>

    </div>
</header><?php /**PATH /var/www/html/terminados/nuevo/looktucuman/resources/views/layouts/header.blade.php ENDPATH**/ ?>