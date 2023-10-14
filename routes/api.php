<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::group(['namespace' => 'Api'], function () {

  //Auth api calls
  Route::prefix('auth')->group(function () {
    Route::post('/admin/login', 'AuthController@adminLogin');
    Route::post('/login', 'AuthController@login');
    Route::post('/register', 'AuthController@register');
  });

  //Unauthenticated api calls
  Route::prefix('category')->group(function () {
    Route::post('/', 'CategoryController@getList');
    Route::get('/{id}', 'CategoryController@getById');
    Route::post('/websites', 'CategoryController@getCategotyWebsites');
  });
  Route::prefix('website')->group(function () {
    Route::post('/', 'WebsiteController@getList');
    Route::get('/{id}', 'WebsiteController@getById');
  });

  //Authenticated api calls
  Route::group(['middleware' => ['auth:api']], function () {

    Route::post('logout', 'AuthController@logout');

    //Category apis
    Route::prefix('category')->group(function () {
      Route::post('create', 'CategoryController@create');
      Route::patch('update', 'CategoryController@update');
      Route::delete('/{id}', 'CategoryController@delete');
    });

    //Website apis
    Route::prefix('website')->group(function () {
      Route::post('create', 'WebsiteController@create');
      Route::patch('update', 'WebsiteController@update');
      Route::delete('/{id}', 'WebsiteController@delete');
      Route::post('vote', 'WebsiteController@vote');
      Route::post('unvote', 'WebsiteController@unvote');
      //Admin apis
      Route::group(['middleware' => ['admin']], function () {
        Route::post('approve', 'WebsiteController@approve');
        Route::post('decline', 'WebsiteController@decline');
      });
    });
  });
});
