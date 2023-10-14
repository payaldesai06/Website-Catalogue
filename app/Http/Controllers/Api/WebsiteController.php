<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\Website\CreateWebsiteRequest;
use App\Http\Requests\Api\Website\UpdateWebsiteRequest;
use App\Http\Requests\Api\Website\DeleteWebsiteRequest;
use App\Http\Requests\Api\Website\GetListWebsiteRequest;
use App\Http\Requests\Api\Website\ApproveWebsiteRequest;
use App\Http\Requests\Api\Website\DeclineWebsiteRequest;
use App\Http\Requests\Api\Website\VoteWebsiteRequest;
use App\Http\Requests\Api\Website\UnvoteWebsiteRequest;
use App\Http\Resources\Website\WebsiteResource;
use App\Http\Resources\Website\GetListWebsiteCollection;
use App\Services\WebsiteService;
use Exception;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Log;

class WebsiteController extends Controller {
  protected $websiteService;

  public function __construct(WebsiteService $websiteService) {
    $this->websiteService = $websiteService;
  }

  /**
   * Get List website.
   * @param GetListWebsiteRequest $request
   * @return JsonResponse|mixed
   */
  public function getList(GetListWebsiteRequest $request) {
    try {
      $categories = $this->websiteService->getList($request);
      return $this->respondWithData(new GetListWebsiteCollection($categories));
    } catch (Exception $exception) {
      Log::error($exception);
      return $this->respondInternalError($exception->getMessage(), [], $exception);
    }
  }

  /**
   * Create website.
   * @param CreateWebsiteRequest $request
   * @return JsonResponse|mixed
   */
  public function create(CreateWebsiteRequest $request) {
    try {
      $isCreated = $this->websiteService->create();
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
   * Update website.
   * @param UpdateWebsiteRequest $request
   * @return JsonResponse|mixed
   */
  public function update(UpdateWebsiteRequest $request) {
    try {
      $isUpdated = $this->websiteService->update($request);
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
   * Get website details.
   * @return JsonResponse|mixed
   */
  public function getById() {
    try {
      return $this->respondWithMessageAndPayload(new WebsiteResource($this->websiteService->getById()));
    } catch (Exception $exception) {
      Log::error($exception);
      return $this->respondInternalError($exception->getMessage(), [], $exception);
    }
  }

  /**
   * Delete website.
   * @param DeleteWebsiteRequest $request
   * @return JsonResponse|mixed
   */
  public function delete(DeleteWebsiteRequest $request) {
    try {
      $isDeleted = $this->websiteService->delete($request);
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
   * Approve website.
   * @param ApproveWebsiteRequest $request
   * @return JsonResponse|mixed
   */
  public function approve(ApproveWebsiteRequest $request) {
    try {
      $isApproved = $this->websiteService->approve($request);
      if (!$isApproved) {
        return $this->respondInternalError(config('response.error'), [], []);
      }
      return $this->respondOk();
    } catch (Exception $exception) {
      Log::error($exception);
      return $this->respondInternalError($exception->getMessage(), [], $exception);
    }
  }

  /**
   * Decline website.
   * @param DeclineWebsiteRequest $request
   * @return JsonResponse|mixed
   */
  public function decline(DeclineWebsiteRequest $request) {
    try {
      $isDeclined = $this->websiteService->decline($request);
      if (!$isDeclined) {
        return $this->respondInternalError(config('response.error'), [], []);
      }
      return $this->respondOk();
    } catch (Exception $exception) {
      Log::error($exception);
      return $this->respondInternalError($exception->getMessage(), [], $exception);
    }
  }

  /**
   * Vote website.
   * @param VoteWebsiteRequest $request
   * @return JsonResponse|mixed
   */
  public function vote(VoteWebsiteRequest $request) {
    try {
      $isVoted = $this->websiteService->vote($request);
      if (!$isVoted) {
        return $this->respondInternalError(config('response.error'), [], []);
      }
      return $this->respondOk();
    } catch (Exception $exception) {
      Log::error($exception);
      return $this->respondInternalError($exception->getMessage(), [], $exception);
    }
  }

  /**
   * Unvote website.
   * @param UnvoteWebsiteRequest $request
   * @return JsonResponse|mixed
   */
  public function unvote(UnvoteWebsiteRequest $request) {
    try {
      $isUnvoted = $this->websiteService->unvote($request);
      if (!$isUnvoted) {
        return $this->respondInternalError(config('response.error'), [], []);
      }
      return $this->respondOk();
    } catch (Exception $exception) {
      Log::error($exception);
      return $this->respondInternalError($exception->getMessage(), [], $exception);
    }
  }
}
