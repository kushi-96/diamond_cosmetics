<?php

namespace App\Http\Middleware;

use Closure;
use Fruitcake\Cors\HandleCors as BaseCors;

class CustomCorsMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, \Closure $next)
    {
        \Log::info('CORS middleware triggered'); // Log a message
        return parent::handle($request, $next);
    }
}
