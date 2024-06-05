<?php

use Illuminate\Http\Request;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ProductController;

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

//Category Routes
Route::apiResource('categories', 'CategoryController');

// Product Routes
Route::apiResource('products', 'ProductController');
Route::post('products/update/{id}', [ProductController::class, 'updateProduct'])->name('products.images.update');






