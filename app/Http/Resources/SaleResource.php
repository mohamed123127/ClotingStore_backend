<?php

namespace App\Http\Resources;

use App\Models\ShippingPrice;
use App\Models\Wilaya;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class SaleResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            "id" => $this->id,
            "tracking" => $this->tracking,
            "fullName" => $this->customer->lastName . " " . $this->customer->firstName,
            "status" => $this->status,
            "communeAndWillaya" => $this->commune.", " . $this->wilaya,
            "agence/address" => $this->agence_or_address,
            "phoneNumber" => $this->customer->phone_number,
            "totalPrice" => $this->saledItems->sum(fn ($item) => $item->selling_price * $item->quantity) + $this->shipping_price,
            "label" => $this->shipping_label,
            "updated at" => $this->updated_at,
            "saledItems" => saledItemResource::collection($this->saledItems)
        ];
    }
}
