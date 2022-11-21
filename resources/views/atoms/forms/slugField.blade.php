@if (isset($model) && !is_array($model))
    @php
        $website_url= env('FRONT_END_URL');
    @endphp
    <span class="slug-default">
        <a  target="_blank" href="{{ $website_url }}{{ getValue($model, 'slug') }}">
            {{ $website_url }}<span id="slug-field">{{ getValue($model, 'slug') }}</span>
        </a>
        <span class="slug-edit" id="slug-edit">Edit</span>
    </span>
    <span class="slug-editable">
        <a href="{{ $website_url }}/{{ getValue($model, 'slug') }}">
            {{ $website_url }}/
        </a>
        <input value="{{ getValue($model, 'slug') }}" name="slug_field" id="slug_field" />
        <input value="{{ $model::class }}" type="hidden" id="model_field" name="model_field" />
        <input value="{{ getValue($model, 'id') }}" type="hidden" id="model_field_id" name="model_field_id" />
        <input value="{{ getValue($model, 'slug') }}" type="hidden" id="slug" name="slug" />

        <span class="slug-save" id="slug-save">Save</span>
        <span class="slug-edit" id="slug-edit">Close</span>
    </span>
@endif
