<?php

namespace App\Rules;

use App\Models\Page;
use Illuminate\Contracts\Validation\Rule;

class UniqueSlug implements Rule
{
    /**
     * Create a new rule instance.
     *
     * @return void
     */
    protected $data;

    public function __construct($data)
    {
        $this->data = $data;
    }

    /**
     * Determine if the validation rule passes.
     *
     * @param  string  $attribute
     * @param  mixed  $value
     * @return bool
     */
    public function passes($attribute, $value)
    {
        $page = Page::query();

        $page=$page->where('id','!=',$this->data->id);

        if($this->data->child_pages->first()){
            $page=$page->where('id','!=',$this->data->child_pages->first()->id);
        }

        if($this->data->parent_page){
            $page=$page->where('id','!=',$this->data->parent_page->id);
        }

        $page = $page->where('slug',$value)->get();

        return count($page) > 0 ? false : true;
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message()
    {
        return 'The Slug is Already Being Used';
    }
}
