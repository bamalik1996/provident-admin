<br>
@php

$field_dot_key = $field;
$random_id = random_int(100000, 999999);

$model_media_ids = null;
if (isset($model) && (isset($multiple) && $multiple) && !isset($defaultValue) && !is_array($model)) {
    $model_media = $model->getMedia($collection);
    $model_media_ids = collect($model_media)
        ->pluck('id')
        ->toArray();
} elseif (isset($model) && !is_array($model) && !isset($defaultValue)) {
    if ($model->getFirstMedia($collection)) {
        $model_media_ids = (string) $model->getFirstMedia($collection)->id;
    }
} elseif (isset($defaultValue)) {
    $model_media_ids = $defaultValue;
}

if (isset($multiple) && $multiple) {
    $old_value = old($field_dot_key, $model_media_ids);
} else {
    $old_value = collect(old($field_dot_key, $model_media_ids))->first();
}

@endphp

@if (isset($label) && $label)
    <label for="{{ $field_dot_key }}" class="form-label">{{ $label }}</label>
@endif

<div class="card media-library-body multi-media-select-{{ isset($multiple) && $multiple ? 'true' : 'false' }}">

    <div class="border-1  card-body " id="selected-media-card">
        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-2 row-cols-xl-6">
            @if ($old_value && is_array($old_value))
                @foreach ($old_value as $media_id)
                    @php
                        $media = getMediaByIds([$media_id]);
                    @endphp
                    @include('media.components.media-item-col', [
                        'media' => $media,
                    ])
                @endforeach
            @elseif(is_string($old_value))
                @php
                    $media = getMediaByIds([$old_value]);
                @endphp
                @include('media.components.media-item-col', [
                    'media' => $media,
                ])
            @endif
        </div>
    </div>
    <div class="card-footer">
        <div class="media-library" id="media_library_{{ $random_id }}">
            <button type="button" class="btn btn-primary mediaLibraryList"
                data-file-type="{{ isset($fileType) ? $fileType : '' }}"
                data-file-size="{{ isset($fileSize) ? $fileSize : '' }}"
                data-multiple-select="{{ isset($multiple) && $multiple ? 'true' : 'false' }}">
                {{ isset($button_label) ? $button_label : ''  }}{{ !isset($compulsory) ? '*' : '' }}
            </button>
            <img src="http://suridolib.org/images/200x200.gif" class="img-thumbnail" alt="..."
                style="display: none">
            @if (isset($multiple) && $multiple)
                <input type="hidden" class="field_name"
                    value="{{ $old_value && is_array($old_value) ? implode(',', $old_value) : '' }}"
                    data-name="{{ dotToString($field_dot_key) }}_array" data-images="images" name="{{ dotToString($field_dot_key) }}" />
            @else
                <input type="hidden" class="field_name" value="{{ $old_value }}" data-images="images" name="{{ dotToString($field_dot_key) }}" />
            @endif
            <div class="input-hidden-fields">

            </div>
        </div>
    </div>
</div>
@if (isset($width) && isset($height))
    <span class="d-block" style="color: darkgreen;font-size: 12px;">
        <strong>Recommended Size: {{ $width }} x {{ $height }}</strong>
    </span>
@endif

@if(isset($svg))
    <span class="d-block" style="color: darkgreen;font-size: 12px;">
        <strong>SVG Image Only</strong>
    </span>
@endif

@if(isset($fileType))
    <span class="d-block" style="color: darkgreen;font-size: 12px;">
        <strong>File types Allowed: {{ $fileType }}</strong>
    </span>
@endif
