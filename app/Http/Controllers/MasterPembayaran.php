<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Models\Pembayaran;

class MasterPembayaran extends Controller
{
  public function add(Request $r){
    if(Auth::user()->level < 3){
      $code=0;
      
      $messages = [
        'required' => ':attribute tidak boleh kosong!'
      ];
        
      $r->validate([
        'siswa' => 'required',
        'nominal' => 'required'
      ], $messages);
          
      DB::statement("alter table pembayaran auto_increment = 1");
          
      if(Pembayaran::create([
        'siswa' => $r->siswa,
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
