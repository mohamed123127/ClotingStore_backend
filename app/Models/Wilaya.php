<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Wilaya extends Model
{
    protected $fillable = ['id','name','stopDeskTarif','homeTarif','is_deliverable'];
    public $timestamps = false;

    public function communes()
    {
        return $this->hasMany(Commune::class, 'wilaya_id');
    }

}