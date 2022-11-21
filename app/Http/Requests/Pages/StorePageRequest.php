<?php

namespace App\Http\Requests\Pages;

use App\Rules\UniqueSlug;
use Illuminate\Foundation\Http\FormRequest;

class StorePageRequest extends FormRequest
{
    /**
     * Determine if the page is authorized to make this request.
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
            'meta_description'=>['required','max:250']
        ];

        if(isset($this->page->id)){
            $default['slug']=['required','alpha_dash',new UniqueSlug($this->page)];
        }

        $rules = [];

        if(isset(request()->template_id)){
            $function = getTemplatebyID(request()->template_id)->template;
            $rules = $this->$function();
        }

        return array_merge($default,$rules);
    }

    public function term_and_conditions(){
        return [
            'extras.banner_section.main_title'=>['required'],
            'extras.banner_section.title'=>['required'],
            'extras.banner_section.sub_title'=>['required'],
            'extras.banner_section.image'=>['required'],
            'extras.banner_section.image_mobile'=>['required'],
            'extras.basic.title'=>['required'],
            'extras.basic.description'=>['required'],
        ];
    }

    public function privacy_policy(){
        return [
            'extras.banner_section.main_title'=>['required'],
            'extras.banner_section.title'=>['required'],
            'extras.banner_section.sub_title'=>['required'],
            'extras.banner_section.image'=>['required'],
            'extras.banner_section.image_mobile'=>['required'],
            'extras.basic.title'=>['required'],
            'extras.basic.description'=>['required'],
        ];
    }

    public function shop(){
        return [
            'extras.banner_section.main_title'=>['required'],
            'extras.banner_section.title'=>['required'],
            'extras.banner_section.sub_title'=>['required'],
            'extras.banner_section.image'=>['required'],
            'extras.banner_section.image_mobile'=>['required'],
            'extras.kandoras_section.title'=>['required'],
            'extras.kandoras_section.description'=>['required'],
        ];
    }

    public function cart(){
        return [
            'extras.cart_page_section.title_one'=>['required'],
            'extras.cart_page_section.title_two'=>['required'],
            'extras.cart_page_section.checkout_button_text'=>['required'],
            'extras.cart_page_section.shopping_button_text'=>['required'],
        ];
    }

    public function custom_kandora_checkout(){
        return [
            'extras.checkout_page_section.title_one'=>['required'],
            'extras.checkout_page_section.title_two'=>['required'],
            'extras.checkout_page_section.title_three'=>['required'],
            'extras.checkout_page_section.checkout_button_text'=>['required'],
        ];
    }

    public function checkout(){
        return [
            'extras.checkout_page_section.title_one'=>['required'],
            'extras.checkout_page_section.title_two'=>['required'],
            'extras.checkout_page_section.title_three'=>['required'],
            'extras.checkout_page_section.message'=>['required','max:100'],
            'extras.checkout_page_section.checkout_button_text'=>['required'],
            'extras.checkout_page_section.shopping_button_text'=>['required'],
        ];
    }

    public function tailors(){
        return [
            'extras.banner_section.main_title'=>['required'],
            'extras.banner_section.title'=>['required'],
            'extras.banner_section.sub_title'=>['required'],
            'extras.banner_section.image'=>['required'],
            'extras.banner_section.image_mobile'=>['required'],
            'extras.tailors_section.title'=>['required'],
            'extras.tailors_section.description'=>['required'],
        ];
    }

    public function contact_us(){
        return [
            'extras.banner_section.main_title'=>['required'],
            'extras.banner_section.title'=>['required'],
            'extras.banner_section.sub_title'=>['required'],
            'extras.banner_section.image'=>['required'],
            'extras.banner_section.image_mobile'=>['required'],
            'extras.write_to_us_section.title'=>['required'],
            'extras.write_to_us_section.sub_title'=>['required'],
            'extras.write_to_us_section.support_title'=>['required'],
            'extras.write_to_us_section.support_value'=>['required'],
            'extras.write_to_us_section.email_title'=>['required'],
            'extras.write_to_us_section.email_value'=>['required'],
            'extras.write_to_us_section.image'=>['required'],
        ];
    }

    public function faq(){
        return [
            'extras.banner_section.main_title'=>['required'],
            'extras.banner_section.title'=>['required'],
            'extras.banner_section.sub_title'=>['required'],
            'extras.banner_section.image'=>['required'],
            'extras.banner_section.image_mobile'=>['required'],
            'extras.faq_section.title'=>['required'],
        ];
    }

    public function not_found(){
        return [
            'extras.basic.heading'=>['required'],
            'extras.basic.number'=>['required','numeric'],
            'extras.basic.main_title'=>['required'],
            'extras.basic.title'=>['required'],
            'extras.basic.sub_title'=>['required'],
            'extras.basic.button_text'=>['required'],
        ];
    }

    public function custom_kandora(){
        return [
            'extras.basic.heading'=>['required'],
            'extras.basic.summary_title'=>['required'],
            'extras.basic.description'=>['required'],
        ];
    }

    public function wishlist(){
        return [
            'extras.basic.heading'=>['required'],
        ];
    }

    public function testimonials(){
        return [
            'extras.banner_section.main_title'=>['required'],
            'extras.banner_section.title'=>['required'],
            'extras.banner_section.sub_title'=>['required'],
            'extras.banner_section.image'=>['required'],
            'extras.banner_section.image_mobile'=>['required'],
            'extras.testimonials_section.title'=>['required'],
            'extras.testimonials_section.description'=>['required'],
        ];
    }

    public function about_us(){
        return [
            'extras.banner_section.main_title'=>['required'],
            'extras.banner_section.title'=>['required'],
            'extras.banner_section.sub_title'=>['required'],
            'extras.banner_section.image'=>['required'],
            'extras.banner_section.image_mobile'=>['required'],
            'extras.our_approach_section.title'=>['required'],
            'extras.our_approach_section.description'=>['required'],
            'extras.our_approach_section.image'=>['required'],
            'extras.mission_and_vision_section.title'=>['required'],
            'extras.mission_and_vision_section.description'=>['required'],
            'extras.mission_and_vision_section.image'=>['required'],
            'extras.from_the_management_section.title'=>['required'],
            'extras.from_the_management_section.description'=>['required'],
            'extras.from_the_management_section.image'=>['required'],
        ];
    }

    public function home(){
        return [
            'extras.hero_banner_section.*.main_title'=>['required'],
            'extras.hero_banner_section.*.title'=>['required'],
            'extras.hero_banner_section.*.description'=>['required'],
            'extras.hero_banner_section.*.button_link'=>['required'],
            'extras.hero_banner_section.*.image'=>['required'],
            'extras.hero_banner_section.*.mobile_image'=>['required'],
            'extras.how_it_works_section.title'=>['required'],
            'extras.how_it_works_section.sub_title'=>['required'],
            'extras.how_it_works_section.sections.*.step_text'=>['required'],
            'extras.how_it_works_section.sections.*.step_number'=>['required','numeric','between:1,5'],
            'extras.how_it_works_section.sections.*.step_title'=>['required'],
            'extras.how_it_works_section.sections.*.main_text'=>['required'],
            'extras.how_it_works_section.sections.*.button_link'=>['required'],
            'extras.how_it_works_section.sections.*.step_image'=>['required'],
            'extras.how_it_works_section.sections.*.main_image'=>['required'],
            'page_status_id' => 'required',
            'language_id' => 'required',
            'extras.about_us_section.main_title'=>['required'],
            'extras.about_us_section.title'=>['required'],
            'extras.about_us_section.description_one'=>['required'],
            'extras.about_us_section.description_two'=>['required'],
            'extras.about_us_section.read_more_button'=>['required'],
            'extras.about_us_section.left_image'=>['required'],
            'extras.about_us_section.right_image'=>['required'],
            'extras.our_product_section.main_title'=>['required'],
            'extras.our_product_section.title'=>['required'],
            'extras.our_product_section.description'=>['required'],
            'extras.our_product_section.explore_all_button_link'=>['required'],
            'extras.our_product_section.products'=>['required',"array","min:3"],
            'extras.featured_tailors_section.main_title'=>['required'],
            'extras.featured_tailors_section.title'=>['required'],
            'extras.featured_tailors_section.explore_all_button_link'=>['required'],
            'extras.featured_tailors_section.tailors'=>['required',"array","min:3","max:3"],
            'extras.testimonial_section.main_title'=>['required'],
            'extras.testimonial_section.title'=>['required'],
            'extras.testimonial_section.description'=>['required'],
            'extras.testimonial_section.explore_all_button_link'=>['required'],
            'extras.testimonial_section.testimonials'=>['required',"array","min:3"],
        ];
    }
}
