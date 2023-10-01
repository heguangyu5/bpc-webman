<?php

include 'FastRoute/functions.php';
include __DIR__ . '/../support/helpers.php';

spl_autoload_register(function ($class) {
    if (   strpos($class, 'Psr\\Log\\') === 0
        || strpos($class, 'Psr\\Container\\') === 0
        || strpos($class, 'FastRoute\\') === 0
        || strpos($class, 'Monolog\\') === 0
        || strpos($class, 'Workerman\\') === 0
        || strpos($class, 'Webman\\') === 0
    ) {
        require str_replace('\\', '/', $class) . '.php';
    } elseif (strpos($class, 'support\\') === 0) {
        require 'Webman/' . str_replace('\\', '/', $class) . '.php';
    } elseif (strpos($class, 'process\\') === 0) {
        require __DIR__ . '/../' . str_replace('\\', '/', $class) . '.php';
    }
});
