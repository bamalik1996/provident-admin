@extends("layouts.app")


@section('wrapper')

    <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
        <div class="ps-3">
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
                <form action="" method="GET" class="w-75">
                    <div class="position-relative row">
                        <div class="align-self-end col-3">
                            <label class="form-label">
                                Search Listing
                            </label>
                            <div class="input-group">
                                <span class="input-group-text bx bx-search" id="basic-addon1"></span>
                                <input type="text" name="search" value="{{ request()->search }}" class="form-control ps-0" placeholder="Search {{ ucwords(str_replace('_', ' ', request()->segment(1))) }}">
                            </div>
                        </div>

                        <div class="col-3 align-self-end">
                            <input type="submit" class="btn btn-primary" value="Search">
                            <a class="btn btn-primary" style="margin-left: 5px" href="{{ route(request()->segment(1).'.index') }}">Reset</a>
                        </div>
                    </div>
                </form>
                @can(request()->segment(1).'.create')
                    <div class="ms-auto">
                        <a href="javascript:;" id="btn_add" class="btn btn-primary mt-2 mt-lg-0"
                            data-href="{{ route(request()->segment(1).'.store') }}">
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

                            <th>@sortablelink('created_at', 'Created Date')</th>
                            <th>@sortablelink('updated_at', 'Last Modify')</th>
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
                                <td>
                                    {{ $information->updated_at->toDayDateTimeString() }}
                                </td>
                                <td>
                                    <div class="d-flex order-actions">
                                        @can(request()->segment(1).'.edit')
                                            <a href="{{ route(request()->segment(1).'.edit', ['city' => $information->id]) }}"
                                                data-update-href="{{ route(request()->segment(1).'.update', ['city' => $information->id]) }}"
                                                class="btn_edit">
                                                <i class='bx bxs-edit'></i>
                                            </a>
                                        @endcan
                                        @can(request()->segment(1).'.delete')
                                            <a data-form-id="form-{{ $information->id }}" data-href="javascript:void"
                                                class="ms-3 delete-btn-modal">
                                                <i class='bx bxs-trash'></i>
                                            </a>
                                            <form id="form-{{ $information->id }}"
                                                action="{{ route(request()->segment(1).'.destroy', ['city' => $information->id]) }}" method="POST">
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
            </div>
        </div>
    </div>

    <div class="modal fade" id="myModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true" >
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <script></script>
                <form id="frm_submit" action="{{ route(request()->segment(1).'.store') }}"
                    method="post" enctype="multipart/form-data">
                    @include(request()->segment(1).'.components.create')
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="save_btn" data-method="PATCH" class="btn btn-danger">Update</button>
            </div>
          </div>
        </div>
    </div>


@endsection


@push('scripts')
    <script>
        function save_request(form_id, btn_instance,method) {

            let _this = btn_instance
            return $.ajax({
                data: $('#' + form_id).serialize(),
                url: $('#' + form_id).attr('action'),
                type: method,
                dataType: 'json',
                statusCode: {
                    200:function(){
                        $(_this).show();
                    },
                    422: function (data) {
                        var form = $('#' + form_id);

                        jQuery('#' + form_id + ' .invalid-feedback').remove();
                        $('#' + form_id + ' .form-control').removeClass('is-invalid');

                        $.each(data.responseJSON.errors, function (key, value) {
                            form.find('[name="' + DotArrayToJs(key) + '"]').addClass('is-invalid');
                            form.find('[name="' + DotArrayToJs(key) + '"]').after(
                                '<span class="invalid-feedback d-block" role="alert">' +
                                '<strong>' + validation_message(value[0]) + '</strong>' +
                                '</span>');
                        })
                        $(_this).show();
                        Toastify({
                            text: 'Please check all the fields to proceed.',
                            duration: 5000,
                            position: "right",
                            gravity: "top",
                        }).showToast();
                    },
                    500: function (response) {
                        Toastify({
                            text: response.responseJSON.message,
                            duration: 5000,
                            position: "right",
                            gravity: "top",
                        }).showToast();
                        $(_this).show();
                    }
                },
                beforeSend: function () {
                    $(_this).hide();
                    Pace.restart();
                },
                complete: function () {}
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

        $(document).ready(function(e) {

            $('#btn_add').click(function(e) {
                $('.modal-title').html('{{ ucwords(str_replace('_', ' ', request()->segment(1))) }} Add');
                $('#frm_submit').attr('action', $('#btn_add').data('href'));
                $("#frm_submit").trigger("reset");
                $('#frm_submit').data('message',"{{ ucwords(str_replace('_', ' ', request()->segment(1))) }} Data has been Added");
                $('#frm_submit .invalid-feedback').remove();
                $('#frm_submit .form-control').removeClass('is-invalid');
                $('#myModal').modal('toggle');
                $('#save_btn').html('Save');
                $('#save_btn').attr('data-method','POST');
            });

            $('#save_btn').click(function(e) {
                e.preventDefault();
                save_request('frm_submit', this,$('#save_btn').data('method')).then(function(data) {
                    $(this).show();
                    $('#myModal').modal('toggle');
                    window.location.href = "{{ url('sessions') }}"+"?message="+data.message+"&route="+data.route;
                });
            });

            $('.btn_edit').click(function(e) {
                e.preventDefault();
                $('.modal-title').html('{{ ucwords(str_replace('_', ' ', request()->segment(1))) }} Update');
                let update_href = $(this).data('update-href');
                $('#frm_submit').data('message',"{{ ucwords(str_replace('_', ' ', request()->segment(1))) }} Data has been Updated");
                $('#frm_submit .invalid-feedback').remove();
                $('#frm_submit .form-control').removeClass('is-invalid');
                $('#save_btn').html('Update');
                $('#save_btn').attr('data-method','PATCH');

                console.log($(this).attr('href'));

                $.ajax({
                    url: $(this).attr('href'),
                    type: "GET",
                    dataType: 'json',
                    success: function(data) {
                        $('#frm_submit').attr('action', update_href);
                        var form = $('#frm_submit');
                        $.each(data, function(key, value) {
                            form.find('[name="' + key + '"]').val(value);
                        });
                        $('#myModal').modal('toggle');
                    },
                    error: function(data) {},
                    beforeSend: function() {},
                    complete: function() {}
                });
            });
        });
    </script>
@endpush
