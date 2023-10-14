<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class WebsiteDeclinedReason extends Model {
  protected $guarded = [];

  /*
   * user relationship
   */
  public function user() {
    return $this->belongsTo(User::class, 'created_by');
  }

  /*
   * website relationship
   */
  public function website() {
    return $this->belongsTo(Website::class, 'website_id');
  }
}
