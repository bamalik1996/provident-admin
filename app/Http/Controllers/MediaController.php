<?php

namespace App\Http\Controllers;

use App\Http\Requests\Media\StoreMediaRequest;
use App\Http\Requests\Media\UpdateMediaRequest;
use App\Models\Media;
use App\Models\MediaRelation;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class MediaController extends Controller
{

    public function __construct()
    {
        $this->middleware('permission:media.list', ['only' => ['index']]);
        $this->middleware('permission:media.create', ['only' => ['create', 'store']]);
        $this->middleware('permission:media.edit', ['only' => ['edit', 'update']]);
        $this->middleware('permission:media.delete', ['only' => ['destroy']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $media = new Media;
        $media = $media->latest();
        if ($request->search_media) {
            $media = $media->where('name', 'like', '%' . $request->search_media . '%');
        }

        if ($request->file_type) {
            $media = $media->where('file_name', 'like', '%.' . $request->file_type);
        }

        if ($request->default_file_type) {

            $media = $media->where(function ($q) use ($request) {
                foreach ($request->default_file_type as $key => $value) {
                    $q->orWhere('file_name', 'like', '%.' . $value);
                }
            });
        }

        $media =  $media->paginate(54);

        if ($request->page == 1 && $request->defaultSelectMedia && count($request->defaultSelectMedia) > 0) {
            $mediaIds =  collect($request->defaultSelectMedia)->merge($media->pluck('id'))->toArray();
            $defaultPaginateCount = count($request->defaultSelectMedia);
            $media = Media::whereIn('id', $mediaIds);
            $media = $media->latest();

            if ($request->search_media) {
                $media = $media->where('name', 'like', '%' . $request->search_media . '%');
            }

            if ($request->file_type) {
                $media = $media->where('file_name', 'like', '%.' . $request->file_type);
            }

            $media = $media->paginate((24 + $defaultPaginateCount));
        }


        if ($request->ajax()) {
            $html = view('media.components.media-item-col', [
                'media' => $media,
            ])->render();

            return [
                'html' => $html,
                'total' => $media->total()
            ];
        }


        return view('media.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('media.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StoreMediaRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreMediaRequest $request)
    {


        $media = MediaRelation::create([
            'media_id' => 1,
        ]);
        $media_spatie =  $media->addMedia($request->file)->toMediaCollection();


        DB::table('media_relations')->where('id', $media->id)->delete();



        $media = Media::where('id', $media_spatie->id);

        // if ($request->_defaultType) {
        //     $media = $media->where(function ($q) use ($request) {
        //         foreach (explode(',', $request->_defaultType) as $key => $value) {
        //             $q->orWhere('file_name', 'like', '%.' . $value);
        //         }
        //     });
        // }

        $media = $media->first();

        $html = '';
        if ($media) {
            $html = view('media.components.media-item-col', [
                'media' => [$media],
                'selected' => true
            ])->render();
        }


        return responseSuccess([
            'url' => $media_spatie->getUrl(),
            'id' => $media_spatie->id,
            'html' => $html
        ], 'File upload successfully.');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Media  $media
     * @return \Illuminate\Http\Response
     */
    public function show(Media $media)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Media  $media
     * @return \Illuminate\Http\Response
     */
    public function edit(Media $media)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateMediaRequest  $request
     * @param  \App\Media  $media
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateMediaRequest $request, Media $media)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Media  $media
     * @return \Illuminate\Http\Response
     */
    public function destroy(Media $medium)
    {
        $medium->delete();
        return responseSuccess(
            [
                'id' => $medium->id,
            ],
            'Media delete successfully'
        );
    }

    public function bulkDelete(Request $request)
    {
        Media::destroy($request->ids);
        return responseSuccess(
            [],
            'Media delete successfully'
        );
    }


    public function getMediaByIds(Request $request)
    {

        $media  =  Media::whereIn('id', $request->ids)->get();

        $html = view('media.components.media-item-col', [
            'media' => $media,
        ])->render();

        return responseSuccess(
            ['html' => $html],
            'Media get successfully'
        );
    }

    public function getSingleMedia(Request $request)
    {
        $media  =  Media::where('id', $request->id)->first();

        $html = view('media.components.media-item-single', [
            'item' => $media,
        ])->render();

        return responseSuccess(
            ['html' => $html],
            'Media get successfully'
        );
    }
}
