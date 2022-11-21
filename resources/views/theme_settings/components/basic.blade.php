<nav>
    <div class="nav nav-tabs" id="nav-tab" role="tablist">
        <button class="nav-link active" id="nav-header-tab" data-bs-toggle="tab" data-bs-target="#nav-header" type="button"
            role="tab" aria-controls="nav-header" aria-selected="true">Header</button>
        <button class="nav-link" id="nav-footer-tab" data-bs-toggle="tab" data-bs-target="#nav-footer" type="button"
            role="tab" aria-controls="nav-footer" aria-selected="false">Footer</button>
        <button class="nav-link" id="nav-social-tab" data-bs-toggle="tab" data-bs-target="#nav-social" type="button"
            role="tab" aria-controls="nav-social" aria-selected="false">Social</button>
        <button class="nav-link" id="nav-facility-tab" data-bs-toggle="tab" data-bs-target="#nav-facility"
            type="button" role="tab" aria-controls="nav-facility" aria-selected="false">Facility</button>
        <button class="nav-link" id="nav-tailor-tab" data-bs-toggle="tab" data-bs-target="#nav-tailor" type="button"
            role="tab" aria-controls="nav-tailor" aria-selected="false">Tailor Detail</button>
        <button class="nav-link" id="nav-product-tab" data-bs-toggle="tab" data-bs-target="#nav-product" type="button"
            role="tab" aria-controls="nav-product" aria-selected="false">Product Detail</button>
        <button class="nav-link" id="nav-delivery-tab" data-bs-toggle="tab" data-bs-target="#nav-delivery"
            type="button" role="tab" aria-controls="nav-delivery" aria-selected="false">Delivery & VAT</button>
        <button class="nav-link" id="nav-measurement-tab" data-bs-toggle="tab" data-bs-target="#nav-measurement"
            type="button" role="tab" aria-controls="nav-measurement" aria-selected="false">Measurement</button>
        <button class="nav-link" id="nav-sizechart-tab" data-bs-toggle="tab" data-bs-target="#nav-sizechart"
            type="button" role="tab" aria-controls="nav-sizechart" aria-selected="false">Size Chart</button>
        <button class="nav-link" id="nav-email-tab" data-bs-toggle="tab" data-bs-target="#nav-email"
        type="button" role="tab" aria-controls="nav-email" aria-selected="false">Email</button>
    </div>
