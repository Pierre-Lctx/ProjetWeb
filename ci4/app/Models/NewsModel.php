<?php

namespace App\Models;

use CodeIgniter\Model;

class NewsModel extends Model
{
    protected $table = 'address';

    public function __construct()
    {
        $db=\Config\Database::connect();
    }

    public function getAddress($slug = false)
    {
        if ($slug === false) {
            return $this->findAll();
        }

        return $this->where(['slug' => $slug])->first();
    }

    public function searchIntership()
    {
        $sql = "CALL searchIntership()";
        $query = $this->db->query("CALL `searchIntership`(offre, , , , , )");
    }

    
}
    