<?php


namespace App\Services;

use App\Models\Category;
use App\Models\Website;
use Exception;
use Illuminate\Support\Facades\DB;
use App\Services\AuthService;

class CategoryService {

  /**
   * Get List category.
   * @param $request
   * @return mixed
   * @throws Exception
   */
  public function getList($request) {
    $perPage = $request->pageSize ?? config('response.perPage');
    $result = Category::select('id', 'name', 'created_by', 'created_at')
      ->with('user:id,name')
      ->when($request->has('filter.name'), function ($query) use ($request) {
        return $query->where('name', 'like', '%' . $request->filter['name'] . '%');
      })
      ->orderBy('id', 'desc');
    return $result->paginate($perPage);
  }

  /**
   * Create category.
   * @param $request
   * @return mixed
   * @throws Exception
   */
  public function create() {
    return DB::transaction(function () {
      $getValidatedData = $this->getValidatedData();
      $category = Category::create($getValidatedData);
      return $category;
    });
  }

  /**
   * Validated request data to create category.
   * @return array
   */
  private function getValidatedData(): array {
    return [
      'created_by' => auth()->id(),
      'name' => request('name') ?? null,
    ];
  }

  /**
   * Get category details.
   * @throws Exception
   * @return array
   */
  public function getById() {
    $category = Category::where('id', request('id'))
      ->with(['user:id,name'])
      ->first();
    if (empty($category)) {
      throw new Exception(config('response.category.notFound'));
    }
    return $category;
  }

  /**
   * Update category.
   * @param $request
   * @return mixed
   * @throws Exception
   */
  public function update($request) {
    return DB::transaction(function () use ($request) {
      $category = Category::where('id', $request->id)->first();
      $this->checkPermission($category);
      $category->fill($this->getValidatedData())->save();
      return $category;
    });
  }

  /**
   * Delete category.
   * @param $request
   * @throws Exception
   * @return mixed
   */
  public function delete($request) {
    return DB::transaction(function () use ($request) {
      $category = Category::where('id', $request->id)->first();
      $this->checkPermission($category);
      $category->delete();
      return $category;
    });
  }

  /**
   * Check permission about category.
   * @param $category
   * @return mixed
   * @throws Exception
   */
  private function checkPermission($category) {
    $authUser = (new AuthService())->getAuthUser();
    if ($authUser->adminAuthorized() || $authUser->id == $category->created_by) {
      return true;
    } else {
      throw new Exception(config('response.category.notFound'));
    }
  }

  /**
   * Get category website list.
   * @param $request
   * @return mixed
   * @throws Exception
   */
  public function getCategotyWebsites($request) {
    $perPage = $request->pageSize ?? config('response.perPage');
    $authUser = (new AuthService())->getAuthUser();
    $result = Website::with(['user:id,name'])
      ->whereHas('websiteCategories', function ($query) use ($request) {
        $query->where('category_id', $request->id);
      })->when($request->has('filter.name'), function ($query) use ($request) {
        return $query->where('name', 'like', '%' . $request->filter['name'] . '%');
      });
    if (!$authUser || ($authUser && !$authUser->adminAuthorized())) {
      $result->where('status', 1);
    }
    return $result->paginate($perPage);
  }
}
