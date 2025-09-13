<?php

namespace App\Http\Resources;

use App\Models\Variant;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class saledItemResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        $variant = Variant::find($this->variant_id);
        return [
            "product" => $variant->product->name,
            "color" => $variant->color,
            "size" => $variant->size->size,
            "selling_price" => $this->selling_price,
            "quantity" => $this->quantity,
        ];
    }
}
