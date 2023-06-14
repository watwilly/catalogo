<?php 
    $user = null;
    if(Auth::check()){
        $user = Auth::user();
    }
?>
<!doctype html>
<html amp lang="es-AR">
<head>
  <meta charset="utf-8">
  <title>{{$post->title}} | Ventas Tucuman</title>
  <meta name="amp-experiment-token" content="HfmyLgNLmblRg3Alqy164Vywr">
  <script async src="https://cdn.ampproject.org/v0.js"></script>

  <script async custom-element="amp-carousel" src="https://cdn.ampproject.org/v0/amp-carousel-0.1.js"></script>
  <script async custom-element="amp-list" src="https://cdn.ampproject.org/v0/amp-list-0.1.js"></script>
  <script async custom-template="amp-mustache" src="https://cdn.ampproject.org/v0/amp-mustache-0.2.js"></script>
  <script async custom-element="amp-social-share" src="https://cdn.ampproject.org/v0/amp-social-share-0.1.js"></script>
  <script async custom-element="amp-lightbox" src="https://cdn.ampproject.org/v0/amp-lightbox-0.1.js"></script>
  <script async custom-element="amp-image-lightbox" src="https://cdn.ampproject.org/v0/amp-image-lightbox-0.1.js"></script>
  <script async custom-element="amp-form" src="https://cdn.ampproject.org/v0/amp-form-0.1.js"></script>
  <script async custom-element="amp-sidebar" src="https://cdn.ampproject.org/v0/amp-sidebar-0.1.js"></script>
  <script async custom-element="amp-selector" src="https://cdn.ampproject.org/v0/amp-selector-0.1.js"></script>
  <script async custom-element="amp-analytics" src="https://cdn.ampproject.org/v0/amp-analytics-0.1.js"></script>
  <script async custom-element="amp-bind" src="https://cdn.ampproject.org/v0/amp-bind-0.1.js"></script>

        <meta name="theme-color" content="#005af0" />
        <meta name="twitter:card" content="summary_large_image" />
        <meta name="twitter:title" content="{{$post->title}}" />
        <meta name="twitter:creator" content="@ventas_tucuman" />
        <meta name="twitter:site" content="@ventas_tucuman" />
        <meta property="og:title" content="{{$post->title}}" />
        <meta property="og:url" content="https://{{$_SERVER['HTTP_HOST']}}{{$_SERVER['REQUEST_URI']}}" />
        <meta property="og:image:width" content="600" />
        <meta property="og:image:height" content="314" />
        <meta name="supported-amp-formats" content="websites" />
        <meta name="page-locale" content="ar" />
  <link rel="canonical" href="https://{{$_SERVER['HTTP_HOST']}}{{str_ireplace('/amp','', $_SERVER['REQUEST_URI'])}}" /> 

  <meta name="viewport" content="width=device-width">
