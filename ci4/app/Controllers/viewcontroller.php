<?php

namespace App\Controllers;

use App\Models\NewsModel;

class viewcontroller extends BaseController
{

    public function view($slug = null)
    {
        $model = model(NewsModel::class);
        echo "$slug";
        $data['news'] = $model->getNews($slug);

        if (empty($data['news'])) {
            throw new \CodeIgniter\Exceptions\PageNotFoundException('Cannot find the news item: ' . $slug);
        }

        $data['title'] = $data['news']['title'];

        echo view('templates/header', $data);
        echo view('news/view', $data);
        echo view('templates/footer', $data);
    }
}
