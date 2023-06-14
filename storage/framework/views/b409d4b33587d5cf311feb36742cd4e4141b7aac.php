<?php $__env->startSection('meta'); ?>
    <title>Detalle de Compre</title>
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
                        <h2 class="m-0">Detalle de compra</h2>
                    </div>
                    <div class="grid-item p-0 justify-self-center justify-self-lg-end">
                        <a href="/compras"  class="section__link section__link--secondary">Volver</a>
                    </div>
                </div>

                <div class="row gy-3 gx-2 mt-4 justify-content-center">
                    <?php 
                        $items_count = $items->count();
                    ?>
                    <?php if($items_count>0): ?>
                        <div class="col-10 col-sm-6 col-md-4 col-lg-3">
                            <?php $__currentLoopData = $items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <?php 
                                    $subtotal = $item->precio * $item->cantidad;
                                    $imagenes = json_decode($item->images);

                                ?>

                                <div class="card card-hover mb-3 mx-2">
                                    <img src="/storage/<?php echo e($imagenes[0]); ?>" class="card-img-top" alt="...">
                                    <div class="card-body d-flex flex-column justify-content-between">
                                        <h5 class="card-title m-0 text-truncate h6"><?php echo e(str_limit($item->producto_name,38)); ?></h5>
                                        <p class="card-text m-0 section__title fw-bold">
                                            <?php echo e($item->precio); ?> x <?php echo e($item->cantidad); ?> = <?php echo e($subtotal); ?>

                                        </p>
                                        <p class="card-text m-0 section__title fw-bold">
                                            ARS $<?php echo e($item->precio); ?>

                                        </p>
                                    </div>
                                </div>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </div>
                    <?php endif; ?>
                    <div class="col-12 col-sm-6 col-md-8 col-lg-9">
                        <div class="card card-hover mx-2">
                            <div class="card-body">
                                <h5 class="card-title">Detalles del pago</h5>
                                <ul class="list-group list-group-flush ">
                                   
                                    <?php /*<li class="list-group-item list-group-item-success d-flex justify-content-between">
                                        <b>Descuento</b>
                                        <span>ARS -$<?php echo $price * ($disccount / 100) ?></span>
                                    </li> */ ?>
                                    <?php /* <li class="list-group-item d-flex justify-content-between">
                                        <b>Envío</b>
                                        <span>ARS $500</span>
                                    </li> */ ?>
                                    <li class="list-group-item list-group-item-info d-flex justify-content-between">
                                        <?php 
                                            $total = $item->cantidad * $item->precio;
                                        ?>
                                        <b>Total pagado</b>
                                        <span>ARS $<?php echo e($payment->monto); ?></span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between">
                                        <b>Fecha</b>
                                        <span><?php echo e($payment->created_at->todateString()); ?></span>
                                    </li>
                                    <li class="list-group-item d-flex flex-column flex-md-row justify-content-between">
                                        <b>Estado</b>
                                        <span class="status-<?php echo e($payment->status); ?>"><?php echo e($payment->status); ?></span>
                                    </li>
                                    <li class="list-group-item d-flex flex-column flex-md-row justify-content-between">
                                        <b>Cantidad de productos</b>
                                        <span ><?php echo e($items_count); ?></span>
                                    </li>
                                    <li class="list-group-item d-flex flex-column flex-md-row justify-content-between">
                                        <b>Referencia</b>
                                        <span><?php echo e($payment->external_reference); ?></span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="card card-hover mx-2 mt-3">
                            <div class="card-body">
                                <h5 class="card-title">Datos de envio o entrega</h5>
                                <ul class="list-group list-group-flush ">
                                  
                                    <li class="list-group-item d-flex flex-column flex-md-row justify-content-between">
                                        <b>Metedo de entrega</b>
                                        <span><?php echo e($payment->metodo_entrega); ?></span>
                                    </li>
                                    <?php if($payment->payment_method): ?>
                                    <li class="list-group-item d-flex flex-column flex-md-row justify-content-between">
                                        <b>Metodo de Pago</b>
                                        <span><?php echo e($payment->payment_method); ?></span>
                                    </li>
                                    <?php endif; ?>
                                   
                                </ul>
                            </div>
                        </div>
                        <?php 
                            $datos_facturacion = DB::table("pagos_facturacion")->select("id","nombre","apellido","empresa","email","telefono","domicilio","mensaje")
                            ->where("pago_id",$payment->id)->first();
                        ?>
                        <?php if($datos_facturacion): ?>
                        <div class="card card-hover mx-2 mt-3">
                            <div class="card-body">
                                <h5 class="card-title">Datos de facturacion</h5>
                                <ul class="list-group list-group-flush ">
                                    <li class="list-group-item d-flex flex-column flex-md-row justify-content-between">
                                        <b>Nombre y Apellido</b>
                                        <span><?php echo e($datos_facturacion->nombre); ?> <?php echo e($datos_facturacion->apellido); ?></span>
                                    </li>
                                    <?php if($datos_facturacion->empresa): ?>
                                    <li class="list-group-item d-flex flex-column flex-md-row justify-content-between">
                                        <b>Empresa</b>
                                        <span><?php echo e($datos_facturacion->empresa); ?></span>
                                    </li>
                                    <?php endif; ?>
                                    <li class="list-group-item d-flex flex-column flex-md-row justify-content-between">
                                        <b>E-mail</b>
                                        <span><?php echo e($datos_facturacion->email); ?></span>
                                    </li>
                                    <li class="list-group-item d-flex flex-column flex-md-row justify-content-between">
                                        <b>Domicilio</b>
                                        <span><?php echo e($datos_facturacion->domicilio); ?></span>
                                    </li>
                                    <li class="list-group-item d-flex flex-column flex-md-row justify-content-between">
                                        <b>Telefono</b>
                                        <span><?php echo e($datos_facturacion->telefono); ?></span>
                                    </li>
                                    <?php if($datos_facturacion->mensaje): ?>
                                    <li class="list-group-item d-flex flex-column flex-md-row justify-content-between">
                                        <b>Mensaje</b>
                                        <span><?php echo e($datos_facturacion->mensaje); ?></span>
                                    </li>
                                    <?php endif; ?>
                                    
                                </ul>
                            </div>
                        </div>
                        <?php endif; ?>
                    
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/html/terminados/nuevo/looktucuman/resources/views/auth/user/user-compra.blade.php ENDPATH**/ ?>