</nav>
<div class="tab-content" id="nav-tabContent">
    <div class="tab-pane fade show active" id="nav-header" role="tabpanel" aria-labelledby="nav-header-tab">

        <div class="row">
            <div class="col-md-3 col-xl-3">
                @include('atoms.forms.mediaField', [
                    'field' => 'header_logo',
                    'defaultValue' => getOption('header_logo'),
                    'fileType' => 'svg',
                    'button_label' => 'Select Header Logo',
                    'width' => 102,
                    'height' => 94,
                ])
            </div>
        </div>

    </div>
    <div class="tab-pane fade" id="nav-footer" role="tabpanel" aria-labelledby="nav-footer-tab">

        <div class="row">
            <div class="col-md-3 col-xl-3">
                @include('atoms.forms.mediaField', [
                    'field' => 'footer_logo',
                    'defaultValue' => getOption('footer_logo'),
                    'fileType' => 'svg',
                    'button_label' => 'Select Footer Logo',
                    'width' => 102,
                    'height' => 94,
                ])

            </div>

            <div class="col-md-9 col-xl-9">
            </div>

            <div class="col-md-4 col-xl-4">

                @include('atoms.forms.textField', [
                    'label' => 'Bottom Text One',
                    'field' => 'buttom_text_one',
                    'value' => getOption('buttom_text_one'),
                    'length'=>30
                ])

                @include('atoms.forms.textField', [
                    'label' => 'Bottom Text One Arabic',
                    'field' => 'buttom_text_one_ar',
                    'value' => getOption('buttom_text_one_ar'),
                    'length'=>30
                ])

                @include('atoms.forms.mediaField', [
                    'field' => 'bottom_image_one',
                    'defaultValue' => getOption('bottom_image_one'),
                    'fileType' => 'svg',
                    'button_label' => 'Bottom Image One',
                    'width' => 35,
                    'height' => 35,
                ])


            </div>

            <div class="col-md-4 col-xl-4">

                @include('atoms.forms.textField', [
                    'label' => 'Bottom Text two',
                    'field' => 'buttom_text_two',
                    'value' => getOption('buttom_text_two'),
                    'length'=>30
                ])

                @include('atoms.forms.textField', [
                    'label' => 'Bottom Text two Arabic',
                    'field' => 'buttom_text_two_ar',
                    'value' => getOption('buttom_text_two_ar'),
                    'length'=>30
                ])

                @include('atoms.forms.mediaField', [
                    'field' => 'bottom_image_two',
                    'defaultValue' => getOption('bottom_image_two'),
                    'fileType' => 'svg',
                    'button_label' => 'Bottom Image Two',
                    'width' => 35,
                    'height' => 35,
                ])

            </div>

            <div class="col-md-4 col-xl-4">

                @include('atoms.forms.textField', [
                    'label' => 'Bottom Text three',
                    'field' => 'buttom_text_three',
                    'value' => getOption('buttom_text_three'),
                    'length'=>30
                ])

                @include('atoms.forms.textField', [
                    'label' => 'Bottom Text three Arabic',
                    'field' => 'buttom_text_three_ar',
                    'value' => getOption('buttom_text_three_ar'),
                    'length'=>30
                ])

                @include('atoms.forms.mediaField', [
                    'field' => 'bottom_image_three',
                    'defaultValue' => getOption('bottom_image_three'),
                    'fileType' => 'svg',
                    'button_label' => 'Bottom Image Three',
                    'width' => 35,
                    'height' => 35,
                ])

            </div>

            <div class="col-md-6 col-xl-6">
                @include('atoms.forms.textField', [
                    'label' => 'Copyright Text',
                    'field' => 'copyright_text',
                    'value' => getOption('copyright_text'),
                    'length'=>100
                ])
            </div>

            <div class="col-md-6 col-xl-6">
                @include('atoms.forms.textField', [
                    'label' => 'Copyright Text Arabic',
                    'field' => 'copyright_text_ar',
                    'value' => getOption('copyright_text_ar'),
                    'length'=>100
                ])
            </div>

        </div>

    </div>
    <div class="tab-pane fade" id="nav-social" role="tabpanel" aria-labelledby="nav-social-tab">

        <div class="row">
            <div class="col-md-3 col-xl-3">

                @include('atoms.forms.mediaField', [
                    'field' => 'twitter_image',
                    'defaultValue' => getOption('twitter_image'),
                    'fileType' => 'svg',
                    'button_label' => 'Select Twitter Image',
                    'width' => 18,
                    'height' => 18,
                ])

                @include('atoms.anchorLink', [
                    'label' => 'Twitter Link',
                    'field' => 'twitter_link',
                    'value' => getOption('twitter_link'),
                ])

                <br><br>

                @include('atoms.forms.StatusField', [
                    'field' => 'twitter_status',
                    'field_dot' => 'twitter_status',
                    'field_text' => 'Show',
                    'true_value' => '1',
                    'false_value' => '0',
                ])

            </div>

            <div class="col-md-3 col-xl-3">

                @include('atoms.forms.mediaField', [
                    'field' => 'facebook_image',
                    'defaultValue' => getOption('facebook_image'),
                    'fileType' => 'svg',
                    'button_label' => 'Select facebook',
                    'width' => 18,
                    'height' => 18,
                ])

                @include('atoms.anchorLink', [
                    'label' => 'Facebook Link',
                    'field' => 'facebook_link',
                    'value' => getOption('facebook_link'),
                ])

                <br><br>

                @include('atoms.forms.StatusField', [
                    'field' => 'facebook_status',
                    'field_dot' => 'facebook_status',
                    'field_text' => 'Show',
                    'true_value' => '1',
                    'false_value' => '0',
                ])

            </div>

            <div class="col-md-3 col-xl-3">

                @include('atoms.forms.mediaField', [
                    'field' => 'youtube_image',
                    'defaultValue' => getOption('youtube_image'),
                    'fileType' => 'svg',
                    'button_label' => 'Select Youtube',
                    'width' => 18,
                    'height' => 18,
                ])

                @include('atoms.anchorLink', [
                    'label' => 'youtube Link',
                    'field' => 'youtube_link',
                    'value' => getOption('youtube_link'),
                ])

                <br><br>

                @include('atoms.forms.StatusField', [
                    'field' => 'youtube_status',
                    'field_dot' => 'youtube_status',
                    'field_text' => 'Show',
                    'true_value' => '1',
                    'false_value' => '0',
                ])

            </div>

            <div class="col-md-3 col-xl-3">

                @include('atoms.forms.mediaField', [
                    'field' => 'instagram_image',
                    'defaultValue' => getOption('instagram_image'),
                    'fileType' => 'svg',
                    'button_label' => 'Select Instagram',
                    'width' => 18,
                    'height' => 18,
                ])

                @include('atoms.anchorLink', [
                    'label' => 'Instagram Link',
                    'field' => 'instagram_link',
                    'value' => getOption('instagram_link'),
                ])

                <br><br>

                @include('atoms.forms.StatusField', [
                    'field' => 'instagram_status',
                    'field_dot' => 'instagram_status',
                    'field_text' => 'Show',
                    'true_value' => '1',
                    'false_value' => '0',
                ])

            </div>
        </div>

    </div>
    <div class="tab-pane fade" id="nav-facility" role="tabpanel" aria-labelledby="nav-facility-tab">

        <div class="row">
            <div class="col-md-3 col-xl-3">

                @include('atoms.forms.mediaField', [
                    'field' => 'quality_image',
                    'defaultValue' => getOption('quality_image'),
                    'fileType' => 'svg',
                    'button_label' => 'Select Quality Image',
                    'width' => 33,
                    'height' => 33,
                ])

                @include('atoms.forms.textField', [
                    'label' => 'Quality Text',
                    'field' => 'quality_text',
                    'value' => getOption('quality_text'),
                    'length'=>30
                ])

                @include('atoms.forms.textField', [
                    'label' => 'Quality Text Arabic',
                    'field' => 'quality_text_ar',
                    'value' => getOption('quality_text_ar'),
                    'length'=>30
                ])

                <br><br>

                @include('atoms.forms.StatusField', [
                    'field' => 'quality_status',
                    'field_dot' => 'quality_status',
                    'field_text' => 'Show',
                    'true_value' => '1',
                    'false_value' => '0',
                ])

            </div>

            <div class="col-md-3 col-xl-3">

                @include('atoms.forms.mediaField', [
                    'field' => 'time_image',
                    'defaultValue' => getOption('time_image'),
                    'fileType' => 'svg',
                    'button_label' => 'Select Time Image',
                    'width' => 33,
                    'height' => 33,
                ])

                @include('atoms.forms.textField', [
                    'label' => 'Time Text',
                    'field' => 'time_text',
                    'value' => getOption('time_text'),
                    'length'=>30
                ])

                @include('atoms.forms.textField', [
                    'label' => 'Time Text Arabic',
                    'field' => 'time_text_ar',
                    'value' => getOption('time_text_ar'),
                    'length'=>30
                ])

                <br><br>

                @include('atoms.forms.StatusField', [
                    'field' => 'time_status',
                    'field_dot' => 'time_status',
                    'field_text' => 'Show',
                    'true_value' => '1',
                    'false_value' => '0',
                ])

            </div>

            <div class="col-md-3 col-xl-3">

                @include('atoms.forms.mediaField', [
                    'field' => 'stiched_image',
                    'defaultValue' => getOption('stiched_image'),
                    'fileType' => 'svg',
                    'button_label' => 'Select Stiched Image',
                    'width' => 33,
                    'height' => 33,
                ])

                @include('atoms.forms.textField', [
                    'label' => 'Stiched Text',
                    'field' => 'stiched_text',
                    'value' => getOption('stiched_text'),
                    'length'=>30
                ])

                @include('atoms.forms.textField', [
                    'label' => 'Stiched Text Arabic',
                    'field' => 'stiched_text_ar',
                    'value' => getOption('stiched_text_ar'),
                    'length'=>30
                ])

                <br><br>

                @include('atoms.forms.StatusField', [
                    'field' => 'stiched_status',
                    'field_dot' => 'stiched_status',
                    'field_text' => 'Show',
                    'true_value' => '1',
                    'false_value' => '0',
                ])

            </div>


        </div>

    </div>
    <div class="tab-pane fade" id="nav-tailor" role="tabpanel" aria-labelledby="nav-tailor-tab">

        <div class="row">

            <div class="col-md-4 col-xl-4">
                @include('atoms.forms.textField', [
                    'label' => 'Tailor Main Title',
                    'field' => 'tailor_main_title',
                    'value' => getOption('tailor_main_title'),
                    'length' => 20,
                ])
            </div>

            <div class="col-md-4 col-xl-4">
                @include('atoms.forms.textField', [
                    'label' => 'Tailor Title',
                    'field' => 'tailor_title',
                    'value' => getOption('tailor_title'),
                    'length' => 20,
                ])
            </div>

            <div class="col-md-4 col-xl-4">
                @include('atoms.forms.textField', [
                    'label' => 'Tailor SubTitle',
                    'field' => 'tailor_sub_title',
                    'value' => getOption('tailor_sub_title'),
                    'length' => 20,
                ])
            </div>

            <div class="col-md-4 col-xl-4">
                @include('atoms.forms.textField', [
                    'label' => 'Tailor Main Title Arabic',
                    'field' => 'tailor_main_title_ar',
                    'value' => getOption('tailor_main_title_ar'),
                    'length' => 20,
                ])
            </div>

            <div class="col-md-4 col-xl-4">
                @include('atoms.forms.textField', [
                    'label' => 'Tailor Title Arabic',
                    'field' => 'tailor_title_ar',
                    'value' => getOption('tailor_title_ar'),
                    'length' => 20,
                ])
            </div>

            <div class="col-md-4 col-xl-4">
                @include('atoms.forms.textField', [
                    'label' => 'Tailor SubTitle Arabic',
                    'field' => 'tailor_sub_title_ar',
                    'value' => getOption('tailor_sub_title_ar'),
                    'length' => 20,
                ])
            </div>

            <div class="col-md-3 col-xl-3">
                @include('atoms.forms.mediaField', [
                    'field' => 'tailor_image',
                    'defaultValue' => getOption('tailor_image'),
                    'fileType' => 'jpg,webp',
                    'button_label' => 'Select Tailor Image',
                    'width' => 1920,
                    'height' => 700,
                ])
            </div>

            <div class="col-md-3 col-xl-3">
                @include('atoms.forms.mediaField', [
                    'field' => 'tailor_image_mobile',
                    'defaultValue' => getOption('tailor_image_mobile'),
                    'fileType' => 'jpg,webp',
                    'button_label' => 'Tailor Mobile Image',
                    'width' => 1920,
                    'height' => 700,
                ])
            </div>

        </div>

    </div>
    <div class="tab-pane fade" id="nav-product" role="tabpanel" aria-labelledby="nav-product-tab">

        <div class="row">

            <div class="col-md-4 col-xl-4">
                @include('atoms.forms.textField', [
                    'label' => 'Product Main Title',
                    'field' => 'product_main_title',
                    'value' => getOption('product_main_title'),
                    'length' => 20,
                ])
            </div>

            <div class="col-md-4 col-xl-4">
                @include('atoms.forms.textField', [
                    'label' => 'Product Title',
                    'field' => 'product_title',
                    'value' => getOption('product_title'),
                    'length' => 20,
                ])
            </div>

            <div class="col-md-4 col-xl-4">
                @include('atoms.forms.textField', [
                    'label' => 'Product SubTitle',
                    'field' => 'product_sub_title',
                    'value' => getOption('product_sub_title'),
                    'length' => 20,
                ])
            </div>

            <div class="col-md-4 col-xl-4">
                @include('atoms.forms.textField', [
                    'label' => 'Product Main Title Arabic',
                    'field' => 'product_main_title_ar',
                    'value' => getOption('product_main_title_ar'),
                    'length' => 20,
                ])
            </div>

            <div class="col-md-4 col-xl-4">
                @include('atoms.forms.textField', [
                    'label' => 'Product Title Arabic',
                    'field' => 'product_title_ar',
                    'value' => getOption('product_title_ar'),
                    'length' => 20,
                ])
            </div>

            <div class="col-md-4 col-xl-4">
                @include('atoms.forms.textField', [
                    'label' => 'Product SubTitle Arabic',
                    'field' => 'product_sub_title_ar',
                    'value' => getOption('product_sub_title_ar'),
                    'length' => 20,
                ])
            </div>

            <div class="col-md-3 col-xl-3">
                @include('atoms.forms.mediaField', [
                    'field' => 'product_image',
                    'defaultValue' => getOption('product_image'),
                    'fileType' => 'jpg,webp',
                    'button_label' => 'Select Product Image',
                    'width' => 1920,
                    'height' => 700,
                ])
            </div>

            <div class="col-md-3 col-xl-3">
                @include('atoms.forms.mediaField', [
                    'field' => 'product_image_mobile',
                    'defaultValue' => getOption('product_image_mobile'),
                    'fileType' => 'jpg,webp',
                    'button_label' => 'Product Mobile Image',
                    'width' => 1920,
                    'height' => 700,
                ])
            </div>

        </div>

    </div>
    <div class="tab-pane fade" id="nav-delivery" role="tabpanel" aria-labelledby="nav-delivery-tab">

        <div class="row">

            <div class="col-md-4 col-xl-4">
                @include('atoms.forms.textField', [
                    'label' => 'Delivery Charge',
                    'field' => 'delivery_charge',
                    'value' => getOption('delivery_charge'),
                ])
            </div>

            <div class="col-md-4 col-xl-4">
                @include('atoms.forms.textField', [
                    'label' => 'VAT Percentage',
                    'field' => 'vat_percentage',
                    'value' => getOption('vat_percentage'),
                ])
            </div>

            <div class="col-md-4 col-xl-4">
                @include('atoms.forms.textField', [
                    'label' => 'Currency',
                    'field' => 'currency',
                    'value' => getOption('currency'),
                ])
            </div>

        </div>

    </div>
    <div class="tab-pane fade" id="nav-measurement" role="tabpanel" aria-labelledby="nav-measurement-tab">

        <div class="row">

            <div class="col-md-3 col-xl-3">
                @include('atoms.forms.textField', [
                    'label' => 'Title One',
                    'field' => 'measurement_title_one',
                    'value' => getOption('measurement_title_one'),
                    'length'=>40
                ])
            </div>

            <div class="col-md-3 col-xl-3">
                @include('atoms.forms.textField', [
                    'label' => 'Title One Arabic',
                    'field' => 'measurement_title_one_ar',
                    'value' => getOption('measurement_title_one_ar'),
                    'length'=>40
                ])
            </div>

            <div class="col-md-3 col-xl-3">
                @include('atoms.forms.textField', [
                    'label' => 'Title Two',
                    'field' => 'measurement_title_two',
                    'value' => getOption('measurement_title_two'),
                    'length'=>40
                ])
            </div>

            <div class="col-md-3 col-xl-3">
                @include('atoms.forms.textField', [
                    'label' => 'Title Two Arabic',
                    'field' => 'measurement_title_two_ar',
                    'value' => getOption('measurement_title_two_ar'),
                    'length'=>40
                ])
            </div>

            <div class="col-md-6 col-xl-6">
                @include('atoms.forms.tinymcy', [
                    'label' => 'Description One',
                    'field' => 'measurement_description_one',
                    'value' => getOption('measurement_description_one'),
                    'class' => '',
                    'rows' => 5,
                ])
            </div>

            <div class="col-md-6 col-xl-6">
                @include('atoms.forms.tinymcy', [
                    'label' => 'Description One',
                    'field' => 'measurement_description_one_ar',
                    'value' => getOption('measurement_description_one_ar'),
                    'class' => '',
                    'rows' => 5,
                ])
            </div>

            <div class="col-md-6 col-xl-6">
                @include('atoms.forms.tinymcy', [
                    'label' => 'Description Two',
                    'field' => 'measurement_description_two',
                    'value' => getOption('measurement_description_two'),
                    'class' => '',
                    'rows' => 5,
                ])
            </div>

            <div class="col-md-6 col-xl-6">
                @include('atoms.forms.tinymcy', [
                    'label' => 'Description Two',
                    'field' => 'measurement_description_two_ar',
                    'value' => getOption('measurement_description_two_ar'),
                    'class' => '',
                    'rows' => 5,
                ])
            </div>

            <div class="col-md-6 col-xl-6">
                @include('atoms.forms.textField', [
                    'label' => 'Measurement Video',
                    'field' => 'measurement_video',
                    'value' => getOption('measurement_video'),
                ])
            </div>


        </div>

    </div>
    <div class="tab-pane fade" id="nav-sizechart" role="tabpanel" aria-labelledby="nav-sizechart-tab">

        <div class="row">

            <div class="col-md-12 col-xl-12" style="display: flex;flex-direction: column;">
                @include('atoms.forms.tinymcy', [
                    'label' => 'Size Chart',
                    'field' => 'size_chart',
                    'value' => getOption('size_chart'),
                    'class' => 'editmefull',
                    'rows' => 10,
                ])
            </div>

        </div>

    </div>
    <div class="tab-pane fade show" id="nav-email" role="tabpanel" aria-labelledby="nav-email-tab">

        <div class="row">
            <div class="col-md-3 col-xl-3">
                @include('atoms.forms.mediaField', [
                    'field' => 'email_logo',
                    'defaultValue' => getOption('email_logo'),
                    'fileType' => 'jpg,png',
                    'button_label' => 'Select email Logo',
                    'width' => 102,
                    'height' => 94,
                ])
            </div>
        </div>

    </div>
</div>
