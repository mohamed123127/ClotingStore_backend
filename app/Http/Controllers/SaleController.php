<?php

namespace App\Http\Controllers;

use App\Http\Requests\CustomerRequest;
use App\Http\Requests\SaleRequest;
use App\Http\Resources\SaleResource;
use App\Models\Sale;
use App\Models\Variant;
use App\Services\SalesFunctionServices;
use App\Services\YalidineServices;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class SaleController extends Controller
{
public function index(){
    $sales = Sale::orderBy('updated_at', 'asc')->paginate(20);

    // return response()->json($sales);

    return response()->json([
        "message" => "sales returned successfully",
        'total_sales' => $sales->total(), // total count in DB
        'current_page'   => $sales->currentPage(),
        'sales_per_page' => $sales->perPage(),
        'last_page'  => $sales->lastPage(),
        "sales" => SaleResource::collection($sales)
    ]);
}

public function store(SaleRequest $request)
{
    $data = $request->all();
    // return response()->json([
        //     "field" => $botFiled
        // ]);
    if(isset($data["customer"]["website"])){
        $botFiled = $data["customer"]["website"];
        if ($botFiled !== null) {
            return response()->json(['message' => 'Bot detected'], 403);
        }
    }
    try {
        return DB::transaction(function () use ($data) {
            $sale = "";
            $tracking = "1";
            $soldItems = $data["soldItems"];
            $customerData = $data["customer"];
            $shippingDetaillies = $data["shippingDetaillies"];
            $salesUnits = new SalesFunctionServices();

            $salesUnits->checkStockAndDecreaseQuantity($soldItems);

            // save customer
            $customerId = $salesUnits->saveCustomer($customerData);

            // save customer targe size
            // $salesUnits->saveCustomerTargetSize($customerId);

            //create parcel in shipping company
        //     $YalidineResponse = YalidineServices::createParcel($customerData,$shippingDetaillies,$soldItems);
        //     if($YalidineResponse['status'] != "success"){
        //         return response()->json([
        //         "message" => $YalidineResponse["message"],
        //         "response" => $YalidineResponse["response"],
        //         "processedData" => $YalidineResponse["processedData"]
        // ], 400);
        //     }
        //     $parcel = $YalidineResponse["data"];

            // save sale
            $sale = $salesUnits->saveSale($tracking,$customerId,"",$shippingDetaillies);

            // save sale Detaillies
            $salesUnits->saveSaleDetaillies($tracking,$soldItems);

            return response()->json([
                "status" => "success",
                "message" => "sale added successfully",
                "saleId" => $tracking,
                "label" => $tracking
            ],201);
        });
    } catch (Exception $e) {
        Log::error("Sale store failed: " . $e->getMessage());

        return response()->json([
            "message" => "Something went wrong",
            "error" => $e->getMessage()
        ], 400);
    }
}
}
