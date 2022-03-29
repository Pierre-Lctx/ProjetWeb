<?php

namespace App\Controllers;

use App\Models\NewsModel;

class Pages extends BaseController
{

    public function overview()
    {
        $data = array();
        $model = model(NewsModel::class);
        $data['address'] = $model->getAddress();
        print_r($data);

        echo view('pages/index', $data);
    }

    public function testQuery()
    {
        
    }
}
