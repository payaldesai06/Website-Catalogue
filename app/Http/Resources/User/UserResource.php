<?php

namespace App\Http\Resources\User;

use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource {

  protected $accessToken;

  public function __construct($user, $accessToken = null) {
    parent::__construct($user);
    $this->accessToken = $accessToken;
  }

  public function toArray($request): array {
    return [
      'user_id' => $this->id ?? "",
      'email' => $this->email ?? "",
      'status' => $this->is_active ?? "",
      'name' => $this->name ?? "",
      'createdAt' => optional($this->created_at)->format(config('constant.date_time_format')) ?? "",
      'access_token' => $this->accessToken
    ];
  }
}
