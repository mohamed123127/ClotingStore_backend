<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Agence extends Model
{
    protected $fillable = ['id','name','address','gps','commune_id'];
    public $timestamps = false;

    public function commune()
    {
        return $this->belongsTo(Commune::class, 'commune_id');
    }
}
