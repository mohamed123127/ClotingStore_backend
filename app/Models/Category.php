<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $fillable = ['name'];
    public $timestamps = false;
    protected $hidden = ['pivot'];


    public function products(){
        return $this->belongsToMany(Product::class);
    }
}