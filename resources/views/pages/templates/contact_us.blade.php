@include('pages.templates.sections.banner_section')

<div class="card">
    <div class="card-body">
        <div class="card-title d-flex align-items-center">
            <h5 class="mb-0 text-primary">
                Write to US Section
            </h5>
        </div>
        <hr>
        <div class="row">

            <div class="col-md-6 col-xl-6">
                @include('atoms.forms.textField', [
                    'label' => 'Title',
                    'field' => 'extras.write_to_us_section.title',
                    'model' => isset($info) ? $info : [],
                    'length'=> 20
                ])
            </div>

            <div class="col-md-6 col-xl-6">
                @include('atoms.forms.textField', [
                    'label' => 'SubTitle',
                    'field' => 'extras.write_to_us_section.sub_title',
                    'model' => isset($info) ? $info : [],
                    'length'=> 30
                ])
            </div>

            <div class="col-md-6 col-xl-6">
                @include('atoms.forms.textField', [
                    'label' => 'Support Title',
                    'field' => 'extras.write_to_us_section.support_title',
                    'model' => isset($info) ? $info : [],
                    'length'=> 10
                ])
            </div>

            <div class="col-md-6 col-xl-6">
                @include('atoms.forms.textField', [
                    'label' => 'Support Value',
                    'field' => 'extras.write_to_us_section.support_value',
                    'model' => isset($info) ? $info : [],
                    'length'=> 15
                ])
            </div>

            <div class="col-md-6 col-xl-6">
                @include('atoms.forms.textField', [
                    'label' => 'Email Title',
                    'field' => 'extras.write_to_us_section.email_title',
                    'model' => isset($info) ? $info : [],
                    'length'=> 10
                ])
            </div>

            <div class="col-md-6 col-xl-6">
                @include('atoms.forms.textField', [
                    'label' => 'Email Value',
                    'field' => 'extras.write_to_us_section.email_value',
                    'model' => isset($info) ? $info : [],
                    'length'=> 40
                ])
            </div>

            <div class="col-md-3">
                @include('atoms.forms.mediaField', [
                    'button_label'=>'Select Image',
                    'field' => 'extras.write_to_us_section.image',
                    'defaultValue' => isset($info) ? getValue($info,'extras.write_to_us_section.image') : [],
                    'fileType' => 'jpg,png,jpeg,webp',
                    'width'=>620,
                    'height'=>874
                ])
            </div>

        </div>

    </div>
</div>




