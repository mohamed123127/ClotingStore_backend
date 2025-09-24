<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class RateLimit extends Model
{
    protected $fillable = ['key', 'count', 'expires_at'];

    protected $casts = [
        'expires_at' => 'datetime',
    ];

    public function expired(): bool
    {
        return $this->expires_at->isPast();
    }

    public static function incrementLimit(string $key, int $ttl): int
    {
        return DB::transaction(function () use ($key, $ttl) {
        $record = RateLimit::where('key', $key)->lockForUpdate()->first();

        if (!$record || $record->expired()) {
            $record = $record ?: new RateLimit(['key' => $key]);
            $record->count = 0;
            $record->expires_at = now()->addSeconds($ttl);
        }

        $record->count++;
        $record->save();

        return $record->count;
    });
    }
}
