<?php
namespace App\Services;

use Illuminate\Support\Facades\Cache;

class YalidineApiRateLimiter
{
    protected $limits = [
        'second' => 5,
        'minute' => 3,
        'hour'   => 1000,
        'day'    => 10000,
    ];

    protected $keys = [
        'second' => 'api_requests_second',
        'minute' => 'api_requests_minute',
        'hour'   => 'api_requests_hour',
        'day'    => 'api_requests_day',
    ];

    protected $queueKey = 'api_requests_queue';

    public function canRequest(): bool
    {
        foreach ($this->keys as $period => $key) {
            if (Cache::get($key, 0) >= $this->limits[$period]) {
                return false;
            }
        }
        return true;
    }

    public function incrementCounters()
    {
        foreach ($this->keys as $period => $key) {
            $ttl = match($period) {
                'second' => 1,
                'minute' => 60,
                'hour'   => 3600,
                'day'    => 86400,
            };
            Cache::add($key, 0, $ttl);
            Cache::increment($key);
        }
    }

    public function request(callable $fn)
    {
        $queue = Cache::get($this->queueKey, []);

        // أضف الوظيفة إلى queue إذا تجاوز limit
        if (!$this->canRequest()) {
            $queue[] = serialize($fn); // serialize لحفظ callable
            Cache::put($this->queueKey, $queue, 3600);
            return null;
        }

        // إذا يمكن التنفيذ، نفّذ الوظيفة
        $this->incrementCounters();
        $result = $fn();

        // بعد التنفيذ حاول معالجة queue
        $this->processQueue();

        return $result;
    }

    public function processQueue()
    {
        $queue = Cache::get($this->queueKey, []);
        $newQueue = [];

        foreach ($queue as $serializedFn) {
            if ($this->canRequest()) {
                $fn = unserialize($serializedFn);
                $this->incrementCounters();
                $fn();
            } else {
                $newQueue[] = $serializedFn; // أعد إدراج البقية
            }
        }

        Cache::put($this->queueKey, $newQueue, 3600);
    }
}
