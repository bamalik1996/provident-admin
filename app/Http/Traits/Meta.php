<?php

namespace App\Http\Traits;

/*
|--------------------------------------------------------------------------
| Api Responser Trait
|--------------------------------------------------------------------------
|
| This trait will be used for any response we sent to clients.
|
*/

class Meta
{
    public function meta(){
        return $this->morphOne(Meta::class,'meta');
    }
}
