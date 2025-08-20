<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class VariantRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'size_id' => 'required|exists:sizes,id',
            'color' => 'required|string|max:255',
            'quantity' => 'required|integer|min:0',
        ];
    }

    protected function prepareForValidation()
    {
        // Ensure product_id is set from the route parameter
        if ($this->route('productId')) {
            $this->merge(['product_id' => $this->route('productId')]);
        }
    }
}
