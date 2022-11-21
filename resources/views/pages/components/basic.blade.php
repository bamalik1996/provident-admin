<div class="card">
    <div class="card-body">
        <div class="card-title d-flex align-items-center">
            <h5 class="mb-0 text-primary">
                Template Information
            </h5>
        </div>
        <hr>
        <div class="col-md-6 col-xl-6 shop-wrapper">

            @if (isset(request()->template_id))
                @include('atoms.forms.select2Field', [
                    'label' => 'Template',
                    'selected_value' => request()->template_id,
                    'field' => 'template_id',
                    'option_key' => 'id',
                    'option_value' => 'title',
                    'data' => getTemplate(),
                    'class' => 'single-select',
                    'placeholder' => 'Select Template',
                ])
            @else
                @include('atoms.forms.select2Field', [
                    'label' => 'Template',
                    'model' => $info,
                    'field' => 'template_id',
                    'option_key' => 'id',
                    'option_value' => 'title',
                    'data' => getTemplate(),
                    'class' => 'single-select',
                    'placeholder' => 'Select Template',
                ])
            @endif

        </div>
    </div>
</div>

<div class="card">
    <div class="card-body">
        <div class="card-title d-flex align-items-center">
            <h5 class="mb-0 text-primary">
                Main Information
            </h5>
        </div>
        <hr>
        <div class="col-md-6 col-xl-6">
            @include('atoms.forms.textField', [
                'label' => 'Title',
                'field' => 'title',
                'model' => $info,
                'length' => 100,
            ])
        </div>
        @if(isset($info->id) && $info->is_delete==1)
            <div class="col-md-6 col-xl-6">
                @include('atoms.forms.textField', [
                    'label' => 'slug',
                    'field' => 'slug',
                    'model' => $info,
                ])
            </div>
            @php
                if($info->slug !='home'){
                    $url = getFrontEndUrl().'/'.getvalue($info,'language.locale').'/'.$info->slug;
                }else{
                    $url = getFrontEndUrl().'/'.getvalue($info,'language.locale');
                }
            @endphp

            <a href="{{ $url }}" target="_blank">{{ $url }}</a>
        @endif
    </div>
</div>
