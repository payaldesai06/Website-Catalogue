<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\Auth\LoginRequest;
use App\Http\Requests\Api\Auth\RegistrationRequest;
use App\Http\Resources\User\UserResource;
use App\Services\AuthService;
use Exception;
use Illuminate\Http\JsonResponse;

class AuthController extends Controller {
  protected $authService;

  public function __construct(AuthService $authService) {
    $this->authService = $authService;
  }

  /**
   * User login
   * @param LoginRequest $request
   * @return JsonResponse|mixed
   * @throws Exception
   */
  public function login(LoginRequest $request) {
    if ($user = $this->authService->login()) {
      $accessToken = $user->createToken('authToken')->accessToken;
      return $this->respondWithMessageAndPayload(
        new UserResource($user, $accessToken),
        'Congratulations! You have logged in successfully.'
      );
    }

    return $this->respondBadRequest('Email/Password is wrong.');
  }

  /**
   * Register new user
   * @param RegistrationRequest $request
   * @return JsonResponse|mixed
   * @throws Exception
   */
  public function register(RegistrationRequest $request) {
    if ($user = $this->authService->register()) {
      $accessToken = $user->createToken('authToken')->accessToken;
      return $this->respondWithMessageAndPayload(
        new UserResource($user, $accessToken),
        'Congratulations! You have logged in successfully.'
      );
    }

    return $this->respondBadRequest('Something went wrong.');
  }

  /**
   * User logout
   * @return JsonResponse|mixed
   * @throws Exception
   */
  public function logout() {
    $this->authService->logout();

    return $this->respondWithMessage('You logout successfully.');
  }

  /**
   * Get login user details
   * @return JsonResponse|mixed
   * @throws Exception
   */
  public function authUser() {
    return $this->respondWithData(new UserResource(auth()->user()));
  }
}
