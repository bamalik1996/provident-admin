@extends("layouts.app")


@section('wrapper')

    <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
        <div class="">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 p-0">
                    <li class="breadcrumb-item"><a href="{{ url('/') }}">Dashboard</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Update {{ ucwords(str_replace('_', ' ', request()->segment(1))) }}</li>
                </ol>
            </nav>
        </div>
    </div>

    <div class="row">
        <div class="col-md-9">
            <div class="card">
                <div class="card-body">
                    <div class="card-title d-flex align-items-center">
                        <h5 class="mb-0 text-primary">Update {{ ucwords(str_replace('_', ' ', request()->segment(1))) }}</h5>
                    </div>
                    <hr>
                    <form id="frm_submit" class="row g-3" action="{{ route(request()->segment(1).'.update',[substr_replace(request()->segment(1), "", -1)=>$info->id]) }}" method="PATCH">
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
                        <button  class="btn btn-primary px-5" id="save_btn">Update</button>
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
                $(_this).show();
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

$('#save_btn').click(function(e) {
    e.preventDefault();
    save_request('frm_submit', this,'PATCH').then(function(data) {
        $(this).show();
        $('#myModal').modal('toggle');
        window.location.href = "{{ url('sessions') }}"+"?message="+data.message+"&route="+data.route;
    });
});

</script>

@endpush
