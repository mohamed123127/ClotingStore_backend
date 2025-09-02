<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ShippingPrice extends Model
{
    protected $fillable = ['wilaya_id','commune_id','stopDeskTarif','homeTarif'];
    public $timestamps = false;
}
