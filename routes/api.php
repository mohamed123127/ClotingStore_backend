<?php

use App\Http\Controllers\CategorieController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\ProductImagesController;
use App\Http\Controllers\SizesController;
use App\Http\Controllers\VariantController;
use App\Models\Categorie;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');*/


//Products API Routes
Route::get('products/MaxAndMinPrice',[ProductController::class,'getMaxAndMinPrice']);
Route::get('products/genders',[ProductController::class,'getGenders']);

Route::apiResource('products', ProductController::class);
//Route::get('products/{id}/variants',[ProductController::class,'getProductVariants']);

Route::prefix('products/{productId}/')->group(function () {
    //Variants API Routes
    // Route::apiResource('variants', ProductController::class)->only(['index', 'store', 'update', 'destroy']);

    //Images API Routes
    Route::apiResource('images', ProductImagesController::class)->only(['index', 'store', 'update', 'destroy']);

    //Sizes API Routes
    Route::apiResource('sizes', SizesController::class)->only(['index', 'store']);

    //Varaints API Routes
    Route::apiResource('variants', VariantController::class)->only(['index', 'store']);

    //Categories api routes
    Route::get('categories',[CategoryController::class,'GetProductCategories']);
    Route::post('categories/{categoryId}',[CategoryController::class,'AddProductCategory']);
});

//Extra Sizes API Routes
Route::get('sizes',[SizesController::class,'getAllSizes']);
Route::put('sizes/{id}', [SizesController::class, 'update']);
Route::delete('sizes/{id}', [SizesController::class, 'destroy']);

//Extravariants API Routes
Route::get('variants/colors',[VariantController::class,'getAllColors']);
Route::put('variants/{id}', [VariantController::class, 'update']);
Route::delete('variants/{id}', [VariantController::class, 'destroy']);

Route::apiResource('categories', CategoryController::class);
