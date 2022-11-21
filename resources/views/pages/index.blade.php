@extends('layouts.app')


@section('wrapper')
    <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
        <div class="">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 p-0">
                    <li class="breadcrumb-item"><a href="{{ url('/') }}">Dashboard</a></li>
                    <li class="breadcrumb-item active" aria-current="page">
                        {{ ucwords(str_replace('_', ' ', request()->segment(1))) }}
                        {{ request()->segment(1) == 'pages' && request()->language_id == 2 ? 'Arabic' : 'English' }} List
                    </li>
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
                                <input type="text" name="search" value="{{ request()->search }}" class="form-control"
                                    placeholder="Search {{ ucwords(str_replace('_', ' ', request()->segment(1))) }}">
                            </div>

                        </div>
                        <div class="col-3">
                            @include('atoms.forms.select2Field', [
                                'model' => null,
                                'field' => 'page_status_id',
                                'option_key' => 'id',
                                'option_value' => 'title',
                                'data' => getPageStatuses(),
                                'class' => '',
                                'placeholder' => 'Select Status',
                                'label' => 'Select Status',
                                'selected_value' => request()->page_status_id,
                                'compulsory' => true,
                            ])
                        </div>
                        @if (count(getAllLanguages()) > 1)
                            <div class="col-3">
                                @include('atoms.forms.select2Field', [
                                    'model' => null,
                                    'field' => 'language_id',
                                    'option_key' => 'id',
                                    'option_value' => 'title',
                                    'data' => getAllLanguages(),
                                    'class' => '',
                                    'placeholder' => 'Select Language',
                                    'label' => 'Select Language',
                                    'selected_value' => request()->language_id,
                                    'compulsory' => true,
                                ])
                            </div>
                        @endif
                        <div class="col-3 align-self-end">
                            <input type="submit" class="btn btn-primary" value="Search">
                            <a class="btn btn-primary" style="margin-left: 5px"
                                href="{{ route(request()->segment(1) . '.index') }}">Reset</a>
                        </div>
                        <span class="invalid-feedback d-block" role="alert">
                            <strong>Please Note Compulsory Pages Cannot be Deleted.</strong>
                        </span>
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
                            <th>Title</th>
                            @if (count(getAllLanguages()) > 1)
                                <th>Languages</th>
                            @endif
                            <th>Status</th>
                            <th>@sortablelink('created_at', 'Created Date')</th>
                            <th>@sortablelink('updated_at', 'Last Modify')</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        @if (count($models) > 0)
                            @foreach ($models as $information)
                                <tr>
                                    <td>
                                        {{ $information->title }}{{ !$information->is_delete ? '*' : '' }}
                                    </td>
                                    @if (count(getAllLanguages()) > 1)
                                        <td>
                                            @if (isset($information->parent_page))
                                                <a
                                                    href="{{ route('pages.edit', ['page' => $information->parent_page->id, 'language_id' => $information->language_id]) }}">
                                                    {{ $information->parent_page->language->title . ' - Edit' }}
                                                </a>
                                            @else
                                                @foreach (getLanguages() as $language)
                                                    @if (in_array($language->id, $information->child_pages->pluck('language_id')->ToArray()))
                                                        @php
                                                            $child = $information->child_pages->where('language_id', $language->id)->first();
                                                        @endphp
                                                        <a
                                                            href="{{ route('pages.edit', ['page' => $child->id, 'language_id' => $language->id]) }}">{{ $language->title . ' - Edit' }}</a>
                                                    @else
                                                        <a
                                                            href="{{ route('pages.create', [
                                                                'parent_id' => $information->id,
                                                                'language_id' => isset($language->id) ? $language->id : null,
                                                                'template_id' => $information->template_id,
                                                                'template' => $information->template->template,
                                                                'slug' => $information->slug,
                                                            ]) }}">{{ $language->title . ' - Create' }}</a>
                                                    @endif
                                                    <br>
                                                @endforeach
                                            @endif
                                        </td>
                                    @endif
                                    <td>
                                        {{ getValue($information, 'page_status.title') }}
                                    </td>
                                    <td>
                                        {{ $information->created_at->toDayDateTimeString() }}
                                    </td>
                                    <td>
                                        {{ $information->updated_at->toDayDateTimeString() }}
                                    </td>
                                    <td>
                                        <div class="d-flex order-actions">
                                            @can(request()->segment(1) . '.edit')
                                                <a title="Edit"
                                                    href="{{ route(request()->segment(1) . '.edit', [substr_replace(request()->segment(1), '', -1) => $information->id]) }}">
                                                    <i class='bx bxs-edit'></i></a>
                                                @if (count($information->child_pages) <= 0 && request()->language_id != 2)
                                                    <a title="Duplicate"
                                                        href="{{ route('pages.duplicate', [
                                                            'parent_id' => $information->id,
                                                            'language_id' => isset($language->id) ? $language->id : null,
                                                            'template_id' => $information->template_id,
                                                            'template' => $information->template->template,
                                                            'slug' => $information->slug,
                                                            'is_delete' => $information->is_delete,
                                                        ]) }}"
                                                        class="ms-3">
                                                        <i class='bx bxs-duplicate'></i>
                                                    </a>
                                                @endif
                                            @endcan
                                            @can(request()->segment(1) . '.delete')
                                                @if ($information->is_delete)
                                                    <a title="Delete" data-form-id="form-{{ $information->id }}"
                                                        data-href="javascript:void" class="ms-3 delete-btn-modal">
                                                        <i class='bx bxs-trash'></i>
                                                    </a>
                                                    <form id="form-{{ $information->id }}"
                                                        action="{{ route(request()->segment(1) . '.destroy', [
                                                            substr_replace(request()->segment(1), '', -1) => $information->id,
                                                            'language_id' => isset(request()->language_id) ? request()->language_id : 1,
                                                        ]) }}"
                                                        method="POST">
                                                        @csrf
                                                        @method('DELETE')
                                                    </form>
                                                @endif
                                            @endcan
                                        </div>
                                    </td>
                                </tr>
                            @endforeach
                        @else
                            <tr style="text-align: center">
                                <th colspan="6">No Record Found</th>
                            </tr>
                        @endif
                    </tbody>
                </table>
                @include('atoms.pagination', [
                    'model' => $models,
                ])
            </div>
        </div>
    </div>
@endsection

@push('scripts')
    <script>
        jQuery('.delete-btn-modal').click(function() {
            var formID = jQuery(this).data('form-id')

            const swalWithBootstrapButtons = Swal.mixin({
                customClass: {
                    confirmButton: 'btn btn-primary me-3',
                    cancelButton: 'btn btn-danger'
                },
                buttonsStyling: false
            })

            @if (!isset(request()->language_id) || request()->language_id == 1)
                let message = "Deleting this page will also delete the arabic page";
            @elseif (isset(request()->language_id) && request()->language_id == 2)
                let message = "Deleting this page will also delete the english page";
            @endif

            swalWithBootstrapButtons.fire({
                title: 'Are you sure?',
                text: message,
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    jQuery('form#' + formID).submit();
                }
            })
        })
    </script>
@endpush
