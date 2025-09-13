<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Sale extends Model
{
    protected $fillable = ['status','customer_id'];

    public function saledItems(){
        return $this->hasMany(SaleDetaille::class);
    }

    public function customer(){
        return $this->belongsTo(Customer::class);
    }
}
