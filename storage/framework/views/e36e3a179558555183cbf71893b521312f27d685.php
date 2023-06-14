<?php $__env->startSection('css'); ?>
    <meta name="csrf-token" content="<?php echo e(csrf_token()); ?>">
    <style>
    	.select-multiple {
    		min-height: 180px;
    	}

    	.talles option {
    		padding: 5px;
    		margin: 0;
    		border-bottom: 1px solid #ddd;
    	}
    	.colores option {
    		width: 100%; 
    		height: 25px; 
    		display: block;
    		padding: 5px;
    		margin: 2px 0;
    		border: 1px solid #eee;
    	}
        .atributos  ul {
            list-style: none;
            border: 1px solid #ddd;
            padding: 0;
            margin: 0;
        }
        .atributos  ul .talles, .atributos  ul .colores {
            padding: 0;
            margin: 0;
        }
        .atributos  ul li {
            border-bottom: 1px solid #ddd;
            padding: 7px 10px;
            display: flex;
        }
        .atributos  ul li:last-child {
            border-bottom: 0;
        }
        .atributos  ul .talles li {
            border-right: 1px solid #ddd;
        }
        .atributos  ul li span {
            display: block;
            width: 90%
        }
        .atributos  ul li a {
            display: block;
            width: 10%;
            text-align: center;
        }
        .atributos  ul li a i {
            display: inline-flex;
            width: 15px;
            height: 15px;
            justify-content: center;
            align-items: center;
            color: #fff;
            background: #c90404;
            border-radius: 50%;
        }
        .atributos  ul li.small {
            font-weight: 600;
            color: #444;
        }
    </style>
<?php $__env->stopSection(); ?>



<?php $__env->startSection('content'); ?>

<h1 class="page-title">Atributos de la Publicacion</h1>
<div class="page-content container-fluid">
	<div class="row">
		<div class="col-xs-12">
			<div class="panel panel-bordered">
				<form role="form"
                            class="form-edit-add"
                            action="/admin/posts/setAtributo"
                            method="POST" enctype="multipart/form-data">
                        <?php echo e(csrf_field()); ?>



					<div class="panel-body">
						<div class="row">
                        <input type="hidden" name="posts_id" value="<?php echo e($post->id); ?>">
							<div class="col-md-6">
								<div class="panel-heading">
									<h3 class="panel-title">Talles</h3>
								</div>
								<select name="talle_id" id="talle_id" class="form-control talles">
                                    <option value="" selected>Seleccione un Talle</option>

                                    <?php $__currentLoopData = $talles; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $talle): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($talle->id); ?>"><?php echo e($talle->talle); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
								</select>
							</div>

							<div class="col-md-6">
								<div class="panel-heading">
									<h3 class="panel-title">Colores</h3>
								</div>
								<select  name="colores_id" id="colores_id" class="form-control colores">
                                    <option value="" selected>Seleccione un Color</option>
									<?php $__currentLoopData = $colores; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $color): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <option value="<?php echo e($color->id); ?>" style="background-color: <?php echo e($color->color); ?>;"></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
								</select>
							</div>
							<div class="col-md-12">
								<button type="submit" class="btn btn-primary save">Guardar</button>
							</div>
						</div>
					</div>
				</form>

                <div class="atributos">
                    <div class="panel-body">
                        <div class="panel-heading">
                            <h3 class="panel-title">Atributos Seleccionados</h3>
                            <ul class="tabla-atributos row">
                               
                                <div class="col-md-6 talles">
                                    <li class="small">Talles</li>
                                    <?php $__currentLoopData = $post->poststalles()->get(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $p_talle): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <?php
                                            $get_pTalle = $p_talle->talles()->first();
                                        ?>
                                        <li><span><?php echo e($get_pTalle->talle); ?></span><a href="/admin/atributo-delete/<?php echo e($p_talle->id); ?>/talle/<?php echo e($post->id); ?>"><i class="voyager-x"></i></a></li>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </div>

                                <div class="col-md-6 colores">
                                    <li class="small">Colores</li>
                                    <?php $__currentLoopData = $post->postscolores()->get(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $p_color): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <?php
                                            $get_pColor = $p_color->colores()->first();
                                        ?>
                                         <li><span id="<?php echo e($color->id); ?>" style="background-color: <?php echo e($get_pColor->color); ?>; color:white"></span><a href="/admin/atributo-delete/<?php echo e($p_color->id); ?>/color/<?php echo e($post->id); ?>"><i class="voyager-x"></i></a></li>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </div>
                            </ul>
                        </div>
                    </div>
                </div>
			</div>
		</div>
	</div>
</div>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('javascript'); ?>
    <script src="<?php echo e(voyager_asset('lib/js/tinymce/tinymce.min.js')); ?>"></script>
    <script src="<?php echo e(voyager_asset('js/voyager_tinymce.js')); ?>"></script>
    <script src="<?php echo e(voyager_asset('lib/js/ace/ace.js')); ?>"></script>
    <script src="<?php echo e(voyager_asset('js/voyager_ace_editor.js')); ?>"></script>
    <script src="<?php echo e(voyager_asset('js/slugify.js')); ?>"></script>


<?php $__env->stopSection(); ?>

<?php echo $__env->make('voyager::master', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/html/terminados/nuevo/looktucuman/vendor/tcg/voyager/src/../resources/views/posts/atributos.blade.php ENDPATH**/ ?>