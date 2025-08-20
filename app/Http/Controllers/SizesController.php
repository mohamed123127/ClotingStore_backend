<?php

namespace App\Http\Controllers;

use App\Http\Requests\SizesRequest;
use App\Models\ProductSizes;
use App\Models\Size;
use Illuminate\Http\Request;

class SizesController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index($productId)
    {
        // Fetch sizes for the given product ID
        $sizes = Size::where('product_id', $productId)->get();

        if($sizes->isEmpty()) {
            return response()->json(['message' => 'No sizes found for this product id'], 404);
        }

        return response()->json([
            'message' => 'Sizes retrieved successfully',
            'sizes' => $sizes
        ], 200);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(SizesRequest $request)
    {
        //$request->merge(['product_id' => $productId]);
        // Validate and create a new size
        $size = Size::create($request->validated());

        return response()->json([
            'message' => 'Size created successfully',
            'size' => $size
        ], 201);
    }

    public function update(SizesRequest $request,$Id)
    {
        $size = Size::find($Id);
        if (!$size) {
            return response()->json(['message' => 'Size not found'], 404);
        }
        $size->update($request->validated());

        return response()->json([
            'message' => 'Size updated successfully',
            'size' => $size
        ], 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($Id)
    {
        $size = Size::find($Id);
        if (!$size) {
            return response()->json(['message' => 'Size not found'], 404);
        }
        $size->delete();

        return response()->json(['message' => 'Size deleted successfully'], 200);
    }
}
