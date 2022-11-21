<?php

namespace App\Http\Requests\Pages;

use Illuminate\Foundation\Http\FormRequest;

class UpdatePageRequest extends FormRequest
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
     * @return array
     */
    public function rules()
    {
        $default = [
            'title' => ['required','max:100'],
            'template_id' => 'required',
            'page_status_id' => 'required',
            'meta_title'=> ['required','max:100'],
            'meta_description'=>['required','max:200']
        ];

        $rules = [];

        if(isset(request()->template_id)){
            $function = getTemplatebyID(request()->template_id)->template;
            $rules = $this->$function();
        }

        return array_merge($default,$rules);
    }

    public function shop(){
        return [
            'extras.banner_section.main_title'=>['required','max:20'],
            'extras.banner_section.title'=>['required','max:30'],
            'extras.banner_section.sub_title'=>['required','max:20'],
            'extras.banner_section.image'=>['required'],
            'extras.banner_section.image_mobile'=>['required'],
            'extras.kandoras_section.title'=>['required','max:25'],
            'extras.kandoras_section.description'=>['required','max:350'],
        ];
    }

    public function tailors(){
        return [
            'extras.banner_section.main_title'=>['required','max:20'],
            'extras.banner_section.title'=>['required','max:30'],
            'extras.banner_section.sub_title'=>['required','max:20'],
            'extras.banner_section.image'=>['required'],
            'extras.banner_section.image_mobile'=>['required'],
            'extras.tailors_section.title'=>['required','max:25'],
            'extras.tailors_section.description'=>['required','max:350'],
        ];
    }

    public function contact_us(){
        return [
            'extras.banner_section.main_title'=>['required','max:20'],
            'extras.banner_section.title'=>['required','max:30'],
            'extras.banner_section.sub_title'=>['required','max:20'],
            'extras.banner_section.image'=>['required'],
            'extras.banner_section.image_mobile'=>['required'],
            'extras.write_to_us_section.title'=>['required','max:20'],
            'extras.write_to_us_section.sub_title'=>['required','max:30'],
        ];
    }

    public function faq(){
        return [
            'extras.banner_section.main_title'=>['required','max:20'],
            'extras.banner_section.title'=>['required','max:30'],
            'extras.banner_section.sub_title'=>['required','max:20'],
            'extras.banner_section.image'=>['required'],
            'extras.banner_section.image_mobile'=>['required'],
            'extras.faq_section.title'=>['required','max:30'],
        ];
    }

    public function testimonials(){
        return [
            'extras.banner_section.main_title'=>['required','max:20'],
            'extras.banner_section.title'=>['required','max:30'],
            'extras.banner_section.sub_title'=>['required','max:20'],
            'extras.banner_section.image'=>['required'],
            'extras.banner_section.image_mobile'=>['required'],
            'extras.testimonials_section.title'=>['required','max:25'],
            'extras.testimonials_section.description'=>['required','max:350'],
        ];
    }

    public function about_us(){
        return [
            'extras.banner_section.main_title'=>['required','max:20'],
            'extras.banner_section.title'=>['required','max:30'],
            'extras.banner_section.sub_title'=>['required','max:20'],
            'extras.banner_section.image'=>['required'],
            'extras.banner_section.image_mobile'=>['required'],
            'extras.our_approach_section.title'=>['required','max:20'],
            'extras.our_approach_section.description'=>['required','max:380'],
            'extras.our_approach_section.image'=>['required'],
            'extras.mission_and_vision_section.title'=>['required','max:20'],
            'extras.mission_and_vision_section.description'=>['required','max:380'],
            'extras.mission_and_vision_section.image'=>['required'],
            'extras.from_the_management_section.title'=>['required','max:20'],
            'extras.from_the_management_section.description'=>['required','max:380'],
            'extras.from_the_management_section.image'=>['required'],
        ];
    }

    public function home(){
        return [
            'extras.hero_banner_section.*.main_title'=>['required','max:20'],
            'extras.hero_banner_section.*.title'=>['required','max:20'],
            'extras.hero_banner_section.*.description'=>['required'],
            'extras.hero_banner_section.*.button_link'=>['required'],
            'extras.hero_banner_section.*.image'=>['required'],
            'extras.hero_banner_section.*.mobile_image'=>['required'],
            'extras.how_it_works_section.title'=>['required','max:20'],
            'extras.how_it_works_section.sub_title'=>['required','max:30'],
            'extras.about_us_section.main_title'=>['required','max:10'],
            'extras.about_us_section.title'=>['required','max:25'],
            'extras.about_us_section.description_one'=>['required','max:150'],
            'extras.about_us_section.description_two'=>['required','max:450'],
            'extras.about_us_section.read_more_button'=>['required'],
            'extras.about_us_section.left_image'=>['required'],
            'extras.about_us_section.right_image'=>['required'],
            'extras.our_product_section.main_title'=>['required','max:20'],
            'extras.our_product_section.title'=>['required','max:40'],
            'extras.our_product_section.description'=>['required','max:150'],
            'extras.our_product_section.explore_all_button_link'=>['required'],
            'extras.our_product_section.products'=>['required',"array","min:1"],
            'extras.featured_tailors_section.main_title'=>['required','max:20'],
            'extras.featured_tailors_section.title'=>['required','max:30'],
            'extras.featured_tailors_section.explore_all_button_link'=>['required'],
            'extras.featured_tailors_section.tailors'=>['required',"array","min:1"],
            'extras.testimonial_section.main_title'=>['required','max:20'],
            'extras.testimonial_section.title'=>['required','max:30'],
            'extras.testimonial_section.description'=>['required','max:350'],
            'extras.testimonial_section.explore_all_button_link'=>['required'],
            'extras.testimonial_section.testimonials'=>['required',"array","min:1"],
        ];
    }
}
