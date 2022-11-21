<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreCouponRequest extends FormRequest
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
            'coupon_id'=>['required'],
            'code'=>['required'],
            'total'=>['required','numeric','gt:0'],
            'total_per_user'=>['required','numeric','gt:0'],
            'start_date'=>['required'],
            'end_date'=>['required'],
            'status_id'=>['required'],
            'value'=>['required','numeric','gt:0'],
        ];
    }
}
