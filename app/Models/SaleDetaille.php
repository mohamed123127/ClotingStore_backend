<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SaleDetaille extends Model
{
        protected $fillable = ['variant_id','selling_price','quantity','sale_id'];
        public $timestamps = false;
}
