<?php

namespace App\Http\Controllers;

use App\Http\Requests\CustomerRequest;
use App\Http\Requests\SaleRequest;
use App\Models\Sale;
use App\Models\Variant;
use App\Services\SalesFunctionServices;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class SaleController extends Controller
{
public function index(){
    $sales = Sale::with("saledItems")->with("customer")->get();

    return response()->json([
        "message" => "sales returned successfully",
        "sales" => $sales
    ]);
}

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
}
