@php
$field_dot_key = stringToDotArray($field);
$data = getStates();
$option_key = 'id';
$option_value ='name';
$attrs='';
if(isset($attr)):
$attrs =  generateHtmlAttrByArray($attr);
endif;

@endphp

@isset($label)
<label for="{{ $field_dot_key }}" class="form-label">{{ $label }}</label>
@endisset

<select {{$attrs }} data-default-selected="{{ old($field_dot_key, isset($model)?getValue($model, $field_dot_key):null ) }}" data-placeholder="{{ isset($placeholder) ? $placeholder : null }} " id="{{$field}}"
    class="form-select @isset($class) {{ $class }} @endisset @error($field_dot_key) is-invalid @enderror"
    name="{{ $field }}">
    @isset($placeholder)
        <option value="">{{ $placeholder }}</option>
    @endisset
    @foreach ($data as $item)
        <option @if($item[$option_key] == old($field_dot_key, isset($model)?getValue($model, $field_dot_key):null)) selected @endif value="{{ $item[$option_key] }}">
            {{ $item[$option_value] }}
        </option>
    @endforeach
</select>
@error($field_dot_key)
    <span class="invalid-feedback" role="alert">
        <strong>{{ $message }}</strong>
    </span>
@enderror
