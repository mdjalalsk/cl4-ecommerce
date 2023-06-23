<?php

namespace App\Controllers\Admin;

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
        // $subcats = $this->db
        //     ->table('subcategories')
        //     ->select('id, name')
        //     ->get()
        //     ->getResultArray();

        // $cats = $this->db
        //     ->table('categories')
        //     ->select('id, name')
        //     ->get()
        //     ->getResultArray();

        $builder = $this->db->table('products');
        $builder->select('products.*, categories.name as catname, subcategories.name as subcatname');
        $builder->join('categories', 'categories.id = products.category_id', 'inner');
        $builder->join('subcategories', 'subcategories.id = products.subcategory_id', 'inner');
        $data = $builder->get()->getResultArray();
        return $this->respond($data, 200);
        // dd($data);
    }


    public function create()
    {
        $c = new CategoryModel();
        $data['cats'] = $c->select("id,name")->findAll();



        $validation = \Config\Services::validation();
        if (!$this->request->is('post')) {
            return view('admin/product/create', $data);
        }
        $rules = [
            'category_id' => 'required',
            'subcategory_id' => 'required',
            'name' => 'required',
            'description' => 'required',
            'sku' => 'required|is_unique[products.sku]',
            'images' => [
                'label' => 'Image File',
                'rules' => [
                    'uploaded[images]',
                    'is_image[images]',
                    'mime_in[images,image/jpg,image/jpeg,image/gif,image/png,image/webp]',
                    // 'max_size[images,100]',
                    'max_dims[images,10024,7068]',
                ],
            ],
        ];

        if (!$this->validate($rules)) {
            $errors = $validation->getErrors();
            return $this->response->setJSON(['status' => 'error', 'errors' => $errors]);
        }
        //
        $request = request();
        $img = $this->request->getFile('images');
        //file upload

        $imagename = "";
        if (!$img->hasMoved()) {
            $imagename = $img->store();
            // echo $imagename;
            // exit;

            $filepath = WRITEPATH . 'uploads/' . $imagename;
            $data = ['uploaded_fileinfo' => new File($filepath)];
            //watermark
            // //image intervention
            // $image = Image::make($filepath)->resize(800, null, function ($constraint) {
            //     $constraint->aspectRatio();
            //     $constraint->upsize();
            // })->insert(WRITEPATH.'/uploads/logoci.png','center')->save($filepath);
            //watermark end


            // return $this->response->setJSON($data);
            // dd($data);

        }
        //file upload end
        $arr = [
            'category_id' => $request->getPost("category_id"),
            'subcategory_id' => $request->getPost("subcategory_id"),
            // 'sku'=>$_POST['sku'],
            'sku' => $request->getPost('sku'),
            // 'sku'=>$this->request->getPost("sku"),
            'name' => $request->getPost('name'),
            'description' => $request->getPost('description'),
            'price' => $_POST['price'],
            'price2' => $_POST['newprice'],
            // 'images'=> $imagename,
            'quantity' => $_POST['quantity'],
            'discount' => $_POST['discount'],
            'hot' => isset($_POST['hot']) ? $_POST['hot'] : 0,
        ];

        $this->model->insert($arr);

        $pid = $this->model->getInsertID();
        //add $imagename in image table
        $data = [
            "product_id" => $pid,
            'name' => $imagename
        ];
        $db      = \Config\Database::connect();
        $builder = $db->table('images');
        $builder->insert($data);
        //add $imagename in image table end

        return $this->response->setJSON(['status' => 'success', 'message' => "Product Added to Database"]);

        // return view('products/upload_success', $data); 


        //redirect works only on named routes
        // return redirect("products");
        //redirect->to should use for normal routes
        //return redirect()->to("products/new");
    }

    public function deleteProduct()
    {
        $id = $this->request->getVar('p_id');
        $builder = $this->db->table('images');
        $builder->where('product_id', $id);
        $builder->delete();

        if ($this->model->where("id", $id)->delete()) {
            return  $this->response->setJSON(["status" => true, "message" => "Product Delete Successful"]);
        } else {
            return  $this->response->setJSON(["status" => true, "message" => "Product Can't Delete Successful"]);
        }
    }

    // public function Product()
    // {
    //     $cats = $this->db
    //     ->table('images')
    //     ->select('id,product_id,name')
    //     ->get()->getResultArray();
    //     $builder = $this->db->table('products');
    //     $builder->select('products.*,images.name as imagename,categories.name as catsname,subcategories.name as subcatsname');
    //     $builder->join('images', 'images.product_id = products.id', 'inner');
    //     $builder->join('categories', 'categories.id = products.category_id', 'inner');
    //     $builder->join('subcategories', 'subcategories.id = products.subcategory_id', 'inner');
    //     $data = $builder->get()->getResultArray();
        

    // dd($data);
        
    //     return view('showsection/products',['data'=>$data]);
    // }
}
