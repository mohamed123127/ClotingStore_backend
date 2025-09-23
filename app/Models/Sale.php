<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Sale extends Model
{
    protected $fillable = ['id','tracking','status','wilaya','commune','agence_or_address','shipping_price','shipping_label','customer_id'];

    public function saledItems(){
        return $this->hasMany(SaleDetaille::class);
    }

    public function customer(){
        return $this->belongsTo(Customer::class);
    }
}
