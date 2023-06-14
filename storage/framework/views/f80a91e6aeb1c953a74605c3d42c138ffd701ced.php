<?php if(!isset($innerLoop)): ?>
<ul class="nav d-none d-lg-flex m-auto">
<?php else: ?>
<ul class="nav flex-column">
<?php endif; ?>

<?php

    if (Voyager::translatable($items)) {
        $items = $items->load('translations');
    }

?>

<?php $__currentLoopData = $items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>

    <?php

        $originalItem = $item;
        if (Voyager::translatable($item)) {
            $item = $item->translate($options->locale);
        }

        $listItemClass = null;
        $linkAttributes =  null;
        $styles = null;
        $icon = null;
        $caret = null;

        // Background Color or Color
        if (isset($options->color) && $options->color == true) {
            $styles = 'color:'.$item->color;
        }
        if (isset($options->background) && $options->background == true) {
            $styles = 'background-color:'.$item->color;
        }

        // With Children Attributes
        if(!$originalItem->children->isEmpty()) {
            $linkAttributes =  'class="nav-link link-secondary active" ';
            $caret = '<span class="caret"></span>';

            if(url($item->link()) == url()->current()){
                $listItemClass = 'dropdown active';
            }else{
                $listItemClass = 'dropdown dropdown__wrapper';
            }
        }

        // Set Icon
        if(isset($options->icon) && $options->icon == true){
            $icon = '<i class="' . $item->icon_class . '"></i>';
        }

     ?>
    
    <li class="nav-item <?php echo e($listItemClass); ?> <?php if($item->title == 'Ingresar'): ?> btn-login <?php endif; ?> <?php if($item->title == 'Registrarme'): ?> btn-registro <?php endif; ?>" >
        <a href="<?php echo e(url($item->link())); ?>" class="nav-link link-secondary <?php if(!$originalItem->children->isEmpty()): ?> active <?php endif; ?>" target="<?php echo e($item->target); ?>" >
            <?php echo e($item->title); ?>

        </a>
        <?php if(!$originalItem->children->isEmpty()): ?>
           <div class="dropdown__content dropdown__content--full">
             <?php echo $__env->make('voyager::menu.bootstrap', ['items' => $originalItem->children, 'options' => $options, 'innerLoop' => true], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            </div>
        <?php endif; ?>
    </li>
<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
<?php /*
@if(!isset($innerLoop))
    @if(Auth::check())
        <?php 
            $user = Auth::user();
        ?>
        <li class="nav-item   btn-login  ">
            <a href="/dashboard" class="nav-link link-secondary " target="_self">
            <i class="fa fa-user"></i> {{$user->name}}
            </a>
        </li>
        <li class="nav-item    btn-registro ">
            <a href="/logout" class="nav-link link-secondary " target="_self">
            Salir
            </a>
        </li>
    @else
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
    @endif
@endif
*/ ?>
</ul>
<?php /**PATH /var/www/html/terminados/nuevo/looktucuman/vendor/tcg/voyager/src/../resources/views/menu/bootstrap.blade.php ENDPATH**/ ?>