<?php

namespace App\Http\Requests\Profile;

use Illuminate\Foundation\Http\FormRequest;

class UpdateProfileRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        $password = '';
        if ($this->password) {
            $password = 'required|max:256|min:8';
        }
        return [
            'name' => 'required|max:256',
            'email' => 'required|max:256|email|unique:users,email,' . auth()->user()->id,
            'password' => $password,
        ];
    }
}
