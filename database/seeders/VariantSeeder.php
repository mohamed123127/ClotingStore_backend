<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class VariantSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run()
{
    // Colors for each product
    $product1Colors = ['Red', 'Blue', 'Green'];
    $product2Colors = ['Green', 'Black', 'White'];

    // 🔹 Product 1
    $product1Sizes = DB::table('sizes')
        ->where('product_id', 1)
        ->pluck('id'); // get all size IDs for product 1

    foreach ($product1Sizes as $sizeId) {
        foreach ($product1Colors as $color) {
            DB::table('variants')->insert([
                'color'      => $color,
                'size_id'    => $sizeId,
                'quantity'   => rand(0, 5), // random between 0 and 5
                'product_id' => 1,
            ]);
        }
    }

    // 🔹 Product 2
    $product2Sizes = DB::table('sizes')
        ->where('product_id', 2)
        ->pluck('id'); // get all size IDs for product 2

    foreach ($product2Sizes as $sizeId) {
        foreach ($product2Colors as $color) {
            DB::table('variants')->insert([
                'color'      => $color,
                'size_id'    => $sizeId,
                'quantity'   => rand(0, 5), // random between 0 and 5
                'product_id' => 2,
            ]);
        }
    }
}
}