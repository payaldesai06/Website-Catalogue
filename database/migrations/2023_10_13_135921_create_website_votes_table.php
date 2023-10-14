<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateWebsiteVotesTable extends Migration {
  /**
   * Run the migrations.
   *
   * @return void
   */
  public function up() {
    Schema::create('website_votes', function (Blueprint $table) {
      $table->id();
      $table->foreignId('website_id')->constrained('websites')->cascadeOnDelete();
      $table->foreignId('user_id')->constrained('users')->cascadeOnDelete();
      $table->timestamps();
    });
  }

  /**
   * Reverse the migrations.
   *
   * @return void
   */
  public function down() {
    Schema::dropIfExists('website_votes');
  }
}
