<?php

namespace App\Console\Commands;

use App\Services\YalidineServices;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Log;

class FetchAgences extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'run:fetch-agences';

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
        $result = YalidineServices::fetchAgencesAndStoreInDb();
        if($result['status']){
            $this->info("Agences updated successfully");
            Log::info("Agences updated successfully");
        }else{
            $this->warn("Failled to update Agences");
            Log::warning("Failled to update Agences",["message"=>$result['message'],"error message"=>$result['error']]);
        }
    }
}
