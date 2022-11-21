<div class="row h-100" id="single-media-modal-row">
    <div class="col-md-8" data-media-col-id='media-item-{{ $item->id }}'
        data-media-item='@json($item)'>
        <div class="card d-flex h-100 justify-content-around" data-media-id="media_item_{{ $item->id }}"
            data-bs-toggle="tooltip" data-bs-placement="top" title="{{ $item->file_name }}">
            <div class="card-body">
                @if (count(explode('.', $item->file_name)) > 1 &&
                    in_array(strtolower(Str::afterLast($item->file_name, '.')), ['der', 'cabundle', 'tlp', 'example']) &&
                    checkFileExists($item))
                    <span class="h3 fiv-cla fiv-icon-txt">
                    </span>
                @elseif (count(explode('.', $item->file_name)) == 1 && checkFileExists($item))
                    <span class="h3 fiv-cla fiv-icon-txt">
                    </span>
                @elseif (count(explode('.', $item->file_name)) > 1 &&
                    in_array(strtolower(Str::afterLast($item->file_name, '.')), ['jpg', 'png', 'jpeg', 'svg', 'jfif', 'webp']) &&
                    checkFileExists($item))
                    <img src="{{ $item->getUrl() }}" class="single-media-image" />
                @elseif (count(explode('.', $item->file_name)) > 1 &&
                    in_array(strtolower(Str::beforeLast($item->mime_type, '/')), ['audio']) &&
                    checkFileExists($item))
                    <audio controls>
                        <source src="{{ $item->getUrl() }}" type="{{ $item->mime_type }}">
                        Your browser does not support the audio element.
                    </audio>
                @elseif (count(explode('.', $item->file_name)) > 1 &&
                    in_array(strtolower(Str::beforeLast($item->mime_type, '/')), ['video']) &&
                    checkFileExists($item))
                    <video controls class="w-100 single-media-image">
                        <source src="{{ $item->getUrl() }}" type="{{ $item->mime_type }}">
                        Your browser does not support the audio element.
                    </video>
                @elseif(count(explode('.', $item->file_name)) > 1 &&
                    strtolower(Str::afterLast($item->file_name, '.')) &&
                    checkFileExists($item))
                    <span class="h3 fiv-cla fiv-icon-{{ strtolower(Str::afterLast($item->file_name, '.')) }}"></span>
                @endif
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card-footer bg-white p-0 mt-1">
            <ul class="list-group">

                <li class="list-group-item d-flex justify-content-between align-items-center border-top-0 rounded-0">
                    <small class="text-muted d-flex w-100"><strong style="width: 25%;">File Name :</strong>
                        <span style="width: 75%;">
                            {{ $item->file_name }}
                        </span>
                    </small>
                </li>
                <li class="list-group-item d-flex justify-content-between align-items-center">
                    <small class="text-muted">
                        <strong>Date </strong> : {{ $item->created_at->toDayDateTimeString() }}
                    </small>
                </li>
                <li class="list-group-item d-flex justify-content-between align-items-center">
                    <small class="text-muted">
                        <strong>Size</strong> : {{ $item->human_readable_size }}
                    </small>
                </li>
                @if (getImageDimension($item)[0])
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        <small class="text-muted">
                            <strong>Dimension</strong> : {{ getImageDimension($item)[0] }} x
                            {{ getImageDimension($item)[1] }} Pexels
                        </small>
                    </li>
                @endif
                <li class="list-group-item d-flex justify-content-between align-items-center">
                    <div class="input-group mb-3">
                        <input type="text" readonly class="form-control" value="{{ $item->getUrl() }}">
                    </div>
                </li>
                @can('media.delete')
                    <li class="list-group-item d-flex justify-content-center align-items-center ">
                        <a class="btn btn-danger media-modal-delete"
                            data-href="{{ route('media.destroy', ['medium' => $item]) }}"
                            data-form-id="delete-form-id-{{ $item->id }}">
                            <span>Delete</span>
                        </a>
                    </li>
                @endcan

            </ul>
        </div>
    </div>

</div>
