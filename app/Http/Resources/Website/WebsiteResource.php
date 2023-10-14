<?php

namespace App\Http\Resources\Website;

use Illuminate\Http\Resources\Json\JsonResource;

class WebsiteResource extends JsonResource {
  public function toArray($request): array {
    return [
      'id' => $this->id,
      'userId' => $this->user_id,
      'userName' => !empty($this->user) ? $this->user->name : '',
      'name' => $this->name ?? '',
      'link' => $this->link ?? '',
      'description' => $this->description ?? '',
      'image' => $this->image ? url('uploads/images') . '/' . $this->image : '',
      'status' => $this->status ?? '',
      'createdAt' => optional($this->created_at)->format(config('constant.date_time_format')) ?? "",
    ];
  }
}
