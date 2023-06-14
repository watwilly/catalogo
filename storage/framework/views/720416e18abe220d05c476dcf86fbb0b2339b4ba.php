<option value="">Seleccione</option>
<?php $__currentLoopData = $modelos; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $cmodelo): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
	<?php 
		$modelo = $cmodelo->modelosId()->first();
	?>
    <option value="<?php echo e($modelo->id); ?>" <?php if(isset($_POST['modelo_id']) && $_POST['modelo_id'] == $modelo->id): ?><?php echo e('selected="selected"'); ?><?php endif; ?>><?php echo e($modelo->name); ?></option>
<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
<?php /**PATH /var/www/html/terminados/nuevo/looktucuman/vendor/tcg/voyager/src/../resources/views/posts/modelos.blade.php ENDPATH**/ ?>