<?php
namespace App\Services;

use App\Models\Agence;
use App\Models\commune;
use App\Models\ShippingPrice;
use App\Models\Variant;
use App\Models\Wilaya;
use Exception;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class YalidineServices{
    public static function fetchWilayasAndStoreInDb(){
        try{
            $response = Http::withoutVerifying()->withHeaders([
                    'X-API-ID' => '67123532299108446759',
                    'X-API-TOKEN' => 't4x6NuMcUgbvsTk2z7k1fOzojocmXYF5LCKa8V0DWUDWKEQagry1NstEvRl9epVd'
                ])->get('https://api.yalidine.app/v1/wilayas');

                if ($response->successful()) {
                    $data = $response->json();
                    $wilayas = $data['data'];
                    foreach($wilayas as $item){
                        Wilaya::updateOrCreate(
                            ['id' => $item['id']],
                            [
                                'name' => $item['name'],
                                "is_deliverable" => $item['is_deliverable']
                            ]
                        );
                    }
                    return ["status"=>true];
                }
                return ["status" => false,"message" => "Failled to fetch data from api","error" => $response->json()->body()];
        }catch(Exception $e){
            return ["status" => false,"message" => "an exception occurred","error" => $e->getMessage()];;
        }
    }

    public static function fetchCommunsAndStoreInDb(){
                        $pageNumber  = 1;
        try{
                Log::info("Start fetching communes");
                $url = "https://api.yalidine.app/v1/communes/";

            do {
    $response = Http::withoutVerifying()->withHeaders( [
        'X-API-ID' => '67123532299108446759',
        'X-API-TOKEN' => 't4x6NuMcUgbvsTk2z7k1fOzojocmXYF5LCKa8V0DWUDWKEQagry1NstEvRl9epVd'
    ])->get($url);

    $data = $response->json();
if ($response->successful()) {
    foreach ($data['data'] as $item) {
        commune::updateOrCreate(
            ['id' => $item['id']],
            [
                'name' => $item['name'],
                'is_deliverable' => $item['is_deliverable'],
                'has_stop_desk' => $item['has_stop_desk'],
                'wilaya_id' => $item['wilaya_id']
            ]
        );
    }

    Log::info("fettching page numbre ".$pageNumber);
    $url = $data['links']['next'] ?? null;
    $pageNumber=$pageNumber+1;

    // 👇 prevent exceeding 5 requests/sec
    if ($url) {
        usleep(500000); // 0.5 sec pause
    }else{
        return ["status"=>true];
    }

    }else{
        return ["status" => false,"message" => "Failled to fetch data from api","error" => $data];
    }

} while ($url);

                return ["status" => false,"message" => "Failled to fetch data from api","error" => $response->json()->body()];
        }catch(Exception $e){
            return ["status" => false,"message" => "an exception occurred","error" => $e->getMessage()];;
        }
    }

    public static function fetchAgencesAndStoreInDb(){
                        $pageNumber  = 1;
        try{
                Log::info("Start fetching agences");
                $url = "https://api.yalidine.app/v1/centers";

            do {
    $response = Http::withoutVerifying()->withHeaders( [
        'X-API-ID' => '67123532299108446759',
        'X-API-TOKEN' => 't4x6NuMcUgbvsTk2z7k1fOzojocmXYF5LCKa8V0DWUDWKEQagry1NstEvRl9epVd'
    ])->get($url);

    $data = $response->json();
if ($response->successful()) {
    foreach ($data['data'] as $item) {
        Agence::updateOrCreate(
            ['id' => $item['center_id']],
            [
                'name' => $item['name'],
                'address' => $item['address'],
                'gps' => $item['gps'],
                'commune_id' => $item['commune_id']
            ]
        );
    }

    Log::info("fettching page numbre ".$pageNumber);
    $url = $data['links']['next'] ?? null;
    $pageNumber=$pageNumber+1;

    // 👇 prevent exceeding 5 requests/sec
    if ($url) {
        usleep(500000); // 0.5 sec pause
    }else{
        return ["status"=>true];
    }

    }else{
        return ["status" => false,"message" => "Failled to fetch data from api","error" => $data];
    }

} while ($url);

                return ["status" => false,"message" => "Failled to fetch data from api","error" => $response->json()->body()];
        }catch(Exception $e){
            return ["status" => false,"message" => "an exception occurred","error" => $e->getMessage()];;
        }
    }

    public static function fetchShippingPrices(){
        $wilayasId = Wilaya::pluck('id')->toArray();

        try{
            Log::info("Start fetching shipping prices");
            $url = "https://api.yalidine.app/v1/fees/?from_wilaya_id=16&to_wilaya_id=";

            foreach($wilayasId as $wilayaId) {
                Log::info("Fetching shipping prices for wilaya id: ".$wilayaId);
                $urlToFetch = $url . $wilayaId;
    $response = Http::withoutVerifying()->withHeaders( [
        'X-API-ID' => '67123532299108446759',
        'X-API-TOKEN' => 't4x6NuMcUgbvsTk2z7k1fOzojocmXYF5LCKa8V0DWUDWKEQagry1NstEvRl9epVd'
    ])->get($urlToFetch);

    $data = $response->json();
    // Log::info("Data received",["data"=>$data['per_commune']]);
    // return ["status"=>"test","data" => $data];
if ($response->successful()) {
    $minStopDeskPrice = 99999;
    $minHomePrice = 99999;
    foreach ($data['per_commune'] as $item) {
        //Log::info("Storing shipping price for wilaya id: ",["data"=>json_encode($item)]);
        if($item['express_desk'] <= $minStopDeskPrice) $minStopDeskPrice = $item['express_desk'];
        if($item['express_home'] <= $minHomePrice) $minHomePrice = $item['express_home'];
    }
    Wilaya::updateOrCreate(
            ['id' => $wilayaId],
            [
                'stopDeskTarif' => $minStopDeskPrice,
                'homeTarif' => $minHomePrice,
            ]
        );
    //$url = $data['links']['next'] ?? null;
    usleep(1500000);
    // 👇 prevent exceeding 5 requests/sec
    // if ($url) {
    //     usleep(500000); // 0.5 sec pause
    // }else{
    // }

}else{
    return ["status" => false,"message" => "Failled to fetch data from api","error" => $data];
}

}

return ["status"=>true];
                //return ["status" => false,"message" => "Failled to fetch data from api","error" => $response->json()->body()];
        }catch(Exception $e){
            return ["status" => false,"message" => "an exception occurred","error" => $e->getMessage()];;
        }
    }

    public static function createParcel($customer,$shippingDetaillies,$soldItems){
        try{
            $productList = "";
            $totalPrice = 0;
            foreach ($soldItems as $soldItem) {
                $variant = Variant::find($soldItem['variantId']);
                if ($variant && $variant->product) {
                    $productName = $variant->product->name;
                    $productList .= "-{$productName} ";
                }
                $totalPrice += $soldItem['selling_price'] * $soldItem['quantity'];
            }
            $productList .= " (Jardin d'enfant)";
            $processedData = [[
                "order_id"=>"1",
                "from_wilaya_name"=>"Alger",
                "firstname"=>$customer["firstName"],
                "familyname"=>$customer["lastName"],
                "contact_phone"=>$customer["phone_number"],
                "to_commune_name"=>$shippingDetaillies["commune"],
                "to_wilaya_name"=>$shippingDetaillies["wilaya"],
                "address" => $shippingDetaillies["address"],
                "product_list"=>$productList,
                "price"=>$totalPrice,
                "do_insurance" => true,
                "declared_value" => $totalPrice,
                "height"=> 0,
                "width" => 0,
                "length" => 0,
                "weight" => 0,
                "freeshipping"=> false,
                "has_exchange"=> false,
                "is_stopdesk"=> false
            ]];
            if($shippingDetaillies['shippingMethod'] === "stopDesk"){
                $processedData[0]["is_stopdesk"] = true;
                $processedData[0]["stopDesk_id"] = $shippingDetaillies["stopDeskId"];
            }
    $response = Http::withoutVerifying()->withHeaders( [
        'X-API-ID' => '67123532299108446759',
        'X-API-TOKEN' => 't4x6NuMcUgbvsTk2z7k1fOzojocmXYF5LCKa8V0DWUDWKEQagry1NstEvRl9epVd',
        "Content-Type" => "application/json"
    ])->post("https://api.yalidine.app/v1/parcels",$processedData);

    $data = $response->json();
    if ($response->successful() && $data["1"]['success'] == true) {
    return ["status" => true,"data" => $data["1"]];
    }else{
        return ["status" => false,"message" => "Failled to create parcel","response" => $data,"processedData" => $processedData];
    }

        }catch(Exception $e){
            return ["status" => false,"message" => "an exception occurred","error" => $e->getMessage()];;
        }
    }
}
