@php
$field_dot_key = stringToDotArray($field);
@endphp
<br>
<button type="button"  data-value="{{ isset($value) ? old($field_dot_key, $value) : ( isset($model) ? getValue($model, $field_dot_key) : '') }}" data-name="{{ dotToString(isset($field)?$field:'') }}"
    class="btn btn-primary insert-edit-link-modal {{ isset($class) ? $class : '' }}">{{ $label }}{{ !isset($compulsory) ? '*' : '' }}</button>
<input type="hidden" value="{{ isset($value) ? old($field_dot_key, $value) : ( isset($model) ? getValue($model, $field_dot_key) : '') }}" name="{{ dotToString(isset($field)?$field:'') }}" />
@error($field_dot_key)
    <span class="invalid-feedback d-block" role="alert">
        <strong>{{ $message }}</strong>
    </span>
@enderror
@error($field_dot_key . '.title')
    <span class="invalid-feedback d-block" role="alert">
        <strong>{{ $message }}</strong>
    </span>
@enderror

@error($field_dot_key . '.link')
    <span class="invalid-feedback d-block" role="alert">
        <strong>{{ $message }}</strong>
    </span>
@enderror
