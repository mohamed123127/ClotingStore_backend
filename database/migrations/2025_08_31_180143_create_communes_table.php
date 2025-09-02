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
        Schema::create('communes', function (Blueprint $table) {
            $table->integer('id')->primary();
            $table->string('name');
            $table->boolean('is_deliverable')->default(true);
            $table->boolean('has_stop_desk')->default(true);
            $table->integer('wilaya_id')->foreignId()->references('id')->on('wilayas')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('communes');
    }
};
