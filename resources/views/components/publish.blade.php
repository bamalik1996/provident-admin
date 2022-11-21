<div class="card">
    <div class="card-body">
        <div class="card-title d-flex align-items-center">
            <h5 class="mb-0 text-primary">Publish</h5>
        </div>
        <hr>
        <div class="row g-3">
            <div class="col-md-12">
                <strong>
                    Create At:
                </strong> {{ now()->toDayDateTimeString() }}
            </div>
            <div class="col-md-12">
                @include('atoms.forms.select2Field', [
                    'model' => isset($model) ? $model : null,
                    'field' => 'status',
                    'label'=>'Status',
                    'placeholder'=>'Please select status',
                    'option_key' => 'key',
                    'option_value' => 'value',
                    'mbsc' => true,
                    'data' => [
                        [
                            'key' => 'active',
                            'value' => 'Active',
                        ],
                        [
                            'key' => 'inactive',
                            'value' => 'Inactive',
                        ],
                    ],
                ])
            </div>
        </div>
    </div>
    <div class="card-footer text-muted text-end ">
        <button class="btn btn-primary w-100">Save</button>
    </div>
</div>
