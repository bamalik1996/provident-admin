var paginate = 1;

$("#mediaLibraryList form").submit(function (event) {
    let search = jQuery('#media_search').val();
    let file_type = jQuery('#file_type').val();

    let _default_file_type = []
    if (jQuery('#mediaLibraryList').attr('data-default-file-type')) {
        _default_file_type = jQuery('#mediaLibraryList').attr('data-default-file-type').split(',');
    }
    paginate = 1;
    $.ajax({
            url: '/media?page=' + paginate,
            type: 'GET',
            data: {
                search_media: search,
                file_type: file_type,
                defaultSelectMedia: jQuery('#mediaLibraryList').attr('data-default-media').split(','),
                default_file_type: _default_file_type
            },
            datatype: 'html',
            beforeSend: function () {
                $('.loading').show();
            }
        })
        .done(function (data) {
            if (data.length == 0) {
                $('#media-list').html('<div class="col-md-12 mb-5 mt-5 text-center"><h3>No more media.</h3></div>');
                return;
            } else {
                $('#media-list').html(data.html);
            }
            defaultMediaSelect()
        })
        .fail(function (jqXHR, ajaxOptions, thrownError) {
            alert('Something went wrong.');
        });
    jQuery("#media-attachment-sticky .card-body").html('')
    event.preventDefault();
});

if (window.location.pathname == '/media') {
    loadMoreData(paginate);
}

const pathArray = window.location.pathname.split("/");

if (pathArray && pathArray.length > 0 && pathArray[1] == 'media') {
    $(window).scroll(function () {
        if ($(window).scrollTop() + $(window).height() >= $(document).height()) {
            paginate++;
            loadMoreData(paginate);
        }
    });
}


$('.modal-body').scroll(function () {
    if ($(this).scrollTop() + $(this).innerHeight() >= this.scrollHeight) {
        paginate++;
        loadMoreData(paginate);
    }
});
// run function when user reaches to end of the page
function loadMoreData(paginate) {
    let search = jQuery('#media_search').val();
    let file_type = jQuery('#file_type').val();


    let _default_media_id = []
    if (jQuery('#mediaLibraryList').attr('data-default-media')) {
        _default_media_id = jQuery('#mediaLibraryList').attr('data-default-media').split(',');
    }


    let _default_file_type = []
    if (jQuery('#mediaLibraryList').attr('data-default-file-type')) {
        _default_file_type = jQuery('#mediaLibraryList').attr('data-default-file-type').split(',');
    }

    $.ajax({
            url: '/media?page=' + paginate,
            type: 'get',
            data: {
                search_media: search,
                file_type: file_type,
                defaultSelectMedia: _default_media_id,
                default_file_type: _default_file_type
            },
            datatype: 'html',
            beforeSend: function () {
                $('.loading').show();
            }
        })
        .done(function (data) {
            $('#media-list').append(data.html);
            defaultMediaSelect()
        })
        .fail(function (jqXHR, ajaxOptions, thrownError) {
            alert('Something went wrong.');
        });
}




$("#media_files").change(function (e) {
    //We need to send dropped files to Server
    if (jQuery('#mediaLibraryList').hasClass('single-file-select') && $('#media_files')[0].files.length > 1) {
        alert('Can\'t upload more then one file')
    } else {
        //We need to send dropped files to Server
        handleFileUpload($('#media_files')[0].files, jQuery('#media-upload-list'));
    }

    $("#media_files").val('')
});

