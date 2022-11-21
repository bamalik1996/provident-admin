<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Meta extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'description',
        'title_ar',
        'description_ar'
    ];

    public function meta(){
        return $this->morphTo();
    }
}
