<?php

namespace App\Http\Controllers;

use App\Http\Requests\Roles\StoreRoleRequest;
use App\Models\Role;
use Illuminate\Http\Request;
use App\Models\Permission;
use Spatie\Permission\Models\Role as ModelsRole;

class RoleController extends Controller
{


    public function __construct()
    {
        $this->middleware('permission:roles.list', ['only' => ['index']]);
        $this->middleware('permission:roles.add', ['only' => ['create', 'store']]);
        $this->middleware('permission:roles.edit', ['only' => ['edit', 'update']]);
        $this->middleware('permission:role.delete', ['only' => ['destroy']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $roles = Role::query();

        $roles = $roles->where('id','!=',1);

        if (isset($request->search) && $request->search) {
            $roles = $roles->where(function ($query) use ($request) {
                $query->where('name', 'like', '%' . $request->search . '%');
            });
        }

        return view('roles.index', [
            'roles' => $roles->paginate(10)
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('roles.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreRoleRequest $request)
    {

        $data = Role::create($request->all());

        if ($request->permissions && count($request->permissions) > 0) {
            foreach ($request->permissions as $permission) {
                $item = Permission::updateOrCreate(['display_name' => $permission], ['display_name' => $permission, 'status' => 'active']);
                $data->givePermissionTo($item);
            }
        }

        return redirect()->route('roles.index')->with('class', 'success')->with('message', 'Role add successfully.');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {

        $role = Role::find($id);
        $permissions = $role->permissions->pluck('display_name')->toArray();
        return view('roles.edit', [
            'role' => $role,
            'permissions' => $permissions
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(StoreRoleRequest $request, Role $role)
    {
        $role->update($request->all());

        $item = [];
        foreach ($request->permissions as $permission) {
            $item[] = Permission::updateOrCreate(['display_name' => $permission], ['display_name' => $permission, 'status' => 'active']);
        }

        $role->syncPermissions($item);

        foreach ($role->users as $user) {

            $user->syncRoles([Role::find($role->id)]);
            $user->syncPermissions(Role::find($role->id)->permissions->pluck('name')->toArray());
        }


        return redirect()->route('roles.index')->with('class', 'success')->with('message', 'Role update successfully.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(ModelsRole $role)
    {
        $role->delete();
        return redirect()->route('roles.index')->with('class', 'success')->with('message', 'Role delete successfully.');
    }
}
