<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductMeasurement extends Model
{
    public function product(){
        $this->belongsTo(Product::class);
    }

    public function size(){
        $this->has(Size::class);
    }

    public function measurementType(){
        $this->has(MeasurementType::class);
    }
}
