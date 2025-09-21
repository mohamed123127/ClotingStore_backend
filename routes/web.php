<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::get('log-viewer', '\Rap2hpoutre\LaravelLogViewer\LogViewerController@index');
