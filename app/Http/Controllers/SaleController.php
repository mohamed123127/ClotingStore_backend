<?php

namespace App\Http\Controllers;

use App\Http\Requests\CustomerRequest;
use App\Http\Requests\SaleRequest;
use App\Http\Resources\SaleResource;
use App\Jobs\CreateParcelJob;
use App\Jobs\TestYalidineJob;
use App\Jobs\YalidineDispatcherJob;
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
    // if(isset($data["customer"]["website"])){
    //     $botFiled = $data["customer"]["website"];
    //     if ($botFiled !== null) {
    //         return response()->json(['message' => 'Bot detected'], 403);
    //     }
    // }
    try {
        return DB::transaction(function () use ($data) {
            $soldItems = $data["soldItems"];
            $customerData = $data["customer"];
            $shippingDetaillies = $data["shippingDetaillies"];
            $salesUnits = new SalesFunctionServices();

            $salesUnits->checkStockAndDecreaseQuantity($soldItems);

            // save customer
            $customerId = $salesUnits->saveCustomer($customerData);

            // // save customer targe size
            // $salesUnits->saveCustomerTargetSize($customerId);

            // save sale
            $saleId = $salesUnits->saveSale($customerId,$shippingDetaillies);

            // save sale Detaillies
            $salesUnits->saveSaleDetaillies($saleId,$soldItems);

           // create parcel in shipping company with worker
           if(config('app.env') == "production"){
           YalidineDispatcherJob::dispatch(CreateParcelJob::class,[
                "saleId" => $saleId,
                "customerData" => $customerData,
                "shippingDetaillies" => $shippingDetaillies,
                "soldItems" => $soldItems
           ])->onQueue('yalidine_dispatcher');
           }else{
                // echo("not added to yalidine we are in development");
            //    YalidineDispatcherJob::dispatch(TestYalidineJob::class,[]);
           }
            return response()->json([
                "status" => "success",
                "message" => "sale added successfully"
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
