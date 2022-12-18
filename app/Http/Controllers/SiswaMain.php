<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Siswa;
use App\Models\Pembayaran;

class SiswaMain extends Controller
{
  public function login(){
    return view('siswa.login');
  }
  public function home(Request $r){
    $messages = [
      'required' => ':attribute tidak boleh kosong!',
      'max' => ':attribute maksimal :max karakter',
      'min' => ':attribute minimal :min karakter'
    ];
    $r->validate([
      'nisn' => 'required|max:10|min:10'
    ], $messages);
    $data=Pembayaran::select('pembayaran.*', 'siswa.nama', 'siswa.nisn', 'siswa.telp')->join('siswa', 'pembayaran.siswa', '=', 'siswa.id')->where('siswa.nisn', '=', $r->nisn)->get();
    $siswa=Siswa::where('nisn', '=', $r->nisn)->first();
    $user="siswa";
    $view="home";
    return view('index',compact('data', 'siswa', 'user', 'view'));
  }
}
