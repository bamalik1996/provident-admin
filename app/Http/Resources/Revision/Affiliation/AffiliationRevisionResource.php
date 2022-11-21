<?php

namespace App\Http\Resources\Revision\Affiliation;

use Illuminate\Http\Resources\Json\JsonResource;

class AffiliationRevisionResource extends JsonResource
{
    public static $wrap = null;

    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {

        $data = $this->getModified();
        $modify = [
            'state' => [
                'new'=>getValue(getStates(getValue($data,'state.new')),'name'),
                'old'=>getValue(getStates(getValue($data,'state.old')),'name')
            ],
            'city' => [
                'new'=>getValue(getCities(getValue($data,'city.new')),'name'),
                'old'=>getValue(getCities(getValue($data,'city.old')),'name')
            ],
        ];
        return collect($data)->merge($modify)->toArray();
    }

}
