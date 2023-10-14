<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class RoleSeed extends Seeder {
  /**
   * Run the database seeds.
   *
   * @return void
   */
  public function run() {
    //create roles of users
    $roles = [
      ['id' => 1, 'name' => 'Administrator',],
      ['id' => 2, 'name' => 'User',],
    ];
    foreach ($roles as $role) {
      \App\Models\Role::create($role);
    }
  }
}
