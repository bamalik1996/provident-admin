<?php

namespace App\Http\Traits;

use App\Models\Language;
use App\Models\Seo as SeoModel;
use Illuminate\Support\Facades\DB;

trait Seo
{

    public function seo()
    {
        return $this->morphOne(SeoModel::class, 'seo');
    }

    public function setSeo($data){

        $check_seo_exists = $this->seo;

        if($check_seo_exists){

            $seo =  SeoModel::find($check_seo_exists->id);

        }else{

            $seo = new SeoModel;

        }

        $seo->title = $data['title'];
        $seo->description = $data['description'];
        $seo->data = json_encode($data);

        self::find($this->id)->seo()->save($seo);
    }
}
