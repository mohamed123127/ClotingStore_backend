<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class SizeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $product1Sizes = [
        '1-2',
        '2-3',
        '3-4',
        '4-5',
        '5-6',
    ];

    foreach ($product1Sizes as $size) {
        DB::table('sizes')->insert([
            'size' => $size,
            'product_id' => 1,
        ]);
    }

    // Product 2 sizes (6-7 to 14-15)
    $product2Sizes = [
        '6-7',
        '8-9',
        '10-11',
        '12-13',
        '14-15',
    ];

    foreach ($product2Sizes as $size) {
        DB::table('sizes')->insert([
            'size' => $size,
            'product_id' => 2,
        ]);
    }
    }
}