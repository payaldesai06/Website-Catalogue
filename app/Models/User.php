<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Laravel\Passport\HasApiTokens;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Hash;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class User extends Authenticatable {
  use SoftDeletes, HasApiTokens, HasFactory;

  /**
   * The attributes that are mass assignable.
   *
   * @var array
   */
  protected $fillable = [
    'email', 'password', 'role_id', 'name'
  ];

  /**
   * The attributes that should be hidden for arrays.
   *
   * @var array
   */
  protected $hidden = [
    'password',
    'remember_token',
  ];

  public function setPasswordAttribute($value) {
    $this->attributes['password'] = Hash::make($value);
  }

  /**
   * @return bool
   */
  public function userAuthorized(): bool {
    return $this->getAttribute('role_id') === 2;
  }

  /**
   * @return bool
   */
  public function adminAuthorized(): bool {
    return $this->getAttribute('role_id') === 1;
  }

  /*
   * user website relationship
   */
  public function websites() {
    return $this->hasMany(Website::class);
  }
}
