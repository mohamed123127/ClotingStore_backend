<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{
    /**
     * Define the application's command schedule.
     */
    protected function schedule(Schedule $schedule): void
    {
        // مثال: شغل كومانديتك كل ساعة
        $schedule->command('run:fetch-wilayas')->dailyAt('02:00');
        $schedule->command('run:fetch-communes')->dailyAt('02:05');
        $schedule->command('run:fetch-agences')->dailyAt('02:10');
        $schedule->command('run:fetch-shipping-prices')->dailyAt('02:15');
    }

    /**
     * Register the commands for the application.
     */
    protected function commands(): void
    {
        $this->load(__DIR__.'/Commands');

        require base_path('routes/console.php');
    }
}
