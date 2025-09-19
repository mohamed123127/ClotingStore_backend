<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $fillable = ['name', 'description', 'price','sex','preview_image'];

    public function variants(){
        return $this->hasMany(Variant::class);
    }

    public function sizes(){
        return $this->hasMany(Size::class);
    }

    public function Measurements(){
        return $this->hasMany(ProductMeasurement::class);
    }

    public function images(){
        return $this->hasMany(ProductImages::class);
    }

    public function categories(){
        return $this->belongsToMany(Category::class);
    }
}
