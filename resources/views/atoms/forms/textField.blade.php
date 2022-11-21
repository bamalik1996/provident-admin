@php
use Illuminate\Support\Arr;

$field_dot_key = '';
if (isset($field)) {
    $field_dot_key = stringToDotArray($field);
}
$attrs = '';
if (isset($attr)):
    $attrs = generateHtmlAttrByArray($attr);
endif;

@endphp

@if (isset($label) && $label)
    <label for="{{ $field_dot_key }}" class="form-label">{{ $label }}{{ !isset($compulsory) ? '*' : '' }}</label>
@endif

@php
if (!isset($model)) {
    $model = null;
}
@endphp


<input  {{ $attrs }} autocomplete="{{ isset($autocomplete) ? 'on' : 'off' }}"
    type="{{ isset($type) ? $type : 'text' }}" id="{{isset($id)?$id:dotToString(isset($field)?$field:'')}}" {{ isset($disabled) ? 'disabled' : false }}
    min="{{ isset($min)? $min : '' }}"
    name="{{ dotToString(isset($field)?$field:'') }}"
    class="form-control {{ isset($class) ? $class : '' }}  @error($field_dot_key) is-invalid @enderror"
    value="{{ isset($value) ? old($field_dot_key, $value) : old($field_dot_key, getValue($model, $field_dot_key)) }}" @if(isset($read_only)) readonly @endif>
@error($field_dot_key)
    <span class="invalid-feedback" role="alert">
        <strong>{{ $message }}</strong>
    </span>
@enderror
@if (isset($length))
    <span class="d-block" style="color: darkgreen;font-size: 12px;">
        <strong>Max Character Length: {{ $length }}</strong>
    </span>
@endif
@if (isset($number))
    <span class="d-block" style="color: darkgreen;font-size: 12px;">
        <strong>Only Number is Allowed</strong>
    </span>
@endif
