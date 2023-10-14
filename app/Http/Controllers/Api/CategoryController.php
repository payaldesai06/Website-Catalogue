<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\Category\CreateCategoryRequest;
use App\Http\Requests\Api\Category\UpdateCategoryRequest;
use App\Http\Requests\Api\Category\DeleteCategoryRequest;
use App\Http\Requests\Api\Category\GetListCategoryRequest;
use App\Http\Requests\Api\Category\GetCategoryWebsiteListRequest;
use App\Http\Resources\Category\CategoryResource;
use App\Http\Resources\Category\GetListCategoryCollection;
use App\Http\Resources\Website\GetListWebsiteCollection;
use App\Services\CategoryService;
use Exception;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Log;

class CategoryController extends Controller {
  protected $categoryService;

  public function __construct(CategoryService $categoryService) {
    $this->categoryService = $categoryService;
  }

  /**
   * Get List category.
   * @param GetListCategoryRequest $request
   * @return JsonResponse|mixed
   */
  public function getList(GetListCategoryRequest $request) {
    try {
      $categories = $this->categoryService->getList($request);
      return $this->respondWithData(new GetListCategoryCollection($categories));
    } catch (Exception $exception) {
      Log::error($exception);
      return $this->respondInternalError($exception->getMessage(), [], $exception);
    }
  }

  /**
   * Create category.
   * @param CreateCategoryRequest $request
   * @return JsonResponse|mixed
   */
  public function create(CreateCategoryRequest $request) {
    try {
      $isCreated = $this->categoryService->create();
      if (!$isCreated) {
        return $this->respondInternalError(config('response.error'), [], []);
      }
      return $this->respondOk();
    } catch (Exception $exception) {
      Log::error($exception);
      return $this->respondInternalError($exception->getMessage(), [], $exception);
    }
  }

  /**
   * Update category.
   * @param UpdateCategoryRequest $request
   * @return JsonResponse|mixed
   */
  public function update(UpdateCategoryRequest $request) {
    try {
      $isUpdated = $this->categoryService->update($request);
      if (!$isUpdated) {
        return $this->respondInternalError(config('response.error'), [], []);
      }
      return $this->respondOk();
    } catch (Exception $exception) {
      Log::error($exception);
      return $this->respondInternalError($exception->getMessage(), [], $exception);
    }
  }

  /**
   * Get category details.
   * @return JsonResponse|mixed
   */
  public function getById() {
    try {
      return $this->respondWithMessageAndPayload(new CategoryResource($this->categoryService->getById()));
    } catch (Exception $exception) {
      Log::error($exception);
      return $this->respondInternalError($exception->getMessage(), [], $exception);
    }
  }

  /**
   * Delete category.
   * @param DeleteCategoryRequest $request
   * @return JsonResponse|mixed
   */
  public function delete(DeleteCategoryRequest $request) {
    try {
      $isDeleted = $this->categoryService->delete($request);
      if (!$isDeleted) {
        return $this->respondInternalError(config('response.error'), [], []);
      }
      return $this->respondOk();
    } catch (Exception $exception) {
      Log::error($exception);
      return $this->respondInternalError($exception->getMessage(), [], $exception);
    }
  }

  /**
   * Get category websites.
   * @param GetCategoryWebsiteListRequest $request
   * @return JsonResponse|mixed
   */
  public function getCategotyWebsites(GetCategoryWebsiteListRequest $request) {
    try {
      $categoryWebsites = $this->categoryService->getCategotyWebsites($request);
      return $this->respondWithData(new GetListWebsiteCollection($categoryWebsites));
    } catch (Exception $exception) {
      Log::error($exception);
      return $this->respondInternalError($exception->getMessage(), [], $exception);
    }
  }

}
