<div class="modal fade" id="mediaLibraryList" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
    aria-labelledby="mediaLibraryListLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-scrollable" style="max-width: 98% !important;">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="mediaLibraryListLabel">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <div class="modal-body">
                <ul class="nav nav-tabs mt-1 px-2" id="myTab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link " id="upload-media-tab" data-bs-toggle="tab" data-bs-target="#upload-media"
                            type="button" role="tab" aria-controls="upload-media" aria-selected="true">Upload</button>
                    </li>
                    <li class="nav-item " role="presentation">
                        <button class="nav-link active" id="list-media-tab" data-bs-toggle="tab" data-bs-target="#list-media"
                            type="button" role="tab" aria-controls="list-media" aria-selected="false">Listing</button>
                    </li>
                </ul>
                <div class="tab-content mt-2 " id="myTabContent">
                    <div class="tab-pane fade " id="upload-media" role="tabpanel" aria-labelledby="upload-media-tab">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title d-flex align-items-center">
                                    <h5 class="mb-0 text-primary">Upload Media</h5>
                                </div>
                                <hr>
                                <form class="row g-3" action="{{ route('media.store') }}" method="POST">
                                    @csrf
                                    <div class="col-12">
                                        <div id="dragandrophandler">
                                            <label class="dragandrophandler_input">
                                                <input type="file" name="media_files[]" id="media_files" multiple />
                                                <h1>
                                                    Drag & Drop Files Here
                                                </h1>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="media-file-info">

                                    </div>
                                    <ul class="list-group" id="media-upload-list">
                                    </ul>
                                    <div class="col-12">
                                        <div id="status1"></div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade show active" id="list-media" role="tabpanel" aria-labelledby="list-media-tab">

                        <div class="row" id="media-list-body">

                            <div class="col-md-9">

                                <form class="row  mb-2">
                                    <div class="col-md-3">
                                        <div class="position-relative">
                                            <input type="text" value="{{ request()->search_media }}"
                                                class="form-control ps-5" name="search_media" id="media_search"
                                                placeholder="Search Media">
                                            <span class="position-absolute top-50 product-show translate-middle-y">
                                                <i class="bx bx-search"></i>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <select class="form-select   w-100" name="file_type"
                                            id="file_type">
                                            <option value="">Select File type</option>
                                            @foreach (getMediaFileTypes() as $filesType)
                                                <option value="{{ $filesType }}"
                                                    @if (request()->file_type == $filesType) selected @endif>
                                                    {{ $filesType }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="col-md-2">
                                        <button type="submit" class="btn btn-primary">Search</button>
                                    </div>
                                    {{-- <div class="col-md-2 text-end" id="bulk-media-delete" style="display:none; margin-right: 0;margin-left: auto; ">
                                        <a data-href="/media/bulk/delete" class="btn btn-primary">Bulk Delete</a>
                                    </div> --}}
                                </form>

                                <div class="row row-cols-1 row-cols-md-2 row-cols-lg-2 row-cols-xl-6" id="media-list">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div id="media-attachment-sticky">
                                    <div class="card sticky-top">
                                        <div class="card-header">
                                            <h5 class="card-title"> Attachment Detail</h5>
                                        </div>
                                        <div class="card-body p-0">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="media-seletez">Select </button>
            </div>
        </div>
    </div>
</div>