function sendFileToServer(formData, status, index) {
    var uploadURL = "/media"; //Upload URL
    var extraData = {}; //Extra Data.

    var _defaultType = jQuery('#mediaLibraryList').attr('data-default-file-type');
    if (_defaultType) {
        formData.append('_defaultType', _defaultType)
    }

    var singeFile = formData.get('file')
    var checkFileType = true;
    if (_defaultType) {
        checkFileType = _defaultType.split(',').indexOf(singeFile.name.split('.').pop().toLowerCase()) !== -1;
    }
    console.log("singeFile.size", checkFileType)
    var checkFileSize = true;
    var _defaultSize = jQuery('#mediaLibraryList').attr('data-default-file-size');

    if (_defaultSize) {
        checkFileSize = Math.round(singeFile.size / (1024 * 1024)) <= parseInt(_defaultSize);
    }

    if (checkFileType && checkFileSize) {
        var jqXHR = $.ajax({
            xhr: function () {
                var xhrobj = $.ajaxSettings.xhr();
                if (xhrobj.upload) {
                    xhrobj.upload.addEventListener('progress', function (event) {
                        var percent = 0;
                        var position = event.loaded || event.position;
                        var total = event.total;
                        if (event.lengthComputable) {
                            percent = Math.ceil(position / total * 100);
                        }
                        //Set progress
                        status.setProgress(percent);
                    }, false);
                }
                return xhrobj;
            },
            url: uploadURL,
            type: "POST",
            contentType: false,
            processData: false,
            cache: false,
            data: formData,
            error: function (error) {
                if (error.responseJSON && error.responseJSON.message) {
                    var fileItemStatus = jQuery('.status-single-file-' + (index + 1))
                    fileItemStatus.addClass('file-error-status')
                    fileItemStatus.find('.progressBar').remove()
                    fileItemStatus.find('.abort').remove()
                    fileItemStatus.find('.filename').after('<div class="file-type-error">' + error.responseJSON.message + '</div>')
                }

            },
            success: function (data) {
                status.setProgress(100);
                $("#status1").removeClass('alert-danger')
                $("#status1").html("File upload Done<br>");
                $("#status1").addClass('alert alert-success')

                if (jQuery('#mediaLibraryList').hasClass('single-file-select')) {
                    jQuery('.media-select').removeClass('media-select')
                }

                jQuery('#media-list').prepend(data.data.data.html)
                var _ids = [];
                jQuery(jQuery('#mediaLibraryList .media-select>div')).each(function () {
                    let _media = jQuery(this).parent().data('media-item');
                    _ids.push(_media.id);
                });
                jQuery('#mediaLibraryList').attr('data-default-media', _ids.join(','))

            }
        });
        status.setAbort(jqXHR);
    } else {
        console.log("(index + 1)", (index + 1))
        if (!checkFileType) {
            var fileItemStatus = jQuery('.status-single-file-' + (index + 1))
            fileItemStatus.addClass('file-error-status')
            fileItemStatus.find('.progressBar').remove()
            fileItemStatus.find('.abort').remove()
            fileItemStatus.find('.filename').after('<div class="file-type-error">Please select file type ' + _defaultType + '</div>')
        }

        if (!checkFileSize) {
            var fileItemStatus = jQuery('.status-single-file-' + (index + 1))
            fileItemStatus.addClass('file-error-status')
            fileItemStatus.find('.progressBar').remove()
            fileItemStatus.find('.abort').remove()
            fileItemStatus.find('.filename').after('<div class="file-type-error">Please select file size less than ' + parseInt(_defaultSize) + ' MB</div>')
        }

        jQuery('.status-single-file-' + (index + 1)).removeClass('status-single-file-' + (index + 1))
    }


}

var rowCount = 0;

function createStatusbar(obj) {
    rowCount++;
    var row = "odd";
    if (rowCount % 2 == 0) row = "even";
    this.statusbar = $("<li class='statusbar list-group-item d-flex justify-content-between status-single-file-" + rowCount + ' ' + row + "'></li>");
    this.filename = $("<div class='filename'></div>").appendTo(this.statusbar);
    this.size = $("<div class='filesize'></div>").appendTo(this.statusbar);
    this.progressBar = $("<div class='progressBar'><div></div></div>").appendTo(this.statusbar);
    this.abort = $("<div class='abort'>Abort</div>").appendTo(this.statusbar);
    obj.append(this.statusbar);

    this.setFileNameSize = function (name, size) {
        var sizeStr = "";
        var sizeKB = size / 1024;
        if (parseInt(sizeKB) > 1024) {
            var sizeMB = sizeKB / 1024;
            sizeStr = sizeMB.toFixed(2) + " MB";
        } else {
            sizeStr = sizeKB.toFixed(2) + " KB";
        }

        this.filename.html(name);
        this.size.html(sizeStr);
    }
    this.setProgress = function (progress) {
        var progressBarWidth = progress * this.progressBar.width() / 100;
        this.progressBar.find('div').animate({
            width: progressBarWidth
        }, 10).html(progress + "% ");
        if (parseInt(progress) >= 100) {
            this.abort.hide();
        }
    }
    this.setAbort = function (jqxhr) {
        var sb = this.statusbar;
        this.abort.click(function () {

            jqxhr.abort();
            sb.remove();
        });
    }
}

