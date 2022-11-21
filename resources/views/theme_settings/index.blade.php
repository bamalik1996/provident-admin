@extends("layouts.app")


@section('wrapper')

    <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
        <div class="">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 p-0">
                    <li class="breadcrumb-item"><a href="{{ url('/') }}">Dashboard</a></li>
                    <li class="breadcrumb-item active" aria-current="page">{{ ucwords(str_replace('_', ' ', request()->segment(1))) }} List</li>
                </ol>
            </nav>
        </div>
    </div>

    <div class="card">
        <div class="card-body">
            <div class="d-lg-flex align-items-center mb-4 gap-3">
                <form action="" method="GET">
                    <div class="position-relative">
                        <input type="text" name="search" value="{{ request()->search }}" class="form-control ps-5 radius-30"
                            placeholder="Search {{ ucwords(str_replace('_', ' ', request()->segment(1))) }}">
                            <span class="position-absolute top-50 product-show translate-middle-y"><i
                                class="bx bx-search"></i></span>
                    </div>
                </form>
                @can(request()->segment(1).'.create')
                    <div class="ms-auto">
                        <a href="{{ route(request()->segment(1).'.create') }}" class="btn btn-primary mt-2 mt-lg-0">
                            <i class="bx bxs-plus-square"></i>
                            Add New {{ ucwords(str_replace('_', ' ', request()->segment(1))) }}
                        </a>
                    </div>
                @endcan
            </div>
            <div class="table-responsive">
                <table class="table mb-0">
                    <thead class="table-light">
                        <tr>
                            <th>Title</th>

                            <th>Date</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($models as $information)
                            <tr>
                                <td>
                                    {{ $information->title }}
                                </td>
                                <td>
                                    {{ $information->title_ar }}
                                </td>
                                <td>
                                    {{ $information->created_at->toDayDateTimeString() }}
                                </td>
                                </td>
                                <td>
                                    <div class="d-flex order-actions">
                                        @can(request()->segment(1).'.edit')
                                            <a href="{{ route(request()->segment(1).'.edit', [substr_replace(request()->segment(1), "", -1) => $information->id]) }}">
                                                <i class='bx bxs-edit'></i></a>
                                        @endcan
                                        @can('users.delete')
                                            <a data-form-id="form-{{ $information->id }}" data-href="javascript:void"
                                                class="ms-3 delete-btn-modal">
                                                <i class='bx bxs-trash'></i>
                                            </a>
                                            <form id="form-{{ $information->id }}"
                                                action="{{ route(request()->segment(1).'.destroy', [substr_replace(request()->segment(1), "", -1) => $information->id]) }}" method="POST">
                                                @csrf
                                                @method('DELETE')
                                            </form>
                                        @endcan
                                    </div>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
                @include('atoms.pagination', [
                    'model' => $models,
                ])
            </div>
        </div>
    </div>


@endsection
