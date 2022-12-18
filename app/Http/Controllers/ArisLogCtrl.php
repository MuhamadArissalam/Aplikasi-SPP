<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ArisLogCtrl extends Controller
{
  public function a(Request $r){
    $c = $r->validate([
      'email' => ['required', 'email'],
      'password' => ['required'],
      ]);
      if(Auth::attempt($c)){
        $r->session()->regenerate();
        return redirect()->route('home');
      }
      return back()->with([
        'error' => 'Authentication Error or Account does not match with our records',
        ]);
  }
  public function l(Request $r){
    Auth::logout();
    if(!$r->session==null){
      $r->session->invalidate();
      $r->session->regenerateToken();
    }
    return redirect()->route('home');
  }
  public function r(){
    return view('auth.register');
  }
  public function v(){
    return view('auth.login');
  }
}
