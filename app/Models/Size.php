<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Size extends Model
{
    protected $fillable = ['size','product_id'];

    public $timestamps = false;

    public function product(){
        return $this->belongsTo(Product::class);
    }

    public function productMeasurements(){
        return $this->belongsToMany(ProductMeasurement::class);
    }

    public function variants(){
        return $this->hasOne(Variant::class);
    }
}
