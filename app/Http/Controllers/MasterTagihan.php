<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Models\Tagihan;

class MasterTagihan extends Controller
{
  public function add(Request $r){
    if(Auth::user()->level < 2){
      $code=0;
      
      $messages = [
        'required' => ':attribute tidak boleh kosong!',
        'min' => ':attribute minimal :min karakter!',
        'max' => ':attribute maksimal :max karakter'
      ];
        
      $r->validate([
        'nama' => 'required|max:25',
        'tahun' => 'required|min:4|max:4',
        'nominal' => 'required'
      ], $messages);
          
      DB::statement("alter table tagihan auto_increment = 1");
          
      if(Tagihan::create([
        'nama' => $r->nama,
        'tahun' => $r->tahun,
        'nominal' => $r->nominal
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
}
