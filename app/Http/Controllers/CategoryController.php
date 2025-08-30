<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    public function index()
    {
        $Categories = Category::withCount('products')->get();

        return response()->json([
            'message' => 'Categories retrieved successfully',
            'Categories' => $Categories
        ], 200);
    }

    public function store(Request $request)
    {
        $validatedRequest = $request->validate([
                        'name' => 'required|string|max:100',
        ]);
        $Category = Category::create($validatedRequest);
        return response()->json([
            'message' => 'Category created successfully',
            'Category' => $Category
        ], 201);
    }

    public function update(Request $request,$id)
    {
        $category = Category::find($id);

         if (!$category) {
            return response()->json([
                'message' => 'Category not found'
            ],404);
        }

        $validatedRequest = $request->validate([
                        'name' => 'required|string|max:100',
        ]);

        $category->update($validatedRequest);

        return response()->json([
            'message' => 'Category updated successfully',
            'Category' => $category
        ], 201);
    }

    public function destroy($id)
    {
        $category = Category::find($id);
        if (!$category) {
            return response()->json([
                'message' => 'Category not found'
            ],404);
        }
        $category->delete();

        return response()->json([
            'message' => "Category deleted succuffuly"
        ]);
    }

    public function GetProductCategories($productId){
    $categories = Product::find($productId)?->categories()->get();


    return response()->json([
        'message' => 'Categories retrieved successfully.',
        'Lenght' => $categories->count(),
        'categories' => $categories,
    ], 200);
    }

    public function AddProductCategory($productId,$categoryId){

    }
}