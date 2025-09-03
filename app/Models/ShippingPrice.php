<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ShippingPrice extends Model
{
    protected $fillable = ['minStopDeskTarif','maxStopDeskTarif','minHomeTarif','maxHomeTarif','defrence','id'];
    public $timestamps = false;
}
