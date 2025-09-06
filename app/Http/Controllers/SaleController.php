<?php

namespace App\Http\Controllers;

use App\Http\Requests\CustomerRequest;
use App\Http\Requests\SaleRequest;
use App\Models\Variant;
use App\Services\SalesFunctionServices;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class SaleController extends Controller
{

public function store(SaleRequest $request)
{
    $data = $request->all();
    try {
        return DB::transaction(function () use ($data) {
            $sale = "";
            $soldItems = $data["soldItems"];
            $customerData = $data["customer"];
            $salesUnits = new SalesFunctionServices();

            $salesUnits->checkStockAndDecreaseQuantity($soldItems);

            // save customer
            $customerId = $salesUnits->saveCustomer($customerData);

            // save customer targe size
            // $salesUnits->saveCustomerTargetSize($customerId);

            // save sale
            $saleId = $salesUnits->saveSale($customerId);

            // save sale Detaillies
            $salesUnits->saveSaleDetaillies($saleId,$soldItems);

            //create parcel in shipping company

            return response()->json([
                "message" => "Sale added successfully",
                "sale" => $customerId
            ]);
        });
    } catch (\Throwable $e) {
        Log::error("Sale store failed: " . $e->getMessage());

        return response()->json([
            "message" => "Something went wrong",
            "error" => $e->getMessage()
        ], 400);
    }
}


        // save customer
        // save customer targe size
        // save sale
        // save sale Detaillies

            // $test = "";
            // $soldItems = $data['soldItems'];
            // Cache::lock('decrement_stock_lock', 10)->block(5, function () use ($soldItems) {
            //     DB::transaction(function () use ($soldItems) {
            //         foreach ($soldItems as $soldItem) {
            //             $variant = Variant::where('id', $soldItem['variantId'])
            //                             ->first();

            //             if ($variant->quantity < $soldItem['quantity']) {
            //                 throw new \Exception("Insufficient stock for variant {$soldItem['variantId']}");
            //             }

            //             $variant->quantity -= $soldItem['quantity'];
            //             $variant->save();
            //         }
            //     });
            // });

            // foreach($soldItems as $soldItem){
            //     $variant = Variant::find($soldItem['variantId']);
            //     if($variant->quantity < $soldItem['quantity']) {
            //         return response()->json([
            //         "message" => "The requested quantity is not available for variant id ".$soldItem['variantId'],
            //         "requested quantity" => $soldItem['quantity'],
            //         "available quantity" => $variant->quantity
            //     ]);
            // }
            // }

            // //foreach($request->)
            // // Decrease stock in db

            // $sale = "";
            // return response()->json([
            //     "message" => "sale added successfully",
            //     "sale" => $test
            // ]);

//     public function store(SaleRequest $request){
//         $data = $request->all();
//         $soldItems = $data['soldItems'];

//         DB::beginTransaction();
//         try {

//             return Cache::lock('decrement_stock_lock', 10)->block(5, function () use ($soldItems) {
//         foreach ($soldItems as $soldItem) {
//             $variant = Variant::where('id', $soldItem['variantId'])->first();

//             if ($variant->quantity < $soldItem['quantity']) {
//                 // 🔄 إلغاء العملية
//                 DB::rollBack();
//                 return response()->json([
//                     "message" => "The requested quantity is not available for variant id ".$soldItem['variantId'],
//                     "requested_quantity" => $soldItem['quantity'],
//                     "available_quantity" => $variant->quantity
//                 ], 400);
//             }

//             $variant->quantity -= $soldItem['quantity'];
//             $variant->save();
//         }

//         // إذا كل شيء تمام → احفظ البيع
//         $sale = Sale::create([
//             // بيانات البيع ...
//         ]);

//         DB::commit();

//         return response()->json([
//             "message" => "Sale added successfully",
//             "sale" => $sale
//         ]);
//     } catch (\Throwable $e) {
//         DB::rollBack();
//         return response()->json([
//             "message" => "Something went wrong",
//             "error" => $e->getMessage()
//         ], 500);
//     }
// });

//
//     }
}