<style amp-custom>
    :root {
      --color-primary: #005AF0;
      --color-secondary: #00DCC0;
      --color-text-light: #fff;
      --color-text-dark: #000;
      --color-bg-light: #FAFAFC;
      --color-bg-grey: rgba(0,0,0,0.8);

      --space-1: .5rem;  /* 8px */
      --space-2: 1rem;   /* 16px */
      --space-3: 1.5rem; /* 24px */
      --space-4: 2rem;   /* 32px */
      --box-shadow-1: 0 1px 1px 0 rgba(0,0,0,.14), 0 1px 1px -1px rgba(0,0,0,.14), 0 1px 5px 0 rgba(0,0,0,.12);
    }

    article#preview {
      background-color: var(--color-bg-light);
    }

    amp-carousel {
      margin:0
    }
    .shadow {
    box-shadow: 0 0.5rem 1rem rgb(0 0 0 / 15%);
}
    .header {
      position:relative;
      box-shadow: var(--box-shadow-1);
      padding-top:66px;
      background-color:#fff;
    }

    .header #sample-menu {
      position:absolute;
      top:0;
      left:0;
      font-size:18px;
      font-weight:700;
      color: var(--color-text-light);
      text-transform:uppercase;
      padding:13px;
    }

    .header #sample-logo {
      position:absolute;
      top:6px;
      left:36px;
      font-size:18px;
      font-weight:400;
      color:var(--color-text-light);
      text-transform:uppercase;
      margin:0 var(--space-2);
      height:var(--space-4);
      text-decoration:none;
      line-height:52px
    }

    .header form {
      padding:0
    }

    .header input::-webkit-search-decoration,.header input::-webkit-search-cancel-button {
      display:none
    }

    .header input[type=submit] {
      position:absolute;
      top:10px;
      right:var(--space-1);
      background-color:#212529;
      background-position:center;
      background-repeat:no-repeat;
      background-image:-webkit-image-set(url(/img/ic_search_white_1x_web_24dp.png) 1x,url(/img/ic_search_white_2x_web_24dp.png) 2x);
      border:0;
      height:var(--space-4);
      width:36px;
      -webkit-appearance:none;
      border-radius:4px 0
    }

    .header input[type=search],.header input[type=text] {
      position:absolute;
      top:10px;
      right:var(--space-3);
      background:var(--color-bg-light);
      padding:0 var(--space-1);
      width:26vw;
      height:var(--space-4);
      font-family:inherit;
      font-size:100%;
      border:solid 0 var(--color-primary);
      border-radius:4px 0;
      transition:all .9s ease
    }

    .header input[type=search]:focus,.header input[type=text]:focus {
      width:80vw;
      max-width:700px;
      background-color:var(--color-text-light);
      border-color:var(--color-primary);
      box-shadow:var(--box-shadow-1);
      outline:none
    }

    .header input:-moz-placeholder,.header input::-webkit-input-placeholder {
      color:var(--color-bg-light);
    }

    .header input:focus + #sample-logo {
      visibility:hidden;
      opacity:0;
      transition:visibility 0 0.7s,opacity .7s ease
    }

    .header input + #sample-logo {
      visibility:visible;
      opacity:1;
      transition:opacity 1.5s ease
    }

    @media (min-width: 600px) {
      .header input[type=search] {
        width:100px
      }

      .header input[type=search]:focus {
        width:600px
      }
    }

    .items,amp-list.items > div {
      display:flex;
      justify-content:space-around;
      flex-wrap:wrap
    }

    .item {
      flex-grow:1;
      flex-shrink:1
    }

    .tile {
      background-color:var(--color-text-light);
      width:120px;
      height:200px;
      display:block;
      margin:var(--space-1);
      -webkit-tap-highlight-color:var(--color-bg-light);
      max-width:200px
    }

    @media (max-width: 500px) {
      .items .tile {
        width:150px;
        height:200px
      }
    }

    .tile:active {
      background-color:var(--color-bg-light);
    }

    .tile p {
      margin:0;
      padding:0 var(--space-1);
      font-size:var(--space-2);
      line-height:20px
    }

    .tile .name {
      margin-top:var(--space-1);
    }

    .tile .price {
      margin-bottom:var(--space-1);
    }

    .tile .price,.tile .star {
      color:var(--color-text-dark);
    }

    #product-description {
      clear: both;
    }

    amp-lightbox {
      background: rgba(0,0,0,0.8);
      width: 100%;
      height: 100%;
      position: absolute;
    }
    amp-accordion h4 {
      font-size: 18px;
    }
    amp-carousel .selected {
      border: solid 2px red;
    }
    .amp-youtube-container {
      display: flex;
      align-items: center;
      justify-content: center;
      width: 100%;
      height: 100%;
    }
    .video {
      flex: 1;
    }
    .price-description {
      color: #0e0d0d;
      font-weight: 800;
      margin-top: 24px;
      margin-bottom: 16px;
      font-size: 20px;
    }
    .product-gallery > ul {
      margin: 0;
      padding: 0;
      float: left;
      list-style: none;
      line-height: 0;
    }
    .product-gallery > ul > li {
      cursor: pointer;
      margin: 0 1em 1em 1em;
      opacity: 1;
      will-change: opacity;
      transition: all 0.3s cubic-bezier(.25,.8,.25,1);
    }
    .product-gallery > ul > li:active {
      opacity: 0.5;
    }
    .product-gallery > ul > li:focus {
      outline: none;
    }
    .product-gallery amp-img:focus {
      outline: none;
    }
    form#order label {
      display: inline;
      font-weight: 500;
      font-size: 16px;
      margin: 0;
    }
    form#order .button {
      width: 100%;
      max-width: 400px;
      align-self: center;
      margin: 16px 20%;
      box-sizing: border-box;
    }
    form#order.amp-form-submitting [name=add-to-cart] {
      color: #666;
      background-color: #aaa;
      cursor: default;
    }
    form#order amp-selector > ul {
      list-style: none;
      display: flex;
      align-items: flex-end;
      justify-content: end;
    }
    form#order amp-selector > ul li {
      display: flex;
      align-items: center;
      justify-content: center;
      margin-right: 8px;
      background: white;
      height: 40px;
      min-width: 40px;
      width: auto;
    }
    form#order amp-selector [option] {
      outline: none;
    }
    form#order amp-selector amp-img[option][selected] {
      outline-width: 1px;
      outline-style: solid;
      outline-color: #eb407a;
      background: none;
    }
    form#order amp-selector:not([disabled]) [option][selected]:not([disabled]), amp-img.selected {
      will-change: box-shadow;
      box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);
      transition: box-shadow 0.3s cubic-bezier(.25,.8,.25,1);
      color: #fff;
    }

    form#order amp-selector:not([disabled]) [option][selected]:not([disabled]):not(.unavailable):not(.square) {
      background-color: #eb407a;
    }

    form#order amp-selector:not([disabled]) [option][selected]:not([disabled]):not(.unavailable).square {
      outline: 1px solid #eb407a;
    }

    form#order amp-selector:not([disabled]) [option]:not([selected]):not([disabled]), amp-img:not([.selected]) {
      will-change: box-shadow;
      box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
      transition: box-shadow 0.3s cubic-bezier(.25,.8,.25,1);
    }

    form#order amp-selector[name=color] div:not([selected]):not([disabled]) {
      opacity: 0.6;
    }

    /* global style in order to bind global style in the iframe */

    html, body {
      font-size: 16px;
      font-family: 'Noto Sans', sans-serif;
      color: #48525C;
    }
    p {
      line-height: 1.6rem;
    }
    a {
      font-weight: bold;
      text-decoration: none;
      color: #005AF0;
    }
    .tabButton.h4.ampstart-nav-item {
      text-align: center;
      padding: 0.5rem;
    }
    .ampstart-btn {
      margin-top: 1.5rem;
      margin-bottom: .75em;
      font-family: 'Poppins', sans-serif;
      font-weight: 700;
      line-height: 1.2em;
      font-size: 1em;
      color: #fff;
      display: inline-block;
      padding: 0.75em 1.75em;
      border-radius: 3px;
      background-color: #005AF0;
      border: none;
      cursor: pointer;
      box-shadow: 0 15px 35px -5px rgba(0,0,0,0.25);
      transition: transform 0.3s cubic-bezier(0.25, 0.1, 0.25, 1),box-shadow 0.3s cubic-bezier(0.25, 0.1, 0.25, 1);
    }
    p.name + p.star {
      color: gold;
    }
    button.info-button {
      border: none;
    }
    @keyframes fadeIn {
      0% {opacity: 0;}
      100% {opacity: 1;}
    }
    .fadeIn {
      animation-duration: 1s;
      animation-fill-mode: both;
      animation-name: fadeIn;
    }

    .unavailable {
      position: relative;
      background: gray;
      overflow: hidden;
      opacity: 0.6;
      pointer-events: none;
      user-select: none;
    }

    .unavailable:before, .unavailable:after {
      position: absolute;
      content: '';
      background: grey;
      display: block;
      width: auto;
      height: 1px;
      min-width: 56px;
      -webkit-transform: rotate(-45deg);
      transform: rotate(-45deg);
      left: -11px;
      right: 0;
      top: 0;
      bottom: 0;
      margin: auto;
      border-bottom: 2px solid;
    }

    .unavailable:after {
        -webkit-transform: rotate(45deg);
        transform: rotate(45deg);
    }

    div.square {
      width: 40px;
      height: 40px;
    }

    .green {
      background-color: #008000;
    }

    .red {
      background-color: #FF0000;
    }

    .golden {
      background-color: #DAA520;
    }

    @media (max-width: 1024px) {
      .product-gallery > ul {
        display: none;
      }
    }
    .info-button {
      background: -webkit-image-set(
        url(/static/samples/img/ic_info_outline_black_24dp_1x.png) 1x,
        url(/static/samples/img/ic_info_outline_black_24dp_2x.png) 2x
      );
      background-repeat: no-repeat;
      width: 24px;
      height: 24px;
      margin-top: 4px;
    }

    .info {
      margin: 0 auto;
      background: #fff;
    }

    .lightbox {
      width: 100%;
      height: 100%;
      display: flex;
      align-items: center;
    }

    .ampTabContainer {
        display: flex;
        flex-wrap: wrap;
    }

    .tabButton {
        list-style: none;
        text-align: center;
        cursor: pointer;
        outline: none;
    }

    amp-selector [option][selected] {
      outline: #fff;
    }

    .tabContent {
        line-height: 1.5rem;
        display: none;
        width: 100%;
        order: 1; /* must be greater than the order of the tab buttons to flex to the next line */
    }

    .tabButton[selected]::after {
      content: '';
      display: block;
      height: 4px;
    }

    .tabButton[selected]+.tabContent {
        display: block;
    }

    .items, amp-list.items > div {
      justify-content: flex-start;
    }

    .close-gallery-button {
      z-index: 1;
      position: absolute;
      right: 0;
    }
    .align-items-center {
    align-items: center;
}
.row {
    --bs-gutter-x: 1.5rem;
    --bs-gutter-y: 0;
    display: flex;
    flex-wrap: wrap;
    margin-top: calc(var(--bs-gutter-y) * -1);
}
.col-3 {
    flex: 0 0 auto;
    width: 25%;
}
.row>* {
    flex-shrink: 0;
    width: 100%;
    position: relative;
    max-width: 100%;
    margin-top: var(--bs-gutter-y);
}
a {
    color: #ffc107;
    text-decoration: none;
}
.rounded-circle {
    border-radius: 50%;
}

