@php
$field_dot_key = stringToDotArray($field);

@endphp

<div class="form-check">
    <input type="checkbox" name="{{ $field }}" value="true"
        class="form-check-input   @error($field_dot_key) is-invalid @enderror"
        @if (old($field_dot_key, getValue($model, $field_dot_key))) checked @endif>
    @error($field_dot_key)
        <span class="invalid-feedback" role="alert">
            <strong>{{ $message }}</strong>
        </span>
    @enderror
    <label for="{{ $field_dot_key }}" class="form-label">{{ $label }}</label>
</div>
