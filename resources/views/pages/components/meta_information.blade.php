<div class="card">
    <div class="card-body">
        <div class="card-title d-flex align-items-center">
            <h5 class="mb-0 text-primary">
                Meta Information
            </h5>
        </div>
        <hr>
      <div class="row gy-2">
        <div class="col-md-8 col-xl-8">
            @include('atoms.forms.textField', [
                'label' => 'Title',
                'field' => 'meta_title',
                'value' => isset($info->meta->title) ? $info->meta->title : '',
                'length'=>100
            ])
        </div>

        <div class="col-md-8 col-xl-8" style="display: flex;flex-direction: column;">
            @include('atoms.forms.tinymcy', [
                'label' => 'Description',
                'field' => 'meta_description',
                'value' => isset($info->meta->description) ? $info->meta->description : '',
                'class' => '',
                'rows' => 4,
                'length'=>250
            ])
        </div>
      </div>

    </div>
</div>
