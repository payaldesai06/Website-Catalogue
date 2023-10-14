<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class WebsiteVote extends Model {
  protected $guarded = [];

  /*
   * user relationship
   */
  public function user() {
    return $this->belongsTo(User::class, 'user_id');
  }

  /*
   * website relationship
   */
  public function website() {
    return $this->belongsTo(Website::class, 'website_id');
  }
}
