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
                <h3 class="card-title">Data Pembayaran</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table class="table table-bordered table-hover aris-table">
                  <thead>
                  <tr>
                    <th>Waktu Pembayaran</th>
                    <th>Nominal</th>
                  </tr>
                  </thead>
                  <tbody>
                    @foreach($data as $o)
                    <tr>
                      <td>{{ $o->created_at }}</td>
                      <td>{{ number_format($o->nominal, 0, ",", ".") }};-</td>
                    </tr>
                    @endforeach
                  </tbody>
                  <tfoot>
                  <tr>
                    <th>Waktu Pembayaran</th>
                    <th>Nominal</th>
                  </tr>
                  </tfoot>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
            <div class="card">
              <div class="card-header border-0">
                <h3 class="card-title">Laporan</h3>
              </div>
              <div class="card-body">
                <div class="d-flex justify-content-between align-items-center border-bottom mb-3">
                  <p class="text-success text-xl">
                    <i class="fas fa-credit-card"></i>
                  </p>
                  <p class="d-flex flex-column text-right">
                    <span class="font-weight-bold">
                    <?php
                    $pembayaran = DB::table('pembayaran')->where('siswa', $siswa->id)->sum('nominal');
                    $pembayaran;
                    echo number_format($pembayaran, 0, ',', '.').";-";
                    ?>
                    </span>
                    <span class="text-muted">TOTAL PEMBAYARAN</span>
                  </p>
                </div>
                <!-- /.d-flex -->
                <div class="d-flex justify-content-between align-items-center mb-0">
                  <p class="text-danger text-xl">
                    <i class="fas fa-money-bill-alt"></i>
                  </p>
                  <p class="d-flex flex-column text-right">
                    <span class="font-weight-bold">
                    <?php
                    if($siswa->lulus == "-"){
                    $tagihan = DB::table('tagihan')->where('tahun', '>=', $siswa->daftar)->sum('nominal');
                    }else{
                    $tagihan = DB::table('tagihan')->where('tahun', '>=', $siswa->daftar)->where('tahun', '<', $siswa->lulus)->sum('nominal');
                    }
                    $pembayaran = DB::table('pembayaran')->where('siswa', $siswa->id)->sum('nominal');
                    $kekurangan = $tagihan - $pembayaran;
                    echo number_format($kekurangan, 0, ',', '.').";-";
                    ?>
                    </span>
                    <span class="text-muted">KEKURANGAN</span>
                  </p>
                </div>
                <!-- /.d-flex -->
              </div>
            </div>
          </div>
          <!-- ./col -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->