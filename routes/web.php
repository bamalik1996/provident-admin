<?php

use App\Http\Controllers\RoleController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\HeroBannerController;
use App\Http\Controllers\HowitWorkController;
use App\Http\Controllers\PageController;
use App\Http\Controllers\ProductColorController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\ProductShopController;
use App\Http\Controllers\ProductSizeController;
use App\Http\Controllers\TailorController;
use App\Http\Controllers\ThemeSettingController;
use App\Http\Controllers\Auth\ProfileController;
use App\Http\Controllers\CityController;
use App\Http\Controllers\ContactController;
use App\Http\Controllers\CouponController;
use App\Http\Controllers\CustomerController;
use App\Http\Controllers\EmailTemplateController;
use App\Http\Controllers\FAQController;
use App\Http\Controllers\KandoraAmountCrystalController;
use App\Http\Controllers\KandoraDesignController;
use App\Http\Controllers\KandoraDesignSleeveController;
use App\Http\Controllers\KandoraFabricController;
use App\Http\Controllers\KandoraKhawarNeckLengthController;
use App\Http\Controllers\KandoraNeckFrontLengthController;
use App\Http\Controllers\KandoraNeckShapeController;
use App\Http\Controllers\KandoraPatternController;
use App\Http\Controllers\KandoraSizeCrystalController;
use App\Http\Controllers\KandoraSleeveButtonController;
use App\Http\Controllers\KandoraSleeveLengthController;
use App\Http\Controllers\KandoraTypeCrystalController;
use App\Http\Controllers\KandoraWaistShapeTightController;
use App\Http\Controllers\MediaController;
use App\Http\Controllers\MenuController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\ProductFabricController;
use App\Http\Controllers\ProductRatingController;
use App\Http\Controllers\Property\PropertyController;
use App\Http\Controllers\SlugController;
use App\Http\Controllers\TestimonailController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Session;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('storage',function(){
    Artisan::call("storage:link");
});


Route::group(['middleware' => ['auth']], function () {


    Route::get('/', function () {
        return view('index');
    });

    Route::get('/slug/generate', [SlugController::class,'slugGenerate']);

    Route::get('/media/delete', function (Request $request) {
        return Media::where('id', $request->media_id)->delete();
    });

    Route::resource('properties', PropertyController::class);
    Route::resource('profile', ProfileController::class);
    Route::resource('roles', RoleController::class);
    Route::resource('users', UserController::class);
    Route::get('product_colors/information', [ProductColorController::class, 'information'])->name("product_colors.information");
    Route::resource('product_colors', ProductColorController::class);
    Route::get('product_sizes/information', [ProductSizeController::class, 'information'])->name("product_sizes.information");
    Route::resource('product_sizes', ProductSizeController::class);
    Route::resource('cities', CityController::class);
    Route::get('product_fabrics/information', [ProductFabricController::class, 'information'])->name("product_fabrics.information");
    Route::resource('product_fabrics', ProductFabricController::class);
    Route::resource('product_shops', ProductShopController::class);
    Route::get('product_variant/remove',[ProductController::class,'remove'])->name('product_variant.remove');
    Route::resource('products', ProductController::class);
    Route::resource('tailors', TailorController::class);
    Route::resource('testimonials', TestimonailController::class);
    Route::resource('email_templates', EmailTemplateController::class);
    Route::resource('faqs', FAQController::class);
    Route::get('pages/template', [PageController::class, 'template'])->name("pages.template");
    Route::get('pages/duplicate',[PageController::class,'duplicate'])->name('pages.duplicate');
    Route::resource('pages', PageController::class);
    Route::resource('hero_banners', HeroBannerController::class);
    Route::resource('how_it_works', HowitWorkController::class);
    Route::resource('kandora_designs', KandoraDesignController::class);
    Route::resource('kandora_fabrics', KandoraFabricController::class);
    Route::resource('kandora_patterns', KandoraPatternController::class);
    Route::resource('kandora_design_sleeves', KandoraDesignSleeveController::class);
    Route::resource('kandora_sleeve_lengths', KandoraSleeveLengthController::class);
    Route::resource('kandora_sleeve_buttons', KandoraSleeveButtonController::class);
    Route::resource('kandora_neck_shapes', KandoraNeckShapeController::class);
    Route::resource('kandora_neck_front_lengths', KandoraNeckFrontLengthController::class);
    Route::resource('kandora_khawar_neck_lengths', KandoraKhawarNeckLengthController::class);
    Route::resource('kandora_waist_shape_tights', KandoraWaistShapeTightController::class);
    Route::resource('kandora_type_crystals', KandoraTypeCrystalController::class);
    Route::resource('kandora_size_crystals', KandoraSizeCrystalController::class);
    Route::resource('kandora_amount_crystals', KandoraAmountCrystalController::class);
    Route::resource('theme_settings', ThemeSettingController::class);
    Route::resource('media', MediaController::class);
    Route::resource('cities', CityController::class);
    Route::resource('menus', MenuController::class);
    Route::resource('orders', OrderController::class);
    Route::resource('coupons', CouponController::class);
    Route::get('customers/export',[CustomerController::class,'export'])->name('customers.export');
    Route::resource('customers', CustomerController::class);
    Route::get('contacts/export',[ContactController::class,'export'])->name('contacts.export');
    Route::resource('contacts', ContactController::class);
    Route::get('product_ratings/status',[ProductRatingController::class,'status'])->name('product_ratings.status');
    Route::resource('product_ratings', ProductRatingController::class);

    Route::get('sessions',function(Request $request){
        Session::flash('message', $request->message);
        Session::flash('class', 'success');
        return redirect($request->route);
    });

    Route::get('cities/state/{state_id}', [CityController::class,'getCitiesByStateId']);

    Route::delete('media/bulk/delete', [MediaController::class,'bulkDelete']);
    Route::post('media/get/ids', [MediaController::class,'getMediaByIds']);
    Route::post('media/single/{id}', [MediaController::class,'getSingleMedia']);

    Route::resource('cities', CityController::class);
    Route::get('cities/state/{state_id}', [CityController::class, 'getCitiesByStateId']);
});

Auth::routes();
