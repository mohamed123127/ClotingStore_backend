<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('products')->insert([
            [
                'name' => 'Ensemble Creavf',
                'description' => 'A comfortable cotton Ensemble',
                'price' => 3800,
                'sex' => 'M',
                'preview_image' => "https://res.cloudinary.com/dpmow9eng/image/upload/v1755436283/Creativ1_fkdqjq.jpg",
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Ensemble Dream',
                'description' => 'Stylish Girl Cloting',
                'price' => 4200,
                'sex' => 'F',
                'preview_image' => "https://res.cloudinary.com/dpmow9eng/image/upload/v1755436814/Dream_k6ho6q.jpg",
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Ensemble Creavf 2',
                'description' => 'A comfortable cotton Ensemble',
                'price' => 3800,
                'sex' => 'M',
                'preview_image' => "https://res.cloudinary.com/dpmow9eng/image/upload/v1755436283/Creativ1_fkdqjq.jpg",
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Ensemble Dream - U',
                'description' => 'Stylish Girl Cloting',
                'price' => 4200,
                'sex' => 'U',
                'preview_image' => "https://res.cloudinary.com/dpmow9eng/image/upload/v1755436814/Dream_k6ho6q.jpg",
                'created_at' => now(),
                'updated_at' => now(),
            ]
        ]);
    }
}