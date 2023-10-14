<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Website extends Model {
  protected $guarded = [];

  /*
   * user website relationship
   */
  public function user() {
    return $this->belongsTo(User::class, 'user_id');
  }

  /*
   * website category website relationship
   */
  public function websiteCategories() {
    return $this->hasMany(WebsiteCategory::class);
  }


  /*
   * website vote relationship
   */
  public function votes() {
    return $this->hasMany(WebsiteVote::class, 'website_id');
  }

  /*
   * website decline reasons relationship
   */
  public function websiteDeclinedReasons() {
    return $this->hasMany(WebsiteDeclinedReason::class, 'website_id');
  }
}
