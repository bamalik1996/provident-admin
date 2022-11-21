@extends('layouts.app')


@section('wrapper')
    <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
        <div class="">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 p-0">
                    <li class="breadcrumb-item"><a href="{{ url('/') }}">Dashboard</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Upload Media</li>
                </ol>
            </nav>
        </div>
    </div>

    <div class="row">
        <div class="col">
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
                        <ul class="list-group" id="media-upload-list">
                        </ul>
                        <div class="col-12">
                            <div id="status1"></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
