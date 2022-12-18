  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Aplikasi SPP</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <p class="float-sm-right">By Muhamad Arissalam</p>
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
          <div class="col-md-6">
            <!-- small box -->
            <div class="small-box bg-success">
              <div class="inner">
                <h3>Petugas</h3>
                <p>Manajemen dan Administrasi</p>
              </div>
              <a href="{{ route('login') }}" class="small-box-footer">Login <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-md-6">
            <!-- small box -->
            <div class="small-box bg-secondary">
              <div class="inner">
                <h3>Siswa</h3>

                <p>Cek Pembayaran</p>
              </div>
              <a href="{{ route('login.siswa') }}" class="small-box-footer">Login <i class="fas fa-arrow-circle-right"></i></a>
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