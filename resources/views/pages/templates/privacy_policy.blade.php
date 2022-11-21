@include('pages.templates.sections.banner_section')

<div class="card">
    <div class="card-body">
        <div class="card-title d-flex align-items-center">
            <h5 class="mb-0 text-primary">
                Privary Policy Section
            </h5>
        </div>
        <hr>
        <div class="row">

            <div class="col-md-6 col-xl-6">
                @include('atoms.forms.textField', [
                    'label' => 'Title',
                    'field' => 'extras.basic.title',
                    'model' => isset($info) ? $info : [],
                    'length'=> 30
                ])
            </div>

            <div class="col-md-12 col-xl-12" style="display: flex;flex-direction: column;">
                @include('atoms.forms.tinymcy', [
                    'label' => 'Description',
                    'field' => 'extras.basic.description',
                    'model' => isset($info) ? $info : [],
                    'class' => 'editme',
                    'rows' => 10,
                ])
            </div>

        </div>

    </div>
</div>

<script>
    tinymce.init({
        selector: 'textarea.editme',
        toolbar: 'undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | outdent indent',
        menubar: ''
    });
</script>




