<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateTailorRequest extends FormRequest
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
        return [
            "title"=>['required','max:100'],
            "title_ar"=>['required','max:100'],
            "name"=>['required','max:100'],
            "description"=>['required'],
            "description_ar"=>['required'],
            "status_id"=>['required'],
            "main_image"=>['required'],
            "gallery"=>['required'],
            'meta_title' => ['required','max:100'],
            'meta_description' => ['required','max:250'],
            'meta_title_ar' => ['required','max:100'],
            'meta_description_ar' => ['required','max:250'],
            'slug'=>['required','alpha_dash','unique:tailors_info,slug,'.$this->tailor->id],
            'order'=>['required','numeric']
        ];
    }

    public function attributes()
    {
        return [
            'gallery_array' => 'gallery',
            'title'=>'shop name',
            'title_ar'=>'shop name ar'
        ];
    }
}
