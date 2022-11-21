<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreEmailTemplateRequest extends FormRequest
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
            "subject"=>['required','max:200'],
            "subject_ar"=>['required','max:200'],
            "description"=>['required'],
            "description_ar"=>['required'],
            "status_id"=>['required'],
        ];
    }
}
