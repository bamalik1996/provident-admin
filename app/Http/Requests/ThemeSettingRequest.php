<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ThemeSettingRequest extends FormRequest
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
            "header_logo"=>['required'],
            "footer_logo"=>['required'],
            "bottom_image_one"=>['required'],
            "buttom_text_one"=>['required'],
            "buttom_text_one_ar"=>['required'],
            "bottom_image_two"=>['required'],
            "buttom_text_two"=>['required'],
            "buttom_text_two_ar"=>['required'],
            "bottom_image_three"=>['required'],
            "buttom_text_three"=>['required'],
            "buttom_text_three_ar"=>['required'],
            "copyright_text"=>['required'],
            "copyright_text_ar"=>['required'],
            "twitter_image"=>['required'],
            "twitter_link"=>['required'],
            "facebook_image"=>['required'],
            "facebook_link"=>['required'],
            "youtube_image"=>['required'],
            "youtube_link"=>['required'],
            "instagram_image"=>['required'],
            "instagram_link"=>['required'],
            "tailor_main_title"=>['required'],
            "tailor_title"=>['required'],
            "tailor_sub_title"=>['required'],
            "tailor_main_title_ar"=>['required'],
            "tailor_title_ar"=>['required'],
            "tailor_sub_title_ar"=>['required'],
            "tailor_image"=>['required'],
            "tailor_image_mobile"=>['required'],
            "product_main_title"=>['required'],
            "product_title"=>['required'],
            "product_sub_title"=>['required'],
            "product_main_title_ar"=>['required'],
            "product_title_ar"=>['required'],
            "product_sub_title_ar"=>['required'],
            "product_image"=>['required'],
            "product_image_mobile"=>['required'],
            "quality_image"=>['required'],
            "quality_text"=>['required'],
            "quality_text_ar"=>['required'],
            "time_image"=>['required'],
            "time_text"=>['required'],
            "time_text_ar"=>['required'],
            "stiched_image"=>['required'],
            "stiched_text"=>['required'],
            "stiched_text_ar"=>['required'],
            "currency"=>['required'],
            "delivery_charge"=>['required','numeric','regex:/^[0-9]+$/','gt:0'],
            "vat_percentage"=>['required','numeric','regex:/^[0-9]+$/','gt:0'],
            "measurement_title_one"=>['required'],
            "measurement_title_one_ar"=>['required'],
            "measurement_title_two"=>['required'],
            "measurement_title_two_ar"=>['required'],
            "measurement_description_one"=>['required'],
            "measurement_description_one_ar"=>['required'],
            "measurement_description_two"=>['required'],
            "measurement_description_two_ar"=>['required'],
            "measurement_video"=>['required'],
            "size_chart"=>['required'],
            "email_logo"=>['required'],
        ];
    }
}
