<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class UserSeed extends Seeder {
  /**
   * Run the database seeds.
   *
   * @return void
   */
  public function run() {
    //create user and adminstartor for testing
    $users = [
      ['name' => 'Admin', 'email' => 'admin@admin.com', 'password' => '123456', 'role_id' => 1], //admin
      ['name' => 'Payal Desai', 'email' => 'payal.desai06@gmail.com', 'password' => '123456', 'role_id' => 2] //user (loan seeker)
    ];
    foreach ($users as $user) {
      \App\Models\User::create($user);
    }
    //create more testing users using factory
    \App\Models\User::factory()->count(15)->create();
  }
}
