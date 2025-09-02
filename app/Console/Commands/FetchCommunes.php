<?php

namespace App\Console\Commands;

use App\Services\YalidineServices;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Log;

class FetchCommunes extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'run:fetch-communes';

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
        $result = YalidineServices::fetchCommunsAndStoreInDb();
        if($result['status']){
            $this->info("Communes updated successfully");
            Log::info("Communes updated successfully");
        }else{
            $this->warn("Failled to update Communes");
            Log::warning("Failled to update Communes",["message"=>$result['message'],"error message"=>$result['error']]);
        }
    }
}
