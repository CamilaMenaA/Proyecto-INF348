<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\InstalationController;
use App\Http\Controllers\HistoryController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

// Instalation Routes
Route::get('/instalation/all',[InstalationController::class,'get_all']);
Route::get('/instalation/{id}/tipo/{tipo}',[InstalationController::class,'get_id']);
Route::delete('/instalation/{id}', [InstalationController::class,'delete_id']);
Route::post('/instalation/add',[InstalationController::class,'store']);
Route::put('/instalation/{id}',[InstalationController::class,'update']);

// History Routes
Route::get('/history/all',[HistoryController::class,'get_all']);
Route::get('/history/tipo/{tipo}/{id_eq}',[HistoryController::class,'get_equipo_asociado']);
Route::get('/history/detalles/{id_hist}',[HistoryController::class,'get_historial']);
Route::get('/history/{id}',[HistoryController::class,'get_historials_by_id']);
Route::post('/history/add',[HistoryController::class,'store']);