function handleFileUpload(files, obj) {
    rowCount = 0;
    for (var i = 0; i < files.length; i++) {
        var fd = new FormData();
        fd.append('file', files[i]);

        var status = new createStatusbar(obj); //Using this we can set progress.
        status.setFileNameSize(files[i].name, files[i].size);
        sendFileToServer(fd, status, i);

    }
}

$(document).ready(function () {
    var obj = $("#dragandrophandler");
    obj.on('dragenter', function (e) {
        e.stopPropagation();
        e.preventDefault();
        $(this).css('border', '2px solid #0B85A1');
    });
    obj.on('dragover', function (e) {
        e.stopPropagation();
        e.preventDefault();
    });
    obj.on('drop', function (e) {

        $(this).css('border', '2px dotted #0B85A1');
        e.preventDefault();
        var files = e.originalEvent.dataTransfer.files;

        if (jQuery('#mediaLibraryList').hasClass('single-file-select') && files.length > 1) {
            alert('Can\'t upload more then one file')
        } else {
            //We need to send dropped files to Server
            handleFileUpload(files, jQuery('#media-upload-list'));
        }

    });
    $(document).on('dragenter', function (e) {
        e.stopPropagation();
        e.preventDefault();
    });
    $(document).on('dragover', function (e) {
        e.stopPropagation();
        e.preventDefault();
        obj.css('border', '2px dotted #0B85A1');
    });
    $(document).on('drop', function (e) {
        e.stopPropagation();
        e.preventDefault();
    });

});

function onlyUnique(value, index, self) {
    return self.indexOf(value) === index;
}

/**
 * Manually Media library modal open
 */
jQuery(document).on('click', '.mediaLibraryList', function () {
    jQuery('#media-list').html('')

    var myModal = new bootstrap.Modal(document.getElementById('mediaLibraryList'), {
        keyboard: false
    })

    jQuery('#mediaLibraryList').removeClass('multiple-file-select');
    jQuery('#mediaLibraryList').removeClass('single-file-select');

    if (jQuery(this).data('multiple-select') == 'true' || jQuery(this).data('multiple-select') == true) {
        jQuery('#mediaLibraryList').addClass('multiple-file-select');
    } else {
        jQuery('#mediaLibraryList').addClass('single-file-select');
    }

    jQuery('#mediaLibraryList').attr('data-modal-body-id', jQuery(this).parent().attr('id'))

    jQuery('#mediaLibraryList').attr('data-default-media', jQuery('#' + jQuery(this).parent().attr('id')).find('.field_name').val())
    jQuery('#mediaLibraryList').attr('data-default-file-type', jQuery(this).attr('data-file-type'))
    jQuery('#mediaLibraryList').attr('data-default-file-size', jQuery(this).attr('data-file-size'))
    paginate = 1;
    loadMoreData(paginate)
    myModal.show()
    var a = new StickySidebar('#media-attachment-sticky', {
        topSpacing: 100,
        containerSelector: '#media-list-body',
        innerWrapperSelector: '.sticky-top',
        scrollContainer: '.modal-body'

    });
})


/**
 * Multiple files selection
 */
jQuery(document).on('click', '.multiple-file-select #media-list > div', function () {
    jQuery(this).toggleClass('media-select')


    jQuery("#media-attachment-sticky .card-body").html('')
    $(this).clone().appendTo("#media-attachment-sticky .card-body")
    jQuery("#media-attachment-sticky .card-body").find('*').removeClass('d-none')

    var _ids = [];

    jQuery(jQuery('#media-list .media-select>div')).each(function () {
        let _media = jQuery(this).parent().data('media-item');
        _ids.push(parseInt(_media.id));
    });

    if (_ids.length > 1) {
        jQuery('#bulk-media-delete').fadeIn()
    } else {
        jQuery('#bulk-media-delete').fadeOut()
    }

    if (jQuery('#mediaLibraryList').attr('data-default-media')) {

        var _current_selection = jQuery(this).data('media-item');
        var _media_item_default = jQuery('#mediaLibraryList').attr('data-default-media').split(',');
        _media_item_default = _media_item_default.map(str => {
            return parseInt(str);
        }).filter(function (item) {
            return item !== _current_selection.id;
        })
        _ids = [..._media_item_default, ..._ids]
    }
    _ids = _ids.filter(onlyUnique)
    jQuery('#mediaLibraryList').attr('data-default-media', _ids.join(','))
})


