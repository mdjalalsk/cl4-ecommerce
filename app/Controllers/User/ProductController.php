<?php

namespace App\Controllers\User;

use CodeIgniter\API\ResponseTrait;
use App\Controllers\BaseController;
use App\Database\Migrations\Products;
use App\Models\CategoryModel;
use App\Models\ProductModel;
use App\Models\SubcategoryModel;
use CodeIgniter\Files\File;
use Intervention\Image\ImageManagerStatic as Image;

class ProductController extends BaseController
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
        $this->model = new ProductModel();
    }
    public function index()
    {
        //empty
    }


    public function Product()
    {
        $cats = $this->db
        ->table('images')
        ->select('id,product_id,name')
        ->get()->getResultArray();
        $builder = $this->db->table('products');
        $builder->select('products.*,images.name as imagename,categories.name as catsname,subcategories.name as subcatsname');
        $builder->join('images', 'images.product_id = products.id', 'inner');
        $builder->join('categories', 'categories.id = products.category_id', 'inner');
        $builder->join('subcategories', 'subcategories.id = products.subcategory_id', 'inner');
        $data = $builder->get()->getResultArray();
        

    dd($data);
        
        // return view('showsection/homepage',['data'=>$data]);
    }
}
