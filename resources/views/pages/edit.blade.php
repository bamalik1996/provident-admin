@extends('layouts.app')


@section('wrapper')
    <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
        <div class="">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 p-0">
                    <li class="breadcrumb-item"><a href="{{ url('/') }}">Dashboard</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Update
                        {{ ucwords(str_replace('_', ' ', request()->segment(1))) }}</li>
                </ol>
            </nav>
        </div>
    </div>

    <form id="frm_submit"
        action="{{ route(request()->segment(1) . '.update', [substr_replace(request()->segment(1), '', -1) => $info->id]) }}"
        method="PATCH">
        @csrf
        <div class="row">
            <div class="col-md-9">

                @include('pages.components.basic')

                <div id="template-extra-fields">
                    @include('pages.templates.' . $info->template->template)
                </div>

                @include('pages.components.meta_information')
            </div>
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title d-flex align-items-center">
                            <h5 class="mb-0 text-primary">Actions</h5>
                        </div>
                        <hr>

                        {{-- @include('atoms.forms.select2Field', [
                            'label' => 'Template',
                            'model' => $info,
                            'field' => 'template_id',
                            'option_key' => 'id',
                            'option_value' => 'title',
                            'data' => getTemplate(),
                            'class' => 'single-select',
                            'placeholder' => 'Select Template',
                        ]) --}}

                        @include('atoms.forms.select2Field', [
                            'label' => 'Status',
                            'model' => $info,
                            'field' => 'page_status_id',
                            'option_key' => 'id',
                            'option_value' => 'title',
                            'data' => getPageStatus(),
                            'class' => 'single-select',
                            'placeholder' => 'Select Status',
                        ])

                        <input type="hidden" name="language_id" value="{{ $info->language_id }}">
                        <input type="hidden" name="parent_id" value="{{ $info->parent_id }}">
                        <input type="hidden" name="post_type" value="{{ request()->segment(1) }}">

                        <br>

                        <div class="col-12">
                            <button class="btn btn-primary px-5" id="save_btn">Save</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
@endsection


@push('scripts')
    <script>
        function save_request(form_id, btn_instance, method) {

            let _this = btn_instance;
            tinyMCE.triggerSave(true, true);

            return $.ajax({
                data: $('#' + form_id).serialize(),
                url: $('#' + form_id).attr('action'),
                type: method,
                dataType: 'json',
                statusCode: {
                    200: function() {
                        $(_this).show();
                    },
                    422: function(data) {
                        var form = $('#' + form_id);

                        jQuery('#' + form_id + ' .invalid-feedback').remove();
                        $('#' + form_id + ' .form-control').removeClass('is-invalid');

                        $.each(data.responseJSON.errors, function(key, value) {
                            if (form.find('[name="' + DotArrayToJs(key) + '"]').data('description') !=
                                undefined) {
                                form.find('[name="' + DotArrayToJs(key) + '"]').after(
                                    '<span class="invalid-feedback d-block" role="alert" style="order: 2;">' +
                                    '<strong>' + validation_message(value[0]) + '</strong>' +
                                    '</span>');
                            }else if (form.find('[name^="' + DotArrayToJs(key) + '"]').data('select') !=
                                undefined) {
                                form.find('[name^="' + DotArrayToJs(key) + '"]').after(
                                    '<span class="invalid-feedback d-block" role="alert" style="order: 4;">' +
                                    '<strong>' + validation_message(value[0]) + '</strong>' +
                                    '</span>');
                            } else {
                                form.find('[name="' + DotArrayToJs(key) + '"]').addClass('is-invalid');
                                form.find('[name="' + DotArrayToJs(key) + '"]').after(
                                    '<span class="invalid-feedback d-block" role="alert">' +
                                    '<strong>' + validation_message(value[0]) + '</strong>' +
                                    '</span>');
                            }
                        })
                        $(_this).prop('disabled', false);
                        Toastify({
                            text: 'Please check all the fields to proceed.',
                            duration: 2000,
                            position: "right",
                            gravity: "top",
                        }).showToast();
                    },
                    500: function(response) {
                        $(_this).prop('disabled', false);
                        Toastify({
                            text: response.responseJSON.message,
                            duration: 2000,
                            position: "right",
                            gravity: "top",
                        }).showToast();
                    }
                },
                beforeSend: function() {
                    $(_this).prop('disabled', true);
                    Pace.restart();
                },
                complete: function() {}
            });
        }

        function DotArrayToJs(str) {
            var splittedStr = str.split('.');
            return splittedStr.length == 1 ? str : (splittedStr[0] + '[' + splittedStr.splice(1).join('][') + ']');
        }

        function validation_message(value) {
            let message = value.split(".");
            if (message.length > 2) {
                return capitalizeFirstLetter(message[message.length - 2]).replace('_', ' ');
            }
            return message[0];
        }

        function capitalizeFirstLetter(str) {
            return str[0].toUpperCase() + str.slice(1);
        }

        $(document).ready(function() {

            $(document).on('select2:selecting', '#page_status_id', function(e) {
                var value = e.params.args.data.id;
                e.preventDefault();
                @if (isset($info->child_pages))
                    let message = "Changing the status will also change the child page as well";
                @else
                    let message = "Change the status will also change the parent page as well";
                @endif

                const swalWithBootstrapButtons = Swal.mixin({
                    customClass: {
                        confirmButton: 'btn btn-primary me-3',
                        cancelButton: 'btn btn-danger'
                    },
                    buttonsStyling: false
                })

                swalWithBootstrapButtons.fire({
                    title: 'Are you sure?',
                    text: message,
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, Change it!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        console.log(value);
                        $("#page_status_id").val(value).trigger('change');
                    }
                })

            })

            $('#save_btn').click(function(e) {
                e.preventDefault();
                save_request('frm_submit', this, 'PATCH').then(function(data) {
                    $(this).show();
                    $('#myModal').modal('toggle');
                    window.location.href = "{{ url('sessions') }}" + "?message=" + data.message +
                        "&route=" +
                        data.route;
                });
            });
        })
    </script>
@endpush
