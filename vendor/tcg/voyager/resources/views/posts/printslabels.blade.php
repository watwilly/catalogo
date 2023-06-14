@extends('voyager::master')

@section('page_title', 'Imprimir etiquetas')

@section('page_header')
<div class="container-fluid">
    <h1 class="page-title">
        <i class=""></i> Imprimir etiquetas.
    </h1>
    <a href="/admin/posts" class="btn btn-success btn-add-new">
        <i class="voyager-plus"></i> <span>Volver</span>
    </a>
    <form class="text-center" action="/admin/posts/etiquetas" method="POST">
        {{ csrf_field() }}

        <input type="hidden" name="productos" value="{{$json_products}}">
        @if(isset($_GET["page"]))
            <h6>Estas imprimiendo la pagina: {{$_GET["page"]}}</h6>
        @endif
        <button type="submit" class="btn btn-warning">
            <span>Click Aqui para imprimir este listado</span>
        </button>
    </form>
    <div class="alert alert-info">
        <h3>Informacion útil:</h3>
        <ul>
            <li>Se imprimirán de 100 en 100 productos. Si tienes más de 100 productos, tendrás que seguir paginando hasta que hayas impreso todas las etiquetas.</li>
            <li>Si quieres imprimir únicamente los productos de una categoría en particular, deberás seleccionar dicha categoría en el buscador que se encuentra más abajo en la página. Una vez que hayas hecho esto, haz clic en la lupa para buscar los productos de esa categoría y luego en el botón amarillo para imprimir las etiquetas correspondientes.</li>
        </ul>
    </div>
</div>
@stop

@section('content')
<div class="page-content browse container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-bordered">
                <div class="panel-body">
                    <form method="get" class="form-search">
                        <div id="search-input">
                          
                            <div class="input-group col-md-12">
                                <div class="col-md-6">
                                    <input type="text" name="title" placeholder="Ingrese un titulo a buscar" class="form-control">
                                </div>
                                <div class="col-md-6">
                                    <select class="form-control " name="s">
                                        <option value="" hidden>Seleccione la categoria</option>
                                        @foreach(DB::table("categories")->select("id","name")->orderBy("name","ASC")->get() as $category)
                                        <option value="{{ $category->id }}" @if(isset($_GET['category_id']) && $_GET['category_id']==$category->id ) selected @endif>{{ $category->name }}</option>
                                        @endforeach
                                    </select>
                                </div>

                                <span class="input-group-btn">
                                    <button class="btn btn-info btn-lg" type="submit">
                                        <i class="voyager-search"></i>
                                    </button>
                                </span>
                            </div>
                        </div>
                    </form>
                    <div class="table-responsive">
                        <table id="dataTable" class="table table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Titulo</th>
                                    <th>Precio</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($productos as $data)
                                <tr>
                                    <td>
                                        <span>{{ $data->id }}</span>
                                    </td>
                                    <td>
                                        <span>{{ $data->title }}</span>
                                    </td>
                                    <td>
                                        <span>$ {{ $data->precios }}</span>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                    <div class="pull-left">
                        <div role="status" class="show-res" aria-live="polite">{{ trans_choice(
                                    'voyager::generic.showing_entries', $productos->total(), [
                                        'from' => $productos->firstItem(),
                                        'to' => $productos->lastItem(),
                                        'all' => $productos->total()
                                    ]) }}</div>
                    </div>
                    <div class="pull-right">
                        {{ $productos->appends([
                                    'order_by' => "ASC",
                                ])->links() }}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@stop

@section('css')
<link rel="stylesheet" href="{{ voyager_asset('lib/css/responsive.dataTables.min.css') }}">
@stop

@section('javascript')

<script>

</script>
@stop