  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Dashboard</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a></li>
              <li class="breadcrumb-item active">Data Siswa</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">
                  <button class="btn btn-primary @if(Auth::user()->level > 1) disabled @endif" type="button" data-toggle="modal" data-target="#tambah">Tambah</button>
                </h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table class="table table-bordered table-hover aris-table">
                  <thead>
                  <tr>
                    <th>Nama</th>
                    <th>NISN</th>
                    <th>Alamat</th>
                    <th>Telp</th>
                    <th>Tahun Daftar</th>
                    <th>Tahun Lulus</th>
                    <th>Kekurangan</th>
                    <th>Pilihan</th>
                  </tr>
                  </thead>
                  <tbody>
                    @foreach($data as $o)
                    <tr>
                      <td>{{ $o->nama }}</td>
                      <td>{{ $o->nisn }}</td>
                      <td>{{ $o->alamat }}</td>
                      <td>{{ $o->telp }}</td>
                      <td>{{ $o->daftar }}</td>
                      <td>{{ $o->lulus }}</td>
                      <td><?php
                        if($o->lulus == "-"){
                          $tagihan = DB::table('tagihan')->where('tahun', '>=', $o->daftar)->sum('nominal');
                        }else{
                          $tagihan = DB::table('tagihan')->where('tahun', '>=', $o->daftar)->where('tahun', '<', $o->lulus)->sum('nominal');
                        }
                        $pembayaran = DB::table('pembayaran')->where('siswa', $o->id)->sum('nominal');
                        $kekurangan = $tagihan - $pembayaran;
                        echo number_format($kekurangan, 0, ',', '.').";-";
                      ?></td>
                      <td>
                        <button class="btn btn-success @if(Auth::user()->level > 1) disabled @endif" data-link="{{ route($view.'.data', $o->id) }}" onclick="edit(this)">Edit</button>
                      </td>
                    </tr>
                    @endforeach
                  </tbody>
                  <tfoot>
                  <tr>
                    <th>Nama</th>
                    <th>NISN</th>
                    <th>Alamat</th>
                    <th>Telp</th>
                    <th>Tahun Daftar</th>
                    <th>Tahun Lulus</th>
                    <th>Kekurangan</th>
                    <th>Pilihan</th>
                  </tr>
                  </tfoot>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- ./col -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
    <div class="modal fade" id="tambah" tabindex="-1" aria-hidden="true" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content bg-dark text-white">
              <form action="{{ route($view.'.add') }}" method="post">
                <div class="modal-header">
                    @csrf
                    <h5 class="modal-title">Tambah Data</h5>
                    <button class="btn-close btn-close-white" data-dismiss="modal" role="button"
                        aria-label="close"></button>
                </div>
                <div class="modal-body">
                  <div class="form-group">
                    <label for="nama">Nama</label>
                    <input class="form-control" id="nama" name="nama" placeholder="Masukkan Nama">
                  </div>
                  <div class="form-group">
                    <label for="nisn">NISN</label>
                    <input class="form-control" id="nisn" name="nisn" placeholder="Masukkan NISN">
                  </div>
                  <div class="form-group">
                    <label for="alamat">Alamat</label>
                    <input class="form-control" id="alamat" name="alamat" placeholder="Masukkan Alamat">
                  </div>
                  <div class="form-group">
                    <label for="telp">Nomor Telepon</label>
                    <input class="form-control" id="telp" name="telp" placeholder="Masukkan Nomor Telepon">
                  </div>
                  <div class="form-group">
                    <label for="daftar">Tahun Daftar</label>
                    <input class="form-control" id="daftar" name="daftar" type="number" placeholder="Masukkan Tahun Daftar">
                  </div>
                  <div class="form-group">
                    <label for="lulus">Tahun Lulus (Default: -)</label>
                    <input class="form-control" id="lulus" name="lulus" placeholder="Masukkan Tahun Lulus" value="-">
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
    <div class="modal fade" id="editModal" tabindex="-1" aria-hidden="true" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content bg-dark text-white">
              <form action="{{ route($view.'.edit') }}" method="post">
                <div class="modal-header">
                    <h5 class="modal-title">Edit Data</h5>
                    <button class="btn-close btn-close-white" data-dismiss="modal" role="button"
                        aria-label="close"></button>
                </div>
                <div class="modal-body">
                  @csrf
                  <input id="editid" name="id" style="display: none">
                  <div class="form-group">
                    <label for="editnama">Nama</label>
                    <input class="form-control" id="editnama" name="nama" placeholder="Masukkan Nama">
                  </div>
                  <div class="form-group">
                    <label for="editnisn">NISN</label>
                    <input class="form-control" id="editnisn" name="nisn" placeholder="Masukkan NISN">
                  </div>
                  <div class="form-group">
                    <label for="editalamat">Alamat</label>
                    <input class="form-control" id="editalamat" name="alamat" placeholder="Masukkan Alamat">
                  </div>
                  <div class="form-group">
                    <label for="edittelp">Nomor Telepon</label>
                    <input class="form-control" id="edittelp" name="telp" placeholder="Masukkan Nomor Telepon">
                  </div>
                  <div class="form-group">
                    <label for="editdaftar">Tahun Daftar</label>
                    <input class="form-control" id="editdaftar" name="daftar" type="number" placeholder="Masukkan Tahun Daftar">
                  </div>
                  <div class="form-group">
                    <label for="editlulus">Tahun Lulus</label>
                    <input class="form-control" id="editlulus" name="lulus" placeholder="Masukkan Tahun Lulus">
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