/**
 * Single file selection
 */
jQuery(document).on('click', '.single-file-select #media-list > div', function () {

    var is_select = jQuery(this).hasClass('media-select');
    jQuery('.media-select').removeClass('media-select')

    jQuery("#media-attachment-sticky .card-body").html('')
    $(this).clone().appendTo("#media-attachment-sticky .card-body")
    jQuery("#media-attachment-sticky .card-body").find('*').removeClass('d-none')

    if (is_select) {
        jQuery(this).removeClass('media-select')
    } else {
        jQuery(this).addClass('media-select')
    }

    var _ids = [];
    jQuery(jQuery('#mediaLibraryList .media-select>div')).each(function () {
        let _media = jQuery(this).parent().data('media-item');
        _ids.push(_media.id);
    });
    jQuery('#mediaLibraryList').attr('data-default-media', _ids.join(','))
})




/**
 * Get Selection file object and ids
 */


jQuery('#media-seletez').click(function () {
    var _modal_id = jQuery('#mediaLibraryList').attr('data-modal-body-id')

    var _media_selection = jQuery('#mediaLibraryList').attr('data-default-media');
    jQuery('#' + _modal_id).find('.field_name').val(_media_selection);
    jQuery('*').removeClass('media-select')
    jQuery('#file_type,#media_search').val('');
    var myModalEl = document.getElementById('mediaLibraryList')
    var modal = bootstrap.Modal.getInstance(myModalEl)
    modal.hide()

    if (_media_selection) {

        _media_selection = _media_selection.split(',')
        $.ajax({
            url: '/media/get/ids',
            type: 'POST',
            data: {
                ids: _media_selection
            },
            beforeSend: function () {
                Pace.restart();
            },
            success: function (result) {
                if (result) {
                    jQuery('#' + _modal_id).closest('.card').find('.card-body .row').html(result.data.data.html)
                    new Sortable(jQuery('#' + _modal_id).closest('.card').find('.card-body .row')[0], {
                        animation: 150,
                        onEnd: function (evt) {
                            var _ids = [];
                            jQuery(jQuery('#' + _modal_id).closest('.card').find('.card-body .row > div')).each(function () {
                                let _media = jQuery(this).data('media-item');
                                _ids.push(_media.id);
                            });
                            jQuery('#' + _modal_id).find('.field_name').val(_ids.join(','));
                            hiddenInputCreate()
                        }
                    });
                }
            }
        })

    } else {
        jQuery('#' + _modal_id).closest('.card').find('.card-body .row').html('')
    }
    hiddenInputCreate()

})


function defaultMediaSelect() {
    var _selected_ids = jQuery('#mediaLibraryList').attr('data-default-media');
    if (_selected_ids) {
        var _media_item_ids = _selected_ids.split(',');
        for (let index = 0; index < _media_item_ids.length; index++) {
            const id = _media_item_ids[index];
            jQuery('#mediaLibraryList [data-media-id="media_item_' + id + '"]').parent().addClass('media-select').addClass('default-media-select')

        }
    }
}

/**
 * Modal Show and remove file type
 */
var myModalEl = document.getElementById('mediaLibraryList')
if (myModalEl) {
    myModalEl.addEventListener('show.bs.modal', function (event) {
        jQuery("#media-attachment-sticky .card-body").html('')

        jQuery('select#file_type > option').show();
        let default_file_type = jQuery('#mediaLibraryList').attr('data-default-file-type');
        jQuery('#mediaLibraryList').find('.file-only').remove()
        if (default_file_type) {
            jQuery('#mediaLibraryList').find('.media-file-info').append('<div class="file-only">Only upload ' + default_file_type + '</div>');
            jQuery('select#file_type > option:first-child~option').hide();
            default_file_type = default_file_type.split(',');
            for (let index = 0; index < default_file_type.length; index++) {
                const element = default_file_type[index];
                jQuery('select#file_type > option[value="' + element + '"]').show();

            }
        }
        defaultMediaSelect()
        jQuery('#media-upload-list').html('');
        $("#status1").hide()
        const someTabTriggerEl = document.querySelector('#list-media-tab')
        const tab = new bootstrap.Tab(someTabTriggerEl)
        tab.show()
        // jQuery('#mediaLibraryList .default-media-select').css("order", -1)
    })
}




