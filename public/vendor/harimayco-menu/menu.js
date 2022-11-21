var arraydata = [];

function getmenus(instance) {

    arraydata = [];
    $('#spinsavemenu').show();

    var cont = 0;

    $('#menu-to-edit li').each(function (index) {
        var dept = 0;
        for (var i = 0; i < $('#menu-to-edit li').length; i++) {
            var n = $(this)
                .attr('class')
                .indexOf('menu-item-depth-' + i);
            if (n != -1) {
                dept = i;
            }
        }

        let params = (new URL(document.location)).searchParams;
        let menu = params.get("menu");
        console.log('menu',menu);

        console.log('dept',dept);

        if(menu == 1 || menu == 2){
            if(dept == 2){
                alert('Menu cannot have depth 2');
                location.reload();
                throw new Error('Menu cannot have depth 2');
            }
        }else{
            if(dept == 1){
                alert('Menu cannot have depth 1');
                location.reload();
                throw new Error('Menu cannot have depth 1');
            }
        }

        var textoiner = $(this)
            .find('.item-edit')
            .text();
        var id = this.id.split('-');
        var textoexplotado = textoiner.split('|');
        var padre = 0;
        if (
            !!textoexplotado[textoexplotado.length - 2] &&
            textoexplotado[textoexplotado.length - 2] != id[2]
        ) {
            padre = textoexplotado[textoexplotado.length - 2];
        }
        arraydata.push({
            depth: dept,
            id: id[2],
            parent: padre,
            sort: cont
        });
        cont++;
    });

    updateitem();
    actualizarmenu(instance);
}

function addcustommenu() {
    $('#spincustomu').show();

    $(".customlinkdiv .invalid-feedback").remove();

    $('.submit-add-to-menu').prop('disabled',true);

    let check = false;

    if (!$('#custom-menu-item-name').val()) {
        $('#custom-menu-item-name').after(
            `<span class="invalid-feedback d-block" role="alert">
           <strong>Label Name Field is Required</strong>
        </span>`);
        check = true;
    }

    if (!$('#custom-menu-item-url').val()) {
        $('#custom-menu-item-url').after(
            `<span class="invalid-feedback d-block" role="alert">
           <strong>URL Field is Required</strong>
        </span>`);
        check = true;
    }

    if (check) {
        $('#spincustomu').hide();
        $(".submit-add-to-menu").prop('disabled',false);
        return false;
    }


    $.ajax({
        data: {
            labelmenu: $('#custom-menu-item-name').val(),
            linkmenu: $('#custom-menu-item-url').val(),
            rolemenu: $('#custom-menu-item-role').val(),
            idmenu: $('#idmenu').val()
        },

        url: addcustommenur,
        type: 'POST',
        success: function (response) {
            window.location.reload();
        },
        complete: function () {
            $('#spincustomu').hide();
        }
    });
}

function updateitem(id = 0) {

    if (id) {

        var label = $('#idlabelmenu_' + id).val();
        var clases = $('#clases_menu_' + id).val();
        var url = $('#url_menu_' + id).val();
        var role_id = 0;
        if ($('#role_menu_' + id).length) {
            role_id = $('#role_menu_' + id).val();
        }

        var data = {
            label: label,
            clases: clases,
            url: url,
            role_id: role_id,
            id: id
        };
    } else {
        var arr_data = [];
        $('.menu-item-settings').each(function (k, v) {
            var id = $(this)
                .find('.edit-menu-item-id')
                .val();
            var label = $(this)
                .find('.edit-menu-item-title')
                .val();
            var clases = $(this)
                .find('.edit-menu-item-classes')
                .val();
            var url = $(this)
                .find('.edit-menu-item-url')
                .val();
            var role = $(this)
                .find('.edit-menu-item-role')
                .val();
            arr_data.push({
                id: id,
                label: label,
                class: clases,
                link: url,
                role_id: role
            });
        });

        var data = {
            arraydata: arr_data
        };
    }

    $.ajax({
        data: data,
        url: updateitemr,
        type: 'POST',
        beforeSend: function (xhr) {
            if (id) {
                $('#spincustomu2').show();
            }
        },
        success: function () {
        },
        complete: function () {
            if (id) {
                $('#spincustomu2').hide();
            }
        }
    });
}

