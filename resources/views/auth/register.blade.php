@extends('layouts.app')
@section('meta')
    <meta name="title" content="Regístrate y obtén acceso a nuestra distribuidora de insumos de estética mayorista en Look Tucumán">
    <meta name="description" content="Regístrate en nuestra distribuidora de insumos de estética mayorista en Look Tucumán y obtén acceso a nuestros productos. ¡Descubre nuestra amplia variedad de insumos y mejora tu negocio!">
    <meta name="keywords" content="registro, distribuidora de insumos de estética, mayorista, Look Tucumán">
    <meta property="og:title" content="Regístrate y obtén acceso a nuestra distribuidora de insumos de estética mayorista en Look Tucumán">
    <meta property="og:description" content="Regístrate en nuestra distribuidora de insumos de estética mayorista en Look Tucumán y obtén acceso a nuestros productos. ¡Descubre nuestra amplia variedad de insumos y mejora tu negocio!">
    <meta property="og:site_name" content="Regístrate y obtén acceso a nuestra distribuidora de insumos de estética mayorista en Look Tucumán">
    <meta property="og:type" content="website">
    <title>Regístrate y obtén acceso a nuestra distribuidora de insumos de estética mayorista en Look Tucumán</title>
@stop

@section('content')
<section class="py-6" style="min-height: 100vh;">
    <div class="container">
        <div class="row">
            <div class="col-12">
            </div>
            <div class="col-12 col-lg-12">
                <div class="row g-3 col-lg-10 m-auto">
                    <div class="col-lg-6 m-auto ">
                        <div class="col-lg-12">
                            <h2 class="text-center mb-5">Crea tu cuenta.</h2>
                        </div>
                        <form method="POST" class="row  mb-4" action="{{ route('register') }}" >
                            @csrf
                            <div class="col-12 mb-3">
                                <div class="form-floating">
                                    <input type="text" name="name" value="{{ old('name') }}" required class="form-control" id="input_name" placeholder="Ejemplo">
                                    <label for="input_name">Nombre</label>
                                </div>
                                @error('name')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            <div class="col-12  mb-3">
                                <div class="form-floating">
                                    <input type="text" name="apellido" value="{{ old('apellido') }}" required class="form-control" id="input_lastname" placeholder="Ejemplo">
                                    <label for="input_lastname">Apellido</label>
                                </div>
                                @error('apellido')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            <div class="col-12  mb-3">
                                <div class="form-floating">
                                    <input type="email" name="email" value="{{ old('email') }}" required class="form-control" id="input_email" placeholder="Ejemplo">
                                    <label for="input_email">E-mail</label>
                                </div>
                                @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            <div class="col-12  mb-3">
                                <div class="form-floating">
                                    <input type="text" name="direccion" value="{{ old('direccion') }}" required class="form-control" id="direccion" placeholder="Av. Mate de luna 1654">
                                    <label for="input_email">Domicilio</label>
                                </div>
                                @error('direccion')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            <div class="col-12  mb-3">
                                <div class="form-floating">
                                    <select id="provincia_id" name="provincia_id" class="form-control">
                                        <option value="">Seleccione la provincia</option>
                                        @foreach($provincias as $provincia)
                                            <option value="{{$provincia->id}}">{{$provincia->provincia}}</option>
                                        @endforeach
                                    </select>
                                </div>
                                @error('provincia_id')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            <div class="col-12  mb-3">
                                <div class="form-floating">
                                    <select id="localidad_id" name="localidad_id" class="form-control">
                                        <option value="">Seleccione la localidad</option>
                                    </select>
                                </div>
                                @error('localidad_id')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            <div class="col-12  mb-3">
                                <div class="form-floating">
                                    <input type="number" name="cpa" value="{{ old('cpa') }}" required class="form-control" id="cpa" >
                                    <label for="input_email">Codigo postal</label>
                                </div>
                                @error('cpa')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>

                            <div class="col-12  mb-3">
                                <div class="form-floating">
                                    <input type="number" name="telefono" value="{{ old('telefono') }}" required class="form-control" id="telefono" >
                                    <label for="input_email">Teléfono</label>
                                </div>
                                @error('telefono')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>


                            <div class="col-12  mb-3">
                                <div class="form-floating">
                                    <input type="password" name="password"  required class="form-control" id="input_pass" placeholder="Ejemplo">
                                    <label for="input_pass">Contraseña</label>
                                </div>
                                @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            <div class="col-12 mb-5">
                                <div class="form-floating">
                                    <input type="password" name="password_confirmation" required  class="form-control" id="input_pass2" placeholder="Ejemplo">
                                    <label for="input_pass2">Repetir Contraseña</label>
                                </div>
                                @error('password_confirmation')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            <div class="col-12 mb-5">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="terminos" required id="flexCheckDefault">
                                    <label class="form-check-label" for="flexCheckDefault">
                                        Acepto los <a target="_blank" href="/nota/2/condiciones-de-uso-online">Términos y Condiciones</a> y <a  target="_blank" href="/nota/3/condiciones-de-uso-online">Politicas de Privacidad</a>
                                    </label>
                                </div>
                            </div>
                            <div class="col-12 mb-5">
                                <div class="g-recaptcha" data-sitekey="{{Voyager::setting('site.ccg')}}"></div>
                                @error('g-recaptcha-response')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            <div class="col-12">
                                <div class="d-flex g-2 justify-content-center">
                                    <button class="btn btn-primary w-50">Registrarme</button>
                                </div>
                            </div>
                        </form>
                        <div class="col-12">
                            <div class="d-flex flex-column align-items-center">
                                <a href="/auth/user/login" class="section__link section__link--secondary">Ya tengo cuenta</a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</section>
 
@endsection