<?php

use App\Http\Controllers\HomeController;
use App\Http\Controllers\LeadsController;
use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

/* Route::get('/dashboard', function () { */
/*     return view('dashboard'); */
/* })->middleware(['auth', 'verified'])->name('dashboard'); */

Route::get('/home',[HomeController::class, 'home'])->middleware('auth')->name('home');

Route::get('create',[LeadsController::class, 'create'])->middleware('auth')->name('create');

Route::post('store',[LeadsController::class, 'store'])->middleware('auth')->name('store');

Route::get('edit/{id}',[LeadsController::class, 'edit'])->middleware('auth')->name('edit');


Route::post('update',[LeadsController::class, 'update'])->middleware('auth')->name('update');

Route::get('delete/{id}',[LeadsController::class, 'delete'])->middleware('auth')->name('delete');

Route::get('status/{id}',[LeadsController::class, 'status'])->middleware('auth')->name('status');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
