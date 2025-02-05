<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\StockController;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::post('/login-user', [LoginController::class, 'index']);


Route::middleware(['auth:sanctum'])->group(function () {
    Route::get('/stock-list', [StockController::class, 'index']);
    Route::post('/stock-save', [StockController::class, 'store']);
    Route::delete('/stock-delete/{id}', [StockController::class, 'destroy']);

    Route::get('/logout', [LoginController::class, 'logout']);
});
