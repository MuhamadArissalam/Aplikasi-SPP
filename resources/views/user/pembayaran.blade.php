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
              <li class="breadcrumb-item active">Data Pembayaran</li>
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
                  <button class="btn btn-primary @if(Auth::user()->level > 2) disabled @endif" type="button" data-toggle="modal" data-target="#tambah">Tambah</button>
                </h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table class="table table-bordered table-hover aris-table">
                  <thead>
                  <tr>
                    <th>Waktu Pembayaran</th>
                    <th>Nama Siswa</th>
                    <th>NISN</th>
                    <th>Telepon</th>
                    <th>Nominal</th>
                  </tr>
                  </thead>
                  <tbody>
                    @foreach($data as $o)
                    <tr>
                      <td>{{ $o->created_at }}</td>
                      <td>{{ $o->nama }}</td>
                      <td>{{ $o->nisn }}</td>
                      <td>{{ $o->telp }}</td>
                      <td>{{ number_format($o->nominal, 0, ",", ".") }};-</td>
                    </tr>
                    @endforeach
                  </tbody>
                  <tfoot>
                  <tr>
                    <th>Waktu Pembayaran</th>
                    <th>Nama Siswa</th>
                    <th>NISN</th>
                    <th>Telepon</th>
                    <th>Nominal</th>
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
                    <select class="form-control" name="siswa">
                      @foreach($option as $s)
                      <option value="{{ $s->id }}">{{ $s->nama }}</option>
                      @endforeach
                    </select>
                  </div>
                  <div class="form-group">
                    <label for="nominal">Nominal</label>
                    <input class="form-control" id="nominal" name="nominal" placeholder="Masukkan Nominal Pembayaran">
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