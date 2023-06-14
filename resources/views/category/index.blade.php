@extends('layouts.app')
<?php 
   $url = url()->full();
?>

@section('meta')
    <meta name="title" content="{{$category->name}} | Look Tucumán">
    <meta name="description" content="@if($category->descripcion) {{$category->descripcion}} @else {{$category->name}} en Tucumán, encuentra todo lo que necesitas para tu negocio de estética en Look Tucumán @endif">
    <meta property="og:locale" content="es_AR">
    <meta property="og:description" content="@if($category->descripcion) {{$category->descripcion}} @else {{$category->name}} en Tucumán, encuentra todo lo que necesitas para tu negocio de estética en Look Tucumán @endif">
    <meta property="og:site_name" content="Look Tucumán">
    <meta name="author" content="Look Tucumán">
    <meta property="og:image" content="@if($category->imagenceo) https://www.looktucuman.com/storage/{{$category->imagenceo}} @else https://www.looktucuman.com/storage/{{Voyager::setting('site.ogimage')}} @endif">
    <title>{{$category->name}} | Look Tucumán</title>
@stop

@section('content')
<section class="min-height">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12 col-lg-4 col-xl-3 p-0">
                @include("category.filter")
            </div>
            <div class="col-12 col-lg-8 col-xl-9 py-5">
                <div class="row gy-3 gx-2 justify-content-center">
                    <div class="col-12">
				  	@if(is_null($category->parent_id))
				  		<?php $prdcatname = $category->name; ?>
				  	@else
				  		<?php $cat_parent =  $category->get_parent()->first(); ?>
				  		<?php $prdcatname = $cat_parent->name; ?>
				  	@endif

                        <h2 class="text-center">{{$category->name}}</h2>
                    </div>
                    <?php $n1=1; ?>
                    @if(count($productos)>0)
					@foreach ($productos as  $post)
               	 		{{Voyager::h_listview($post["title"], $post["id"], $post["imagen"], null, $post["precios"], 'small', $prdcatname)}}
                        <?php $n1++; ?>
                   @endforeach
                   <div class="col-12">
					<nav aria-label="Page navigation">
					  <ul class="pagination">
						    {{$render->render()}}
					  </ul>
					</nav>
                   </div>
                   @else
                    <div class="alert alert-info">Seccion sin contenido.</div>
                   @endif
                    <?php /*<div class="col-12">
                        <div class="d-flex justify-content-center">
                            <a href="#" class="btn btn-primary">Cargando más publicaciones...</a>
                        </div>
                    </div> */ ?>
                </div>
            </div>
        </div>
    </div>
</section>
@section('jsfooter')

<script>
    let priceShow = document.getElementById("price-show")
    let priceChange = document.getElementById("price-change")
    let filterContainer = document.getElementById("filter-container")

    priceShow.innerHTML = priceChange.value
    priceChange.oninput = function() {
        priceShow.innerHTML = this.value
    }

    window.onload = () => {
        if(window.innerWidth >= 992){
            filterContainer.classList.add("show")
        }
    }

	$('#price-change').change(function() {
		var xhttp = new XMLHttpRequest();
		var price = $(this).val();
		
		xhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200) {
	        	window.location = "";
		    }
		};
		xhttp.open("GET", "/filtro-category?argument=price_rangue&max_price="+price, true);
		xhttp.send();
	});

    function orderatribute(o) {
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200) {
	        	window.location = "";
		    }
		};
		xhttp.open("GET", "/filtro-category?argument=catOrden&atribute="+o, true);
		xhttp.send();
    }

</script>
@append

@endsection