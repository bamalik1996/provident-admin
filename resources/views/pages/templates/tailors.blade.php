@include('pages.templates.sections.banner_section')

<div class="card">
    <div class="card-body">
        <div class="card-title d-flex align-items-center">
            <h5 class="mb-0 text-primary">
                Tailors Section
            </h5>
        </div>
        <hr>
        <div class="row">

            <div class="col-md-6 col-xl-6">
                @include('atoms.forms.textField', [
                    'label' => 'Title',
                    'field' => 'extras.tailors_section.title',
                    'model' => isset($info) ? $info : [],
                    'length'=> 25
                ])
            </div>

            <div class="col-md-6 col-xl-6">
            </div>

            <div class="col-md-6 col-xl-6" style="display: flex;flex-direction: column;">
                @include('atoms.forms.tinymcy', [
                    'label' => 'Description',
                    'field' => 'extras.tailors_section.description',
                    'model' => isset($info) ? $info : [],
                    'class' => '',
                    'rows' => 4,
                    'length'=> 350
                ])
            </div>

        </div>

    </div>
</div>