.img-fluid {
    max-width: 100%;
    height: auto;
}
amp-img, svg {
    vertical-align: middle;
}
.col-9 {
    flex: 0 0 auto;
    width: 75%;
}
.custom-link {
    position: relative;
    transition: all .2s ease-in-out;
}
.link-secondary {
    color: #3b3a38;
}
.section__lead {
    font-family: "Roboto",sans-serif;
    text-transform: uppercase;
    letter-spacing: 4px;
    line-height: 2;
    margin: 0;
}
.text-truncate {
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}
.custom-link::after {
    bottom: -5px;
    right: 100%;
    left: 0;
    transition: inherit;
}
.custom-link::after, .section__link::after {
    content: " ";
    height: 2px;
    position: absolute;
    transition: inherit;
}
.rounded-pill {
    border-radius: 50rem;
}
.bg-light {
    background-color: #f8f9fa;
}
.fw-bold {
    font-weight: 700;
}
.py-2 {
    padding-top: 0.5rem ;
    padding-bottom: 0.5rem;
}
.px-3 {
    padding-right: 1rem ;
    padding-left: 1rem ;
}
.border-gray {
    border-color: #cbd3da ;
}
.border {
    border: 1px solid #3b3a38 ;
}
.d-block {
    display: block;
}
.bg-dark {
    background-color: #212529;
}
.text-light {
    color: #f8f9fa;
}
.py-6 {
    padding-top: 3rem ;
    padding-bottom: 3rem ;
}
.container, .container-fluid, .container-xxl, .container-xl, .container-lg, .container-md, .container-sm {
    width: 100%;
    margin-right: auto;
    margin-left: auto;
}
.justify-content-center {
    justify-content: center ;
}
.align-items-center {
    align-items: center ;
}
.justify-content-evenly {
    justify-content: space-evenly ;
}
.h-100 {
    height: 100% ;
}
.g-5, .gy-5 {
    --bs-gutter-y: 2rem;
}
.row {
    --bs-gutter-x: 1.5rem;
    --bs-gutter-y: 0;
    display: flex;
    flex-wrap: wrap;
}
.col-12 {
    flex: 0 0 auto;
    width: 100%;
}
.text-primary {
    color: #ffc107 ;
}

