@extends("layouts.app")


@section('wrapper')

    @php
        $info = [];
    @endphp

    <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
        <div class="">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 p-0">
                    <li class="breadcrumb-item"><a href="{{ url('/') }}">Dashboard</a></li>
                    <li class="breadcrumb-item active" aria-current="page">{{ ucwords(str_replace('_', ' ', request()->segment(1))) }}</li>
                </ol>
            </nav>
        </div>
    </div>

    <div class="row">
        <div class="col-md-9">
            <div class="card">
                <div class="card-body">
                    <div class="card-title d-flex align-items-center">
                        <h5 class="mb-0 text-primary">{{ ucwords(str_replace('_', ' ', request()->segment(1))) }}</h5>
                    </div>
                    <hr>
                    <form id="frm_submit" class="row g-3" action="{{ route(request()->segment(1).'.store') }}" method="POST">
                        @csrf
                        @include(request()->segment(1).'.components.basic')
                    </form>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card">
                <div class="card-body">
                    <div class="card-title d-flex align-items-center">
                        <h5 class="mb-0 text-primary">Actions</h5>
                    </div>
                    <hr>
                    <div class="col-12">
                        @can('theme.settings.edit')
                           <button  class="btn btn-primary px-5" id="save_btn">Save</button>
                        @endcan
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection


@push('scripts')

<script>

function save_request(form_id, btn_instance,method) {

    let _this = btn_instance;
    tinyMCE.triggerSave(true, true);

    return $.ajax({
        data: $('#' + form_id).serialize(),
        url: $('#' + form_id).attr('action'),
        type: method,
        dataType: 'json',
        statusCode: {
            200:function(){
                $(_this).prop('disabled', false);
                jQuery('#' + form_id + ' .invalid-feedback').remove();
                $('#' + form_id + ' .form-control').removeClass('is-invalid');
            },
            422: function (data) {
                var form = $('#' + form_id);

                jQuery('#' + form_id + ' .invalid-feedback').remove();
                $('#' + form_id + ' .form-control').removeClass('is-invalid');

                $.each(data.responseJSON.errors, function (key, value) {
                    if (form.find('[name="' + DotArrayToJs(key) + '"]').data('description') != undefined) {
                            form.find('[name="' + DotArrayToJs(key) + '"]').after(
                                '<span class="invalid-feedback d-block" role="alert" style="order: 2;">' +
                                '<strong>' + validation_message(value[0]) + '</strong>' +
                                '</span>');
                    }else{
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
                    duration: 5000,
                    position: "right",
                    gravity: "top",
                }).showToast();
            },
            500: function (response) {
                $(_this).prop('disabled', false);
                Toastify({
                    text: response.responseJSON.message,
                    duration: 5000,
                    position: "right",
                    gravity: "top",
                }).showToast();
            }
        },
        beforeSend: function () {
            $(_this).prop('disabled', true);
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

$('#save_btn').click(function(e) {
    e.preventDefault();
    save_request('frm_submit', this,'POST').then(function(data) {
        $(this).show();
        Toastify({
            text: 'Theme Settings has been Updated',
            duration: 5000,
            position: "right",
            gravity: "top",
            style: {
                background: "linear-gradient(to right, #00b09b, #96c93d)",
            },
        }).showToast();
    });
});

</script>

@endpush
