<?php $__env->startSection('css'); ?>
<meta name="csrf-token" content="<?php echo e(csrf_token()); ?>">
<style>
    .panel .mce-panel {
        border-left-color: #fff;
        border-right-color: #fff;
    }

    .panel .mce-toolbar,
    .panel .mce-statusbar {
        padding-left: 20px;
    }

    .panel .mce-edit-area,
    .panel .mce-edit-area iframe,
    .panel .mce-edit-area iframe html {
        padding: 0 10px;
        min-height: 350px;
    }

    .mce-content-body {
        color: #555;
        font-size: 14px;
    }

    .panel.is-fullscreen .mce-statusbar {
        position: absolute;
        bottom: 0;
        width: 100%;
        z-index: 200000;
    }

    .panel.is-fullscreen .mce-tinymce {
        height: 100%;
    }

    .panel.is-fullscreen .mce-edit-area,
    .panel.is-fullscreen .mce-edit-area iframe,
    .panel.is-fullscreen .mce-edit-area iframe html {
        height: 100%;
        position: absolute;
        width: 99%;
        overflow-y: scroll;
        overflow-x: hidden;
        min-height: 100%;
    }
</style>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('page_title', "Actualizacion Masiva"); ?>

<?php $__env->startSection('page_header'); ?>
<h1 class="page-title">
    Actualizacion Masiva
</h1>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
<div class="page-content container-fluid">

    <?php
    $postdata = [];
    ?>
    <div class="row">
        <div class="col-md-6">
            <div class="alert alert-info">
                <h5>Informacion de la aplicacion:</h5>
                <ul>
                    <li>En el panel Izquierdo podras ver los productos pendientes de actualizacion de precios y podras filtrarlos por categoria</li>
                    <li>En el panel del centro, se ingresa el valor del aumento y tambien el tipo de Aumento:
                        <ul>
                            <li><b>Aumentar:</b> Se aumenta el precio en base al % ingresado</li>
                            <li><b>Bajar:</b> Baja el precio en base al % ingresado,</li>
                            <li><b>Monto:</b> Monto fijo del precio, esto quiere decir que no se actualiza por porcentaje si no por el monto ingresado</li>
                        </ul>
                    </li>
                    <li>En el panel derecho podras ver los productos que ya han sido actualizados</li>
                    <li>Para volver a actualizar todos los precios, haga click en en el boton verde <b>Re-actualizar</b></li>
                </ul>
            </div>
        </div>
        <div class="col-md-6">
            <div class="alert alert-success">
                <ul>Total de productos en la base de datos: <b><?php echo e($totalPosts); ?></b></ul>
                <ul><?php if(isset($_GET['category_id'])): ?> Total de productos filtrados para actualizar: <?php else: ?> Total de productos Pendientes de Actualizacion: <?php endif; ?> <b><?php echo e($posts->total()); ?></b> </ul>
                <ul>Total de productos con precios Actualizaos: <b><?php echo e($update_posts->total()); ?></b></ul>
            </div>
        </div>
        <div class="col-md-12">
            <div class="col-md-4">
                <div class="panel col-md-12">
                    <h3 class="panel-title">Productos proximos a Actualizar</h3>

                    <form action="/admin/price-update" method="get" class="text-center">
                        <div class="form-group">
                            <select class="form-control" name="category_id" required>
                                <option value="" hidden>Seleccione</option>
                                <?php $__currentLoopData = $categorias; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $categoria): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <option value="<?php echo e($categoria->id); ?>"><?php echo e($categoria->name); ?></option>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-success">Filtrar por categoría</button>
                        </div>
                    </form>
                    <?php if($posts->count()>0): ?>
                    <?php $__currentLoopData = $posts; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $post): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <?php
                    $postdata[] = [
                        "post_id" => $post->id,
                        "old_price" => $post->precios
                    ];
                    ?>
                    <div class="col-md-12">
                        <hr>
                        <div class="col-md-10">
                            <?php echo e($post->title); ?>

                        </div>
                        <div class="col-md-2">
                            $<?php echo e($post->precios); ?>

                        </div>
                    </div>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    <?php else: ?>
                    <div class="alert alert-success">Todos los productos han sido actualizados</div>
                    <a href="/admin/truncate/price-update" class="btn btn-success"> Re-Actualizar</a>
                    <?php endif; ?>
                </div>
            </div>

            <div class="col-md-3">
                <form class="form-edit-add" role="form" action="/admin/massiveupdateprice" method="POST">
                    <?php echo e(csrf_field()); ?>


                    <div class="panel">
                        <?php if(count($errors) > 0): ?>
                        <div class="alert alert-danger">
                            <ul>
                                <?php $__currentLoopData = $errors->all(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $error): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <li><?php echo e($error); ?></li>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </ul>
                        </div>
                        <?php endif; ?>
                        <input type="hidden" name="postsId" value="<?php echo e(json_encode($postdata)); ?>">
                        <div class="panel-heading">
                            <h3 class="panel-title">Definicion de Aumento:</h3>
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                <label>Ingrese el valor: </label>
                                <input type="number" required class="form-control" id="valor" name="valor">
                            </div>
                            <div class="form-group">
                                <label>Seleccione la opcion a aplicar:</label>
                                <select name="aplicativo" class="form-control" required>
                                    <option value="" hidden>Seleccione</option>
                                    <option value="increase">Aumentar</option>
                                    <option value="decrease">Disminuir</option>
                                    <option value="mount">monto</option>
                                </select>

                            </div>
                            <button type="submit" class="btn btn-primary pull-right">Enviar actualizacion</button>
                        </div>
                    </div>
                </form>

            </div>

            <div class="col-md-5">
                <div class="panel col-md-12">
                    <h3 class="panel-title">Productos Actualizados</h3>
                    <?php if($update_posts->count()>0): ?>
                    <?php $__currentLoopData = $update_posts; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $upost): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <div class="col-md-12">
                        <hr>
                        <div class="col-md-3">
                            <b><?php echo e($upost->title); ?></b>
                        </div>
                        <div class="col-md-3">
                            <b>Precio Anterior:</b> $<?php echo e($upost->old_price); ?>

                        </div>
                        <div class="col-md-3">
                            <b>Nuevo Precio:</b> $<?php echo e($upost->new_price); ?>

                        </div>
                        <div class="col-md-3">
                            <b><?php echo e($aplicativoApplied[$upost->aplicativo]); ?></b> <?php echo e($upost->valor_ingresado); ?>

                        </div>
                    </div>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    <?php echo $update_posts->render(); ?>

                    <?php else: ?>
                    <div class="alert alert-warning">No hay productos actualizados</div>
                    <?php endif; ?>
                </div>

            </div>
        </div>
    </div>



</div>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('javascript'); ?>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('voyager::master', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/html/web/looktucuman/vendor/tcg/voyager/src/../resources/views/posts/priceupdate.blade.php ENDPATH**/ ?>