<!doctype html>
<html lang="en" class="{{ themeStyleClasses() }}">

<head>
    @if (env('APP_ENV') == 'production')
        <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
    @endif
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <!--favicon-->
    <link rel="apple-touch-icon" sizes="57x57" href="/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
    <link rel="manifest" href="/manifest.json">
    <!--plugins-->
    @yield('style')
    <link href="/assets/plugins/simplebar/css/simplebar.css" rel="stylesheet" />
    <link href="/assets/plugins/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet" />
    <link href="/assets/plugins/metismenu/css/metisMenu.min.css" rel="stylesheet" />
    <!-- loader-->
    <link href="/assets/css/pace.min.css" rel="stylesheet" />
    <script data-pace-options='{ "startOnPageLoad": false ,"restartOnPushState": false,"restartOnRequestAfter":false }'
        src="/assets/js/pace.min.js"></script>

    <!-- Bootstrap CSS -->
    <link href="/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="/assets/css/bootstrap-extended.css" rel="stylesheet">
    <link href="/assets/css/app.css" rel="stylesheet">
    <link href="/assets/css/icons.css" rel="stylesheet">
    <link href="{{ asset('assets/plugins/select2/css/select2.min.css') }}" rel="stylesheet">
    <link rel="stylesheet" href="/assets/icons/file-icon-vectors.css" />
    <link href="/assets/css/media.css" rel="stylesheet" />
    <!-- Theme Style CSS -->
    <link rel="stylesheet" href="/assets/css/dark-theme.css" />
    <link rel="stylesheet" href="/assets/css/header-colors.css" />
    <link rel="stylesheet" type="text/css" href="/assets/css/toastify.min.css">

    <title>{{ env('APP_NAME') }} - Admin - Digital Gravity</title>
    <script>
        var locale_id = {{ request()->locale_id ? request()->locale_id : 1 }}
        var url = '{{ url('/') }}'
    </script>
    <style>
        .tox-notifications-container {
            display: none;
        }

        .mbsc-windows.mbsc-textfield-box,
        .mbsc-windows.mbsc-textfield-outline {
            border-color: #cfd4da;
        }

        .mbsc-windows.mbsc-textfield {
            height: unset;
        }

        .mbsc-windows.mbsc-select.mbsc-ltr {
            padding-right: 2em;
            padding: 0.375rem 0.75rem;
            border-radius: 0.25rem;
        }

        .mbsc-windows.mbsc-select-icon {
            top: 0.6375em;
        }

        .shop-wrapper {
            display: flex;
            flex-direction: column;
            margin-bottom: 1rem;
        }

        .shop-wrapper .form-label {
            order: 1;
        }

        .shop-wrapper .form-select {
            order: 2;

        }

        .shop-wrapper .invalid-feedback {
            order: 4;

        }

        .shop-wrapper .select2 {
            order: 3;

        }

        .fiv-cla {
            font-size: 7.2em;
            margin: 0 auto;
        }

        .icon-space {
            width: 24.5px;
            height: 26px;
        }
    </style>
</head>

<body>
    <!--wrapper-->
    <div class="wrapper">

        <!--navigation-->
        @include('layouts.nav')
        <!--end navigation-->

        <!--start header -->
        @include('layouts.header')
        <!--end header -->


        <!--start page wrapper -->
        <div class="page-wrapper">
            <div class="page-content">
                @if (session()->has('class'))
                    <div
                        class="alert border-0 border-start border-5 border-{{ session()->get('class') }} alert-dismissible fade show bg-body">
                        <div>{{ session()->get('message') }}</div>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                @endif
                @yield('wrapper')
            </div>
        </div>
        <!--end page wrapper -->
        <!--start overlay-->
        <div class="overlay toggle-icon"></div>
        <!--end overlay-->
        <!--Start Back To Top Button--> <a href="javaScript:;" class="back-to-top"><i
                class='bx bxs-up-arrow-alt'></i></a>
        <!--End Back To Top Button-->
        {{-- <footer class="page-footer">
            <p class="mb-0">Copyright © {{ date('Y') }}. All right reserved.</p>
        </footer> --}}
    </div>

    <!--end wrapper-->
    @if (\Route::current()->getName() !== 'media.index')
        @include('media.components.media-modal')
    @endif
    <!--end switcher-->
    <!-- Bootstrap JS -->
    <script src="{{ asset('assets/js/bootstrap.bundle.min.js') }}"></script>
    <!--plugins-->
    <script src="{{ asset('assets/js/jquery.min.js') }}"></script>
    <script src="{{ asset('assets/js/Sortable.js') }}"></script>
    <script src="{{ asset('assets/plugins/simplebar/js/simplebar.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/metismenu/js/metisMenu.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js') }}"></script>
    <script src="{{ asset('assets/plugins/select2/js/select2.min.js') }}"></script>
    <script src="{{ asset('assets/js/jquery-ui.min.js') }}"></script>
    <script src="{{ asset('assets/js/sweetalert2@11.js') }}"></script>
    {{-- <script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script> --}}
    <script src="/assets/js/sticky-sidebar.js"></script>
    <script src="{{ asset('assets/js/media.js') }}"></script>
    <script src="{{ asset('assets/js/clipboard.min.js') }}"></script>
    {{-- <script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script> --}}
    <script src="{{ asset('assets/js/jquery.inputmask.min.js') }}"></script>
    <script type="text/javascript" src="/assets/js/toastify-js.js"></script>
    <script type="text/javascript" src="{{ asset('assets/js/jquery.repeater.min.js') }}"></script>
    <script>
        $('.single-select').select2();

        if (typeof tinymce !== 'undefined') {
            tinymce.init({
                selector: 'textarea.editme',
                toolbar: 'undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | outdent indent',
                menubar: ''
            });

            tinymce.init({
                selector: 'textarea.editmefull',
                plugins: "table",
                toolbar: '',
            });
        }
    </script>

    <script src="/assets/js/app.js"></script>
    <script src="/assets/js/custom.js"></script>
    @stack('scripts')
    @include('layouts.theme-control')

    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
        aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">Anchor Link</h5>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body p-3">
                    <form class="insert-link-body" id="insert-edit-link">
                        <div class="form-group m-1">
                            <label for="exampleInputEmail1">Title*</label>
                            <input type="text" class="form-control p-1" name="title" id="anchor_title"
                                aria-describedby="emailHelp" placeholder="">
                        </div>
                        <div class="form-group m-1 ">
                            <label for="exampleInputPassword1">Url*</label>
                            <input type="url" class="form-control p-1" name="link" id="anchor_link"
                                placeholder="Link">
                        </div>
                        <div class="form-check m-1">
                            <input type="checkbox" class="form-check-input" name="target" id="anchor_target">
                            <label class="form-check-label" for="exampleCheck1">New Tab</label>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="add-link">Understood</button>
                </div>
            </div>
        </div>
    </div>

</body>

</html>
