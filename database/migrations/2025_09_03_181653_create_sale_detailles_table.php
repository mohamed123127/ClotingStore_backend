<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('sale_detailles', function (Blueprint $table) {
            $table->id();
            $table->foreignId('variant_id');
            $table->decimal('selling_price');
            $table->integer('quantity');
            $table->foreignId('sale_id');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sale_detailles');
    }
};
