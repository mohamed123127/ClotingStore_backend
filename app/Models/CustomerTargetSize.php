<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CustomerTargetSize extends Model
{
    protected $fillable = ['date_of_birth','customer_id'];

    public $timestamps = false;

}