function actualizarmenu(instance) {

    console.log(instance);



    // return false;

    let check = false;

    if (instance !== undefined) {
        $(instance).parent().parent().find('.label').find('.invalid-feedback').remove();
        $(instance).parent().parent().find('.url').find('.invalid-feedback').remove();

        // console.log($(instance).parent().parent().find('.label').find('.edit-menu-item-title').val())

        if (!$(instance).parent().parent().find('.label').find('.edit-menu-item-title').val()) {
            $(instance).parent().parent().find('.label').find('.edit-menu-item-title').after(
                `<span class="invalid-feedback d-block" role="alert">
                    <strong>Label Name Field is Required</strong>
                </span>`);
            check = true;
        }

        // console.log($(instance).parent().parent().find('.url').find('.edit-menu-item-url').val())

        if (!$(instance).parent().parent().find('.url').find('.edit-menu-item-url').val()) {
            $(instance).parent().parent().find('.url').find('.edit-menu-item-url').after(
                `<span class="invalid-feedback d-block" role="alert">
                    <strong>URL Field is Required</strong>
                </span>`);
            check = true;
        }
    }

    // console.log(check);

    // console.log($('#menu-to-edit .invalid-feedback').length);
    if($('#menu-to-edit .invalid-feedback').length > 0){
        Toastify({
            text: 'Please fill out all the fields to save Menu',
            duration: 5000,
            position: "right",
            gravity: "top",
            style: {
                background: "red",
            },
        }).showToast();
        return false;
    }

    if (check) {
        return false;
    }

    $.ajax({
        dataType: 'json',
        data: {
            arraydata: arraydata,
            menuname: $('#menu-name').val(),
            idmenu: $('#idmenu').val()
        },

        url: generatemenucontrolr,
        type: 'POST',
        beforeSend: function (xhr) {
            $('#spincustomu2').show();
        },
        success: function (response) {
            // console.log(response);
            Toastify({
                text: 'Your Menu has been Saved',
                duration: 5000,
                position: "right",
                gravity: "top",
                style: {
                    background: "green",
                },
            }).showToast();
        },
        complete: function () {
            $('#spincustomu2').hide();
        }
    });
}

function deleteitem(id) {
    $.ajax({
        dataType: 'json',
        data: {
            id: id
        },

        url: deleteitemmenur,
        type: 'POST',
        success: function (response) {}
    });
}

function deletemenu() {
    var r = confirm('Do you want to delete this menu ?');
    if (r == true) {
        $.ajax({
            dataType: 'json',

            data: {
                id: $('#idmenu').val()
            },

            url: deletemenugr,
            type: 'POST',
            beforeSend: function (xhr) {
                $('#spincustomu2').show();
            },
            success: function (response) {
                if (!response.error) {
                    alert(response.resp);
                    window.location = menuwr;
                } else {
                    alert(response.resp);
                }
            },
            complete: function () {
                $('#spincustomu2').hide();
            }
        });
    } else {
        return false;
    }
}

function createnewmenu() {
    if (!!$('#menu-name').val()) {
        $.ajax({
            dataType: 'json',

            data: {
                menuname: $('#menu-name').val()
            },

            url: createnewmenur,
            type: 'POST',
            success: function (response) {
                window.location = menuwr + '?menu=' + response.resp;
            }
        });
    } else {
        alert('Enter menu name!');
        $('#menu-name').focus();
        return false;
    }
}

function insertParam(key, value) {
    key = encodeURI(key);
    value = encodeURI(value);

    var kvp = document.location.search.substr(1).split('&');

    var i = kvp.length;
    var x;
    while (i--) {
        x = kvp[i].split('=');

        if (x[0] == key) {
            x[1] = value;
            kvp[i] = x.join('=');
            break;
        }
    }

    if (i < 0) {
        kvp[kvp.length] = [key, value].join('=');
    }

    //this will reload the page, it's likely better to store this until finished
    document.location.search = kvp.join('&');
}

wpNavMenu.registerChange = function () {
    // getmenus();
};
