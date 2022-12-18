<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ArisLogCtrl;
use App\Http\Controllers\ArisMain;
use App\Http\Controllers\MasterUser;
use App\Http\Controllers\MasterSiswa;
use App\Http\Controllers\MasterTagihan;
use App\Http\Controllers\MasterPembayaran;
use App\Http\Controllers\SiswaMain;


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

Route::get('/welcome', function(){
  return view('welcome');
});
Route::get('/register',[ArisLogCtrl::class, 'r'])->name('register');
Route::get('/login',[ArisLogCtrl::class, 'v'])->name('login');
Route::post('/login',[ArisLogCtrl::class, 'a'])->name('login');
Route::post('/logout',[ArisLogCtrl::class, 'l'])->name('logout');
Route::post('/user/ca/{u}', [ArisMain::class, 'ca'])->name('user.ca');
Route::post('/user/cpass/{u}', [ArisMain::class, 'cpass'])->name('user.cpass');
Route::get('/', [ArisMain::class, 'home'])->name('home');
Route::get('/download', [ArisMain::class, 'download'])->name('download');
Route::get('/user', [ArisMain::class, 'user'])->name('user');
Route::get('/siswa', [ArisMain::class, 'siswa'])->name('siswa');
Route::get('/tagihan', [ArisMain::class, 'tagihan'])->name('tagihan');
Route::get('/pembayaran', [ArisMain::class, 'pembayaran'])->name('pembayaran');
Route::post('/user/add', [MasterUser::class, 'add'])->name('user.add');
Route::post('/user/data/{u}', [MasterUser::class, 'data'])->name('user.data');
Route::post('/user/del/{u}', [MasterUser::class, 'del'])->name('user.del');
Route::post('/user/edit', [MasterUser::class, 'edit'])->name('user.edit');
Route::post('/siswa/add', [MasterSiswa::class, 'add'])->name('siswa.add');
Route::post('/siswa/data/{s}', [MasterSiswa::class, 'data'])->name('siswa.data');
Route::post('/siswa/edit', [MasterSiswa::class, 'edit'])->name('siswa.edit');
Route::post('/tagihan/add', [MasterTagihan::class, 'add'])->name('tagihan.add');
Route::post('/pembayaran/add', [MasterPembayaran::class, 'add'])->name('pembayaran.add');
Route::get('/login-siswa',[SiswaMain::class, 'login'])->name('login.siswa');
Route::post('/home-siswa',[SiswaMain::class, 'home'])->name('home.siswa');