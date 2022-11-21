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
    data-default-selected="{{ old($field_dot_key, isset($model) ? getValue($model, $field_dot_key) : null) }}"
    placeholder="{{ isset($placeholder) ? $placeholder : null }} " id="{{ isset($id) ? $id : dotToString($field) }}"
    class="form-select mobi-select @isset($class) {{ $class }} @endisset @error($field_dot_key) is-invalid @enderror"
    name="{{ dotToString($field) }}" @if(isset($multiple)) {{ $multiple }} @endif>
    @isset($placeholder)
        <option value="">{{ $placeholder }}</option>
    @endisset
    @isset($data)
        @foreach ($data as $item)
            <option @if(isset($selected_value) &&  $selected_value == $item[$option_key]) selected @endif   @if ($item[$option_key] == old($field_dot_key, isset($model) ? getValue($model, $field_dot_key) : null)) selected @endif value="{{ $item[$option_key] }}">
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
