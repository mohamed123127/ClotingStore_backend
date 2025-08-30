<?php

namespace App\Http\Controllers;

use App\Http\Requests\VariantRequest;
use App\Http\Resources\VariantResource;
use App\Models\Variant;
use Illuminate\Http\Request;

class VariantController extends Controller
{
    public function index($productId)
    {
        $variants = Variant::where('product_id',$productId)->with('size')->get();
        if($variants->isEmpty()){
            return response()->json(["message" => "No variants found for this product id"],404);
        }

        return response()->json([
            'message' => 'Variants retrieved successfully.',
            'data' => VariantResource::collection($variants),
        ]);
    }

    public function store(VariantRequest $request, $productId)
    {
        $data = $request->validated();
        $data['product_id'] = $productId; // Set product_id from route

        $variant = Variant::create($data);

        return response()->json([
            'message' => 'Variant added successfully',
            "variant" => $variant
        ], 201);
    }

    public function update(VariantRequest $request,$id){
        $variant = Variant::find($id);

        if(!$variant) {
            return response()->json([
                "message" => "no variant exsists by this id"
            ],404);
        }

        $variant->update($request->validated());
        return response()->json([
            "message" => "Variants updated Successfully",
            "Variant" => $variant
        ]);
    }

    public function destroy($id){
        $variant = Variant::find($id);

        if(!$variant) {
            return response()->json([
                "message" => "no variant exsists by this id"
            ],404);
        }
        $variant->delete();
        return response()->json([
            "message" => "Variants deleted Successfully"
        ],203);
    }

    public function getAllColors(){
        $colors = Variant::select('color')->distinct()->pluck('color');

        return response()->json([
            'message' => 'Colors retrieved successfully',
            'colors' => $colors
        ], 200);
    }
}