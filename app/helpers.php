<?php

use App\Http\Traits\ApiResponse;
use App\Models\Language;
use App\Models\Option;
use App\Models\Template;
use App\Models\PageStatus;
use App\Models\State;
use App\Models\User;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Spatie\MediaLibrary\MediaCollections\Models\Media;
use Illuminate\Support\Str;

function responseSuccess($data, string $message = null, int $code = 200)
{
    return (new ApiResponse)->success($data, $message, $code);
}

function responseError($data, string $message = null, int $code = 400)
{
    return (new ApiResponse)->error($data, $message, $code);
}

function getValue($array, $sting)
{
    return Arr::get($array, $sting);
}

function getSideBar()
{
    $sideBars  = collect(config('sideBar'));

    $grouped = $sideBars->sortBy('order')->groupBy('group');
    $grouped = $grouped->all();

    return $grouped;
}

function renderSideBarMenu($items)
{

    $user = Auth::user();
    foreach ($items as $key => $value) :
        if ($value['permission'] && $user->canany($value['permission'])) : ?>
            <li>

                <a class="<?= (getValue($value, 'child') && count(getValue($value, 'child')) > 0) ? 'has-arrow' : ''  ?>" href="<?= (getValue($value, 'child') && count(getValue($value, 'child')) > 0) ?   'javascript:;' : getValue($value, 'url')  ?>">

                    <div class="parent-icon">
                        <?php if (getValue($value, 'iconUrl')) : ?>
                            <img class="icon-space" src="<?php echo getValue($value, 'iconUrl') ?>" />
                        <?php elseif (getValue($value, 'iconClass')) : ?>
                            <i class="<?= getValue($value, 'iconClass')  ? getValue($value, 'iconClass') : 'lni lni-bubble'  ?>"></i>
                        <?php endif; ?>
                    </div>
                    <div class="menu-title">
                        <?php echo $value['name'] ?>
                    </div>
                </a>

                <?php
                if ($user->canany($value['permission'])) :
                    if (isset($value['child']) && count($value['child']) > 0) :
                ?>

                        <ul>
                            <?php renderSideBarMenu($value['child']); ?>
                        </ul>

                <?php endif;
                endif; ?>

            </li>

        <?php endif;
    endforeach;
}

function getSideBarHtml($item)
{
    foreach ($item as $key => $value) :
        if ($key) : ?>
            <li class="menu-label"><?php echo $key ?></li>
        <?php endif; ?>


        <?php echo renderSideBarMenu($value) ?>

<?php endforeach;
}

function themeStyleClasses()
{
    $theme_setting = config('themeSetting');
    $classes = '';
    if ($theme_setting['themeStyle'] !== 'default' && $theme_setting['themeStyle'] !== '') {
        $classes .= $theme_setting['themeStyle'];
    }
    if ($theme_setting['headerColor'] !== 'default' && $theme_setting['headerColor'] !== '') {
        $classes .= ' color-header ' . $theme_setting['headerColor'];
    }
    if ($theme_setting['sideBarColor'] !== 'default' && $theme_setting['sideBarColor'] !== '') {
        $classes .= ' color-sidebar ' . $theme_setting['sideBarColor'];
    }
    return  $classes;
}

function stringToDotArray($string)
{
    $replaced = Str::replaceLast(']', '', $string);
    $replaced = Str::replaceFirst('[', '.', $replaced);
    $replaced = Str::replace('][', '.', $replaced);
    return  $replaced;
}

function dotToString($string)
{
    $replaced = Str::replace('.', '][', $string . ']');
    $replaced = Str::replaceFirst(']', '', $replaced);
    return  $replaced;
}

function getStates($id = null)
{
    if ($id) {
        return State::find($id);
    }
    return State::get();
}

function getCities($id = null)
{
    if ($id) {
        return City::find($id);
    }
    return City::get();
}

function generateHtmlAttrByArray($data)
{
    if (isset($data)) :
        $attrs =  implode(' ', array_map(
            function ($k, $v) {
                if (is_string($k)) {
                    return $k . '=' . htmlspecialchars($v) . '';
                } else {
                    return $v;
                }
            },
            array_keys($data),
            $data
        ));
        return $attrs;
    endif;
}