.text-center {
    text-align: center;
}
.flex-column {
    flex-direction: column ;
}
.nav {
    display: flex;
    flex-wrap: wrap;
    padding-left: 0;
    margin-bottom: 0;
    list-style: none;
}
.link-light {
    color: #f8f9fa;
}
.nav-link {
    display: inline-block;
    margin: 0.25rem 0.5rem;
    font-family: "Roboto",sans-serif;
    text-transform: uppercase;
    letter-spacing: 3px;
    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out;
}
.col-6 {
    flex: 0 0 auto;
    width: 50%;
}

.img-fluid {
    max-width: 100%;
    height: auto;
}
.col-4 {
    flex: 0 0 auto;
    width: 33.3333333333%;
}
.bg-black {
    background-color: #000 ;
}
.btn-outline-light {
    color: #f8f9fa;
    border-color: #f8f9fa;
}
.btn-light {
    color: #000;
    background-color: #f8f9fa;
    border-color: #dae0e5;
    box-shadow: inset 0 1px 0 rgb(255 255 255 / 15%), 0 1px 1px rgb(0 0 0 / 8%);
}
.btn {
    display: inline-block;
    font-weight: 600;
    line-height: 2rem;
    text-align: center;
    vertical-align: middle;
    cursor: pointer;
    user-select: none;
    padding: 0.5rem 1rem;
    font-size: 1rem;
    border-radius: 2rem;
    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}
