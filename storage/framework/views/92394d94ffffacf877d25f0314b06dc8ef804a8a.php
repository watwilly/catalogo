<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consulta</title>
    <?php echo $__env->make("emails.style", \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
</head>

<body class="container my-6 bg-light">

    <main class="card shadow">
        <header class="text-center">
            <img src="https://www.ventastucuman.com/storage/<?php echo e(Voyager::setting('site.logo')); ?>" alt="">
            <hr>
        </header>
        <div class="card-body">
            <h1>Nuevo Comentario</h1>
            <p>Estimado/a Look Tucumán,</p>
            <p>Le informamos que ha recibido un nuevo comentario en una de las publicaciones de su sitio web:</p>
            <ul>
                <li><strong>Publicación:</strong> <?php echo e($post->title); ?></li>
                <li><strong>Comentario:</strong> <?php echo e($mensaje); ?></li>
                <li><strong>Autor:</strong> <?php echo e($user->name); ?> <?php echo e($user->apellido); ?></li>
                <li><strong>Fecha:</strong> <?php echo e($create->created_at->todateString()); ?></li>
            </ul>
            <p>Por favor, revise el comentario y apruébelo o rechácelo según corresponda. Puede acceder a su panel de administración para hacerlo:</p>
            <a href="https://<?php echo e($_SERVER['HTTP_HOST']); ?>/admin" class="btn btn-primary mb-3">Acceder al Panel de Administración</a>
        </div>
        <footer class="card-footer bg-dark p-3 text-center">
            <h6 class="text-light m-0">Atentamente, el equipo de <a href="https://distlooktucuman.com.ar/">distlooktucuman.com.ar</a></h6>
        </footer>
    </main>
</body>

</html>
<?php /**PATH /var/www/html/terminados/nuevo/looktucuman/resources/views/emails/interesados.blade.php ENDPATH**/ ?>