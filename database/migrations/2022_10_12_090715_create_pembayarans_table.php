<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
  /**
   * * Run the migrations.
   * *
   * * @return void
   * */
   public function up()
   {
     Schema::create('pembayaran', function (Blueprint $table) {
       $table->id();
       $table->bigInteger('siswa')->unsigned();
       $table->foreign('siswa')->references('id')->on('siswa');
       $table->bigInteger('nominal');
       $table->timestamps();
     });
   }
   
   /**
    * * Reverse the migrations.
    * *
    * * @return void
    * */
    public function down()
    {
      Schema::dropIfExists('pembayaran');
    }
};
