$(document).on('change', '#template_id', function () {
    tinymce.remove('#content');

    $.get("/pages/template", {
        id: this.value
    }, function (data) {
        $("#template-extra-fields").html(data);
        tinymce.init({
            selector: '#content'
        });
    }).fail(function (data) {
        jQuery(".page-template-fields").html("");
    });
});

$.ajaxSetup({
    headers: {
        "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content"),
    },
});

$("body").on("change", ".media-upload-image", function (e) {
    var file_data = $(this).prop("files")[0];
    var form_data = new FormData();
    form_data.append("file", file_data);
    form_data.append('page_id', jQuery('#page_id').val())
    var _this = jQuery(this);
    $.ajax({
        url: "/media/upload", // <-- point to server-side PHP script
        cache: false,
        contentType: false,
        processData: false,
        data: form_data,
        type: "post",
        success: function (php_script_response) {
            console.log("php_script_response", php_script_response)
            let url = php_script_response.data.data.url;
            let id = php_script_response.data.data.id;
            let page_id = php_script_response.data.data.page_id;
            jQuery('#page_id').val(page_id)
            _this.next().remove();

            _this.val('');
            jQuery('[name="' + _this.data("bind") + '"]').val(id);
            _this.after(
                '<div class="preview-image-body"><span class="upload-image-remove" data-image-id="' + id + '"><i class="anticon anticon-close-circle"></i></span><img src="' +
                url +
                '"  class="img-thumbnail mt-2" style=" width: 200px; height: 200px;object-fit: contain; "/></div>'
            );
        },
    });
})

$(document).on('click', '.insert-edit-link-modal', function () {
    jQuery('.insert-edit-link-modal').removeClass("insert-edit-link-open")
    jQuery(this).addClass("insert-edit-link-open")
    $('#staticBackdrop').modal('show')
})

function getFormData($form) {
    var unindexed_array = $form.serializeArray();
    var indexed_array = {};

    $.map(unindexed_array, function (n, i) {
        indexed_array[n["name"]] = n["value"];
    });
    return indexed_array;
}

$(document).on('show.bs.modal', '#staticBackdrop', function () {
    var _this = jQuery('.insert-edit-link-open')
    jQuery('#insert-edit-link')[0].reset()
    var _data = _this.attr("data-value");

    $('#insert-edit-link .invalid-feedback').remove();
    $('#insert-edit-link .form-control').removeClass('is-invalid');

    if (_data) {
        try {
            if (typeof _data == 'string') {
                _data = JSON.parse(_data)
            }
            $("#staticBackdrop").find("#insert-edit-link").find("#anchor_title").val(_data.title);
            $("#staticBackdrop").find("#insert-edit-link").find("#anchor_link").val(_data.link);
            $("#staticBackdrop").find("#insert-edit-link").find("#anchor_target").prop("checked", _data.target == "on" ? true : false);
            $("#staticBackdrop").find("#insert-edit-link").find("#anchor_nofollow").prop("checked", _data.follow == "on" ? true : false);
        } catch (err) {}
    }
})

$(document).on('click', '#add-link', function () {
    var _this = jQuery('#staticBackdrop')
    var fieldName = jQuery('.insert-edit-link-open').attr('data-name');

    $('#insert-edit-link .invalid-feedback').remove();
    $('#insert-edit-link .form-control').removeClass('is-invalid');

    validation_check = false;

    if (_this.find("#insert-edit-link").find('[name="title"]').val() == "") {
        _this.find("#insert-edit-link").find('[name="title"]').addClass('is-invalid');
        _this.find("#insert-edit-link").find('[name="title"]').after(`<span class="invalid-feedback d-block" role="alert">
                                                                        <strong>Title is Required</strong>
                                                                      </span>`);
        validation_check = true;
    }

    if (_this.find("#insert-edit-link").find('[name="link"]').val() == "") {
        _this.find("#insert-edit-link").find('[name="link"]').addClass('is-invalid');
        _this.find("#insert-edit-link").find('[name="link"]').after(`<span class="invalid-feedback d-block" role="alert">
                                                                        <strong>Link is Required</strong>
                                                                      </span>`);
        validation_check = true;
    }

    if (validation_check) {
        return false;
    }

    var formDataTarget = JSON.stringify(getFormData(_this.find("#insert-edit-link")));
    jQuery('[name="' + fieldName + '"]').val(formDataTarget);
    jQuery('.insert-edit-link-open').attr('data-value', formDataTarget);
    jQuery('#insert-edit-link')[0].reset();
    $('#staticBackdrop').modal('hide');
    jQuery('.insert-edit-link-modal').removeClass("insert-edit-link-open");
})


