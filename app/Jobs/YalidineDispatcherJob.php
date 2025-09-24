<?php

namespace App\Jobs;

use App\Models\RateLimit;
use App\Models\Sale;
use App\Services\YalidineServices;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Redis;
use Illuminate\Support\Str;

class YalidineDispatcherJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public string $jobClass;
    public $payload;

    /**
     * Create a new job instance.
     */
      public function __construct(string $jobClass, $payload)
    {
        $this->jobClass = $jobClass;
        $this->payload = $payload;
    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {
        if ($this->canSendRequest()) {
            dispatch_sync(new $this->jobClass($this->payload));
        } else {
            // أعده إلى أول الطابور (LPUSH)
            $this->release(30);
        }
    }

       private function canSendRequest(): bool
    {
        $limits = [
            ['key' => 'api:sec',  'max' => 5,    'ttl' => 1],
            ['key' => 'api:min',  'max' => 50,   'ttl' => 60],
            ['key' => 'api:hour', 'max' => 1000, 'ttl' => 3600],
            ['key' => 'api:day',  'max' => 10000,'ttl' => 86400],
        ];

        foreach ($limits as $limit) {
            $count = RateLimit::incrementLimit($limit['key'], $limit['ttl']);
            if ($count > $limit['max']) {
                return false;
            }
        }

        return true;
    }

    // private function requeueToFront(): void
    // {
    //     $queueName = 'queues:yalidine_dispatcher';
    //     $payload = $this->jobPayload();

    //     // LPUSH → أول الطابور
    //     Redis::lpush($queueName, $payload);
    // }

    // private function jobPayload(): string
    // {
    //     return json_encode([
    //         'uuid' => (string) Str::uuid(),
    //         'displayName' => static::class,
    //         'job' => 'Illuminate\Queue\CallQueuedHandler@call',
    //         'maxTries' => null,
    //         'timeout' => null,
    //         'data' => [
    //             'commandName' => static::class,
    //             'command' => serialize($this),
    //         ],
    //     ]);
    // }
}
