<!DOCTYPE html>
<html>
<head>
	<title>Etiqueta de Producto</title>
	<style>
		body {
			font-family: Arial, sans-serif;
			font-size: 14px;
			margin: 0;
			padding: 0;
		}

		.container {
			width: 83mm; /* Ancho de la etiqueta */
			height: 25mm; /* Alto de la etiqueta */
			border: 1px solid #000;
			padding: 5px;
			position: relative;
			overflow: hidden;
			box-sizing: border-box;
			display: inline-block; /* Ajuste para que las etiquetas aparezcan una al lado de la otra */
			text-align: center;
		}

		.fecha {
			font-size: 12px;
			top: 5px;
			right: 0%;
		}

		.titulo {
			font-size: 16px;
			font-weight: bold;
			margin: 5px;
		}

		.precio {
			font-size: 24px;
			font-weight: bold;
			margin-top: 10px;
		}
	</style>
</head>
<body>
    @foreach($productos as $producto)
        <div class="container">
            <div class="titulo">{{ $producto->title }}</div>
            <div class="precio">${{ $producto->precios }}</div>
        </div>
    @endforeach
</body>
</html>
