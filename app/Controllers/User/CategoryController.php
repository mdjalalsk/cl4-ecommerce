<?php

namespace App\Controllers\User;

use App\Controllers\BaseController;
use App\Models\CategoryModel;
use CodeIgniter\API\ResponseTrait;

class CategoryController extends BaseController
{
    use ResponseTrait;
    public $model;
    protected $db;
    protected $security;
    public function __construct()
    {
        helper('form');
        $this->db = \Config\Database::connect();
        $this->security = \Config\Services::security();
        $this->model = new CategoryModel();
    }
    public function index()
    {

        $builder = $this->db->table('categories');  
        $data = $builder->get()->getResultArray();
        //  dd($data);

        return view("showsection/homepage", [
            'category' => $data,   
        ]);
    }


    public function showproduct($subcatid){
       
        $data = [];
        $data['subcats'] = $this->db
            ->table('subcategories')
            ->select('id, name')
            ->get()->getResultArray();

        $data['category'] = $this->db
            ->table('categories')
            ->select('id, name,image')
            ->get()->getResultArray();

        $data['products'] = $this->db
            ->table('products')
            ->select('products.*, images.name as image_name')
            ->join('images', 'images.product_id = products.id', 'left')
            ->where('products.subcategory_id', $subcatid)
            ->get()
            ->getResultArray();
        return view('showsection/allproduct',$data);
    }
     

   
    
}
