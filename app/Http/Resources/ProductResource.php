<?php

namespace App\Http\Resources;

use App\Http\Requests\ProductRequest;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ProductResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray($request): array
    {
        return [
            'id'    => $this->id,
            'name'  => $this->name,
            'description' => $this->description,
            'price' => number_format($this->price,0),
            'preview_image' => $this->preview_image,
        ];
    }
}
