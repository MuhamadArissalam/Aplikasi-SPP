  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <a href="#" class="brand-link">
      <img src="/image/aris2.jpg" alt="Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">Aris's Blog</span>
    </a>
    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="/image/aris.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="https://aris.great-site.net/" class="d-block">Muhamad Arissalam</a>
        </div>
      </div>
      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          @if(Auth::check())
          <li class="nav-item">
            <a href="{{ route('home') }}" class="nav-link">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Dashboard
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="{{ route('user') }}" class="nav-link">
              <i class="nav-icon fas fa-user"></i>
              <p>
                Data Petugas
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="{{ route('siswa') }}" class="nav-link">
              <i class="nav-icon fas fa-graduation-cap"></i>
              <p>
                Data Siswa
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="{{ route('tagihan') }}" class="nav-link">
              <i class="nav-icon fas fa-money-bill-alt"></i>
              <p>
                Data Tagihan
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="{{ route('pembayaran') }}" class="nav-link">
              <i class="nav-icon fas fa-credit-card"></i>
              <p>
                Data Pembayaran
              </p>
            </a>
          </li>
          @else
          <li class="nav-item">
            <a href="{{ route('login') }}" class="nav-link">
              <i class="nav-icon fas fa-user"></i>
              <p>
                Login Petugas
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="{{ route('login.siswa') }}" class="nav-link">
              <i class="nav-icon fas fa-graduation-cap"></i>
              <p>
                Login Siswa
              </p>
            </a>
          </li>
          @endif
          <li class="nav-item">
            <a href="{{ route('download') }}" class="nav-link">
              <i class="nav-icon fas fa-code"></i>
              <p>
                Source Code
              </p>
            </a>
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
