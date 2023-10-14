<?php


namespace App\Services;

use App\Models\Website;
use App\Models\WebsiteVote;
use Exception;
use Illuminate\Support\Facades\DB;
use App\Services\AuthService;

class WebsiteService {

  /**
   * Get List website.
   * @param $request
   * @return mixed
   * @throws Exception
   */
  public function getList($request) {
    $perPage = $request->pageSize ?? config('response.perPage');
    $authUser = (new AuthService())->getAuthUser();
    $result = Website::with('user:id,name')
      ->when($request->has('filter.name'), function ($query) use ($request) {
        return $query->where('name', 'like', '%' . $request->filter['name'] . '%');
      });
    if (!$authUser || ($authUser && !$authUser->adminAuthorized())) {
      $result->where('status', 1);
    }
    $result->withCount('votes')->orderBy('votes_count', 'desc'); //based on votes the most relevant content is always at the top
    return $result->paginate($perPage);
  }

  /**
   * Create website.
   * @param $request
   * @return mixed
   * @throws Exception
   */
  public function create() {
    return DB::transaction(function () {
      $getValidatedData = $this->getValidatedData();
      $website = Website::create($getValidatedData);
      if (!empty(request('category_ids'))) {
        foreach (request('category_ids') as $category_id) {
          $website->websiteCategories()->create(['category_id' => $category_id]);
        }
      }
      if (request()->hasFile('image')) {
        $fileName = $this->getFileName(request('image'));
        request('image')->move(base_path('public/uploads/images'), $fileName);
        $website->image = $fileName;
        $website->save();
      }
      return $website;
    });
  }

  /**
   * Get random file name
   * @return string
   */
  protected function getFileName($file) {
    return time() . '.' . $file->extension();
  }

  /**
   * Validated request data to create website.
   * @return array
   */
  private function getValidatedData(): array {
    return [
      'user_id' => auth()->id(),
      'name' => request('name') ?? null,
      'link' => request('link') ?? null,
      'description' => request('description') ?? null,
      'status' => 0,
    ];
  }

  /**
   * Get website details.
   * @throws Exception
   * @return array
   */
  public function getById() {
    $website = Website::where('id', request('id'))
      ->with(['user:id,name'])
      ->first();
    if (empty($website)) {
      throw new Exception(config('response.website.notFound'));
    }
    return $website;
  }

  /**
   * Update website.
   * @param $request
   * @return mixed
   * @throws Exception
   */
  public function update($request) {
    return DB::transaction(function () use ($request) {
      $website = Website::where('id', $request->id)->first();
      $this->checkPermission($website);
      $website->fill($this->getValidatedData())->save();
      if (!empty(request('category_ids'))) {
        $website->websiteCategories()->delete();
        foreach (request('category_ids') as $category_id) {
          $website->websiteCategories()->create(['category_id' => $category_id]);
        }
      }
      if (request()->hasFile('image')) {
        $fileName = $this->getFileName(request('image'));
        request('image')->move(base_path('public/uploads/images'), $fileName);
        $website->image = $fileName;
        $website->save();
      }
      return $website;
    });
  }

  /**
   * Delete website.
   * @param $request
   * @throws Exception
   * @return mixed
   */
  public function delete($request) {
    return DB::transaction(function () use ($request) {
      $website = Website::where('id', $request->id)->first();
      $this->checkPermission($website);
      $website->delete();
      return $website;
    });
  }

  /**
   * Approve website.
   * @param $request
   * @return mixed
   * @throws Exception
   */
  public function approve($request) {
    return DB::transaction(function () use ($request) {
      $website = Website::where('id', $request->id)->first();
      $website->status = 1;
      $website->save();
      return $website;
    });
  }

  /**
   * Decline website.
   * @param $request
   * @return mixed
   * @throws Exception
   */
  public function decline($request) {
    return DB::transaction(function () use ($request) {
      $website = Website::where('id', $request->id)->first();
      $website->status = 2;
      $website->save();
      if (!empty($request->reason)) {
        $website->websiteDeclinedReasons()->create(
          [
            'reason' => $request->reason,
            'created_by' => auth()->id()
          ]
        );
      }
      return $website;
    });
  }

  /**
   * Vote website.
   * @param $request
   * @return mixed
   * @throws Exception
   */
  public function vote($request) {
    return DB::transaction(function () use ($request) {
      $vote = WebsiteVote::firstOrCreate([
        'website_id' => $request->id,
        'user_id' => auth()->id(),
      ]);
      return $vote;
    });
  }

  /**
   * Unvote website.
   * @param $request
   * @return mixed
   * @throws Exception
   */
  public function unvote($request) {
    return DB::transaction(function () use ($request) {
      $vote = WebsiteVote::where([
        'website_id' => $request->id,
        'user_id' => auth()->id(),
      ])
        ->delete();
      return $vote;
    });
  }

  /**
   * Check permission about website.
   * @param $website
   * @return mixed
   * @throws Exception
   */
  private function checkPermission($website) {
    $authUser = (new AuthService())->getAuthUser();
    if ($authUser->adminAuthorized() || $authUser->id == $website->user_id) {
      return true;
    } else {
      throw new Exception(config('response.website.notFound'));
    }
  }
}
