<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Models\Siswa;

class MasterSiswa extends Controller
{
  public function add(Request $r){
    if(Auth::user()->level < 2){
      $code=0;
      
      $messages = [
        'required' => ':attribute tidak boleh kosong!',
        'min' => ':attribute minimal :min karakter!',
        'unique' => ':attribute sudah digunakan!',
        'max' => ':attribute maksimal :max karakter'
      ];
        
      $r->validate([
        'nama' => 'required|max:25',
        'nisn' => 'required|min:10|max:10',
        'alamat' => 'required',
        'telp' => 'required|min:11|max:19',
        'daftar' => 'required|min:4|max:4',
        'lulus' => 'required'
      ], $messages);
          
      DB::statement("alter table siswa auto_increment = 1");
          
      if(Siswa::create([
        'nama' => $r->nama,
        'nisn' => $r->nisn,
        'alamat' => $r->alamat,
        'telp' => $r->telp,
        'daftar' => $r->daftar,
        'lulus' => $r->lulus
      ])) {
        $code=1;
        $alert="Data berhasil ditambahkan";
      }else{
        $alert="Data gagal ditambahkan";
      }
    }else{
      $alert="Mau ngapain hayoo... wkwkwk";
    }
    return back()->with("alert", $alert)->with("code", $code);
  }
  public function data(Siswa $s){
    return $s;
  }
  public function edit(Request $r){
    if(Auth::user()->level < 2){
      $code=0;
      
      $messages = [
        'required' => ':attribute tidak boleh kosong!',
        'min' => ':attribute minimal :min karakter!',
        'max' => ':attribute maksimal :max karakter'
      ];
        
      $r->validate([
        'id' => 'required',
        'nama' => 'required|max:25',
        'nisn' => 'required',
        'alamat' => 'required',
        'telp' => 'required|min:11|max:19',
        'daftar' => 'required',
        'lulus' => 'required'
      ], $messages);
          
      if(Siswa::find($r->id)->update([
        'nama' => $r->nama,
        'nisn' => $r->nisn,
        'alamat' => $r->alamat,
        'telp' => $r->telp,
        'daftar' => $r->daftar,
        'lulus' => $r->lulus
      ])) {
        $code=1;
        $alert="Data berhasil diubah";
      }else{
        $alert="Perubahan tidak tersimpan!";
      }
    }else{
      $alert="Mau ngapain hayoo... wkwkwk";
    }
    return back()->with("alert", $alert)->with("code", $code);
  }
}
