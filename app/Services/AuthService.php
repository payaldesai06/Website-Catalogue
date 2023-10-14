<?php

namespace App\Services;

use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Exception;

class AuthService {

  public function __construct() {
  }

  /**
   * Register new user
   * @return mixed
   * @throws Exception
   */
  public function register() {
    $userData = request([
      'email', 'password', 'name'
    ]);
    $user = User::create($userData);
    return $user;
  }

  /**
   * Login user
   * @return mixed
   * @throws Exception
   */
  public function login() {

    if (
      Auth::attempt(
        ['email' => request('email'), 'password' => request('password')]
      )
      // User cannot log in if not in active status.
      && Auth::user()->is_active == 1
    ) {
      return Auth::user();
    }
    return null;
  }

  /**
   * Logout user
   * @return mixed
   * @throws Exception
   */
  public function logout() {
    return request()->user()->token()->revoke();
  }

  /**
   * Get login user details
   * @return mixed
   * @throws Exception
   */
  public function getAuthUser() {
    $user = auth('api')->user();
    return $user;
  }
}
