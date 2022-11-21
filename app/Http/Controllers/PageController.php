<?php

namespace App\Http\Controllers;

use App\Http\Requests\Pages\StorePageRequest;
use App\Models\Page;
use App\Models\Template;
use Illuminate\Http\Request;

class PageController extends Controller
{

    public function __construct()
    {
        $this->middleware('permission:' . request()->segment(1) . '.list', ['only' => ['index']]);
        $this->middleware('permission:' . request()->segment(1) . '.create', ['only' => ['create', 'store']]);
        $this->middleware('permission:' . request()->segment(1) . '.edit', ['only' => ['edit', 'update']]);
        $this->middleware('permission:' . request()->segment(1) . '.delete', ['only' => ['destroy']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $models = Page::where('post_type', $request->segment(1))
            ->where('language_id', '=', isset($request->language_id) ? $request->language_id : 1);

        if (isset($request->language_id)) {
            $models = $models->where('language_id', $request->language_id);
        }

        if (isset($request->page_status_id)) {
            $models = $models->where('page_status_id', $request->page_status_id);
        }

        if ($request->search) {
            $models = $models->where(function ($query) use ($request) {
                $query->where('title', 'like', '%' . $request->search . '%');
            });
        }
        return view(request()->segment(1) . '.index', [
            'models' => $models->sortable()->paginate(10),
        ]);
    }

    public function duplicate(Request $request)
    {
        $page = Page::find($request->parent_id);
        $page_arr = $page->toArray();
        unset($page_arr['id']);
        unset($page_arr['created_at']);
        unset($page_arr['updated_at']);
        $page_arr['language_id'] = 2;
        $page_arr['parent_id'] = $request->parent_id;
        $page_arr['is_delete'] = $request->is_delete;
        $new_page = Page::create($page_arr);

        $new_page->meta()->create([
            'title' => $page->meta->title,
            'description' => $page->meta->description,
        ]);

        return redirect()->route(request()->segment(1) . '.index', ['language_id' => $request->language_id])
            ->with('class', 'success')
            ->with('message', 'Your Page has been Successfully Duplicated');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view(request()->segment(1) . '.create');
    }

    public function clean($string)
    {
        $string = str_replace(' ', '-', $string);
        return preg_replace('/[^\w\s]+/u', '', $string);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StorePageRequest $request)
    {
        $data = $request->all();
        $data['content'] = $this->clean(json_encode($data, JSON_UNESCAPED_UNICODE));
        $data['is_slug'] = true;
        $Page = Page::Create($data);

        $Page->meta()->create([
            'title' => $data['meta_title'],
            'description' => $data['meta_description'],
        ]);

        return response()->json([
            'status' => true,
            'route' => route(request()->segment(1) . '.index', ['language_id' => $request->language_id]),
            'message' => ucfirst(str_replace('_', ' ', request()->segment(1))) . ' Data has been Added',
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Page  $page
     * @return \Illuminate\Http\Response
     */
    public function show(Page $page)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Page  $page
     * @return \Illuminate\Http\Response
     */
    public function edit(Page $page)
    {
        // dd($page->extras);
        return view(request()->segment(1) . '.edit', [
            'info' => $page,
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Page  $page
     * @return \Illuminate\Http\Response
     */
    public function update(StorePageRequest $request, Page $page)
    {
        $data = $request->all();

        if (getValue($data, 'extras.how_it_works_section.sections') && count(getValue($data, 'extras.how_it_works_section.sections')) > 0) {
            if (count(getValue($data, 'extras.how_it_works_section.sections')) < 4) {
                return response()->json([
                    'message' => 'How it Works Sections Repeater cannot be less than 5',
                ], 500);
            }
        }

        $data['content'] = $this->clean(json_encode($data, JSON_UNESCAPED_UNICODE));
        $data['is_slug'] = true;
        $page->update($data);

        if ($page->child_pages) {
            foreach ($page->child_pages as $item) {
                $item->update([
                    'slug' => $data['slug'],
                    'page_status_id' => $data['page_status_id'],
                ]);
            }
        }

        if ($page->parent_page) {
            $page->parent_page->update([
                'slug' => $data['slug'],
                'page_status_id' => $data['page_status_id'],
            ]);
        }

        $page->meta()->update([
            'title' => $data['meta_title'],
            'description' => $data['meta_description'],
        ]);

        return response()->json([
            'status' => true,
            'route' => route(request()->segment(1) . '.index', ['language_id' => $request->language_id]),
            'message' => ucfirst(str_replace('_', ' ', request()->segment(1))) . ' Data has been Updated',
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Page  $page
     * @return \Illuminate\Http\Response
     */
    public function destroy(Page $page, Request $request)
    {
        if ($page->child_pages) {
            foreach ($page->child_pages as $item) {
                $item->meta()->delete();
                $item->delete();
            }
        }

        if ($page->parent_page) {
            $page->parent_page->meta()->delete();
            $page->parent_page()->delete();
        }

        $page->meta()->delete();
        $page->delete();

        return redirect()->route(request()->segment(1) . '.index', ['language_id' => $request->language_id])
            ->with('class', 'success')
            ->with('message', ucwords(str_replace('_', ' ', request()->segment(1))) . ' Delete Successfully.');
    }

    public function template(Request $request)
    {
        $template = Template::find($request->id);
        return view('pages.templates.' . $template->template)->render();
    }
}
