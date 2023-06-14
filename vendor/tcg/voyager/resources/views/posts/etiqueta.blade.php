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
			width: 80mm; /* Ancho de la etiqueta */
			height: 25mm; /* Alto de la etiqueta */
			border: 1px solid #000;
			padding: 5px;
			position: relative;
			overflow: hidden;
			box-sizing: border-box;
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
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
	<div class="container">
		<div class="titulo">{{ $titulo }}</div>
		<div class="precio">${{ $precio }}</div>
	</div>
</body>
</html>