jQuery(jQuery('.multi-media-select-true #selected-media-card > .row')).each(function () {
    var _modal_id = jQuery(this).closest('.media-library-body').find('.media-library').attr('id');
    new Sortable(jQuery(this)[0], {
        animation: 150,
        onEnd: function (evt) {
            var _ids = [];
            jQuery(jQuery('#' + _modal_id).closest('.card').find('.card-body .row > div')).each(function () {
                let _media = jQuery(this).data('media-item');
                _ids.push(_media.id);
            });
            jQuery('#' + _modal_id).find('.field_name').val(_ids.join(','));
            hiddenInputCreate()
        }
    });
});

hiddenInputCreate()

function hiddenInputCreate() {
    jQuery(jQuery('.multi-media-select-true .media-library')).each(function () {
        var _this = jQuery(this);
        _this.find('.input-hidden-fields').html('');
        var _ids = jQuery(this).find('.field_name').val().split(',');
        var _field_name = jQuery(this).find('.field_name').attr('data-name');
        if (_ids.length > 0) {
            for (let index = 0; index < _ids.length; index++) {
                const element = _ids[index];
                _this.find('.input-hidden-fields').append('<input type="hidden" value="' + element + '" name="' + _field_name + '[]"/>');
            }
        }

    });

}
var singleMediaModal = null
if (document.getElementById('staticSingleMedia')) {
    singleMediaModal = new bootstrap.Modal(document.getElementById('staticSingleMedia'), {
        keyboard: false
    })

}


/**
 * Single media Delete
 */
jQuery(document).on('click', '.media-modal-delete', function () {
    var _this = jQuery(this)
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

            $.ajax({
                url: _this.attr('data-href'),
                type: 'DELETE',
                success: function (result) {
                    if (result) {
                        let media_id = result.data.data.id
                        var _media_delete_object = jQuery('#media-card-body [data-media-col-id="media-item-' + media_id + '"]')


                        Toastify({
                            text: "Media Delete Successfully",
                            duration: 5000,
                            style: {
                                background: "linear-gradient(135deg,#4caf50,#8bc34a)",
                            }
                        }).showToast();



                        var _next_media = _media_delete_object.next();
                        var _prev_media = _media_delete_object.prev();

                        if (_next_media.length == 1) {

                            var _media_object = JSON.parse(_next_media.attr('data-media-item'));
                            var _media_id = _media_object.id;
                            getSingleMediaForModalNextPrevious(_media_id)

                        } else if (_prev_media.length == 1) {

                            var _media_object = JSON.parse(_prev_media.attr('data-media-item'));
                            var _media_id = _media_object.id;
                            getSingleMediaForModalNextPrevious(_media_id)
                        } else {
                            singleMediaModal.hide()
                        }

                        _media_delete_object.remove();

                    }
                }
            });

        }
    })
});


/**
 * Bulk media Delete
 */
jQuery(document).on('click', '#bulk-media-delete a', function () {
    var _this = jQuery(this)

    var media_ids = [];
    jQuery(jQuery('#media-list .media-select>div')).each(function () {
        let _media = jQuery(this).parent().data('media-item');
        media_ids.push(_media.id);
    });

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

            $.ajax({
                url: '/media/bulk/delete',
                type: 'DELETE',
                data: {
                    ids: media_ids
                },
                success: function (result) {
                    if (result) {
                        for (let index = 0; index < media_ids.length; index++) {
                            const element = media_ids[index];
                            jQuery('[data-media-col-id="media-item-' + element + '"]').remove();

                            jQuery('#mediaLibraryList').attr('data-default-media', '');
                        }
                    }

                    Toastify({
                        text: "Media Delete successfully.",
                        duration: 5000,
                        style: {
                            background: "linear-gradient(135deg,#4caf50,#8bc34a)",
                        }
                    }).showToast();

                    if (jQuery('.media-list-page #media-list > .media-select').length > 0) {
                        jQuery('#bulk-media-delete a').removeClass('disabled');
                    } else {
                        jQuery('#bulk-media-delete a').addClass('disabled');

                    }
                    jQuery('#bulk-unselection-all a').addClass('disabled');

                }
            });

        }
    })
});

/**
 *
 * Media Page Listing
 */

/**
 * Bulk Delete Media Listing Page
 */

