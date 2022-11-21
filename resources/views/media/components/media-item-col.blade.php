@foreach ($media as $item)
    <div class=" {{ isset($selected) ? 'media-select' : '' }}" title=" {{ $item->name }}"
        data-media-col-id='media-item-{{ $item->id }}' data-media-item='@json($item)'>
        <div class="card" data-media-id="media_item_{{ $item->id }}" data-bs-toggle="tooltip" data-bs-placement="top"
            title="{{ $item->file_name }}">
            @if (count(explode('.', $item->file_name)) > 1 &&
                in_array(strtolower(Str::afterLast($item->file_name, '.')), ['der', 'cabundle', 'tlp', 'example']) &&
                checkFileExists($item))
                <span class="h3 fiv-cla fiv-icon-txt">
                </span>
            @elseif (count(explode('.', $item->file_name)) == 1 && checkFileExists($item))
                <span class="h3 fiv-cla fiv-icon-txt">
                </span>
            @elseif (count(explode('.', $item->file_name)) > 1 &&
                in_array(strtolower(Str::afterLast($item->file_name, '.')), ['jpg', 'png', 'jpeg', 'jfif', 'webp']) &&
                checkFileExists($item))
                <img src="{{ $item->getUrl('thumb') }}" class="single-media-image" />
            @elseif (count(explode('.', $item->file_name)) > 1 &&
                in_array(strtolower(Str::afterLast($item->file_name, '.')), ['svg']) &&
                checkFileExists($item))
                <img src="{{ $item->getUrl() }}" class="single-media-image" />
            @elseif(count(explode('.', $item->file_name)) > 1 &&
                strtolower(Str::afterLast($item->file_name, '.')) &&
                checkFileExists($item))
                <span class="h3 fiv-cla fiv-icon-{{ strtolower(Str::afterLast($item->file_name, '.')) }}"></span>
            @else
                <img src="/assets/images/no-image.webp" style="height: 140px;object-fit: contain;" />
            @endif
            <div class="card-footer bg-white p-0 mt-1">
                <ul class="list-group">
                    {{-- <li class="list-group-item d-flex justify-content-center align-items-center d-none">
                        <a class="btn btn-danger media-modal-delete" data-href="{{ route('media.destroy', ['medium' => $item]) }}" data-form-id="delete-form-id-{{ $item->id }}">
                            <span>Delete</span>
                        </a>
                    </li> --}}
                    <li
                        class="list-group-item d-flex justify-content-between align-items-center border-top-0 rounded-0">
                        <small class="text-muted text-ellipsis-dot"><strong class=" d-none">File Name :</strong>
                            {{ $item->file_name }}</small>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center  d-none">
                        <small class="text-muted">
                            <strong>Date </strong> : {{ $item->created_at->toDayDateTimeString() }}
                        </small>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center  d-none">
                        <small class="text-muted">
                            <strong>Size</strong> : {{ $item->human_readable_size }}
                        </small>
                    </li>
                    @if (isset($item[0]) && getImageDimension($item)[0])
                        <li class="list-group-item d-flex justify-content-between align-items-center  d-none">
                            <small class="text-muted">
                                <strong>Dimension</strong> : {{ getImageDimension($item)[0] }} x
                                {{ getImageDimension($item)[1] }} Pexels
                            </small>
                        </li>
                    @endif
                    <li class="list-group-item d-flex justify-content-between align-items-center  d-none">
                        <div class="input-group mb-3">
                            <input type="text" readonly class="form-control" value="{{ $item->getUrl() }}">
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
@endforeach
