<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use App\Services\ApiRateLimiter;
use App\Services\YalidineApiRateLimiter;

class YalidineApiRateLimitMiddleware
{
    protected $limiter;

    public function __construct()
    {
        $this->limiter = new YalidineApiRateLimiter();
    }

    /**
     * Handle an incoming request.
     */
    public function handle(Request $request, Closure $next)
    {
        // هنا نغلف تنفيذ الطلب في دالة
        $response = $this->limiter->request(function() use ($next, $request) {
            return $next($request);
        });

        // إذا لم يسمح بـ request (تم وضعه في queue) نرسل Response مؤقت
        if ($response === null) {
            return response()->json([
                'message' => 'Rate limit exceeded. Your request is queued.'
            ], 429); // 429 = Too Many Requests
        }

        return $response;
    }
}
