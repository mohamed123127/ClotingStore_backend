<?php

namespace App\Jobs;

use App\Models\Category;
use App\Models\Sale;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Queue\Queueable;
use Illuminate\Log\Logger;
use Illuminate\Support\Facades\Log;
use Sentry\Logs\Log as LogsLog;

class TestYalidineJob implements ShouldQueue
{
    use Queueable;

    /**
     * Create a new job instance.
     */
    public function __construct()
    {
        //
    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {
        Log::info("test yalidine job");
        Category::create(["name" => "test"]);
    }
}
