<?php $__env->startSection('meta'); ?>
    <title>Compras</title>
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
                        <h2 class="m-0">Mis Compras</h2>
                    </div>
                </div>

                <form accept="" method="get">
                    <div class="row g-3 mt-2">
                        <div class="col-12 col-md-3">
                            <div class="form-floating">
                                <input type="text" list="addresses" <?php if(isset($_GET["publicacion"])): ?> value="<?php echo e($_GET["publicacion"]); ?>" <?php endif; ?> class="form-control" id="publicacion" name="publicacion" placeholder="Ejemplo">
                                <datalist id="addresses">
                                    <option value="Ingrese el nombre de una publicacion">
                                </datalist>
                                <label for="input_email">Producto</label>
                            </div>
                        </div>
                        <div class="col-12 col-md-3">
                            <div class="form-floating">
                                <input type="date" id="input_dateStart" <?php if(isset($_GET["desde"])): ?> value="<?php echo e($_GET["desde"]); ?>" <?php endif; ?> name="desde" class="form-control">
                                <label for="input_dateStart">Desde</label>
                            </div>
                        </div>
                        <div class="col-12 col-md-3">
                            <div class="form-floating">
                                <input type="date" id="input_dateEnd" <?php if(isset($_GET["hasta"])): ?> value="<?php echo e($_GET["hasta"]); ?>" <?php endif; ?> name="hasta" class="form-control">
                                <label for="input_dateEnd">Hasta</label>
                            </div>
                        </div>
                        <div class="col-12 col-md-3">
                            <div class="form-floating">
                                <select class="form-select" id="orden" name="orden" aria-label="Floating label select example">
                                    <option value="">Seleccione</option>
                                    <option value="ASC" <?php if(isset($_GET["orden"])&&$_GET["orden"]=="ASC"): ?> selected <?php endif; ?> >Más antigua</option>
                                    <option value="DESC" <?php if(isset($_GET["orden"])&&$_GET["orden"]=="DESC"): ?> selected <?php endif; ?>>Más reciente</option>
                                </select>
                                <label for="input_addressType">Ordenar por</label>
                            </div>
                        </div>
                        <div class="col-12 d-flex">
                            <button type="submit" class="btn btn-outline-secondary mx-auto">Filtrar ventas</button>
                        </div>
                    </div>
                </form>

                <div class="mt-4 px-2">
                  <?php if($query->count()>0): ?>
                    <?php $__currentLoopData = $query; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $compras): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <?php 
                            $item = DB::table("pagos_compras")->select("id", "producto_name")->count();
                        ?>
                      <div class="grid p-3 mb-3 rows-4 cols-2 rows-md-2 cols-md-4 rows-lg-1 cols-lg-6 align-items-center card card-hover">
                          <div class="grid-item c-2 c-md-4 c-lg-2">
                              <a href="posts.show.php" class="custom-link link-secondary">
                                <h5 class="m-0 text-truncate"><?php echo e($compras->external_reference); ?></h5>
                              </a>
                          </div>
                          <div class="grid-item">
                              <h6 class="m-0 text-muted"><?php echo e($compras->created_at); ?></h6>
                          </div>
                          <div class="grid-item justify-self-end justify-self-lg-end">
                              <h6 class="m-0 status-<?php echo e($compras->status); ?> "><?php echo e($compras->status); ?></h6>
                          </div>
                          <div class="grid-item c-2 c-md-1 justify-self-center justify-self-lg-end">
                              <h6 class="m-0">ARS $<?php echo e($compras->monto); ?></h6>
                          </div>
                          <div class="grid-item c-2 c-md-1 justify-self-center justify-self-md-end">
                              <a href="/detail/<?php echo e($compras->id); ?>/<?php echo e($compras->external_reference); ?>" class="section__link section__link--success">Detalles</a>
                          </div>
                      </div>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    <div class="col-12">
                        <div class="d-flex justify-content-center">
                          <?php echo e($query->render()); ?>

                          <!--  <a href="#" class="btn btn-primary">Cargando más compras...</a>-->
                        </div>
                    </div>
                  <?php else: ?>
                    <div class="alert alert-info">No se han encontrado compras.</div>
                  <?php endif; ?>
                </div>
            </div>
        </div>
    </div>
</section>
 

<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/html/terminados/nuevo/looktucuman/resources/views/auth/user/compras.blade.php ENDPATH**/ ?>