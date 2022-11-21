@php
$field_dot_key = stringToDotArray($field);

@endphp
<div class="form-check form-switch  @error($field_dot_key) is-invalid @enderror">
    <input class="form-check-input" name="{{ dotToString(isset($field)?$field:'') }}" type="checkbox" @if (old($field_dot_key, getValue($model, $field_dot_key))) checked @endif
        id="{{ $field }}">
    <label class="form-check-label" for="{{ $field }}">{{ $label }}</label>
</div>
@error($field_dot_key)
    <span class="invalid-feedback" role="alert">
        <strong>{{ $message }}</strong>
    </span>
@enderror
