<option value="">Seleccione</option>
<?php $__currentLoopData = $marcas; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $cmarca): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
	<?php 
		$marca = $cmarca->marcasId()->first();
	?>
    <option value="<?php echo e($marca->id); ?>" <?php if(isset($_POST['marca_id']) && $_POST['marca_id'] == $marca->id): ?><?php echo e('selected="selected"'); ?><?php endif; ?>><?php echo e($marca->name); ?></option>
<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
<?php /**PATH /var/www/html/terminados/nuevo/looktucuman/vendor/tcg/voyager/src/../resources/views/posts/marcas.blade.php ENDPATH**/ ?>