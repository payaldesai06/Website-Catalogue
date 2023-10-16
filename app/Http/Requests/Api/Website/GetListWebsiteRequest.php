<?php

namespace App\Http\Requests\Api\Website;

use Illuminate\Foundation\Http\FormRequest;

class GetListWebsiteRequest extends FormRequest {
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
      'filter.name' => 'nullable|string|max:255',
      'pageSize' => 'nullable|integer|min:1',
    ];
  }
  public function messages(): array {
    return [
      'filter.name.string' => 'The filter name field is supported only string type.',
      'filter.name.max' => 'The filter name field maximum length is 255.',
    ];
  }
}
