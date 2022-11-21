@include('pages.templates.sections.banner_section')

<div class="card">
    <div class="card-body">
        <div class="card-title d-flex align-items-center">
            <h5 class="mb-0 text-primary">
                Our Approach Section
            </h5>
        </div>
        <hr>
        <div class="row gy-2">

            <div class="col-md-6 col-xl-6">
                @include('atoms.forms.textField', [
                    'label' => 'Title',
                    'field' => 'extras.our_approach_section.title',
                    'model' => isset($info) ? $info : [],
                    'length'=> 20
                ])
            </div>

            <div class="col-md-6 col-xl-6">
            </div>

            <div class="col-md-6 col-xl-6" style="display: flex;flex-direction: column;">
                @include('atoms.forms.tinymcy', [
                    'label' => 'Description',
                    'field' => 'extras.our_approach_section.description',
                    'model' => isset($info) ? $info : [],
                    'class' => '',
                    'rows' => 4,
                    'length'=> 380
                ])
            </div>

            <div class="col-md-6 col-xl-6" style="display: flex;flex-direction: column;">
            </div>

            <div class="col-md-6">
                @include('atoms.forms.mediaField', [
                    'button_label'=>'Image',
                    'field' => 'extras.our_approach_section.image',
                    'defaultValue' => isset($info) ? getValue($info,'extras.our_approach_section.image') : [],
                    'fileType' => 'jpg,png,jpeg,webp',
                    'width'=>945,
                    'height'=>528
                ])
            </div>

        </div>

    </div>
</div>

<div class="card">
    <div class="card-body">
        <div class="card-title d-flex align-items-center">
            <h5 class="mb-0 text-primary">
                Mission & Vision Section
            </h5>
        </div>
        <hr>
        <div class="row">

            <div class="col-md-6 col-xl-6">
                @include('atoms.forms.textField', [
                    'label' => 'Title',
                    'field' => 'extras.mission_and_vision_section.title',
                    'model' => isset($info) ? $info : [],
                    'length'=> 20
                ])
            </div>

            <div class="col-md-6 col-xl-6">
            </div>

            <div class="col-md-6 col-xl-6" style="display: flex;flex-direction: column;">
                @include('atoms.forms.tinymcy', [
                    'label' => 'Description',
                    'field' => 'extras.mission_and_vision_section.description',
                    'model' => isset($info) ? $info : [],
                    'class' => '',
                    'rows' => 4,
                    'length'=> 380
                ])
            </div>

            <div class="col-md-6 col-xl-6" style="display: flex;flex-direction: column;">
            </div>

            <div class="col-md-6">
                @include('atoms.forms.mediaField', [
                    'button_label'=>'Image',
                    'field' => 'extras.mission_and_vision_section.image',
                    'defaultValue' => isset($info) ? getValue($info,'extras.mission_and_vision_section.image') : [],
                    'fileType' => 'jpg,png,jpeg,webp',
                    'width'=>699,
                    'height'=>460
                ])
            </div>

        </div>

    </div>
</div>

<div class="card">
    <div class="card-body">
        <div class="card-title d-flex align-items-center">
            <h5 class="mb-0 text-primary">
                From the Management Section
            </h5>
        </div>
        <hr>
        <div class="row">

            <div class="col-md-6 col-xl-6">
                @include('atoms.forms.textField', [
                    'label' => 'Title',
                    'field' => 'extras.from_the_management_section.title',
                    'model' => isset($info) ? $info : [],
                    'length'=> 20
                ])
            </div>

            <div class="col-md-6 col-xl-6">
            </div>

            <div class="col-md-6 col-xl-6" style="display: flex;flex-direction: column;">
                @include('atoms.forms.tinymcy', [
                    'label' => 'Description',
                    'field' => 'extras.from_the_management_section.description',
                    'model' => isset($info) ? $info : [],
                    'class' => '',
                    'rows' => 4,
                    'length'=> 380
                ])
            </div>

            <div class="col-md-6 col-xl-6" style="display: flex;flex-direction: column;">
            </div>

            <div class="col-md-6">
                @include('atoms.forms.mediaField', [
                    'button_label'=>'Image',
                    'field' => 'extras.from_the_management_section.image',
                    'defaultValue' => isset($info) ? getValue($info,'extras.mission_and_vision_section.image') : [],
                    'fileType' => 'jpg,png,jpeg,webp',
                    'width'=>390,
                    'height'=>525
                ])
            </div>

        </div>

    </div>
</div>
