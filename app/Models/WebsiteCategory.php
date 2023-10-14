<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class WebsiteCategory extends Model {

  public $timestamps = false;
  protected $guarded = [];

  /*
   * category relationship
   */
  public function category() {
    return $this->belongsTo(Category::class, 'category_id');
  }

  /*
   * website relationship
   */
  public function website() {
    return $this->belongsTo(Website::class, 'website_id');
  }
}
