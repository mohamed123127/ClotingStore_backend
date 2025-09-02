<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Commune extends Model
{
    protected $fillable = ['id','name','is_deliverable','has_stop_desk','wilaya_id'];
    public $timestamps = false;

    public function wilaya()
    {
        return $this->belongsTo(Wilaya::class, 'wilaya_id');
    }

    public function agences()
    {
        return $this->hasMany(Agence::class, 'commune_id');
    }
}
