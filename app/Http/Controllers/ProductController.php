<?php

namespace App\Http\Controllers;

use App\Http\Requests\ProductRequest;
use App\Http\Resources\ProductResource;
use App\Models\Category;
use App\Models\Product;
use App\Models\Variant;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Ramsey\Uuid\Type\Integer;

class ProductController extends Controller
{
    public function index(Request $request)
    {
        $query = Product::query();

        // Filter by price range
        if ($request->has('min_price')) {
            $query->where('price', '>=', $request->min_price);
        }
        if ($request->has('max_price')) {
            $query->where('price', '<=', $request->max_price);
        }

        // Filter by sex
        if ($request->has('sex')) {
            $query->whereIn('sex', [$request->sex , "U"]);
        }

        // Filter by category (and eager-load category only if needed)
        if ($request->has('category_id')) {
    $query->whereHas('categories', function($q) use ($request) {
        $q->where('categories.id', $request->category_id);
    })->with('categories');
}


        // Filter by color (from variants)
        if ($request->has('color')) {
            $query->whereHas('variants', function($q) use ($request) {
                $q->where('color', $request->color);
            })->with('variants'); // only eager-load if color filter applied
        }

        // Filter by size (from variants/sizes table)
        if ($request->has('size')) {
    $query->whereHas('variants', function($q) use ($request) {
        $q->whereHas('size', function($q2) use ($request) {
            $q2->where('size', $request->size);
        });
    })->with(['variants.size']); // eager-load sizes if needed
}

        $perPage = $request->get('per_page', 9);
        $products = $query->orderBy('name', 'asc')->paginate($perPage);

        return response()->json([
            'message' => 'Products retrieved successfully',
            'total_products' => $products->total(), // total count in DB
            'current_page'   => $products->currentPage(),
            'products_per_page' => $products->perPage(),
            'last_page'      => $products->lastPage(),
            'products' => ProductResource::collection($products)
        ], 200);
    }

    public function store(ProductRequest $request)
    {
        $product = Product::create($request->validated());

        return response()->json([
            'message' => 'Product created successfully',
            'product' => $product
        ], 201);
    }

    public function show($id)
    {
        $product = Product::find($id);

        if (!$product) {
            return response()->json([
                'message' => 'Product not found'
            ])->setStatusCode(404, 'Not Found');
        }

        return response()->json([
            'message' => 'Product retrieved successfully',
            'product' => $product
        ], 200);
    }

    public function update(ProductRequest $request, $id)
    {
        $product = Product::find($id);

        if (!$product) {
            return response()->json([
                'message' => 'Product not found'
            ],404);
        }

        $product->update($request->validated());

        return response()->json([
            'message' => 'Product updated successfully',
            'product' => $product
        ], 200);
    }

    public function destroy($id)
    {
        $product = Product::find($id);
        if (!$product) {
            return response()->json([
                'message' => 'Product not found'
            ],404);
        }
        $product->delete();

        return response()->json([
            'message' => "Product deleted succuffuly"
        ]);
    }

    public function getMaxAndMinPrice(){
        $max = (int)Product::max('price');
        $min = (int)Product::min('price');

        return response()->json([
            'maxPrice' => $max,
            'minPrice' => $min
        ], 200);
    }

    public function getGenders(){
        $genders = Product::select('sex as name', DB::raw('COUNT(*) as count'))
                    ->groupBy('sex')
                    ->orderByRaw("FIELD(sex, 'B', 'G', 'U')")
                    ->get();


        return response()->json([
            'message' => "genders fetched successfully",
            "genders" => $genders
        ], 200);
    }
}