<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateWebsitesTable extends Migration {
  /**
   * Run the migrations.
   *
   * @return void
   */
  public function up() {
    Schema::create('websites', function (Blueprint $table) {
      $table->id();
      $table->foreignId('user_id')->constrained('users')->cascadeOnDelete();
      $table->string('name');
      $table->string('link');
      $table->text('description')->nullable();
      $table->string('image')->nullable();
      $table->integer('status')->default(0)->comment('0->pending, 1->active, 2->declined');
      $table->timestamps();
      $table->index('name');
    });
  }

  /**
   * Reverse the migrations.
   *
   * @return void
   */
  public function down() {
    Schema::dropIfExists('websites');
  }
}
