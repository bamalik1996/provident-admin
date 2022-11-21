<?php

namespace App\Http\Controllers;

use App\Models\Page;
use Illuminate\Http\Request;
use \Cviebrock\EloquentSluggable\Services\SlugService;

class SlugController extends Controller
{
    public function slugGenerate (Request $request)
    {
        $slug = $request->slug;
        $class = $request->model;
        $object = new $class();

         if($object->where('slug',$slug)->exists()){
            return  response()->json([
                'message'=>'Slug is already exists.',
                'slug'=>SlugService::createSlug($class, 'slug', $slug)
            ],422);
         }
         return  response()->json([
            'message'=>'Slug generate successfully.',
            'slug'=> SlugService::createSlug($class, 'slug', $slug)
        ]);


    }
}
