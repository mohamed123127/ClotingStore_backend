<?php

namespace App\Console\Commands;

use App\Models\Wilaya;
use App\Services\YalidineServices;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Log;

class fetchShippingPrices extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'run:fetch-shipping-prices';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $result = YalidineServices::fetchShippingPrices();
        // $this->info("Testing");
        //     Log::warning("Testing",["data"=>$result]);
        if($result['status']){
            $this->info("Shipping prices updated successfully");
            Log::info("Shipping prices updated successfully");
        }else{
            $this->warn("Failled to update Shipping prices");
            Log::warning("Failled to update Shipping prices",["message"=>$result['message'],"error message"=>$result['error']]);
        }
    }
}
