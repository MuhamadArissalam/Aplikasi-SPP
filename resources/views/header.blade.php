<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Aplikasi SPP</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="/assets/adminlte/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="/assets/adminlte/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="/assets/adminlte/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="/assets/adminlte/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="/assets/adminlte/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="/assets/adminlte/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
  <link rel="stylesheet" href="/assets/adminlte/plugins/jqvmap/jqvmap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/assets/adminlte/dist/css/adminlte.min.css">
  <link rel="stylesheet" href="/assets/css/bootstrap.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="/assets/adminlte/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="/assets/adminlte/plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="/assets/adminlte/plugins/summernote/summernote-bs4.min.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
  
    <div class="modal fade" id="contact" tabindex="-1" aria-hidden="true" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content bg-dark text-white">
                <div class="modal-header">
                    <h5 class="modal-title">Tentang</h5>
                    <button class="btn-close btn-close-white" data-dismiss="modal" role="button"
                        aria-label="close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-4">
                            <img src="/image/aris.jpg" alt="Muhamad Arissalam" class="rounded-3 w-100">
                        </div>
                        <div class="col-8">
                            <h5 class="modal-title">Muhamad Arissalam</h5>
                            <p>Hanya seorang anak yang suka <em>Pemrograman</em> dan <em>Uji Keamanan</em></p>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <a class="btn btn-success" href="https://wa.me/6289524940588" target="_blank">
                        <i class="fa fa-whatsapp"></i>
                        WhatsApp
                    </a>
                    <a class="btn btn-primary" href="https://www.facebook.com/m.arissalam.12">
                        <i class="fa fa-facebook-f"></i>
                        Facebook
                    </a>
                </div>
            </div>
        </div>
    </div>
    @if(session('alert'))
    <div class="modal fade" id="alert" tabindex="-1" aria-hidden="true" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content bg-dark text-white">
                <div class="modal-header">
                    <h5 class="modal-title">@if(session('code') == 1) Berhasil @else Perhatian @endif</h5>
                    <button class="btn-close btn-close-white" data-dismiss="modal" role="button"
                        aria-label="close"></button>
                </div>
                <div class="modal-body">
                  <p>{{ session('alert') }}</p>
                </div>
                <div class="modal-footer">
                    <button class="btn @if(session('code') == 1) btn-primary @else btn-secondary @endif" data-dismiss="modal" role="button"
                        aria-label="close">OK</button>
                </div>
            </div>
        </div>
    </div>
    @endif
    @if(Auth::check())
    <div class="modal fade" id="editAkun" tabindex="-1" aria-hidden="true" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content bg-dark text-white">
              <form action="{{ route('user.ca', Auth::user()->id) }}" method="post">
                @csrf
                <div class="modal-header">
                    <h5 class="modal-title">Edit Data</h5>
                    <button class="btn-close btn-close-white" data-dismiss="modal" role="button"
                        aria-label="close"></button>
                </div>
                <div class="modal-body">
                  <div class="form-group">
                    <label for="cname">Nama</label>
                    <input id="cname" class="form-control" name="name" placeholder="Masukkan Nama" value="{{Auth::user()->name}}">
                  </div>
                  <div class="form-group">
                    <label for="cmail">Email</label>
                    <input type="email" class="form-control" id="cmail" name="email" placeholder="Masukkan Email" value="{{Auth::user()->email}}">
                  </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" data-dismiss="modal" role="button"
                        aria-label="close">Cancel</button>
                      
                    <button class="btn btn-primary" type="submit">Simpan</button>
                </div>
              </form>
            </div>
        </div>
    </div>
    <div class="modal fade" id="editPass" tabindex="-1" aria-hidden="true" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content bg-dark text-white">
              <form action="{{ route('user.cpass', Auth::user()->id) }}" method="post">
                @csrf
                <div class="modal-header">
                    <h5 class="modal-title">Edit Data</h5>
                    <button class="btn-close btn-close-white" data-dismiss="modal" role="button"
                        aria-label="close"></button>
                </div>
                <div class="modal-body">
                  <div class="form-group">
                    <label for="passlama">Password saat ini</label>
                    <input type="password" class="form-control" id="passlama" name="oldpass" placeholder="Masukkan password saat ini">
                  </div>
                  <div class="form-group">
                    <label for="passbaru">Password baru</label>
                    <input type="password" class="form-control" id="passbaru" name="password" placeholder="Masukkan password baru">
                  </div>
                  <div class="form-group">
                    <label for="passkonf">Konfirmasi password baru</label>
                    <input type="password" class="form-control" id="passkonf" name="konfirmasi" placeholder="Konfirmasi password baru">
                  </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" data-dismiss="modal" role="button"
                        aria-label="close">Cancel</button>
                      
                    <button class="btn btn-primary" type="submit">Simpan</button>
                </div>
              </form>
            </div>
        </div>
    </div>
    <div class="modal fade" id="logout" tabindex="-1" aria-hidden="true" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content bg-dark text-white">
                <div class="modal-header">
                    <h5 class="modal-title">Logout</h5>
                    <button class="btn-close btn-close-white" data-dismiss="modal" role="button"
                        aria-label="close"></button>
                </div>
                <div class="modal-body">
                  <p>Anda yakin ingin keluar?</p>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" data-dismiss="modal" role="button"
                        aria-label="close">Cancel</button>
                    <form action="{{ route('logout') }}" method="post">
                      @csrf
                      <button class="btn btn-danger" type="submit">Logout</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    @endif
  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Navbar Search -->
      <li class="nav-item">
        <a class="nav-link" data-widget="fullscreen" href="#" role="button">
          <i class="fas fa-expand-arrows-alt"></i>
        </a>
      </li>
      @if(Auth::check())
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" role="button" id="arisuser" aria-expanded="false">
          <i class="fas fa-user"></i>
        </a>
        <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="arisuser">
          <li>
            <a class="dropdown-item" href="#editAkun" data-toggle="modal" data-target="#editAkun" role="button">Edit Akun</a>
          </li>
          <li>
            <a class="dropdown-item" href="#editPass" data-toggle="modal" data-target="#editPass" role="button">Ubah Password</a>
          </li>
          <li>
            <a class="dropdown-item" href="#logout" data-toggle="modal" data-target="#logout" role="button">Logout</a>
          </li>
        </ul>
      </li>
      @else
      <li class="nav-item">
        <a class="nav-link" href="#contact" data-toggle="modal" data-target="#contact" role="button">
          <i class="fas fa-info-circle"></i>
        </a>
      </li>
      @endif
    </ul>
  </nav>
  <!-- /.navbar -->
  @include('sidebar')