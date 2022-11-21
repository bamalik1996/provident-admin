@extends('layouts.app')


@section('wrapper')
    <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
        <div class="">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 p-0">
                    <li class="breadcrumb-item"><a href="{{ url('/') }}">Dashboard</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Add Role</li>
                </ol>
            </nav>
        </div>
    </div>

    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-body">
                    <div class="card-title d-flex align-items-center">
                        <h5 class="mb-0 text-primary">Add Role</h5>
                    </div>
                    <hr>
                    <form class="row g-3" action="{{ route('roles.store') }}" method="POST">
                        @csrf
                        <div class="col-md-6">
                            <label for="display_name" class="form-label">Role Name*</label>
                            <input type="name" name="display_name" value="{{ old('display_name') }}"
                                class="form-control   @error('display_name') is-invalid @enderror" id="display_name">
                            <span class="d-block" style="color: darkgreen;font-size: 12px;">
                                <strong>Max Character Length: 100</strong>
                            </span>
                            @error('display_name')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>

                        <div class="col-md-12">
                            <h4>Permissions</h4>
                        </div>
                        <div class="col-md-12">
                            <div class="row" data-masonry='{"percentPosition": true }'>
                                @foreach (config('sideBarPermissions') as $key => $value)
                                    <div class="col-sm-4 col-md-3 col-lg-3 col-xxl-2">
                                        <ul class="list-group select-role-checkbox">
                                            <li
                                                class="list-group-item d-flex justify-content-between align-items-center active p-1">
                                                {{ $key }}
                                                <span class="badge rounded-pill">
                                                    <input type="checkbox" class="select-all-checkbox">
                                                </span>
                                            </li>
                                            @foreach ($value as $item)
                                                <li
                                                    class="list-group-item d-flex justify-content-between align-items-center p-1 {{ 'Parent-' . $item }}">
                                                    <span>{{ $item }}<br />{{ Str::slug($key . ' ' . $item, '.') }}</span>
                                                    <span class="badge rounded-pill">
                                                        <input @if (old('permissions') && in_array($key . ' ' . $item, old('permissions'))) checked @endif
                                                            type="checkbox"
                                                            class="select-inner-role-checkbox {{ $item }}"
                                                            value="{{ $key . ' ' . $item }}" name="permissions[]">
                                                    </span>
                                                </li>
                                            @endforeach
                                        </ul>
                                    </div>
                                @endforeach
                            </div>
                        </div>


                        <div class="col-12">
                            <button type="submit" class="btn btn-primary px-5">Save</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
    <script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js"></script>

    <script>
        $('.select-role-checkbox').on('click', function() {
            if ($(this).closest('.select-role-checkbox').find('.select-inner-role-checkbox:checked').length == $(
                    this).closest('.select-role-checkbox').find('.select-inner-role-checkbox').length) {

                $(this).closest('.select-role-checkbox').find('.select-all-checkbox').prop('checked', true);

            } else {

                $(this).closest('.select-role-checkbox').find('.select-all-checkbox').prop('checked', false);

            }
        });
        $('.select-role-checkbox .select-all-checkbox').on('click', function() {
            if (this.checked) {
                $(this).closest('.select-role-checkbox').find('.select-inner-role-checkbox').each(function() {
                    console.log("this.checked = true")
                    this.checked = true;
                });
            } else {
                $(this).closest('.select-role-checkbox').find('.select-inner-role-checkbox').each(function() {
                    console.log("this.checked = true")
                    this.checked = false;
                });
            }
        });

        jQuery.each(jQuery('.select-role-checkbox'), function() {
            if ($(this).find('.select-inner-role-checkbox:checked').length == $(this).find(
                    '.select-inner-role-checkbox').length) {
                $(this).find('.select-all-checkbox').prop('checked', true);
            }
        });

        $('.Create,.Edit,.Delete').click(function() {
            if ($(this).is(':checked')) {
                if (!$(this).parent().parent().siblings('.Parent-List').find('.List').is(':checked')) {
                    $(this).parent().parent().siblings('.Parent-List').find('.List').prop('checked', true);
                    Toastify({
                        text: 'Selecting Create/Edit/Delete will automatically select list',
                        duration: 5000,
                        position: "right",
                        gravity: "top",
                    }).showToast();
                }
            }
        });

        $('.List').click(function() {
            _this = this;
            if (!$(_this).is(':checked')) {
                if ($(_this).parent().parent().siblings('.Parent-Create').find('.Create').is(':checked') || $(_this)
                    .parent().parent().siblings('.Parent-Edit').find('.Edit').is(':checked') || $(_this).parent()
                    .parent().siblings('.Parent-Delete').find('.Delete').is(':checked')) {
                    Toastify({
                        text: 'Cannot Deselect list. Please Unselect Create/Edit/Delete',
                        duration: 5000,
                        position: "right",
                        gravity: "top",
                        style: {
                            background: "red",
                        },
                    }).showToast();
                    $(_this).prop('checked', true);
                }
            }
        })
    </script>
@endpush