jQuery('#bulk-select,#bulk-selection-cancel').click(function () {
    jQuery('#media-card-body').toggleClass('media-list-page')
    if (jQuery('#media-card-body').hasClass('media-list-page')) {
        jQuery('.media-page-filter').hide();
        jQuery('.after-bulk-selection').show();
    } else {
        jQuery('.after-bulk-selection').hide();
        jQuery('.media-page-filter').show();
        jQuery('#media-list > div').removeClass('media-select');
    }
    jQuery('#bulk-media-delete a').addClass('disabled');
    jQuery('#bulk-unselection-all a').addClass('disabled');

});

jQuery(document).on('click', '.media-list-page #media-list > div', function () {
    jQuery(this).toggleClass('media-select')
    if (jQuery('.media-list-page #media-list > .media-select').length > 0) {
        jQuery('#bulk-media-delete a').removeClass('disabled');
        jQuery('#bulk-unselection-all a').removeClass('disabled');

    } else {
        jQuery('#bulk-media-delete a').addClass('disabled');
        jQuery('#bulk-unselection-all a').addClass('disabled');

    }
})

jQuery('#bulk-selection-all a').click(function () {
    jQuery('.media-list-page #media-list > div').addClass('media-select')

    if (jQuery('.media-list-page #media-list > .media-select').length > 0) {
        jQuery('#bulk-media-delete a').removeClass('disabled');
        jQuery('#bulk-unselection-all a').removeClass('disabled');

    } else {
        jQuery('#bulk-media-delete a').addClass('disabled');
        jQuery('#bulk-unselection-all a').addClass('disabled');

    }
});

jQuery('#bulk-unselection-all a').click(function () {
    jQuery('.media-list-page #media-list > div').removeClass('media-select')
    jQuery('#bulk-unselection-all a').addClass('disabled');
    jQuery('#bulk-media-delete a').addClass('disabled');

});

jQuery(document).on('click', '.card:not(.media-list-page) #media-list >div', function () {

    jQuery(this).addClass('media-open-modal');

    var _media_object = JSON.parse(jQuery(this).attr('data-media-item'));
    var _media_id = _media_object.id;

    getSingleMediaForModalNextPrevious(_media_id)

    singleMediaModal.show()
})

jQuery('#next-media-modal').click(function () {
    var _this = jQuery('.media-open-modal').next()
    jQuery('.card:not(.media-list-page) #media-list >div').removeClass('media-open-modal');
    var _media_object = JSON.parse(_this.attr('data-media-item'));
    _this.addClass('media-open-modal');
    var _media_id = _media_object.id;
    getSingleMediaForModalNextPrevious(_media_id)

});

jQuery('#previous-media-modal').click(function () {
    var _this = jQuery('.media-open-modal').prev()
    jQuery('.card:not(.media-list-page) #media-list >div').removeClass('media-open-modal');
    var _media_object = JSON.parse(_this.attr('data-media-item'));
    _this.addClass('media-open-modal');
    var _media_id = _media_object.id;
    getSingleMediaForModalNextPrevious(_media_id)

});

function getSingleMediaForModal(_media_id) {
    $.ajax({
        url: "/media/single/" + _media_id,
        type: "POST",
        beforeSend: function () {
            Pace.restart();
        },
        success: function (response) {
            $("#staticSingleMedia .modal-body").html(response.data.data.html);
        }
    });
}

function getSingleMediaForModalNextPrevious(_media_id) {
    getSingleMediaForModal(_media_id)
    if (jQuery('.media-open-modal').prev().length == 0) {
        jQuery('#previous-media-modal').attr('disabled', 'disabled');
    }
    if (jQuery('.media-open-modal').prev().length == 1) {
        jQuery('#previous-media-modal').removeAttr('disabled');
    }
    if (jQuery('.media-open-modal').next().length == 1) {
        jQuery('#next-media-modal').removeAttr('disabled');
    }
    if (jQuery('.media-open-modal').next().length == 0) {
        jQuery('#next-media-modal').attr('disabled', 'disabled')
    }
}

var myModalEl = document.getElementById('staticSingleMedia')
if (myModalEl) {
    myModalEl.addEventListener('hidden.bs.modal', function (event) {
        jQuery('.card:not(.media-list-page) #media-list >div').removeClass('media-open-modal');

        $("#staticSingleMedia .modal-body").html('');
    })

}
