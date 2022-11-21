<?php

namespace App\Http\Controllers;

use App\Http\Requests\Users\StoreUserRequest;
use App\Http\Requests\Users\UpdateUserRequest;
use App\Models\Role;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use phpDocumentor\Reflection\DocBlock\Tags\Var_;

class UserController extends Controller
{

    public function __construct()
    {
        $this->middleware('permission:users.list', ['only' => ['index']]);
        $this->middleware('permission:users.create', ['only' => ['create', 'store']]);
        $this->middleware('permission:users.edit', ['only' => ['edit', 'update']]);
        $this->middleware('permission:users.delete', ['only' => ['destroy']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $users = User::query();
        $users = $users->where('id', '!=', 1);
        // $users = $users->where('id', '!=', auth()->user()->id);

        if (isset($request->search) && $request->search) {
            $users = $users->where(function ($query) use ($request) {
                $query->where('name', 'like', '%' . $request->search . '%');
            });
        }

        return view('users.index', [
            'users' => $users->sortable()->paginate(10)
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $roles = Role::get();
        return view('users.create', [
            'roles' => $roles
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreUserRequest $request)
    {

        $request->merge(['password' => Hash::make($request->password)]);
        $user =  User::create($request->all());
        $user->assignRole(Role::find($request->role));
        // $user->syncPermissions(Role::find($request->role)->permissions->pluck('name')->toArray());

        return redirect()->route('users.index')->with('class', 'success')->with('message', 'User add successfully.');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function show(User $user)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function edit(User $user)
    {
        if ($user->id == 1) {
            abort(403);
        }
        $roles = Role::get();
        return view('users.edit', [
            'user' => $user,
            'roles' => $roles
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateUserRequest $request, User $user)
    {
        if ($user->id == 1) {
            abort(403);
        }
        if ($request->password) {

            $request->merge(['password' => Hash::make($request->password)]);
            $user->update($request->all());
        } else {

            $user->update($request->except('password'));
        }

        // All current roles will be removed from the user and replaced by the array given
        $user->syncRoles([Role::find($request->role)]);
        // $user->syncPermissions(Role::find($request->role)->permissions->pluck('name')->toArray());

        return redirect()->route('users.index')->with('class', 'success')->with('message', 'User update successfully.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function destroy(User $user)
    {
        if ($user->id == 1) {
            abort(403);
        }
        $user->delete();
        return redirect()->route('users.index')->with('class', 'success')->with('message', 'User delete successfully.');
    }
}
