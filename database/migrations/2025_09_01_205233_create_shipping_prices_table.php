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
        Schema::create('shipping_prices', function (Blueprint $table) {
            $table->id();
            $table->string('wilaya_id');
            $table->string('commune_id');
            $table->string('stopDeskTarif');
            $table->string('homeTarif');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('shipping_prices');
    }
};
