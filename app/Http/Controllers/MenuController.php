<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class MenuController extends Controller
{
    public function index(Request $request){
        if(!$request->has('menu') || $request->menu == 0){
            return redirect()->route('menus.index',['menu'=>1]);
        }
        return view('menus.index');
    }
}
