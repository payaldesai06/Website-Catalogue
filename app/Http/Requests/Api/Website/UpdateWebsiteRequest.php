<?php

namespace App\Http\Requests\Api\Website;

use Illuminate\Foundation\Http\FormRequest;

class UpdateWebsiteRequest extends FormRequest {
  /**
   * Determine if the user is authorized to make this request.
   *
   * @return bool
   */
  public function authorize(): bool {
    return true;
  }

  /**
   * Get the validation rules that apply to the request.
   *
   * @return array
   */
  public function rules(): array {
    return [
      'id' => 'required|integer|exists:websites,id',
      'category_ids' => 'array|min:1',
      'category_ids.*' => 'required|integer|exists:categories,id|distinct',
      'name' => 'required|string|max:255',
      'link' => 'nullable|string|max:255',
      'description' => 'nullable',
      'image' => 'nullable|image|mimes:jpeg,bmp,png|max:10240',
    ];
  }
}