</style>


  <style amp-boilerplate>body{-webkit-animation:-amp-start 8s steps(1,end) 0s 1 normal both;-moz-animation:-amp-start 8s steps(1,end) 0s 1 normal both;-ms-animation:-amp-start 8s steps(1,end) 0s 1 normal both;animation:-amp-start 8s steps(1,end) 0s 1 normal both}@-webkit-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-moz-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-ms-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-o-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}</style><noscript><style amp-boilerplate>body{-webkit-animation:none;-moz-animation:none;-ms-animation:none;animation:none}</style></noscript>
</head>
<body>


  <amp-sidebar id="drawermenu" layout="nodisplay" style="background:rgba(59,58,56,.97);width: 72%;">
    <div class="sidemenu">
        @if(is_null($user))
            <h3 class="text-primary" style="text-align: center;">Ventas Tucumán</h3>
        @else
            <h3 class="text-primary">{{$user->name}} {{$user->apellido}}</h3>
        @endif
        <hr class="my-5 bg-light">
        <div class="container-fluid">
            <div class="row g-2">
                <div class="col-6">
                    @if(is_null($user))
                        <a href="/auth/user/login" class="d-block btn btn-outline-light">Iniciar Sesión</a>
                    @else
                        <a href="/dashboard" class="d-block btn btn-outline-light">Mi Cuenta</a> 
                    @endif
                </div>
                <div class="col-6">
                    @if(is_null($user))
                        <a href="/auth/user/register" class="d-block btn btn-light">Registrarse</a>
                    @else
                        <a href="/logout" class="d-block btn btn-light">Cerrar Sesión</a>
                    @endif
                </div>
            </div>
        </div>
        <hr class="my-5 bg-light">
        @if(Auth::check())
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a href="/dashboard" class="nav-link link-light">Panel de Usuario</a>
                </li>
                <li class="nav-item">
                    <a href="/ventas" class="nav-link link-light">Publicaciones</a>
                </li>
                <li class="nav-item">
                    <a href="/interesados" class="nav-link link-light">Consultas</a>
                </li>
                <li class="nav-item">
                    <a href="/comercio" class="nav-link link-light">Mis Tiendas</a>
                </li>
                <li class="nav-item">
                    <a href="/mis-ventas" class="nav-link link-light">Mis Ventas</a>
                </li>
                <li class="nav-item">
                    <a href="/compras" class="nav-link link-light">Mis Compras</a>
                </li>
                <li class="nav-item">
                    <a href="/cuenta" class="nav-link link-light">Mi Cuenta</a>
                </li>
                <li class="nav-item">
                    <a href="/ml/importar" class="nav-link link-light">Importar desde Mercadolibre</a>
                </li>
                <li class="nav-item">
                    <a href="/reportar-incidencia" class="nav-link link-light">Reportar un Problema</a>
                </li>
            </ul>
        <hr class="my-5 bg-light">
        @endif
        <ul class="nav flex-column">
            <li class="nav-item">
                <a href="/todas-las-categorias" class="nav-link link-light">Categorías</a>
            </li>
            <li class="nav-item">
                <a href="/contratar/servicios" class="nav-link link-light">Servicios</a>
            </li>
            <li class="nav-item">
                <a href="/buenos-precios" class="nav-link link-light">Promociones</a>
            </li>
            <li class="nav-item">
                <a href="/tiendas-digitales" class="nav-link link-light">Tiendas</a>
            </li>
        </ul>
    </div>
  </amp-sidebar>

  <!-- ## Header with Search -->
  <div class="header">
    <a id="sample-menu" on="tap:drawermenu.toggle">
      <amp-img srcset="/img/ic_menu_white_1x_web_24dp.png 1x, /img/ic_menu_white_2x_web_24dp.png 2x" width="24" height="24" alt="navigation"></amp-img>
    </a>
    <form method="GET" action="/search" target="_top">
      <input name="data" type="search" placeholder="Buscar">
      <a id="sample-logo" href="/">
        <amp-img src="/storage/{{Voyager::setting('site.logo')}}" width="204" height="36"  alt="Ventas Tucuman"></amp-img>
      </a>
      <input type="submit" value="">
    </form>
  </div>

  <main  class="" style="padding: 11px;">
