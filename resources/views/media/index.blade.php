@extends('layouts.app')


@section('wrapper')
    <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
        <div class="">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 p-0">
                    <li class="breadcrumb-item"><a href="{{ url('/') }}">Dashboard</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Media List</li>
                </ol>
            </nav>
        </div>
    </div>

    <div class="card" id="media-card-body">
        <div class="card-body">
            <div class="media-page-filter">
                <div class="d-lg-flex align-items-center mb-4 gap-3 w-100">
                    <form class="row position-relative">
                        <div class="col-md-6">
                            <div class="position-relative">
                                <input type="text" value="{{ request()->search_media }}" class="form-control ps-5"
                                    name="search_media" id="media_search" placeholder="Search Media">
                                <span class="position-absolute top-50 product-show translate-middle-y">
                                    <i class="bx bx-search"></i>
                                </span>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <select class="form-select  w-100" name="file_type" id="file_type">
                                <option value="">Select File type</option>
                                @foreach (getMediaFileTypes() as $filesType)
                                    <option value="{{ $filesType }}" @if (request()->file_type == $filesType) selected @endif>
                                        {{ $filesType }}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-2">
                            <button type="submit" class="btn btn-primary">Search</button>
                        </div>
                    </form>
                    <div class="ms-auto" id="bulk-select">
                        <a class="btn btn-primary mt-2 mt-lg-0">
                            Bulk Select
                        </a>
                    </div>
                    @can('media.upload')
                        <div id="media-create-btn">
                            <a href="{{ route('media.create') }}" class="btn btn-primary mt-2 mt-lg-0">
                                <i class="bx bxs-plus-square"></i>
                                Upload Media
                            </a>
                        </div>
                    @endcan
                </div>
            </div>
            <div class="after-bulk-selection sticky-top bg-white" style="display: none;top: 60px;">
                <div class="d-lg-flex align-items-center mb-4 gap-3 w-100 ">
                    <div class="ms-auto" id="bulk-unselection-all">
                        <a class="btn btn-primary mt-2 mt-lg-0 disabled">
                           Unselect
                        </a>
                    </div>
                    <div  id="bulk-selection-all">
                        <a class="btn btn-primary mt-2 mt-lg-0">
                            Select All
                        </a>
                    </div>
                    <div id="bulk-media-delete">
                        <a class="btn btn-primary mt-2 mt-lg-0 disabled" >
                            Delete
                        </a>
                    </div>
                    <div id="bulk-selection-cancel">
                        <a class="btn btn-primary mt-2 mt-lg-0">
                            Cancel
                        </a>
                    </div>
                </div>
            </div>
            <div class="row" id="media-list">
            </div>
            {{-- @include('atoms.pagination', [
                    'model' => $media,
                ]) --}}
        </div>
    </div>
    <div class="modal fade" id="staticSingleMedia" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
        aria-labelledby="staticSingleMedia" aria-hidden="true">
        <div class="modal-dialog modal-xl modal-dialog-scrollable" >
            <div class="modal-content h-100">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticSingleMedia">Attachment details
                    </h5>
                    <div class="btn-group" role="group" aria-label="Basic example">
                        <button type="button" class="btn btn-outline-primary" id="previous-media-modal"><i class="bx bx-left-arrow"></i>
                        </button>
                        <button type="button" class="btn btn-outline-primary" id="next-media-modal"><i class="bx bx-right-arrow"></i>
                        </button>
                        <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal" aria-label="Close">
                            <i class="lni lni-close"></i>
                        </button>

                    </div>
                </div>
                <div class="modal-body">
                    ...
                </div>
                {{-- <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" >Close</button>
                    <button type="button" class="btn btn-primary">Understood</button>
                </div> --}}
            </div>
        </div>
    </div>
@endsection
