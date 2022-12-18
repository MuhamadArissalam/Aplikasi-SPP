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
              <li class="breadcrumb-item active">Data Petugas</li>
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
                  <a class="btn btn-primary @if(Auth::user()->level > 1) disabled @endif" href="{{route('register')}}">Tambah</a>
                </h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table class="table table-bordered table-hover aris-table">
                  <thead>
                  <tr>
                    <th>Nama</th>
                    <th>Email</th>
                    <th>Level</th>
                    <th>Pilihan</th>
                  </tr>
                  </thead>
                  <tbody>
                    @foreach($data as $o)
                    <tr>
                      <td>{{ $o->name }}</td>
                      <td>{{ $o->email }}</td>
                      <td>@if($o->level == 0) root @elseif($o->level == 1) admin @elseif($o->level == 2) bendahara @else guest @endif</td>
                      <td>
                        @if($o->level !== 0)
                        <button class="btn btn-success @if(Auth::user()->level > 1) disabled @endif" data-link="{{ route($view.'.data', $o->id) }}" onclick="edit(this)">Edit</button>
                        @endif
                        <button class="btn btn-danger @if( Auth::user()->level > 1) disabled @endif" data-link="{{ route($view.'.del', $o->id) }}" onclick="del(this)">Remove</button>
                      </td>
                    </tr>
                    @endforeach
                  </tbody>
                  <tfoot>
                  <tr>
                    <th>Nama</th>
                    <th>Email</th>
                    <th>Level</th>
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
    <div class="modal fade" id="editModal" tabindex="-1" aria-hidden="true" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content bg-dark text-white">
              <form action="{{route($view.'.edit')}}" method="post">
                <div class="modal-header">
                    <h5 class="modal-title">Edit Data</h5>
                    <button class="btn-close btn-close-white" data-dismiss="modal" role="button"
                        aria-label="close"></button>
                </div>
                <div class="modal-body">
                  @csrf
                  <input id="editid" name="id" type="hidden">
                  <div class="form-group">
                    <label for="editlevel">Level</label>
                    <select class="form-control" name="level" id="editlevel" placeholder="Password">
                      <option value="1">Admin</option>
                      <option value="2">Bendahara</option>
                      <option value="3" default>Guest</option>
                    </select>
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
    <div class="modal fade" id="deleteModal" tabindex="-1" aria-hidden="true" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content bg-dark text-white">
                <div class="modal-header">
                    <h5 class="modal-title">Delete Data</h5>
                    <button class="btn-close btn-close-white" data-dismiss="modal" role="button"
                        aria-label="close"></button>
                </div>
                <div class="modal-body">
                  <p>Are you sure you want to delete this data?</p>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" data-dismiss="modal" role="button"
                        aria-label="close">Cancel</button>
                    <form id="delForm" method="post">
                      @csrf
                      <button class="btn btn-danger" type="submit">Delete</button>
                    </form>
                </div>
            </div>
        </div>
    </div>