<?php

namespace App\Http\Controllers;

use App\Http\Requests\ProductRequest;
use App\Http\Resources\ProductResource;
use App\Models\Category;
use App\Models\Product;
use App\Models\Variant;
use Exception;
use Illuminate\Container\Attributes\Log;
use Illuminate\Http\Request;
use Illuminate\Log\Logger;
use Illuminate\Support\Facades\DB;
use Ramsey\Uuid\Type\Integer;

class ProductController extends Controller
{
    public function index(Request $request)
    {
        try{
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
            $sexes = explode(',', $request->sex);
            $sexes[] = 'U';

            $query->whereIn('sex', $sexes);
        }

        // Filter by category (and eager-load category only if needed)
        if ($request->has('category_id')) {
    $categories = explode(',', $request->category_id);

    foreach ($categories as $catId) {
        $query->whereHas('categories', function($q) use ($catId) {
            $q->where('categories.id', $catId);
        });
    }
}



        // Filter by color (from variants)
       if ($request->has('color')) {
        $colors = explode(',', $request->color);

        $query->whereHas('variants', function($q) use ($colors) {
        $q->where(function($q2) use ($colors) {
            foreach ($colors as $color) {
                $q2->orWhere('color', 'like', '%' . trim($color) . '%');
            }
        });
    });
}
        // Filter by size (from variants/sizes table)
        if ($request->has('size')) {
            $sizes = explode(',', $request->size);

            $query->whereHas('variants', function($q) use ($sizes) {
            $q->whereHas('size', function($q2) use ($sizes) {
                $q2->whereIn('size', $sizes);
            });
    });
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
    }catch(Exception $e){
        return response()->json([
            "message" => "error when getting product",
            "error" => $e->getMessage()
        ]);
    }
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
                    ->orderByRaw("FIELD(sex, 'M', 'F', 'U')")
                    ->get();

        $uCount = $genders->firstWhere('name', 'U')?->count ?? 0;

        // add U count to M and F
        $genders = $genders->map(function ($item) use ($uCount) {
            if ($item->name === 'M' || $item->name === 'F') {
                $item->count += $uCount;
            }
            return $item;
        });

        return response()->json([
            'message' => "genders fetched successfully",
            "genders" => $genders
        ], 200);
    }
}
