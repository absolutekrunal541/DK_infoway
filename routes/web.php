<?php

use App\Http\Controllers\StockController;
use Illuminate\Support\Facades\Route;

Route::prefix('/stock')->group(
    function () {
        Route::get('/list', function () {
            return view('stock.list');
        })->name('stock.list');

        Route::get('/add', [StockController::class, 'add'])->name('stock.add');
    }
);

Route::get('/login', function () {
    return view('auth.login');
})->name('auth.login');

Route::get('/', function () {
    return redirect()->route('auth.login');
});
