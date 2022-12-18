<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use App\Models\Siswa;
use App\Models\Tagihan;
use App\Models\Pembayaran;

class ArisMain extends Controller
{
  public function home(){
    $view="home";
    if(Auth::check()){
      $user="user";
    }else{
      $user="guest";
    }
    return view('index',compact('user', 'view'));
  }
  public function download(){
    $view="index";
    $user="download";
    return view('index',compact('user', 'view'));
  }
  public function user(){
    $data=User::all();
    $view="user";
    if(Auth::check()){
      $user="user";
    }else{
      $user="guest";
      $view="home";
    }
    return view('index',compact('data', 'user', 'view'));
  }
  public function siswa(){
    $data=Siswa::all();
    $view="siswa";
    if(Auth::check()){
      $user="user";
    }else{
      $user="guest";
      $view="home";
    }
    return view('index',compact('data', 'user', 'view'));
  }
  public function tagihan(){
    $data=Tagihan::all();
    $view="tagihan";
    if(Auth::check()){
      $user="user";
    }else{
      $user="guest";
      $view="home";
    }
    return view('index',compact('data', 'user', 'view'));
  }
  public function pembayaran(){
    $data=Pembayaran::select('pembayaran.*', 'siswa.nama', 'siswa.nisn', 'siswa.telp')->join('siswa', 'pembayaran.siswa', '=', 'siswa.id')->get();
    $option=Siswa::where('lulus', '-')->get();
    $view="pembayaran";
    if(Auth::check()){
      $user="user";
    }else{
      $user="guest";
      $view="home";
    }
    return view('index',compact('data', 'option', 'user', 'view'));
  }
  public function ca(Request $r, User $u){
    $code=0;
    
    $messages = [
      'required' => ':attribute tidak boleh kosong!',
      'max' => ':attribute maksimal :max karakter'
    ];
      
    $r->validate([
      'name' => 'required|max:17',
      'email' => 'required'
    ], $messages);
        
        if(Auth::user()->name !== "demo"){
          if($u->update([
            'name' => $r->name,
            'email' => $r->email
            ])){
              $code=1;
              $alert="Data berhasil diubah";
            }else{
              $alert="Perubahan data tidak tersimpan";
            }
        }else{
          $alert="User demo tidak bisa diganti!";
        }
    return back()->with("alert", $alert)->with("code", $code);
  }
  public function cpass(Request $r, User $u){
    $code=0;
    if(Auth::user()->name !== "demo"){
      if(Hash::check($r->oldpass, $u->password)){
        if($r->password == $r->konfirmasi){
          if($u->update([
            'password' => Hash::make($r->password),
            ])){
              $code=1;
              $alert="Password berhasil diubah";
            }else{
              $alert="Perubahan tidak tersimpan!";
            }
        }else{
          $alert="Password dan konfirmasinya tidak sesuai!";
        }
      }else{
        $alert="Password lama Anda salah!";
      }
    }else{
      $alert="Password user demo tidak bisa diganti!";
    }
    return back()->with("alert", $alert)->with("code", $code);
  }
}
