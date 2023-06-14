<?php $__env->startSection('page_title', 'Imprimir etiquetas'); ?>

<?php $__env->startSection('page_header'); ?>
<div class="container-fluid">
    <h1 class="page-title">
        <i class=""></i> Imprimir etiquetas.
    </h1>
    <a href="/admin/posts" class="btn btn-success btn-add-new">
        <i class="voyager-plus"></i> <span>Volver</span>
    </a>
    <form class="text-center" action="/admin/posts/etiquetas" method="POST">
        <?php echo e(csrf_field()); ?>


        <input type="hidden" name="productos" value="<?php echo e($json_products); ?>">
        <?php if(isset($_GET["page"])): ?>
            <h6>Estas imprimiendo la pagina: <?php echo e($_GET["page"]); ?></h6>
        <?php endif; ?>
        <button type="submit" class="btn btn-warning">
            <span>Click Aqui para imprimir este listado</span>
        </button>
    </form>
    <div class="alert alert-info">
        <h3>Informacion útil:</h3>
        <ul>
            <li>Se imprimirán de 100 en 100 productos. Si tienes más de 100 productos, tendrás que seguir paginando hasta que hayas impreso todas las etiquetas.</li>
            <li>Si quieres imprimir únicamente los productos de una categoría en particular, deberás seleccionar dicha categoría en el buscador que se encuentra más abajo en la página. Una vez que hayas hecho esto, haz clic en la lupa para buscar los productos de esa categoría y luego en el botón amarillo para imprimir las etiquetas correspondientes.</li>
        </ul>
    </div>
</div>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
<div class="page-content browse container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-bordered">
                <div class="panel-body">
                    <form method="get" class="form-search">
                        <div id="search-input">
                          
                            <div class="input-group col-md-12">
                                <div class="col-md-6">
                                    <input type="text" name="title" placeholder="Ingrese un titulo a buscar" class="form-control">
                                </div>
                                <div class="col-md-6">
                                    <select class="form-control " name="s">
                                        <option value="" hidden>Seleccione la categoria</option>
                                        <?php $__currentLoopData = DB::table("categories")->select("id","name")->orderBy("name","ASC")->get(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($category->id); ?>" <?php if(isset($_GET['category_id']) && $_GET['category_id']==$category->id ): ?> selected <?php endif; ?>><?php echo e($category->name); ?></option>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    </select>
                                </div>

                                <span class="input-group-btn">
                                    <button class="btn btn-info btn-lg" type="submit">
                                        <i class="voyager-search"></i>
                                    </button>
                                </span>
                            </div>
                        </div>
                    </form>
                    <div class="table-responsive">
                        <table id="dataTable" class="table table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Titulo</th>
                                    <th>Precio</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $__currentLoopData = $productos; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $data): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <tr>
                                    <td>
                                        <span><?php echo e($data->id); ?></span>
                                    </td>
                                    <td>
                                        <span><?php echo e($data->title); ?></span>
                                    </td>
                                    <td>
                                        <span>$ <?php echo e($data->precios); ?></span>
                                    </td>
                                </tr>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </tbody>
                        </table>
                    </div>
                    <div class="pull-left">
                        <div role="status" class="show-res" aria-live="polite"><?php echo e(trans_choice(
                                    'voyager::generic.showing_entries', $productos->total(), [
                                        'from' => $productos->firstItem(),
                                        'to' => $productos->lastItem(),
                                        'all' => $productos->total()
                                    ])); ?></div>
                    </div>
                    <div class="pull-right">
                        <?php echo e($productos->appends([
                                    'order_by' => "ASC",
                                ])->links()); ?>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('css'); ?>
<link rel="stylesheet" href="<?php echo e(voyager_asset('lib/css/responsive.dataTables.min.css')); ?>">
<?php $__env->stopSection(); ?>

<?php $__env->startSection('javascript'); ?>

<script>

</script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('voyager::master', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/html/web/looktucuman/vendor/tcg/voyager/src/../resources/views/posts/printslabels.blade.php ENDPATH**/ ?>