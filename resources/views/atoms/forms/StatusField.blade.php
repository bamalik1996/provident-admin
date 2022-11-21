<label for="{{ $field }}" style="font-weight: bold;">{{ ucwords(str_replace('_', ' ', $field)) }}:</label>
<input type="hidden" name="{{ $field }}" value="{{ $false_value }}">
<label class="checkbox-inline d-block"><input type="checkbox" name="{{ $field }}"
{{ getOption($field)==$true_value ? 'checked' : '' }} value="{{ $true_value }}">{{ $field_text }}</label>