<h1 class="m1">{{$post->title}}</h1>

<!-- ## Social Sharing -->
<div class="m1">
    <amp-social-share type="twitter" width="30" height="22"></amp-social-share>
    <amp-social-share type="facebook" width="30" height="22" data-attribution="200538640664258"></amp-social-share>
    <amp-social-share type="whatsapp" width="30" height="22" ></amp-social-share>
</div>

<!-- ## Image Gallery -->
<div class="product-gallery " style="    margin-bottom: 15px;">
    <amp-carousel width="400" height="300" layout="responsive" autoplay delay="2000" type="slides" role="region" aria-label="type='slides' carousel">
        @foreach($imagenes as  $imagen)
        <amp-img src="{{Voyager::get_image($imagen->imagen, NULL, $imagen->storage)}}" width="400" height="300" layout="responsive" alt="a sample image"></amp-img>
        @endforeach
    </amp-carousel>
</div>
<!-- ## Product price -->
<p class="price-description">Precio:
    <span [text]="product[product.selectedColor].sizes[product.selectedSize]"> @if($post->precios == 1 or $post->precios == 0) PRECIO A CONVENIR @else ARS ${{$post->precios}} @endif</span>
</p>
<!-- ## Store -->
<div class="container-fluid    rounded bg-white">
    @if($tienda)
        <div class="align-items-center" style="  margin-bottom: px; display: flex; ">
            <div class="col-3 col-sm-2 col-lg-3">
                <a href="/comercio/{{str_slug($tienda->titulo, '-')}}/{{$tienda->id}}">
                    <amp-img src="{{Voyager::get_image($tienda->logo, 'cropped', 'storage')}}" class="rounded-circle shadow img-fluid" width="400" height="400" layout="responsive" alt="{{$tienda->titulo, 25}}"></amp-img>
                </a>
            </div>
            <div class="col-9 col-sm-10 col-lg-9">
                <a href="/comercio/{{str_slug($tienda->titulo, '-')}}/{{$tienda->id}}" class="custom-link link-secondary">
                    <h4 class="section__lead h6 text-truncate">{{$tienda->titulo, 25}}</h4>
                </a>
            </div>
        </div>
        <hr style=" margin-bottom: 15px;">
    @endif

    <h6 style="font-size: 1rem;margin: 8px;">Información del vendedor:</h6>
    @if($post->provincia)
    <div class="d-block rounded-pill bg-light border border-gray h6 fw-bold px-3 py-2" style="margin-bottom: 7px;">
        <i class="fas fa-map-marker-alt"></i>
        {{$post->provincia}}, {{$post->localidad}}
    </div>
    @endif
    @if(!is_null($post->telefono))
        <div class="d-block rounded-pill bg-light border border-gray h6 fw-bold px-3 py-2">
            <a><i class="fas fa-phone-alt"></i>
            {{$post->telefono}}</a>
        </div>
    @endif

</div>



<form id="order" method="POST" action-xhr="#" target="_top" class="flex flex-wrap m1">
  @if($colores->count() !== 0)
    
    <div class="items-center flex">
      <label for="color">Colores:</label>
      <amp-selector name="color" layout="container" >
        <ul class="p0 m1">
          @foreach($colores as $colores)
            <?php
              $atributo_color = $colores->colores()->first();
            ?>
            <li>
                <div option="green" selected class="square " style="background-color: {{$atributo_color->color}};"></div>
            </li>
          @endforeach
        </ul>
      </amp-selector>
    </div>
    @endif
    @if($talles->count() !== 0)
    <div class="items-center flex">
      <label for="size">Talles:</label>
      <amp-selector name="size" layout="container">
        <ul class="p0 m1">
        @foreach($talles as $talles)
            @php
               $atributo_talle = $talles->talles()->first();
            @endphp
          <li option="{{$atributo_talle->talle}}" class="">{{$atributo_talle->talle}}</li>
        @endforeach
        </ul>
      </amp-selector>
    </div>
    @endif

