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
        Schema::create('agences', function (Blueprint $table) {
            $table->integer('id')->primary();
            $table->string('name');
            $table->string('address')->default(true);
            $table->string('gps')->default(true);
            $table->integer('commune_id')->foreignId()->references('id')->on('communes')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('agences');
    }
};
