<div class="card">
    <div class="card-body">
        <div class="card-title d-flex align-items-center">
            <h5 class="mb-0 text-primary">
                Banner Section
            </h5>
        </div>
        <hr>
        <div class="row">
            <div class="col-md-6 col-xl-6">
                @include('atoms.forms.textField', [
                    'label' => 'Main title',
                    'field' => 'extras.banner_section.main_title',
                    'model' => isset($info) ? $info : [],
                    'length'=> 20
                ])
            </div>

            <div class="col-md-6 col-xl-6">
                @include('atoms.forms.textField', [
                    'label' => 'Title',
                    'field' => 'extras.banner_section.title',
                    'model' => isset($info) ? $info : [],
                    'length'=> 30
                ])
            </div>

            <div class="col-md-6 col-xl-6">
                @include('atoms.forms.textField', [
                    'label' => 'Sub Title',
                    'field' => 'extras.banner_section.sub_title',
                    'model' => isset($info) ? $info : [],
                    'length'=> 20
                ])
            </div>

            <div class="col-md-6 col-xl-6">
            </div>

            <div class="col-md-3">
                @include('atoms.forms.mediaField', [
                    'button_label'=>'Select Image',
                    'field' => 'extras.banner_section.image',
                    'defaultValue' => isset($info) ? getValue($info,'extras.banner_section.image') : [],
                    'fileType' => 'jpg,png,jpeg,webp',
                    'width'=>1920,
                    'height'=>700
                ])
            </div>

            <div class="col-md-3">
                @include('atoms.forms.mediaField', [
                    'button_label'=>'Select Mobile Image',
                    'field' => 'extras.banner_section.image_mobile',
                    'defaultValue' => isset($info) ? getValue($info,'extras.banner_section.image_mobile') : [],
                    'fileType' => 'jpg,png,jpeg,webp',
                    'width'=>1920,
                    'height'=>700
                ])
            </div>

        </div>

    </div>
</div>