function formatSizeUnits($bytes)
{
    if ($bytes >= 1073741824) {
        $bytes = number_format($bytes / 1073741824, 2) . ' GB';
    } elseif ($bytes >= 1048576) {
        $bytes = number_format($bytes / 1048576, 2) . ' MB';
    } elseif ($bytes >= 1024) {
        $bytes = number_format($bytes / 1024, 2) . ' KB';
    } elseif ($bytes > 1) {
        $bytes = $bytes . ' bytes';
    } elseif ($bytes == 1) {
        $bytes = $bytes . ' byte';
    } else {
        $bytes = '0 bytes';
    }

    return $bytes;
}

function checkFileExists($media)
{
    if ($media && file_exists($media->getPath())) {
        return true;
    }
    return false;
}

function getMediaFileTypes()
{
    $fileTypes =  DB::table('media')->select('file_name')->get()->map(function ($item) {
        return strtolower(Str::afterLast($item->file_name, '.'));
    })->unique()->values()->all();

    return $fileTypes;
}

function getImageDimension($media)
{

    if ($media->file_name && in_array(strtolower(Str::afterLast($media->file_name, '.')), ['jpg', 'png', 'jpeg', 'bmp'])) {

        if (file_exists($media->getPath())) {
            $imageInstance = Spatie\MediaLibrary\Support\ImageFactory::load($media->getPath());
            $imageWidth = $imageInstance->getWidth();
            $imageHeight = $imageInstance->getHeight();
            return [$imageWidth, $imageHeight];
        }
    }
    return ['', ''];
}

function getMediaByIds($media)
{
    if (is_array($media)) {
        return Media::whereIn('id', $media)->get();
    } else {
        return Media::where('id', $media)->first();
    }
}

function getProductShop()
{
    return ProductShop::all();
}

function getOptionLanguage($key)
{
    if (request()->segment(1) == 'ar') {
        $key = $key . '_ar';
    }

    $value = Option::where('key', $key)->first();
    if ($value)
        return  $value->value;
    return;
}

function getValueSwitcher($array, $sting)
{
    if (request()->segment(1) == 'ar') {
        $sting = $sting . '_ar';
    }
    return Arr::get($array, $sting);
}

function getEmailTemplateById($id){
    return EmailTemplate::find($id);
}

function getProductColor()
{
    return ProductColor::all();
}

function getUsers(){
    return User::all();
}

function getOrders(){
    return Order::all();
}

function getOrdersAccepted(){
    return Order::where('order_status_id',2)->get();
}

function getOrdersPending(){
    return Order::where('order_status_id',1)->get();
}

function getProductFabric()
{
    return ProductFabric::all();
}

function getProductSize()
{
    return ProductSize::all();
}

function getTemplate()
{
    return Template::all();
}

function getPageStatus()
{
    return PageStatus::all();
}

function getLanguages()
{
    return Language::where('id', '!=', isset(request()->language_id) ? request()->language_id : 1)->get();
}

function getAllLanguages()
{
    return Language::all();
}

function getTailors()
{
    return Tailor::where('status_id', 1)->get();
}

function getTestimonials()
{
    return Testimonial::where('status_id', 1)->get();
}

function getStatuses()
{
    return Status::all();
}

function getAcceptStatus(){
    return AcceptStatus::all();
}

function getOrderStatuses()
{
    return OrderStatus::all();
}

function getPaymentStatuses()
{
    return PaymentStatus::all();
}

function getPageStatuses()
{
    return PageStatus::all();
}

function getOption($key)
{
    $value = Option::where('key', $key)->first();
    if ($value)
        return  $value->value;
    return;
}

function getTemplatebyID($id)
{
    return Template::find($id);
}

function getOptionTwo($key)
{
    $value = Option::where('key', $key)->first();
    if ($value)
        return  $value->value;
    return true;
}

function getKandoraFabrics()
{
    return KandoraFabric::where('status_id', 1)->get();
}

function getKandoraDesigns()
{
    return KandoraDesign::where('status_id', 1)->get();
}

function getKandoraTypeCrystals()
{
    return KandoraTypeCrystal::where('status_id', 1)->get();
}

function getKandoraSizeCrystals()
{
    return KandoraSizeCrystal::where('status_id', 1)->get();
}

function getCouponTypes(){
    return CouponType::all();
}

function getFrontEndUrl()
{
    return env('FRONT_END_URL');
}

