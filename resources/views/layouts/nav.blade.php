<div class="sidebar-wrapper" data-simplebar="true">
    <div class="sidebar-header">
        <div>
            <img src="/assets/images/brand-logo.webp" class="logo-icon" alt="logo icon">
        </div>
        {{-- <div>
            <h4 class="logo-text">{{ env('APP_NAME') }}</h4>
        </div> --}}
        <div class="toggle-icon ms-auto"><i class='bx bx-first-page'></i>
        </div>
    </div>
    <!--navigation-->
    <ul class="metismenu" id="menu">

        {{getSideBarHtml(getSideBar())}}

    </ul>
    <!--end navigation-->
</div>
