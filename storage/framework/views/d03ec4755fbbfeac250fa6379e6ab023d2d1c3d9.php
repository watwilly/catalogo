<!DOCTYPE html>
<html>
<head>
<style type="text/css">
@font-face {
    font-family: 'Light';
    src: url(fonts/Metropolis-Light.otf);
}
@font-face {
    font-family: 'Thin';
    src: url(fonts/Metropolis-Thin.otf);
}
@font-face {
    font-family: 'Bold';
    src: url(fonts/Metropolis-Bold.otf);
}

.logo img {
    max-width: 100%;
}

.estado-pago {
    border-radius: 15px;
    text-align: center;
    font-size: 24px;
    font-family: 'Bold', sans-serif;
}
.detalle-compra table {
    width: 100%;
}

h5 {
    font-family: 'Bold', sans-serif;
    margin-bottom: 15px;
    border-bottom: 1px solid #eee;
    padding-bottom: 4px;
}

.datos-comprador {
    margin-top: 30px;
}

.datos-comprador ul {
    padding: 15px;
    border: 1px solid #eee;
}
.datos-comprador ul li {
    padding: 10px 0;
}

.leyenda {
    font-size: 14px;
    margin-bottom: 30px;
}
.container {
    max-width: 1140px;
}
.pull-right {
    float: right;
}

.table-responsive {
    display: block;
    width: 100%;
    overflow-x: auto;
    -webkit-overflow-scrolling: touch;
    -ms-overflow-style: -ms-autohiding-scrollbar;
}
h5 {
    font-family: 'Bold', sans-serif;
    margin-bottom: 15px;
    border-bottom: 1px solid #eee;
    padding-bottom: 4px;
}

table {
    border-collapse: collapse;
}
.text-center {
    text-align: center!important;
}
.table .thead-dark th {
    color: #fff;
    background-color: #212529;
    border-color: #32383e;
}

.table thead th {
    vertical-align: bottom;
    border-bottom: 2px solid #e9ecef;
}

th {
    text-align: inherit;
}
.table td, .table th {
    padding: .75rem;
    vertical-align: top;
    border-top: 1px solid #e9ecef;
}
.bg-light {
    background-color: #f8f9fa!important;
}
.text-right {
    text-align: right!important;
}
th {
    text-align: inherit;
}

</style>

</head>

<body>
    <div class="container">
        <div class="d-flex justify-content-center">
            <div class=" alert-danger border-danger p-4 border my-5 estado-pago">
                ¡Gracias por tu compra!
            </div> 
            <div class=" alert-danger border-danger p-4 border my-5 estado-pago">
                <p>Nos complace informarte que hemos recibido tu pedido y lo estamos procesando de inmediato. Esperamos que estés satisfecho/a con tu compra y que disfrutes de los productos que has adquirido.</p>
                <p>Si tienes alguna pregunta o problema con tu pedido, no dudes en ponerte en contacto con nosotros a través de nuestro sitio web o correo electrónico de soporte. Estamos aquí para ayudarte en todo lo que necesites.</p>
                <p>¡Gracias de nuevo por elegirnos y esperamos verte pronto en nuestra tienda en línea! </p>
                </p>
            </div>
        </div>
        <div class="pull-right">
            <a href="http://<?php echo e($_SERVER['HTTP_HOST']); ?>/carrito" class="btn btn-info">Ir a mis carrito</a>
        </div>
        <div class="detalle-compra table-responsive">
            <h5>Detalle de Compra</h5>
            <table class="table">
                <thead class="thead-dark text-center">
                    <tr>
                        <th>Producto</th>
                        <th>Atributos</th>
                        <th>Cantidad</th>
                        <th>Precio unitario</th>
                        <th>Subtotal</th>
                    </tr>
                </thead>
                <tbody class="text-center">
                
                <?php $total = 0; ?>

                <?php $__currentLoopData = $register; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $detalle): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <?php 
                        if ($detalle->descuento) {
                            $price = \App\Models\Post::returnDescuento($detalle->precio, $detalle->descuento);
                        }else{
                            $price = $detalle->precio;
                        }
                        $firstImg = json_decode($detalle->images);

                        $topTotal = $price * $detalle->cantidad;

                        $talle = $detalle->talleId()->first();
                        $color = $detalle->colorId()->first();
                    ?>
                    <tr>
                        <td><?php echo e($detalle->producto_name); ?></td>
                        <td>Talle: <?php if(!is_null($talle)): ?> <?php echo e($talle->talle); ?> <?php endif; ?> Color:                        <?php if(!is_null($color)): ?>
                         <span class="color" style="background-color:  <?php echo e($color->color); ?>; "></span>
                        <?php else: ?>
                            <span class="color">NN</span>
                        <?php endif; ?></td>
                        <td><?php echo e($detalle->cantidad); ?></td>
                        <td>$<?php echo e($price); ?></td>
                        <td>$<?php echo e($topTotal); ?></td>
                    </tr>
                     <?php $total +=$topTotal; ?>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    <tr class="bg-light">
                        <th scope="row" colspan="4" class="text-right">Total</th>
                        <td>$ <?php echo e($total); ?></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <hr>
        <div class="datos-comprador">
            <h5>Datos Comprador</h5>
            <div class="bg-light">
                <ul>
                    <li>Nombre: <?php echo e($user->name); ?> </li>
                    <li>Apellido: <?php echo e($user->apellido); ?></li>
                    <li>Domicilio: <?php echo e($user->direccion); ?></li>
                    <li>Teléfono: <?php echo e($user->telefono); ?></li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>

<?php /**PATH /var/www/html/terminados/nuevo/looktucuman/resources/views/emails/confpayment.blade.php ENDPATH**/ ?>