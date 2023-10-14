<?php

namespace App\Http\Resources\Category;

use Illuminate\Http\Resources\Json\JsonResource;

class CategoryResource extends JsonResource {
  public function toArray($request): array {
    return [
      'id' => $this->id,
      'name' => $this->name ?? '',
      'createdBy' => !empty($this->user) ? $this->user->name : '',
      'createdAt' => optional($this->created_at)->format(config('constant.date_time_format')) ?? "",
    ];
  }
}
