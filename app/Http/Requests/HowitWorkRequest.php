<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class HowitWorkRequest extends FormRequest
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
            'title'=>['required','max:100'],
            'extras.step_text'=>['required','max:20'],
            'extras.step_number'=>['required','max:2'],
            'extras.step_title'=>['required','max:20'],
            'extras.main_text'=>['required','max:40'],
            'extras.button_link'=>['required'],
            'extras.step_image'=>['required'],
            'extras.main_image'=>['required'],
            'page_status_id' => 'required',
            'language_id' => 'required',
        ];
    }
}
