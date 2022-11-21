@extends('layouts.app')


@section('wrapper')
    <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
        <div class="">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 p-0">
                    <li class="breadcrumb-item"><a href="{{ url('/') }}">Dashboard</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Edit User</li>
                </ol>
            </nav>
        </div>
    </div>

    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-body">
                    <div class="card-title d-flex align-items-center">
                        <h5 class="mb-0 text-primary">Edit User</h5>
                    </div>
                    <hr>
                    <form class="row g-3" action="{{ route('users.update', ['user' => $user]) }}" method="POST">
                        @csrf
                        @method('put')
                        <div class="col-md-6">
                            <label for="name" class="form-label">Name*</label>
                            <input type="name" name="name" value="{{ old('name', $user->name) }}"
                                class="form-control   @error('name') is-invalid @enderror" id="name">
                            @error('name')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>

                        <div class="col-md-6">
                            <label for="email" class="form-label">Email*</label>
                            <input type="email" name="email" value="{{ old('email', $user->email) }}"
                                class="form-control   @error('email') is-invalid @enderror" id="email">
                            @error('email')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>

                        <div class="col-md-6">
                            <label for="password" class="form-label">Password*</label>
                            <input type="password" name="password" value=""
                                class="form-control   @error('password') is-invalid @enderror" id="password">
                            @error('password')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>

                        <div class="col-md-6">
                            <label for="role" class="form-label">Role*</label>
                            <select id="role" class="form-select  @error('role') is-invalid @enderror" name="role">
                                <option value="">Select Role</option>
                                @foreach ($roles as $role)
                                    <option value="{{ $role->id }}" @if (old('role', $user->roles->pluck('id')->first()) == $role->id) selected @endif>
                                        {{ $role->display_name }}
                                    </option>
                                @endforeach
                            </select>
                            @error('role')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                        <div class="col-md-6">
                            @include('atoms.forms.mediaField', [
                                'field' => 'avatar',
                                'multiple' => true,
                                'model'=>$user,
                                'collection'=>'avatar'
                                //'fileType' => 'jpg,png,jpeg',
                            ])
                        </div>
                        <div class="col-md-6">
                            @include('atoms.forms.mediaField', [
                                'field' => 'avatar_document',
                                'multiple' => true,
                                'fileType' => 'csv,xls,json,php',
                                'model'=>$user,
                                'collection'=>'avatar_document',
                                'fileSize'=>5
                            ])
                        </div>
                        <div class="col-md-6">
                            @include('atoms.forms.mediaField', [
                                'field' => 'profile_image',
                                'model'=>$user,
                                //'fileType' => 'pdf',
                                'collection'=>'profile_image'
                            ])
                        </div>

                        <div class="col-md-6">
                            @include('atoms.forms.mediaField', [
                                'field' => 'profile_image_document',
                                'model'=>$user,
                                'fileType' => 'jpg',
                                'collection'=>'profile_image_document'
                            ])
                        </div>

                        <div class="col-md-6">
                            <label for="inputState" class="form-label">Status*</label>
                            @include('atoms.formStatus', [
                                'data' => $user,
                            ])
                        </div>

                        <div class="col-12">
                            <button type="submit" class="btn btn-primary px-5">Save</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
