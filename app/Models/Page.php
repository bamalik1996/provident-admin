<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Cviebrock\EloquentSluggable\Sluggable;
use Kyslik\ColumnSortable\Sortable;

class Page extends Model
{
    use HasFactory;
    use Sluggable;
    use Sortable;

    public $sortable = [
        'created_at',
        'updated_at'
    ];

    protected $fillable = [
        'template_id',
        'title',
        'slug',
        'post_type',
        'content',
        'extras',
        'language_id',
        'parent_id',
        'is_slug',
        'page_status_id'
    ];

    protected $casts = [
        'extras' => 'collection'
    ];

    public function sluggable(): array
    {
        return [
            'slug' => [
                'source' => 'title'
            ]
        ];
    }

    public function template(){
        return $this->belongsTo(Template::class,'template_id','id');
    }

    public function page_status(){
        return $this->belongsTo(PageStatus::class,'page_status_id','id');
    }

    public function child_pages(){
        return $this->hasMany(self::class,'parent_id','id');
    }

    public function parent_page(){
        return $this->belongsTo(self::class,'parent_id','id');
    }

    public function language(){
        return $this->belongsTo(Language::class,'language_id','id');
    }

    public function meta(){
        return $this->morphOne(Meta::class,'meta');
    }
}
