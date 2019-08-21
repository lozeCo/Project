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


//japhom rutas
Route::any('tickets/{fecha}','ticketController@index');

Route::post('nuevaCorrida/{fecha}','ticketController@nuevaCorrida');
Route::post('nuevaCorrida/{fecha}/{rta}','ticketController@nuevaCorrida');
Route::post('nuevaCorrida/{fecha}/{rta}/{vhc}','ticketController@nuevaCorrida');

Route::post('storeTicket/{icr}/{client}/{sit}','ticketController@storeSit');

Route::any('vehiculos','ticketController@getVehiculos');
Route::any('rutas','ticketController@getRutas');
