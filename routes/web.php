<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;


//Route crontab
Route::get('deleteoldcarts', 'CarritosFunctionsController@deleteold');
Route::get('cart-notif', 'CarritosFunctionsController@cartnotif');

//End


/*Habilitar solo para prueba
Route::get("testing", "TestingController@testing");*/


Route::get('/', 'HomeController@index');

Route::get('sitemapxml', 'HomeController@generatesitemap');

//Route::get('novedades', "NotaController@index");

Route::get('auth/validate_account/{email}/{token}', 'Auth\UserController@validate_account');
Route::get('validate/{status}', 'Auth\UserController@validateAccount');
Route::get('/home', 'HomeController@index')->name('home');
Route::get('lista-localidades', ['uses' => 'HomeController@listaLocalidades']);
Route::get('search', 'HomeController@search');
Route::get('filtro-search', 'SearchfiltroController@create');
Route::get('load_search', 'HomeController@search');
Route::get('drop_filtro', 'SearchfiltroController@drop_filtro');
Route::get('categoria/{id}/{slug}', 'CategoryController@index');
Route::get('filtro-category', 'SearchfiltroController@create');
//Route::get('contratar/servicios', 'ServiciosController@index');
/*Route::get('promociones', 'HomeController@buenosprecios');
Route::get("/promociones/{condicion}/{category_id}/{orden}", 'HomeController@buenosprecios');
Route::get("/promociones/condicion/{condicion}", 'HomeController@buenosprecios');
Route::get("/promociones/categoria/{category_id}", 'HomeController@buenosprecios');
Route::get("/promociones/orden/{orden}", 'HomeController@buenosprecios');
Route::get("/promociones/condicion-{condicion}/category-{category_id}", 'HomeController@buenosprecios');
Route::get("/promociones/condicion-{condicion}/orden-{orden}", 'HomeController@buenosprecios');
Route::get("/promociones/orden-{orden}/category-{category_id}", 'HomeController@buenosprecios');
*/
//Route::get('tiendas-digitales', 'ComerciosTiendasController@index');

Route::get('contacto','HomeController@contacto');
Route::post('form-contacto','HomeController@fomcontacto');

Route::get('publicacion/{cat_name}/{title}/{id}', 'PostController@show');
/*
Route::get("/servicios/{name}/{category_id}/{orden}", 'ServiciosController@index');
Route::get("/servicios/name/{name}", 'ServiciosController@index');
Route::get("/servicios/categoria/{category_id}", 'ServiciosController@index');
Route::get("/servicios/orden/{orden}", 'ServiciosController@index');
Route::get("/servicios/name-{name}/category-{category_id}", 'ServiciosController@index');
Route::get("/servicios/name-{name}/orden-{orden}", 'ServiciosController@index');
Route::get("/servicios/orden-{orden}/category-{category_id}", 'ServiciosController@index');
*/
//Route::get('tienda/{name}/{id}', 'ComerciosTiendasController@show');


//Route::get('ayuda-y-soporte', 'LandingController@ayudaysoporte');
//Route::get('publicacion-de-avisos-gratis', 'LandingController@publicagratis');
Route::get('nota/{slug}/{id}', 'NotaController@show');
//Route::post('reportaraviso', 'PostController@reportes');
Route::get('todas-las-categorias', 'CategoryController@all');

//Carrito publico
Route::get('compartir/{carrito_id}/pedido','SharedController@compartir_pedido');