</form>

  <!-- ## Tab panels -->
  <amp-selector role="tablist" style="    margin-top: 12px;" layout="container" class="ampTabContainer ampstart-headerbar-nav" keyboard-select-mode="select">
    <div role="tab" class="tabButton " style="font-size: 1rem;margin: 8px;    font-weight: 800;" selected option="a">Descripción de la publicación</div>
    <div role="tabpanel" class="tabContent p1 p">
        <ul class="list-group list-group-flush h5 mb-3">
            @if(!is_null($post->ma_name))
            <li class="list-group-item d-flex flex-column flex-md-row justify-content-between">
                <span class="text-muted fw-normal">Marca</span>
                <b>{{$post->ma_name}}</b>
            </li>
            @endif

            @if(!is_null($post->mo_name))
            <li class="list-group-item d-flex flex-column flex-md-row justify-content-between">
                <span class="text-muted fw-normal">Modelo</span>
                <b>{{$post->mo_name}}</b>
            </li>
            @endif
            @if(!is_null($post->category_id) && $post->category_id == 6)
            <?php $vehiculo =  $post->postsvehiculos()->first(); ?>

                @if(!is_null($vehiculo->tipos_vehiculos_id))
                    <?php $tipoVehiculos = $vehiculo->tiposvehiculos()->first(); ?>
                    <li class="list-group-item d-flex flex-column flex-md-row justify-content-between">
                        <span class="text-muted fw-normal">Tipo</span>
                        <b>{{$tipoVehiculos->name}}</b>
                    </li>
                @endif
                <li class="list-group-item d-flex flex-column flex-md-row justify-content-between">
                    <span class="text-muted fw-normal">Año</span>
                    <b>{{$vehiculo->anio}}</b>
                </li>
                <li class="list-group-item d-flex flex-column flex-md-row justify-content-between">
                    <span class="text-muted fw-normal">Kilometraje</span>
                    <b>{{$vehiculo->kilometros}}</b>
                </li>
                <li class="list-group-item d-flex flex-column flex-md-row justify-content-between">
                    <span class="text-muted fw-normal">Transmisión</span>
                    <b>{{$vehiculo->transmision}}</b>
                </li>
                @if(!is_null($vehiculo->colores_id))
                    <?php $color = $vehiculo->colores()->first(); ?>
                    <li class="list-group-item d-flex flex-column flex-md-row justify-content-between">
                        <span class="text-muted fw-normal">Color</span>
                        <b style="border: 1px solid {{$color->color}};">color</b>
                    </li>
                @endif
            @endif
        </ul>   
<!-- ## product description -->
    <p id="product-description" style="    word-break: break-all;" class="m1">
        @php
        $body = str_replace("\n", "<p>", $post->body);
        @endphp
        <p>{!! $body !!}</p>
    </p>             
    </div>
  </amp-selector>

  <!-- ## Dynamic Related Product Lists -->
  @if($simil->count()>0)
  <div class="items-center flex">
    <h2 id="related-products" class="m1 inline-block">Similares a -  {{$post->title}}</h2>
    <amp-carousel height="373" layout="fixed-height" type="carousel" role="region" aria-label="Basic usage carousel">
        @foreach($simil as $simils)
            <?php 
                $imgsimil = $simils->postimagenes()->limit(1)->first();
                $las_storage = NULL;
                $laspImg = NULL;
                if ($imgsimil) {
                    $laspImg = $imgsimil->imagen;
                    $las_storage = $imgsimil->storage;
                }
            ?>
            <a class="shadow" style="padding:10px;" href="/vtucuman-{{$simils->id}}/{{str_slug($simils->name,'-')}}/{{str_slug($simils->title)}}/amp" role="listitem">
                <amp-img src="{{voyager::get_image($laspImg,'small',$las_storage)}}" width="281" height="281" alt="{{$simils->title}}"></amp-img>
                <p style="color:#333;">{{str_limit($simils->title,25)}}</p>
                <p style="color:#333;"> ARS ${{$simils->precios}}</p>
            </a>
        @endforeach
    </amp-carousel>
  </div>
  @endif


  <amp-analytics type="googleanalytics">
    <script type="application/json">
      {
        "vars": {
          "account": "UA-69941808-9"
        },
        "triggers": {
          "default pageview": {
            "on": "visible",
            "request": "pageview",
            "vars": {
              "title": "{{$post->title}}"
            }
          }
        }
      }
    </script>
  </amp-analytics>
