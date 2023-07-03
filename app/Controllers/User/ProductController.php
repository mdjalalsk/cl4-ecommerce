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


    public function singleProduct($pid)
    {
        // $cats = $this->db
        // ->table('images')
        // ->select('id,product_id,name')
        // ->get()->getResultArray();
        $builder = $this->db->table('products');
        $builder->select('products.*,images.name as imagename,categories.name as catsname,subcategories.name as subcatsname');
        $builder->join('images', 'images.product_id = products.id', 'left');
        $builder->join('categories', 'categories.id = products.category_id', 'left');
        $builder->join('subcategories', 'subcategories.id = products.subcategory_id', 'left');
        $builder->where('products.id', $pid);
        $data = $builder->get()->getResultArray();
        

     //dd($data);
        
         return view('showsection/singleproduct',['data'=>$data]);
    }

    // public function hotProduct()
    // {
    //     $builder = $this->db->table('products');
    //     $builder->select('products.*, images.name as imagename, categories.name as catsname, subcategories.name as subcatsname');
    //     $builder->join('images', 'images.product_id = products.id', 'left');
    //     $builder->join('categories', 'categories.id = products.category_id', 'left');
    //     $builder->join('subcategories', 'subcategories.id = products.subcategory_id', 'left');
    //     $builder->where('products.hot', 1); // Fetch hot products where hot=1
    //     $builder->orderBy('products.created_at', 'desc');// Sort by created_at in descending order
    //     $builder->limit(12); // Limit the results to 12 records
    //     $data = $builder->get()->getResultArray();
    
    //     //dd($data);
    
    //     return view('users/user', ['data' => $data]);
    // }
    

}
