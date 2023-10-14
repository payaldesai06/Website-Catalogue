<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateWebsiteCategoriesTable extends Migration {
  /**
   * Run the migrations.
   *
   * @return void
   */
  public function up() {
    Schema::create('website_categories', function (Blueprint $table) {
      $table->id();
      $table->foreignId('website_id')->constrained('websites')->cascadeOnDelete();
      $table->foreignId('category_id')->constrained('categories')->cascadeOnDelete();
    });
  }

  /**
   * Reverse the migrations.
   *
   * @return void
   */
  public function down() {
    Schema::dropIfExists('website_categories');
  }
}
