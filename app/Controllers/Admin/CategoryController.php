<?php

namespace App\Controllers\Admin;

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

        //echo BASESEURL . "<hr>";
      
        $builder = $this->db->table('categories');
     
        $data = $builder->get()->getResultArray();
        // dd($data);

        return view("Admin/category/all", [
            'subcats' => $data,
            'security' => $this->security
        ]);
    }

    //paginated link
    public function getPaginatedData($id)
    {
        $model = new CategoryModel();

        // Get the current page number from the AJAX request
        //$currentPage = $this->request->getGet('page');

        // Perform pagination using the model's `paginate()` method
        $data = $model->paginate(10, '', $id);

        // Retrieve the pagination links
        $pager = $model->pager;

        // Create an array with the paginated data and pagination links
        $response = [
            'data' => $data,
            'pager' => $pager->links(),
        ];

        // Return the JSON response
        return $this->response->setJSON($response);
    }
    //paginated link end

    public function all()
    {

        //echo BASESEURL . "<hr>";
        $builder = $this->db->table('categories');
        
        $data = $builder->get()->getResultArray();
        // dd($data);
        return $this->respond($data, 200);
    }

    public function create()
    {
        $request = request();
        //return $this->respond($_POST,200);
        $name = $this->request->getPost("name");
        $image = $this->request->getFile("image");

        if ( $image->isValid() && !$image->hasMoved()) {
            $newName =   $image->getRandomName();
            $image->move('assets/images/categories/', $newName);

        }
        $data = [
            "name" => $name,
            'image' => base_url('assets/images/categories/' . $newName)
        ];
        if($this->model->insert($data)){
            return $this->response->setJSON(['status' => true,"message" => "Category Insert Successfull"]);
          }
     

        // if($image->isValid()){
        //     $newImage = $image->getRandomName();
        //     $image->move(base_url("assets/images/categories/"), $newImage);
        // }
        // $data = [
        //     'name' => $this->request->getPost('name'),
        //     "image" => base_url("assets/images/categories/").$newImage
        // ];

        //     if($this->model->insert($data)){
        //         return $this->response->setJSON(["status"=> true,"message"=> "Category Insert Successful"]);
        //     }

        // if ($request->getPost('id') != "") {
        //     $data['id'] = $request->getPost('id');
        // }

        // $builder = $this->db->table('categories');
        // $builder->upsert($data);
        // $this->db
        // ->table('subcategories')
        // ->insert($data);
        // return $this->respond([
        //     'success' => true,
        //     'message' => "Data Inserted Successfully"
        // ], 200);
    }

    public function delete()
    {
        $request = request();
        $id = $request->getPost('id');
        $builder = $this->db->table('categories');
        if ($builder->delete(['id' => $id])) {
            return $this->respond([
                'success' => true,
                'message' => "Data Deleted Successfully"
            ], 200);
        } else {
            return $this->respond([
                'success' => false,
                'message' => "Error deleting Subcategory!!"
            ], 200);
        }
    }
}
