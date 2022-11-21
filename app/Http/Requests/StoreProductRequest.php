<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreProductRequest extends FormRequest
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
            "tailor_id" => ['required'],
            "title" => ['required', 'max:100'],
            "title_ar" => ['required', 'max:100'],
            "status_id" => ['required'],
            "description" => ['required'],
            "description_ar" => ['required'],
            "product_fabric" => ['required'],
            "product_size" => ['required'],
            "featured_image" => ['required'],
            "featured_image_thumb" => ['required'],
            "gallery" => ['required'],
            "variants.*.price" => ['required','numeric','gt:0'],
            "variants.*.quantity" => ['required','numeric','gt:0'],
            'meta_title'=>['required'],
            'meta_description'=>['required'],
            'meta_title_ar' => ['required'],
            'meta_description_ar' => ['required'],
        ];
    }
}
