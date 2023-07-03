<?php

namespace App\Controllers;

use CodeIgniter\API\ResponseTrait;

class Home extends BaseController
{
    use ResponseTrait;
    protected $security;
    private $db;
    private $model;
    protected $helpers = ['form'];
    public function __construct()
    {
        $this->db = \Config\Database::connect();
        $this->security = \Config\Services::security();
        
    }

    public function index()
    {
        $builder = $this->db->table('products');
        $builder->select('products.*, images.name as imagename, categories.name as catsname, subcategories.name as subcatsname');
        $builder->join('images', 'images.product_id = products.id', 'left');
        $builder->join('categories', 'categories.id = products.category_id', 'left');
        $builder->join('subcategories', 'subcategories.id = products.subcategory_id', 'left');
        $builder->where('products.hot', 1); // Fetch hot products where hot=1
        $builder->orderBy('products.created_at', 'desc');// Sort by created_at in descending order
        $builder->limit(9); // Limit the results to 12 records
        $data = $builder->get()->getResultArray();
    
        //dd($data);
    
        return view('users/user', ['data' => $data]);



        //return view('users/user');
    }
}
