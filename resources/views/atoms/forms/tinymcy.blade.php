@php
$field_dot_key = stringToDotArray($field);
@endphp

<label for="{{ $field_dot_key }}" class="form-label">{{ $label }}{{ !isset($compulsory) ? '*' : '' }}</label>
<textarea {{ isset($rows) ? 'rows=' . $rows . '' : '' }} name="{{ dotToString(isset($field)?$field:'') }}"
    class="form-control {{ isset($class) ? $class : '' }}   @error($field_dot_key) is-invalid @enderror"
    {{ isset($id) ? 'id=' . $id . '' : '' }} data-description="description">{{ isset($value) ? $value : old($field_dot_key, getValue($model, $field_dot_key)) }}</textarea>
@error($field_dot_key)
    <span class="invalid-feedback" role="alert">
        <strong>{{ $message }}</strong>
    </span>
@enderror
@if (isset($length))
    <span class="d-block" style="color: darkgreen;text-decoration: underline;font-size: 12px;">
        <strong>Max Character Length: {{ $length }}</strong>
    </span>
@endif