jQuery(function () {
    $(document).on('click', '.btn_delete', function () {

        Swal.fire({
            title: 'Are you sure?',
            text: "You won't be able to revert this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = $(this).data('href');
            }
        })

    })
});



jQuery('.form-check-input').change(function () {
    if ($(this).prop("checked") == true) {
        jQuery(this).parent().addClass('checked')
    } else if ($(this).prop("checked") == false) {
        jQuery(this).parent().removeClass('checked')
    }
});

jQuery('.form-check-input').change(function () {
    var id = jQuery(this).attr('id');
    jQuery('[data-switch-show="' + id + '"]').removeClass('d-none');
    if ($(this).prop("checked") == true) {

        jQuery('[data-switch-show="' + id + '"]').slideDown();
    } else if ($(this).prop("checked") == false) {
        jQuery('[data-switch-show="' + id + '"]').slideUp();
    }
});

jQuery('.delete-btn-modal').click(function () {
    var formID = jQuery(this).data('form-id')

    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-primary me-3',
            cancelButton: 'btn btn-danger'
        },
        buttonsStyling: false
    })

    swalWithBootstrapButtons.fire({
        title: 'Are you sure?',
        text: "You won't be able to revert this!",
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

$(".delete-image").click(function () {
    var _this = jQuery(this)
    $.ajax({
        url: url + "/media/delete",
        data: {
            media_id: _this.data('media-id')
        },
        success: function (result) {
            jQuery(_this).parent().remove()
        }
    });
});

var i = 0;

// jQuery.each(jQuery('[data-city-id]'), function () {
//     var input = jQuery(this).parent().find("[data-input-select]")[0]
//     var _city_select = $("#" + jQuery(this).data('city-id'));
//     var input_city = $("#" + jQuery(this).data('city-id')).parent().find("[data-input-select]")[0]
//     var cityInst = $("#" + jQuery(this).data('city-id')).mobiscroll().select({
//         touchUi: false,
//         disabled: true,
//         inputElement: input_city,
//         display: 'anchored',
//         filter: true,
//         onOpen: function (event, inst) {
//             $('.mbsc-scroller-wheel-item *').each(function () {
//                 var text = $(this).text();
//                 text = text.replace(/TRIAL/g, "");
//                 $(this).text(text);
//             });
//         },
//         // onChange: function (event, inst) {
//         //     _city_select.html('<option value="' + (event.value) + '" selected></option>')
//         // }

//     }).mobiscroll('getInst')


//     var _state = jQuery(this).mobiscroll().select({
//         touchUi: false,
//         inputElement: input,
//         display: 'anchored',
//         filter: true,
//         onOpen: function (event, inst) {
//             $('.mbsc-scroller-wheel-item *').each(function () {
//                 var text = $(this).text();
//                 text = text.replace(/TRIAL/g, "");
//                 $(this).text(text);
//             });
//         },
//         onChange: function (event, inst) {
//             cityInst.setTempVal('');
//             $.get(url + "/cities/state/" + event.value, function (data, status) {
//                 cityInst.setOptions({
//                     data: data,
//                     disabled: false,

//                 });

//             });

//             if(_city_select.data('default-selected')){
//                 cityInst.setTempVal(_city_select.data('default-selected'))
//             }
//         }
//     }).mobiscroll('getInst');

//     _state.setTempVal(jQuery(this).val())

//     i++;
// })
jQuery('.slug-edit').click(function () {
    jQuery('.slug-default').toggle()
    jQuery('.slug-editable').toggle()
})
jQuery('#slug-save').click(function () {
    var slug = jQuery('#slug_field').val()
    var model = jQuery('#model_field').val()
    var model_id = jQuery('#model_field_id').val()
    jQuery('.slug-error-message').remove()
    $.ajax({
        url: url + "/slug/generate",
        data: {
            slug: slug,
            model: model,
            model_id: model_id
        },
        success: function (result) {
            jQuery('#slug_field').val(result.slug)
            jQuery('#slug-field').html(result.slug)
            jQuery('#slug').val(result.slug)
            jQuery('.slug-default').toggle()
            jQuery('.slug-editable').toggle()
        },
        error: function (xhr, status, error) {

            let _message = xhr.responseJSON.message;
            let _slug = xhr.responseJSON.slug;
            jQuery('.slug-editable').append('<span class="slug-error-message d-block text-danger">'+_message+' Suggest: '+_slug+' etc</span>')

        }
    });
})
