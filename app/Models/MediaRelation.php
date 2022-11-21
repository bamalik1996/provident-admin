<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

class MediaRelation extends Model  implements HasMedia
{
    use HasFactory;
    use InteractsWithMedia;
    protected $fillable = ['media_id', 'model_type', 'model_id', 'order', 'collection'];

    public function registerMediaConversions(Media $media = null): void
    {
        if(!in_array($media->mime_type,['image/svg+xml'])){

            $this->addMediaConversion('thumb')
            ->width(250)
            ->height(250);
        }

    }
}
