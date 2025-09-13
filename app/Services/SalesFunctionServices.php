<?php
namespace App\Services;

use App\Http\Requests\CustomerRequest;
use App\Models\Customer;
use App\Models\CustomerTargetSize;
use App\Models\Sale;
use App\Models\SaleDetaille;
use App\Models\Variant;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;

class SalesFunctionServices{

public function checkStockAndDecreaseQuantity($soldItems)
{
    return Cache::lock('decrement_stock_lock', 10)->block(5, function () use ($soldItems) {
        foreach ($soldItems as $soldItem) {
            $variant = Variant::where('id', $soldItem['variantId'])->first();

            if (!$variant) {
                throw new \Exception("Variant not found: {$soldItem['variantId']}");
            }

            if ($variant->quantity < $soldItem['quantity']) {
                throw new \Exception("The requested quantity is not available for variant id {$soldItem['variantId']}. Requested {$soldItem['quantity']}, available {$variant->quantity}");
            }

            $variant->quantity -= $soldItem['quantity'];
            $variant->save();
        }
    });
}

public function saveCustomer($data){
        $customer = Customer::where('phone_number',$data['phone_number'])->first();
        if(!$customer){
            $customer = Customer::create($data);
        }

        return $customer->id;
    }

public function saveCustomerTargetSize($customerId,$sizes){
        foreach($sizes as $size){
            $yearOfBirth = now()->subYears($size);
            $customer = CustomerTargetSize::create();
        }

        return [
            "message" => "Customer added successfully",
            "data" => $customer
        ];
    }

    public function saveSale($tracking,$customerId,$shippingLabel){
        $sale = Sale::create([
            "id" => $tracking,
            "status" => "En préparation",
            "shipping_label" => $shippingLabel,
            "customer_id" => $customerId
        ]);

        return $sale;
    }

    public function saveSaleDetaillies($saleId,$soldItems){
        foreach($soldItems as $soldItem){
            SaleDetaille::create([
                "variant_id" => $soldItem['variantId'],
                "selling_price" => $soldItem['selling_price'],
                "quantity" => $soldItem['quantity'],
                "sale_id"=>$saleId
            ]);
        }
    }
}
?>
