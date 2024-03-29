<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
// Route::middleware(['cors'])->get('/apiPagos/{use}/{password}', 'apiPagos@index');
Route::get('apiPagos/{use}/{password}', 'apiPagos@index');
Route::post('uploadFile','apiPagos@uploadFile');


//edgar
Route::get('/projects/{id?}', 'Project\ProjectController@show');
Route::post('/storeProject/','Project\ProjectController@store');



//japhom rutas

Route::any('tickets/{fecha}','ticketController@index');
Route::post('nuevaCorrida/{fecha}','ticketController@nuevaCorrida');
Route::post('nuevaCorrida/{fecha}/{rta}','ticketController@nuevaCorrida');
Route::post('nuevaCorrida/{fecha}/{rta}/{vhc}','ticketController@nuevaCorrida');
Route::post('storeTicket/{icr}/{client}/{sit}','ticketController@storeSit');
Route::post('storeTicketM/{icr}','ticketController@storeSit');
Route::post('cancelTicketM/{icr}','ticketController@cancelSit');
Route::any('vehiculos','ticketController@getVehiculos');
Route::any('rutas','ticketController@getRutas');
Route::any('rutasCheck/{fecha}','ticketController@getRutasCheckIn');
Route::any('rutasClientes/{crr_id}','ticketController@getClienteCorrida');
