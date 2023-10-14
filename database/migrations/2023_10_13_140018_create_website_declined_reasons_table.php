<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateWebsiteDeclinedReasonsTable extends Migration {
  /**
   * Run the migrations.
   *
   * @return void
   */
  public function up() {
    Schema::create('website_declined_reasons', function (Blueprint $table) {
      $table->id();
      $table->foreignId('website_id')->constrained('websites')->cascadeOnDelete();
      $table->text('reason');
      $table->foreignId('created_by')->nullable()->constrained('users')->nullOnDelete();
      $table->timestamps();
    });
  }

  /**
   * Reverse the migrations.
   *
   * @return void
   */
  public function down() {
    Schema::dropIfExists('website_declined_reasons');
  }
}
