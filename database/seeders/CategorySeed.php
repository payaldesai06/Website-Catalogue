<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class CategorySeed extends Seeder {
  /**
   * Run the database seeds.
   *
   * @return void
   */
  public function run() {
    //create categories of websites
    $categories = [
      ['name' => 'Shopping',],
      ['name' => 'Social Media',],
    ];
    foreach ($categories as $category) {
      \App\Models\Category::create($category);
    }
  }
}
