<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use App\Models\User;

class MasterUser extends Controller
{
  public function add(Request $r){
    $code=0;
    
    $messages = [
      'required' => ':attribute tidak boleh kosong!',
      'min' => ':attribute minimal :min karakter!',
      'unique' => ':attribute sudah digunakan!',
      'max' => ':attribute maksimal :max karakter'
    ];
    $r->validate([
      'nama' => 'required|max:17',
      'email' => 'required|unique:users',
      'password' => 'required|min:8'
    ], $messages);
    if($r->konfirmasi == $r->password){
      DB::statement("alter table users auto_increment = 1");
      if(User::create([
        'name' => $r->nama,
        'email' => $r->email,
        'password' => Hash::make($r->password)
      ])) {
        $code=1;
        $alert="Data berhasil ditambahkan";
      }else{
        $alert="Data gagal ditambahkan";
      }
    }else{
      $alert="Password dan konfirmasinya tidak sesuai!";
    }
    return redirect()->route('login')->with("alert", $alert)->with("code", $code);
  }
  public function data(User $u){
    return $u;
  }
  public function del(User $u){
    if(Auth::user()->level < 2){
      $code=0;
      if($u->delete()) {
        $code=1;
        $alert="Data berhasil dihapus";
      }else{
        $alert="Data tidak terhapus!";
      }
    }else{
      $alert="Mau ngapain hayoo... wkwkwk";
    }
    return back()->with("alert", $alert)->with("code", $code);
  }
  public function edit(Request $r){
    if(Auth::user()->level < 2){
      $code=0;
      $messages = [
        'required' => ':attribute tidak boleh kosong!'
      ];
      $r->validate([
        'id' => 'required',
        'level' => 'required'
      ], $messages);
      if(User::find($r->id)->update([
        'level' => $r->level
      ])){
        $code=1;
        $alert="Data berhasil diubah";
      }else{
        $alert="Perubahan data tidak tersimpan";
      }
    }else{
      $alert="Mau ngapain hayoo... wkwkwk";
    }
    return back()->with("alert", $alert)->with("code", $code);
  }
}
