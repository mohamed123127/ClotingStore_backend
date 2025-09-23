<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

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
        $record = static::firstOrNew(['key' => $key]);

        if (!$record->exists || $record->expired()) {
            $record->count = 0;
            $record->expires_at = now()->addSeconds($ttl);
        }

        $record->count++;
        $record->save();

        return $record->count;
    }
}
