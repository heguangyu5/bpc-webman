<?php

require 'FastRoute/functions.php';
require 'Symfony/Polyfill/Php80/bootstrap.php';
require 'Illuminate/Support/helpers.php';
require __DIR__ . '/../support/helpers.php';

spl_autoload_register(function ($class) {
    if (   strpos($class, 'Psr\\Log\\') === 0
        || strpos($class, 'Psr\\Container\\') === 0
        || strpos($class, 'FastRoute\\') === 0
        || strpos($class, 'Monolog\\') === 0
        || strpos($class, 'Workerman\\') === 0
        || strpos($class, 'Webman\\') === 0
        || strpos($class, 'Doctrine\\') === 0
        || strpos($class, 'Illuminate\\') === 0
        || strpos($class, 'Carbon\\') === 0
        || strpos($class, 'Symfony\\') === 0
        || strpos($class, 'Intervention\\') === 0
    ) {
        require str_replace('\\', '/', $class) . '.php';
    } elseif (strpos($class, 'support\\') === 0) {
        require 'Webman/' . str_replace('\\', '/', $class) . '.php';
    } elseif (strpos($class, 'process\\') === 0) {
        require __DIR__ . '/../' . str_replace('\\', '/', $class) . '.php';
    } elseif (strpos($class, 'plugin\\') === 0) {
        if (defined('__BPC__')) {
            if (strpos($class, '\\app\\controller\\')) {
                $class = strtolower($class);
            }
            $path = __DIR__ . '/../' . str_replace('\\', '/', $class)  . '.php';
            // Route::convertToCallable() 需要加载
            // App::guessControllerAction() 需要尝试
            include_silent($path);
        } else {
            $path = __DIR__ . '/../' . str_replace('\\', '/', $class)  . '.php';
            if (file_exists($path)) {
                include $path;
            }
        }
    }
});
