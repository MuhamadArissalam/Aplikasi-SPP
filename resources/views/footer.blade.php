  <footer class="main-footer">
    <strong>Copyright &copy; {{ date('Y'); }} <a href="https://aris.great-site.net/">Muhamad Arissalam</a>.</strong>
    All rights reserved.
    <div class="float-right d-none d-sm-inline-block">
      <b>Version</b> 3.2.0
    </div>
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="/assets/adminlte/plugins/jquery/jquery.min.js"></script>
<!-- jQuery Validation -->
<script src="/assets/adminlte/plugins/jquery-validation/jquery.validate.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="/assets/adminlte/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="/assets/adminlte/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="/assets/adminlte/plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="/assets/adminlte/plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script src="/assets/adminlte/plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="/assets/adminlte/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="/assets/adminlte/plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="/assets/adminlte/plugins/moment/moment.min.js"></script>
<script src="/assets/adminlte/plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="/assets/adminlte/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="/assets/adminlte/plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="/assets/adminlte/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="/assets/adminlte/dist/js/adminlte.js"></script>
<!-- DataTables  & Plugins -->
<script src="/assets/adminlte/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="/assets/adminlte/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="/assets/adminlte/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="/assets/adminlte/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="/assets/adminlte/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="/assets/adminlte/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="/assets/adminlte/plugins/jszip/jszip.min.js"></script>
<script src="/assets/adminlte/plugins/pdfmake/pdfmake.min.js"></script>
<script src="/assets/adminlte/plugins/pdfmake/vfs_fonts.js"></script>
<script src="/assets/adminlte/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="/assets/adminlte/plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="/assets/adminlte/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<script type="text/javascript">
  $(function () {
    $.ajaxSetup({
      headers: {
        'X-CSRF-TOKEN': "{{ csrf_token() }}"
      }
    });
    $('.aris-table').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": true,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "responsive": true,
      @if($view == "user")
      "columns": [null, null, null, {searchable: "false"}],
      @elseif($view == "siswa")
      "columns": [null, null, null, null, null, null, null, {searchable: "false"}],
      @endif
      "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
    }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
    @if(session('alert'))
    $('#alert').modal('show');
    @endif
  });
  @if($view=="tagihan")
  $("#s1").on("input", function() {
    let z = parseInt($(this).val()) + 1;
    $("#s2").html("/ " + z);
  });
  @endif
  function del(e){
    $('#delForm').attr(
      "action", $(e).data("link")
    );
    $('#deleteModal').modal("toggle");
  }
 function edit(e){
    $.ajax({
      type: "POST",
      url: $(e).data("link"),
      success: function (data) {
      @if($view == "user")
        $('#editid').val(data.id);
        $('#editlevel').val(data.level).change();
        $('#editModal').modal("show");
      @elseif($view == "siswa")
        $('#editid').val(data.id);
        $('#editnama').val(data.nama);
        $('#editnisn').val(data.nisn);
        $('#editalamat').val(data.alamat);
        $('#edittelp').val(data.telp);
        $('#editdaftar').val(data.daftar);
        $('#editlulus').val(data.lulus);
        $('#editModal').modal("show");
      @endif
      }
    });
  }
</script>
</body>
</html>
