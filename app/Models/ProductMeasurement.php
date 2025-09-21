<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductMeasurement extends Model
{
    public function product(){
        return $this->belongsTo(Product::class);
    }

    public function size(){
        return $this->belongsTo(Size::class);
    }

    public function measurementType(){
        return $this->belongsTo(MeasurementType::class);
    }
}
