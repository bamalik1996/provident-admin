@php
$field_dot_key = '';
if (isset($field)) {
    $field_dot_key = stringToDotArray($field);
}
@endphp

@if (isset($label) && $label)
    <label for="{{ $field_dot_key }}" class="form-label">{{ $label }}</label>
@endif
<input autocomplete="{{ isset($autocomplete) ? 'on' : 'off' }}" id="{{ $field_dot_key }}" data-inputmask="'mask': '999-99-9999'"
    type="{{ isset($type) ? $type : 'text' }}" {{ isset($disabled) ? 'disabled' : false }}
    name="{{ isset($field) ? $field : null }}"
    class="form-control {{ isset($class) ? $class : '' }}  @error($field_dot_key) is-invalid @enderror"
    value="{{ isset($value) ? $value : old($field_dot_key, getValue($model, $field_dot_key)) }}">
@error($field_dot_key)
    <span class="invalid-feedback" role="alert">
        <strong>{{ $message }}</strong>
    </span>
@enderror
