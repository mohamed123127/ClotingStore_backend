<?php

use App\Http\Controllers\CategorieController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\CustomerController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\ProductImagesController;
use App\Http\Controllers\SaleController;
use App\Http\Controllers\SizesController;
use App\Http\Controllers\VariantController;
use App\Http\Controllers\WilayaController;
use App\Http\Controllers\Yalidine;
use App\Http\Controllers\YalidineController;
use App\Http\Middleware\YalidineApiRateLimitMiddleware;
use App\Models\Categorie;
use App\Models\Product;
use App\Models\ProductImages;
use App\Models\Size;
use App\Models\Variant;
use App\Services\Yalidine\wilayaServices;
use App\Services\YalidineServices;
use Cloudinary\Tag\Sizes;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Route;

//Products API Routes
Route::get('products/genders',[ProductController::class,'getGenders']);
Route::get('products/MaxAndMinPrice',[ProductController::class,'getMaxAndMinPrice']);
Route::apiResource('products', ProductController::class);

Route::prefix('products/{productId}/')->group(function () {
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

//Extra variants API Routes
Route::get('variants/colors',[VariantController::class,'getAllColors']);
Route::put('variants/{id}', [VariantController::class, 'update']);
Route::delete('variants/{id}', [VariantController::class, 'destroy']);

Route::apiResource('categories', CategoryController::class);
Route::apiResource('customers', CustomerController::class)->only(['index','store']);

//All Yalidine Routes
Route::prefix('yalidine/')->group(function(){
    Route::get("wilayas",[YalidineController::class,'GetWilayas']);
    Route::get("communes/{wilaya_id}",[YalidineController::class,'GetCommunes']);
    Route::get("communes/{wilaya_id}/hasAgence",[YalidineController::class,'GetCommunes_hasAgences']);
    Route::get("agences/{commune_id}",[YalidineController::class,'GetAgences']);
})->middleware(YalidineApiRateLimitMiddleware::class);

Route::apiResource("sales",SaleController::class)->only(['index','store']);

Route::post('testAddProduct',function (Request $request){
    $data = $request->all();
    $product = Product::find($data["id"]);
    $productId = $product->id;
    foreach($data["productImages"] as $productImage){
        ProductImages::create([
            "image_url" => $productImage,
            "product_id" => $productId
        ]);
    };

    foreach($data["sizes"] as $size){
        Size::create([
            "size" => $size,
            "product_id" => $productId
        ]);
    };

    $sizesId = Size::where('product_id', $productId)->pluck('id');
    foreach($data["variants"] as $variant){
        foreach($sizesId as $size){
                Variant::create([
                "size_id" => $size,
                "color" => $variant["color"],
                "quantity" => $variant["quantity"],
                "product_id" => $productId
                ]);
    };
};

    // $productId =
    return response()->json([
        "product" => $productId,
        "data" => $sizesId
    ]);
});

Route::get('/test',function(){
      try {

// Log to all channels in the stack (including Sentry)
Log::info('This is an info message');
Log::warning('User {id} failed to login.', ['id' => 1]);
Log::error('This is an error message');

// Log directly to the Sentry channel
Log::channel('sentry_logs')->error('This will only go to Sentry');
return "test from vps";
    } catch (\Exception $e) {
        // إرسال الاستثناء إلى Sentry
        app('sentry')->captureException($e);
        return "test exception sent!";
    }
});
