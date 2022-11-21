<?php

namespace App\Http\Traits;

use App\Models\Media;
use App\Models\MediaRelation;
use Illuminate\Support\Str;

trait MediaLibrary
{
    public function addMedia($media_id, $collection, $order = 1)
    {

        $checkMediaExits = MediaRelation::where('model_id', $this->id)
            ->where('model_type', self::class)
            ->where('media_id', $media_id)
            ->where('collection', $collection)->exists();

        if (!$checkMediaExits  && $media_id) {

            return MediaRelation::create([
                'model_id' => $this->id,
                'model_type' => self::class,
                'media_id' => $media_id,
                'collection' => $collection,
                'order' => $order,
            ]);
        } elseif ($media_id) {
            return MediaRelation::where([
                'model_id' => $this->id,
                'model_type' => self::class,
                'media_id' => $media_id,
                'collection' => $collection,
            ])->update([
                'order' => $order,
            ]);
        }
    }

    public function deleteMedia($media_ids, $collection)
    {
        if (is_array(($media_ids)) && count(array_filter($media_ids)) > 0) {
            return MediaRelation::where('model_id', $this->id)
                ->where('model_type', self::class)
                ->whereNotIn('media_id', $media_ids)
                ->where('collection', $collection)->delete();
        } else if (is_array(($media_ids)) && count(array_filter($media_ids)) == 0) {
            return MediaRelation::where('model_id', $this->id)
                ->where('model_type', self::class)
                ->where('collection', $collection)->delete();
        } else {
            return MediaRelation::where('model_id', $this->id)
                ->where('model_type', self::class)
                ->where('media_id', '!=', $media_ids)
                ->where('collection', $collection)->delete();
        }
    }

    public function mediaExists($media_id, $collection)
    {
        return MediaRelation::where('model_id', $this->id)
            ->where('model_type', self::class)
            ->where('media_id', $media_id)
            ->where('collection', $collection)->exists();
    }

    public function getMedia($collection)
    {
        $media_relations =  MediaRelation::where('model_id', $this->id)->where('model_type', self::class)->where('collection', $collection)->orderBy('order', 'ASC')->get();
        $mediaTemp = [];
        foreach ($media_relations as $media_relation) {
            $media =  Media::where('id', $media_relation->media_id)->first();
            $media_cast = new Media();
            $media_cast->fill(collect($media)->put('order_column', $media_relation->order)->put('collection_name', $media_relation->collection)->toArray());
            $mediaTemp[] = $media_cast;
        }
        return $mediaTemp;
    }

    public function getFirstMedia($collection)
    {

        $media_relation =  MediaRelation::where('model_id', $this->id)->where('model_type', self::class)->where('collection', $collection)->first();
        if ($media_relation) {
            $media =  Media::where('id', $media_relation->media_id)->first();
            $Topic = new Media();
            $Topic->fill(collect($media)->put('order_column', $media_relation->order)->put('collection_name', $media_relation->collection)->toArray());

            return $Topic;
        }
        return;
    }

    public function getFirstMediaUrl($collection)
    {
        $media = $this->getFirstMedia($collection);
        if ($media) {
            return $media->getUrl();
        }
        return;
    }

    public function addMultipleMedia($media, $collection)
    {
        $this->deleteMedia($media, $collection);
        if (is_array(array_filter($media)) && count(array_filter($media)) > 0) {
            foreach ($media as $key => $value) {
                $this->addMedia($value, $collection, ($key + 1));
            }
        }
    }

    public function addSingleMedia($media, $collection)
    {
        $this->deleteMedia($media, $collection);
        $this->addMedia($media, $collection);
    }
}
