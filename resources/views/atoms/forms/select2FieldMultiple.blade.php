@php
$field_dot_key = stringToDotArray($field);

$attrs = '';
if (isset($attr)):
    $attrs = generateHtmlAttrByArray($attr);
endif;

@endphp

<label class="form-label" for="{{ isset($id) ? $id : $field }}">
    @isset($label)
        {{ $label }}{{ !isset($compulsory) ? '*' : '' }}
    @endisset
    @isset($mbsc)
        <input value="{{old($field_dot_key, isset($model) ? getValue($model, $field_dot_key) : null) }}" mbsc-input data-input-select data-dropdown="true"
            placeholder="{{ isset($placeholder) ? $placeholder : null }}" />
    @endisset
</label>
<select {{ $attrs }}
    placeholder="{{ isset($placeholder) ? $placeholder : null }} " id="{{ isset($id) ? $id : dotToString($field) }}"
    class="form-control mobi-select @isset($class) {{ $class }} @endisset @error($field_dot_key) is-invalid @enderror"
    name="{{ dotToString($field) }}[]" @if(isset($multiple)) {{ $multiple }} @endif data-select="select">
    @isset($placeholder)
        <option value="">{{ $placeholder }}</option>
    @endisset
    @isset($data)
        @foreach ($data as $item)
            <option @if(isset($selected) && in_array($item[$option_key],$selected)) selected @endif  @if(isset($model) && getValue($model, $field_dot_key) && in_array($item[$option_key],getValue($model, $field_dot_key))) selected @endif value="{{ $item[$option_key] }}">
                @if (is_array($option_value))
                    @foreach ($option_value as $v)
                        {{ $item[$v] }}
                    @endforeach
                @else
                    {{ $item[$option_value] }}
                @endif
            </option>
        @endforeach
    @endisset

</select>
@error($field_dot_key)
    <span class="invalid-feedback" role="alert">
        <strong>{{ $message }}</strong>
    </span>
@enderror
