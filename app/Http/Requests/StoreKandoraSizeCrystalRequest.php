<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreKandoraSizeCrystalRequest extends FormRequest
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
            "price"=>['required','max:100'],
            "image"=>['required'],
            "status_id"=>['required'],
            "kandora_type_crystal_id"=>['required'],
        ];
    }
}
