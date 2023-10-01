<?php

namespace app\controller;

use support\Request;

class IndexController
{
    public function index(Request $request)
    {
        static $readme;
        if (!$readme) {
            if (defined('__BPC__')) {
                $readme = resource_get_contents(base_path('README.md'));
            } else {
                $readme = file_get_contents(base_path('README.md'));
            }
        }
        return $readme;
    }

    public function view(Request $request)
    {
        return view('index/view', ['name' => 'webman']);
    }

    public function json(Request $request)
    {
        return json(['code' => 0, 'msg' => 'ok']);
    }

}