Route::group(['middleware' => 'auth'], function() {
	Route::get('logout', ['uses' => 'Auth\LoginController@logout']);
	Route::get('dashboard','Auth\UserController@dashboard');
	//Route::get('ventas', 'Auth\PostController@ventas');
	//Route::get('vender', 'Auth\PostController@vender');
	//Route::post('get-subcategory', 'Auth\PostController@lista_subcategoria');
	//Route::get('get-tipos-vehiculos', 'Auth\PostController@tiposvehiculos');
	//Route::post('store_ventas', 'Auth\PostController@store');
	//Route::post('lista_marca', 'Auth\PostController@lista_marca');
	//Route::post('getAtributos', 'Auth\PostController@getAtributos'); 
	//Route::post('lista_modelos', 'Auth\PostController@lista_modelos');
	//Route::get('change_status/{id}/{status}', 'Auth\PostController@change_status');
	//Route::get('deletepublication/{post_id}', 'Auth\PostController@detroy');
	//Route::get('publicacion/{post_id}/atributos', 'Auth\PostController@publicacionAtributos');
	//Route::get('quitAtributo', 'Auth\PostController@quitAtributo');
	//Route::get('publicacion/edit/{id}/{title}', 'Auth\PostController@edit');
	///Route::post('update_ventas/{publicacion_id}', 'Auth\PostController@update');
	//Route::get('delete_image', 'Auth\PostController@delete_image');
	//Route::get('servicios', 'Auth\ServiciosController@index');
	//Route::post('addservice', 'Auth\ServiciosController@store'); //Create a Service
	//Route::get('servicios/{id}/editar', 'Auth\ServiciosController@edit');
	//Route::post('servicios/{id}/update', 'Auth\ServiciosController@update'); //Update Service
	//Route::get('/servicios/status', 'Auth\ServiciosController@status'); //Update Service
	//Route::get('autoload_servicios', 'Auth\ServiciosController@autoload_servicios');
	//Route::get('ml/importar', 'Auth\MlController@index');
	//Route::get('ml/auth', 'Auth\MlController@authmla');
	///Route::get('ml/auth/ancle', 'Auth\MlController@meliAncleauth');
	//Route::post('ml/import_items', 'Auth\MlController@import_items');
	//Route::get('comercio', 'Auth\ComerciosController@index');
	//Route::post('tienda-status/{id}/{status}', 'Auth\ComerciosController@status');
	//Route::get('tiendas/nuevo', 'Auth\ComerciosController@create');
	//Route::get('tienda-edit/{id}/{titulo}', 'Auth\ComerciosController@edit');
	//Route::post('tienda_store_update', 'Auth\ComerciosController@store');
	Route::get('cuenta', 'Auth\UserController@index');
	//Route::post('user_profile','Auth\UserController@user_profile');
	//Route::get('deleteUserImg', 'Auth\UserController@deleteUserImage');
	Route::post('user_edit', 'Auth\UserController@edit');
	//Route::get('interesados', 'Auth\InteresadosController@index');
	//Route::get('reportar-incidencia', 'Auth\IncidenciasController@index');
	//Route::post('store_incidencia', 'Auth\IncidenciasController@store');
	//Route::post('interesados-consultas','InteresadosController@store');
	//Route::get('autload-consultas/{pubId}','InteresadosController@autoload');
	//Route::post('interesados-answered','Auth\InteresadosController@answered');
	Route::post('select-post-atribute', 'Auth\CarritoController@selectpostAtribute');

	
	#Payment proccess
	Route::get('/checkout/pre-payment', 'Auth\PaymentController@checkout');
	Route::get("payment-success", 'Auth\PaymentController@events');
	Route::get("payment-pending", 'Auth\PaymentController@events');
	Route::get("payment-failure", 'Auth\PaymentController@failure');
	Route::get("diff/{status}", 'Auth\PaymentController@diff');
	Route::post('/payment', 'Auth\PaymentController@payment');
	Route::get('/detail/{payment_id}/{ref_id}', 'Auth\UserController@detail');


	#Carrito de compras
	Route::post('addtoCart', 'Auth\CarritoController@addtoCart');
	Route::get('carrito', 'Auth\CarritoController@index');
	Route::get('carrito-update-quantity/{cantidad}/{item_id}','Auth\CarritoController@update_cantidad');
	Route::get('carrito-items-{id}-delete','Auth\CarritoController@delete');


	Route::get('/compras', 'Auth\UserController@compras');
	//Route::get('/mis-ventas', 'Auth\UserController@ventas');
	Route::get('/detail-sales/{payment_id}/{ref_id}', 'Auth\UserController@detailseller');
	//Route::post('contact_seller', 'PostController@contact_seller');
	//Route::get('/ml/morepublication/{scroll_id}','Auth\MlController@morepublication');
	//Route::get('user/configuracion','Auth\UserController@conf');
	//Route::post('user/conf-store','Auth\UserController@confstore');
	//Route::get('user/renew/comercial', 'Auth\UserController@renewcomercial');

	Route::get('first','Auth\UserController@first');
	//Route::get('deletestore/{id}/trash', 'Auth\ComerciosController@delete');
	Route::get("validateUser","Auth\UserController@emailvalidate");

	Route::group(['prefix' => 'admin'], function () {
	    Voyager::routes();
	});

});

Route::group(['prefix' => 'auth'], function () {
	//Route::get('{provider}', 'Auth\LoginController@redirectToProvider') ;
	//Route::get('{provider}/callback', 'Auth\LoginController@handleProviderCallback');
	Route::post('login', 'Auth\LoginController@login');
	Route::get('user/login', 'Auth\LoginController@ingresar');
	Route::get('user/register', 'Auth\RegisterController@showRegistrationForm');
});

//Route::post("ipn", "Auth\PaymentController@ipn");
Auth::routes();

