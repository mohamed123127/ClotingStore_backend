<?php

namespace App\Http\Controllers;

use App\Http\Requests\ProductImageRequest;
use App\Models\Product;
use App\Models\ProductImages;
use Cloudinary\Cloudinary;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Config;

class ProductImagesController extends Controller
{
    protected function cloudinaryInstance()
    {
        return new Cloudinary([
            'cloud' => [
                'cloud_name' => env('CLOUDINARY_CLOUD_NAME'),
                'api_key'    => env('CLOUDINARY_API_KEY'),
                'api_secret' => env('CLOUDINARY_API_SECRET'),
            ],
            'url' => [
                'secure' => true
            ]
        ]);
    }

    public function index($productId)
    {
        $productImages = ProductImages::where('product_id', $productId)->get();

        if ($productImages->isEmpty()) {
            return response()->json([
                'message' => 'No images found for this product',
                'images' => []
            ], 200);
        }

        return response()->json([
            'message' => 'Product images retrieved successfully',
            'images' => $productImages
        ], 200);
    }

    public function store(Request $request, $productId)
    {
        $request->validate([
            'image' => 'required|image|mimes:jpg,jpeg,png|max:2048',
        ]);

        $cloudinary = $this->cloudinaryInstance();

        $uploadedFile = $cloudinary->uploadApi()->upload(
            $request->file('image')->getRealPath(),
            [
                'folder' => 'products',
                'public_id' => uniqid($productId . '_')
            ]
        );

        $productImage = ProductImages::create([
            'product_id' => $productId,
            'image_url' => $uploadedFile['secure_url']
        ]);

        return response()->json([
            'message' => 'Product image uploaded successfully',
            'data' => $productImage
        ], 201);
    }
}
