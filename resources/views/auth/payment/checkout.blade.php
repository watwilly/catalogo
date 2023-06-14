@extends('layouts.app')

@section('meta')
    <title>CheckOut</title>
@stop

@section('content')
 
<section class="min-height">
    <div class="container mt-4">
        <h2 class="text-center mb-5">Confirmar Compra</h2>
        <div class="row g-3 mb-3">
            <div class="col-12 col-lg-7">
                <div class="container-fluid py-3 h-100 shadow rounded bg-white">
                    <h4 class="section__lead">Datos de facturacion</h4>
                    <div class="row g-3">
                        
                       <div class="col-12 col-md-4">
                            <div class="form-floating">
                                <input type="text" value="{{$user->name}}" class="form-control"  id="nombre" placeholder="Nombre">
                                <label for="input_email">Nombre</label>
                            </div>
                        </div>
                        <div class="col-12 col-md-4">
                            <div class="form-floating">
                                <input type="text"  value="{{$user->apellido}}" class="form-control"  id="apellido" placeholder="Apellido">
                                <label for="input_email">Apellido</label>
                            </div>
                        </div>
                        <div class="col-12 col-md-4">
                            <div class="form-floating">
                                <input type="text"   value="{{$user->email}}" class="form-control"  id="email" placeholder="E-mail">
                                <label for="input_email">E-mail</label>
                            </div>
                        </div>
                        <div class="col-12 col-md-4">
                            <div class="form-floating">
                                <input type="tel"  value="{{$user->telefono}}" class="form-control" id="telefono" placeholder="Ejemplo">
                                <label for="input_tel">Teléfono</label>
                            </div>
                        </div> 
                        <div class="col-12 col-md-4">
                            <div class="form-floating">
                                <input type="text"  value="{{$user->direccion}}" list="addresses" class="form-control" id="direccion" placeholder="Ejemplo">
                                <datalist id="addresses">
                                    <option value="Lorem ipsum dolor sit amet. 351">
                                    <option value="Lorem, ipsum. 456">
                                    <option value="Lorem ipsum dolor sit. A 5">
                                </datalist>
                                <label for="input_email">Domicilio</label>
                            </div>
                        </div>
                        <div class="col-12 col-md-4">
                            <div class="form-floating">
                                <input type="number"  value="{{$user->ndomicilio}}" class="form-control" id="numero" placeholder="Numero de casa o piso">
                                <label for="input_tel">Numero de casa o piso</label>
                            </div>
                        </div> 
                        <div class="col-12 col-md-12 col-lg-12">
                            <textarea class="form-control" id="mensaje" name="mensaje"></textarea>

                        </div>
                     
                    </div>

              
                </div>
            </div>
         
            <div class="col-12 col-lg-5">
                <div class="container-fluid py-3 h-100 shadow rounded bg-white">
                    <h4 class="section__lead">Total a pagar</h4>
                    <ul class="list-group list-group-flush ">
                        <?php
                            $total = 0;
                        ?>
                        @foreach($items as $item)
                            <?php 
                                $subtotal = $item->precios * $item->cantidad;
                            ?>
                            <li class="list-group-item d-flex justify-content-between">
                                <b>{{$item->title}}({{$item->precios}}x{{$item->cantidad}})</b>
                                <span>ARS $ {{$subtotal}}</span>
                            </li>
                            <?php 
                                $total +=$subtotal;
                            ?>
                        @endforeach
                    </ul>
                    <div class="col-md-12 alert alert-info col-12 col-lg-12">
                        <span class="alert alert-info">Total a pagar: <b>ARS ${{$total}}</b></span>
                    </div>
                    <div class="pt-4 text-center col-12 col-md-12 col-lg-12">
                        <input type="checkbox" checked="true" id="shipment_method" name="shipment_method" > Marque para retirar en el local
                    </div>
                    @if(is_null($user->email))
                        <div class="alert-warning alert text-center">Agrega tu correo electronico para poder comprar, <a href="/cuenta" class="btn btn-success">Agregar Correo</a> </div>
                    @else
                        <a href="#payment" onclick="payment();" class="btn btn-success w-100 mt-6">Pagar</a>
                    @endif
                </div>
            </div>
        </div>
    </div>
</section>
@endsection


@section('jsfooter')
<script>
    function validarCampos() {
        var nombre = $("#nombre").val();
        var apellido = $("#apellido").val();
        var email = $("#email").val();
        var telefono = $("#telefono").val();
        var direccion = $("#direccion").val();
        var numero = $("#numero").val();
        var mensaje = $("#mensaje").val();
        var shipment_method = document.getElementById("shipment_method");
        if (shipment_method.checked == true){
            shipment = "SUCURSAL";
        }else{
            shipment="N/N";
        }
        var camposVacios = [];

        if(nombre==""){
            camposVacios.push("Nombre");
        }
        if(apellido==""){
            camposVacios.push("Apellido");
        }
        if(email==""){
            camposVacios.push("Email");
        }
        if(telefono==""){
            camposVacios.push("Telefono");
        }
        if(direccion==""){
            camposVacios.push("Direccion");
        }
        if(numero==""){
            camposVacios.push("Numero");
        }

        if(camposVacios.length > 0){
            toastr("danger", "Los siguientes campos están vacíos: " + camposVacios.join(", "));
            return false;
        }
        var datos = {
            nombre: nombre,
            apellido: apellido,
            email: email,
            telefono: telefono,
            direccion: direccion,
            numero: numero,
            mensaje:mensaje,
            shipment_method:shipment,
            "_token":"{{ csrf_token() }}"
        };

        return datos;
    }

    function payment() {
        
        var campos = validarCampos();
        if(!campos){
            return;
        }
       
        showload();

        // Enviar datos por POST
        fetch("/payment", {
            method: "POST",
            body: JSON.stringify(campos),
            headers: {
                "Content-Type": "application/json"
            }
        })
        .then(function(response) {
            return response.json(); // Analiza la respuesta en formato JSON

        })
        .then(function(json){
            toastr(json["status"], json["msg"]);
            if (json["status"] == "success") {
                window.location.href = json["url"];
            }
            hideload();
        });

    }
</script>
@append

