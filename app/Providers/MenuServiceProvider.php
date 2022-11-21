<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Foundation\AliasLoader;
use App\Library\Menu\src\WMenu;

class MenuServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap the application services.
     *
     * @return void
     */
    public function boot()
    {
        if (!$this->app->routesAreCached()) {
            require  app_path('Library/Menu/src/routes.php');
        }

        $this->loadViewsFrom(__DIR__ . '/Views', 'wmenu');

        $this->publishes([
            app_path('Library/Menu/config/menu.php')  => config_path('menu.php'),
        ], 'config');

        $this->publishes([
            app_path('Library/Menu/src/Views')   => resource_path('views/vendor/wmenu'),
        ], 'view');

        $this->publishes([
            app_path('Library/Menu/assets') => public_path('vendor/harimayco-menu'),
        ], 'public');

        $this->publishes([
            app_path('Library/Menu/migrations/2017_08_11_073824_create_menus_wp_table.php') => database_path('migrations/2017_08_11_073824_create_menus_wp_table.php'),
            app_path('Library/Menu/migrations/2017_08_11_074006_create_menu_items_wp_table.php') => database_path('migrations/2017_08_11_074006_create_menu_items_wp_table.php'),
        ], 'migrations');
    }

    /**
     * Register the application services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->bind('harimayco-menu', function () {
            return new WMenu();
        });

        $this->app->make('App\Library\Menu\src\Controllers\MenuController');
        $this->mergeConfigFrom(
            app_path('Library/Menu/config/menu.php'),
            'menu'
        );
    }
}
