<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Sale extends Model
{
        protected $fillable = ['id','status','shipping_label','customer_id'];
        public $incrementing = false;
        protected $keyType = 'string';

}