<script type='application/ld+json'> 
      {
        "@context": "http://www.schema.org",
        "@type": "product",
        "sku": "{{rand(0,200)}}{{$post->id}}{{str_slug($post->categoryId,'-')}}",
        "mpn": "{{rand(0,200)}}{{$post->id}}{{str_slug($post->categoryId,'-')}}",
        "brand":{
          "@type": "Brand",
          "name": @if(!is_null($post->ma_name))"{{$post->ma_name}}" @else "Ventas Tucumán" @endif
        },
        "name": "{{$post->title}}",
        @if($imagenes->count() > 0) "image": @if($imagen->storage !='online') "https://www.ventastucuman.com/storage/{{$imagen->imagen}}" @else "{{$imagen->imagen}}" @endif , @endif
        "description": "{{str_replace('-', '',  str_limit($post->body, 130))}}",
        "aggregateRating": {
          "@type": "aggregateRating",
          "ratingValue": "5.0",
          "reviewCount": "{{$cant_visitas}}"
        },

        "review": {
          "@type": "Review",
          "reviewRating": {
            "@type": "Rating",
            "ratingValue": "4",
            "bestRating": "5"
          },
          "author": {
            "@type": "Person",
            "name": "{{$post->name}}"
          }

          },
        "offers": {
          "@type": "Offer",
          "url": "https://www.ventastucuman.com/vtucuman-{{$post->id}}/{{(str_slug($post->category_name,'-'))}}/{{str_slug($post->title)}}",
          "priceCurrency": "ARS",
          "price": "{{$post->precios}}",
          "priceValidUntil": "{{$post->created_at->format("Y-m-d")}}",
          "itemCondition": "https://www.ventastucuman.com/nota/2/condiciones-de-uso-online",
          "availability": "InStock",
          "seller": {
            "@type": "Organization",
            "name": "Ventas Tucuman"
          }
        }
      }
  </script>
</main>

<footer class="bg-dark text-light">
    <div class="container py-6">
        <div class="row gy-5 justify-content-center">
            <div class="col-12 col-md-6 col-lg-3">
                <figure>
                    <amp-img src="/storage/{{Voyager::setting('site.lf')}}"  width="334" height="64" layout="responsive" alt="Ventas Tucuman"></amp-img>
                </figure>

                <hr >

                <h4 class="text-center lead mb-5">Seguinos en nuestras redes sociales</h4>

                <div class="d-flex justify-content-evenly">
                    <a href="https://www.facebook.com/ventastucuman93" target="_blank" class="link-light">
                        <i class="fab fa-2x fa-facebook-square"></i>
                    </a>
                    <a href="https://twitter.com/ventas_tucuman" target="_blank" class="link-light">
                        <i class="fab fa-2x fa-twitter"></i>
                    </a>
                    <a href="https://www.instagram.com/ventastucuman.20" target="_blank" class="link-light">
                        <i class="fab fa-2x fa-instagram"></i>
                    </a>
                </div>
            </div>
            <div class="col-12 col-lg-3">
                <h4 class="text-center text-primary">Ventas Tucumán</h4>
                <ul class="nav flex-column text-center">
                    <li class="nav-item">
                        <a href="/auth/user/login" class="nav-link link-light">Ingresar</a>
                    </li>
                    <li class="nav-item">
                        <a href="/auth/user/register" class="nav-link link-light">Registrarse</a>
                    </li>
                    <li class="nav-item">
                        <a href="/contacto" class="nav-link link-light">Contacto</a>
                    </li>
                    <li class="nav-item">
                        <a href="/novedades" class="nav-link link-light">Novedades</a>
                    </li>
                </ul>
            </div>
            <div class="col-12 col-lg-3">
                <h4 class="text-center text-primary">¿Cómo trabajamos?</h4>

                <ul class="nav flex-column text-center">
                    <li class="nav-item">
                        <a href="/nota/1/condiciones-de-uso-online" class="nav-link link-light">Términos y Condiciones</a>
                    </li>
                    <li class="nav-item">
                        <a href="/nota/2/politica-de-privacidad" class="nav-link link-light">Politicas de Privacidad</a>
                    </li>
                </ul>
            </div>
      
        </div>
    </div>
    <div class="p-3 bg-black text-light">
        <h6 class="text-center m-0">Marketplace desarrollado por <a href="https://www.idedicado.com.ar/" target="_blank">Idedicado - Expertos en Tecnología Web</a></h6>
    </div>
</footer>
</body>
</html>