<?php

namespace App\Http\Middleware;

use Closure;
use App\Traits\ApiResponser;

class CheckAdminMiddleware {
  use ApiResponser;
  /**
   * Handle an incoming request.
   *
   * @param  \Illuminate\Http\Request  $request
   * @param  \Closure  $next
   * @return mixed
   */
  public function handle($request, Closure $next) {
    if (!$request->user()->adminAuthorized()) {
      return $this->respondForbidden('Unauthorized action occurred.');
    }
    return $next($request);
  }
}
