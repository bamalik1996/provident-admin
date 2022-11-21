<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreTestimonailRequest extends FormRequest
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
            "ratings"=>['required','integer','between:1,5'],
            "description"=>['required'],
            "description_ar"=>['required'],
            "image"=>['required'],
            "image_thumb"=>['required'],
            "status_id"=>['required'],
            "order"=>['required','numeric'],
        ];
    }
}
