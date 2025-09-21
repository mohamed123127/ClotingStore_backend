<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class SizeResource extends JsonResource
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
           "size" => $this->size,
           "mesurements" => $this->measurements->map(function($mesurement){
                return[
                    "type" => $mesurement->measurement_type_id,
                    "value" => $mesurement->value
                ];
           })
        ];
    }
}
