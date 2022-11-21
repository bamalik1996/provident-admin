@extends('layouts.app')


@section('wrapper')

    <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
        <div class="">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 p-0">
                    <li class="breadcrumb-item"><a href="{{ url('/') }}">Dashboard</a></li>
                    <li class="breadcrumb-item active" aria-current="page">User List</li>
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
                                <input type="text" name="search" value="{{ request()->search }}"
                                    class="form-control ps-5"
                                    placeholder="Search {{ ucwords(str_replace('_', ' ', request()->segment(1))) }}">
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
                            <th>Name</th>
                            <th>Email</th>
                            <th>Role</th>
                            <th>Status</th>
                            <th>@sortablelink('created_at', 'Created Date')</th>
                            <th>@sortablelink('updated_at', 'Last Modify')</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        @if (count($users) > 0)
                            @foreach ($users as $user)
                                <tr>
                                    <td>
                                        {{ $user->name }}
                                    </td>
                                    <td>
                                        {{ $user->email }}
                                    </td>
                                    <td>
                                        {{ getValue($user, 'roles.0.display_name') }}
                                    </td>
                                    <td>
                                        @if ($user->status == 'active')
                                            <div
                                                class="badge rounded-pill text-success bg-light-success p-2 text-uppercase px-3">
                                                <i class='bx bxs-circle me-1'></i>
                                                {{ ucfirst($user->status) }}
                                            </div>
                                        @else
                                            <div
                                                class="badge rounded-pill text-danger bg-light-danger p-2 text-uppercase px-3">
                                                <i class='bx bxs-circle me-1'></i>
                                                {{ ucfirst($user->status) }}
                                            </div>
                                        @endif

                                    </td>
                                    <td>
                                        {{ $user->created_at->toDayDateTimeString() }}
                                    </td>
                                    <td>
                                        {{ $user->updated_at->toDayDateTimeString() }}
                                    </td>
                                    </td>
                                    <td>
                                        <div class="d-flex order-actions">
                                            @can('users.edit')
                                                <a href="{{ route('users.edit', ['user' => $user]) }}" class=""><i
                                                        class='bx bxs-edit'></i></a>
                                            @endcan
                                            @can('users.delete')
                                                <a data-form-id="form-{{ $user->id }}" data-href="javascript:void"
                                                    class="ms-3 delete-btn-modal">
                                                    <i class='bx bxs-trash'></i>
                                                </a>
                                                <form id="form-{{ $user->id }}"
                                                    action="{{ route('users.destroy', ['user' => $user]) }}" method="POST">
                                                    @csrf
                                                    @method('DELETE')
                                                </form>
                                            @endcan
                                        </div>
                                    </td>
                                </tr>
                            @endforeach
                        @else
                            <tr style="text-align: center">
                                <th colspan="7">No Record Found</th>
                            </tr>
                        @endif
                    </tbody>
                </table>
                @include('atoms.pagination', [
                    'model' => $users,
                ])
            </div>
        </div>
    </div>


@endsection
