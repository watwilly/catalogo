<?php 
   $url = url()->full();
?>
<?php $__env->startSection('meta'); ?>
<meta name="title" content="Resultados de búsqueda de productos <?php echo e($busqueda); ?> en Look Tucumán">
<meta name="description" content="Encuentra productos de <?php echo e($busqueda); ?> en Look Tucumán, el ecommerce distribuidor mayorista y minorista en Tucumán">
<meta property="og:locale" content="es_ar">
<meta property="og:description" content="Encuentra productos de <?php echo e($busqueda); ?> en Look Tucumán, el ecommerce distribuidor mayorista y minorista en Tucumán">
<meta property="og:site_name" content="Look Tucumán">
<meta property="og:title" content="Resultados de búsqueda de productos <?php echo e($busqueda); ?> en Look Tucumán">
<title>Resultados de búsqueda de productos <?php echo e($busqueda); ?> en Look Tucumán</title>
<?php $__env->stopSection(); ?>
 

<?php $__env->startSection('content'); ?>
<section class="min-height">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12 col-lg-4 col-xl-3 p-0">
                <div class="filter p-3 text-light">
                    <button class="w-100 d-lg-none btn btn-outline-light" data-bs-toggle="collapse" data-bs-target="#filter-container">Filtrar Resultados</button>
                    <div class="filter__container mt-4 collapse" id="filter-container">
                        <div class="filter__header">
                            <h4 class="section__lead section__lead--5 border-bottom border-light">Filtros aplicados</h4>
                            <div class="border-bottom border-light pb-2">
                                <?php $__currentLoopData = Session::all(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <?php if($key == 'seaModel'): ?>
                                        <a href="#" onclick="drop_filtro('<?php echo e($key); ?>');" class="filter__applied"><?php echo e(Session::get('seamodelo_name')); ?><i class="fas fa-times"></i></a>
                                    <?php endif; ?>

                                    <?php if($key == 'seaMarca'): ?>
                                        <a href="#" onclick="drop_filtro('<?php echo e($key); ?>');" class="filter__applied"><?php echo e(Session::get('seamarca_name')); ?><i class="fas fa-times"></i></a>
                                    <?php endif; ?>
                                    <?php if($key=='seaOrden'): ?>
                                        <a href="#" onclick="drop_filtro('<?php echo e($key); ?>');" class="filter__applied"><?php echo e(Session::get('seaOrden')); ?><i class="fas fa-times"></i></a>
                                    <?php endif; ?>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                <?php if(isset($_GET['category'])) {?>
                                    <a href="/search?data=<?php echo e($busqueda); ?>" class="filter__applied"><?php echo e($_GET['name']); ?>  <i class="fas fa-times"></i></a>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="filter__form mt-3">
                            <div class="row gy-3">
                                <div class="col-12">
                                    <h4 class="section__lead section__lead--6">Ordenar publicaciones</h4>
                                    <ul class="nav flex-column regular">
                                        <li class="nav-item">
                                            <a href="#" onclick="orderatribute('ASC');" class="orden nav-link link-light custom-link custom-link-primary">
                                                Menor precio
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="#" onclick="orderatribute('DESC');" class="orden nav-link link-light custom-link custom-link-primary">
                                                Mayor precio
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="#"  onclick="orderatribute('AAZ');" class="orden nav-link link-light custom-link custom-link-primary">
                                                Alfabéticamente (A - Z)
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="#"  onclick="orderatribute('ZAA');" class="orden nav-link link-light custom-link custom-link-primary">
                                                Alfabéticamente (Z - A)
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <?php if($categorias): ?>
                                    <div class="col-12">
                                        <h4 class="section__lead section__lead--6">Categoría</h4>
                                        <ul class="nav flex-column regular">
                                            <?php $__currentLoopData = $categorias; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $categoria): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <?php 
                                                    $pos = strpos($url, "category");
                                                ?>
                                                <li class="nav-item">
                                                    <?php if($pos === false): ?>
                                                        <a href="<?php echo e($url); ?>&category=<?php echo e($categoria["id"]); ?>&name=<?php echo e($categoria["name"]); ?>" class="nav-link link-light custom-link custom-link-primary">
                                                            <?php echo e($categoria["name"]); ?>

                                                        </a>
                                                    <?php else: ?>
                                                        <a href="/search?data=<?php echo e($busqueda); ?>&category=<?php echo e($categoria["id"]); ?>&name=<?php echo e($categoria["name"]); ?>" class="nav-link link-light custom-link custom-link-primary">
                                                            <?php echo e($categoria["name"]); ?>

                                                        </a>
                                                    <?php endif; ?>
                                                </li>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        </ul>
                                    </div>
                                <?php endif; ?>
                                <?php if($marcas): ?>
                                    <div class="col-12">
                                        <h4 class="section__lead section__lead--6">Marcas</h4>
                                        <ul class="nav flex-column regular">
                                            <?php $__currentLoopData = $marcas; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $marca): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <li class="nav-item">
                                                <a href="#" onclick="filtro_search('marca', '<?php echo e($marca["name"]); ?>', <?php echo e($marca["id"]); ?>);" class="nav-link link-light custom-link custom-link-primary">
                                                   <?php echo e($marca["name"]); ?>

                                                </a>
                                            </li>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        </ul>
                                    </div>
                                <?php endif; ?>

                                <?php if($modelos): ?>
                                    <div class="col-12">
                                        <h4 class="section__lead section__lead--6">Marcas</h4>
                                        <ul class="nav flex-column regular">
                                            <?php $__currentLoopData = $modelos; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $modelo): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <li class="nav-item">
                                                <a href="#" onclick="filtro_search('modelo', '<?php echo e($modelo["name"]); ?>', <?php echo e($modelo["id"]); ?>);" class="nav-link link-light custom-link custom-link-primary">
                                                   <?php echo e($modelo["name"]); ?>

                                                </a>
                                            </li>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        </ul>
                                    </div>
                                <?php endif; ?>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-lg-8 col-xl-9 py-5">
                <div class="row gy-3 gx-2 justify-content-center">
                    <div class="col-12">
                        <h1 class="text-center">Encontra <b><?php echo e($busqueda); ?></b> en Tucuman</h1>
                    </div>
                    <?php if($paginate->count() > 0): ?>
                        <?php $n1=1; ?>
                        <?php $__currentLoopData = $productos; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $post): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <?php echo e(Voyager::h_listview($post["title"], $post["id"], $post["imagen"], null, $post["precios"], 'medium', $post["cat_name"])); ?>

                            <?php $n1++; ?>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    <?php else: ?>
                        <div class="alert alert-info col-md-12">No se encontró resultado con <b><?php echo e($busqueda); ?></b> o con el filtro seleccionado, elimine el filtro para ver otros resultados</div>
                    <?php endif; ?>
                   <div class="col-12">
                    <nav aria-label="Page navigation">
                      <ul class="pagination">
                            <?php echo e($paginate->links()); ?>

                      </ul>
                    </nav>
                   </div>
            
                </div>
            </div>
        </div>
    </div>
</section>


<?php $__env->stopSection(); ?>

<?php $__env->startSection('jsfooter'); ?>
<script>
    let filterContainer = document.getElementById("filter-container")
    window.onload = () => {
        if(window.innerWidth >= 992){
            filterContainer.classList.add("show")
        }
    }


    function orderatribute(o) {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                window.location = "";
            }
        };
        xhttp.open("GET", "/filtro-category?argument=orden&atribute="+o, true);
        xhttp.send();
    }

</script>
<?php $__env->appendSection(); ?>
<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/html/terminados/nuevo/looktucuman/resources/views/home/search.blade.php ENDPATH**/ ?>