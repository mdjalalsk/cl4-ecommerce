<?php

namespace App\Controllers\User;

use App\Controllers\BaseController;

use CodeIgniter\API\ResponseTrait;

class SubcategoryController extends BaseController
{
    use ResponseTrait;
    protected $db;
    protected $security;
    public function __construct()
    {
        $this->db = \Config\Database::connect();
        $this->security = \Config\Services::security();
    }

    public function products($catid)
    {
        $data = [];
        
        $data['subcats'] = $this->db
            ->table('subcategories')
            ->select('id, name')
            ->where('category_id', $catid)
            ->get()->getResultArray();

        $data['category'] = $this->db
            ->table('categories')
            ->select('id, name,image')
            ->get()->getResultArray();

        $data['products'] = $this->db
            ->table('products')
            ->select('products.*, images.name as image_name')
            ->join('images', 'images.product_id = products.id', 'left')
            ->where('products.category_id', $catid)
            ->get()
            ->getResultArray();


        return view("showsection/allproduct", $data);
    }



    // public function subcat($id)
    // {
    //     $subcats = $this->db
    //         ->table('subcategories')
    //         ->select('id, name')
    //         ->where('category_id', $id)
    //         ->get()->getResultArray();
    //         return view("showsection/allproduct",['subcats' => $subcats]);
    //     // return $this->response->setJSON($subcats);
    // }


   
}