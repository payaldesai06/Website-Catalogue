<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Category extends Model {

  use HasFactory;

  protected $guarded = [];

  /*
   * category user relationship
   */
  public function user() {
    return $this->belongsTo(User::class, 'created_by');
  }
}
