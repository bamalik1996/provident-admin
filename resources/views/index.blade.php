@extends("layouts.app")

@section('style')
    <link href="/assets/plugins/highcharts/css/highcharts.css" rel="stylesheet" />
    <link href="/assets/plugins/vectormap/jquery-jvectormap-2.0.2.css" rel="stylesheet" />
@endsection

@section('wrapper')
    <div class="dash-wrapper bg-dark">
        <div class="row row-cols-1 row-cols-md-2 row-cols-xl-4 row-cols-xxl-5">
            <div class="col border-end border-light-2">
                <div class="card bg-transparent shadow-none mb-0">
                    <div class="card-body text-center">
                        <p class="mb-1 text-white">Total Number of Tailors</p>
                        <h3 class="mb-3 text-white">{{ 0 }}</h3>
                    </div>
                </div>
            </div>
            <div class="col border-end border-light-2">
                <div class="card bg-transparent shadow-none mb-0">
                    <div class="card-body text-center">
                        <p class="mb-1 text-white">Total Number of Users</p>
                        <h3 class="mb-3 text-white">{{ count(getUsers()) }}</h3>
                    </div>
                </div>
            </div>
            <div class="col border-end border-light-2">
                <div class="card bg-transparent shadow-none mb-0">
                    <div class="card-body text-center">
                        <p class="mb-1 text-white">Total Number of Orders</p>
                        <h3 class="mb-3 text-white">{{ 0 }}</h3>
                    </div>
                </div>
            </div>
            <div class="col border-end border-light-2">
                <div class="card bg-transparent shadow-none mb-0">
                    <div class="card-body text-center">
                        <p class="mb-1 text-white">Total Number of Inprogress Orders</p>
                        <h3 class="mb-3 text-white">{{ 0 }}</h3>
                    </div>
                </div>
            </div>
            <div class="col border-end border-light-2">
                <div class="card bg-transparent shadow-none mb-0">
                    <div class="card-body text-center">
                        <p class="mb-1 text-white">Total Number of Incoming Orders</p>
                        <h3 class="mb-3 text-white">{{ 0 }}</h3>
                    </div>
                </div>
            </div>
        </div>

        <!--end row-->
    </div>

@endsection
@push('scripts')
    {{-- <script src="/assets/plugins/vectormap/jquery-jvectormap-2.0.2.min.js"></script>
    <script src="/assets/plugins/vectormap/jquery-jvectormap-world-mill-en.js"></script> --}}
    {{-- <script src="/assets/plugins/highcharts/js/highcharts.js"></script>
    <script src="/assets/plugins/highcharts/js/exporting.js"></script>
    <script src="/assets/plugins/highcharts/js/variable-pie.js"></script>
    <script src="/assets/plugins/highcharts/js/export-data.js"></script>
    <script src="/assets/plugins/highcharts/js/accessibility.js"></script>
    <script src="/assets/plugins/apexcharts-bundle/js/apexcharts.min.js"></script>

    <script>
        $(".topbar").addClass('topbar d-flex align-items-center bg-dark shadow-none border-light-2 border-bottom');
        $(".nav-link").addClass('text-white');
        $(".user-name").addClass('text-white');
    </script>
    <script src="/assets/js/index.js"></script> --}}
@endpush
