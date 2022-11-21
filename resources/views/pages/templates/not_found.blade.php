<div class="card">
    <div class="card-body">
        <div class="card-title d-flex align-items-center">
            <h5 class="mb-0 text-primary">
                404 Section
            </h5>
        </div>
        <hr>
        <div class="row">

            <div class="col-md-6 col-xl-6">
                @include('atoms.forms.textField', [
                    'label' => 'Heading',
                    'field' => 'extras.basic.heading',
                    'model' => isset($info) ? $info : [],
                    'length' => 30,
                ])
            </div>

            <div class="col-md-6 col-xl-6">
                @include('atoms.forms.textField', [
                    'label' => 'Number',
                    'field' => 'extras.basic.number',
                    'model' => isset($info) ? $info : [],
                    'number' => true,
                    'type'=>'number'
                ])
            </div>

            <div class="col-md-6 col-xl-6">
                @include('atoms.forms.textField', [
                    'label' => 'Main Title',
                    'field' => 'extras.basic.main_title',
                    'model' => isset($info) ? $info : [],
                    'length' => 50,
                ])
            </div>

            <div class="col-md-6 col-xl-6">
                @include('atoms.forms.textField', [
                    'label' => 'Title',
                    'field' => 'extras.basic.title',
                    'model' => isset($info) ? $info : [],
                    'length' => 100,
                ])
            </div>

            <div class="col-md-6 col-xl-6">
                @include('atoms.forms.textField', [
                    'label' => 'Sub Title',
                    'field' => 'extras.basic.sub_title',
                    'model' => isset($info) ? $info : [],
                    'length' => 100,
                ])
            </div>

            <div class="col-md-6 col-xl-6">
                @include('atoms.forms.textField', [
                    'label' => 'Button Text',
                    'field' => 'extras.basic.button_text',
                    'model' => isset($info) ? $info : [],
                    'length' => 50,
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
