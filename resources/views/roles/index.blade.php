@extends("layouts.app")


@section('wrapper')

    <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
        <div class="ps-3">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 p-0">
                    <li class="breadcrumb-item"><a href="{{ url('/') }}">Dashboard</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Role List</li>
                </ol>
            </nav>
        </div>
    </div>

    <div class="card">
        <div class="card-body">
            <div class="d-lg-flex align-items-center mb-4 gap-3">
                <form action="" method="GET" class="w-75">
                    <div class="position-relative row">
                        <div class="align-self-end col-3">
                            <label class="form-label">
                                Search Listing
                            </label>
                            <div class="input-group">
                                <span class="input-group-text bx bx-search" id="basic-addon1"></span>
                                <input type="text" name="search" value="{{ request()->search }}" class="form-control ps-5" placeholder="Search {{ ucwords(str_replace('_', ' ', request()->segment(1))) }}">
                            </div>
                        </div>
                        <div class="col-3 align-self-end">
                            <input type="submit" class="btn btn-primary" value="Search">
                        </div>
                    </div>
                </form>

                @can(request()->segment(1) . '.create')
                    <div class="ms-auto">
                        <a href="{{ route(request()->segment(1) . '.create') }}" class="btn btn-primary mt-2 mt-lg-0">
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
                            <th>Role</th>
                            <th>Date</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        @if(count($roles) > 0)
                            @foreach ($roles as $role)
                                <tr>
                                    <td>
                                        {{ $role->display_name }}
                                    </td>
                                    <td>
                                        {{ $role->created_at->toDayDateTimeString() }}
                                    </td>
                                    </td>
                                    <td>
                                        <div class="d-flex order-actions">
                                            @can('roles.edit')
                                                <a href="{{ route('roles.edit', ['role' => $role]) }}" class="">
                                                    <i class='bx bxs-edit'></i>
                                                </a>
                                            @endcan
                                            <a data-form-id="form-{{ $role->id }}" data-href="javascript:void"
                                                class="ms-3 delete-btn-modal">
                                                <i class='bx bxs-trash'></i>
                                            </a>
                                            <form id="form-{{ $role->id }}"
                                                action="{{ route('roles.destroy', ['role' => $role]) }}" method="POST">
                                                @csrf
                                                @method('DELETE')
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                            @endforeach
                        @else
                            <tr style="text-align: center">
                                <th colspan="4">No Record Found</th>
                            </tr>
                        @endif
                    </tbody>
                </table>
            </div>
        </div>
    </div>


@endsection
