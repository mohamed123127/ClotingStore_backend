<?php

namespace App\Jobs;

use App\Models\Sale;
use App\Services\YalidineServices;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Queue\Queueable;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Log;

class CreateParcelJob implements ShouldQueue
{
    use Queueable;
    public $parcelData;

    /**
     * Create a new job instance.
     */
    public function __construct($parcelData)
    {
        $this->parcelData = $parcelData;
    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {
        $customerData = $this->parcelData["customerData"];
        $shippingDetaillies = $this->parcelData["shippingDetaillies"];
        $soldItems = $this->parcelData["soldItems"];
        $saleId = $this->parcelData["saleId"];

        $YalidineResponse = YalidineServices::createParcel($customerData,$shippingDetaillies,$soldItems);
            if($YalidineResponse['status'] != "success"){
                Log::error("failled to save sale in yalidine",[
                "message" => $YalidineResponse["message"],
                "response" => $YalidineResponse["response"],
                "processedData" => $YalidineResponse["processedData"]
                ]);
            }
            $parcel = $YalidineResponse["data"];

            Sale::find($saleId)->update([
                "tracking" => $parcel['tracking'],
                "shipping_label" => $parcel['label']
            ]);
    }
}
