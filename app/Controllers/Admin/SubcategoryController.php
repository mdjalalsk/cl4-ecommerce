<?php

namespace App\Controllers\Admin;

use App\Controllers\BaseController;
use App\Models\SubcategoryModel;
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
    public function index()
    {

        //echo BASESEURL . "<hr>";
        $cats = $this->db
            ->table('categories')
            ->select('id, name')
            ->get()->getResultArray();
        $builder = $this->db->table('subcategories');
        $builder->select('subcategories.*,categories.name as catname');
        $builder->join('categories', 'categories.id = subcategories.category_id', 'inner');
        $data = $builder->get()->getResultArray();
        // dd($data);

        return view("admin/subcategory/all", [
            'subcats' => $data,
            'cats' => $cats,
            'security' => $this->security
        ]);
    }

    public function subcat($id){
        $subcats = $this->db
            ->table('subcategories')
            ->select('id, name')
            ->where('category_id', $id)
            ->get()->getResultArray();
            return $this->response->setJSON($subcats);

    }

    //paginated link
    public function getPaginatedData($id)
    {
        $model = new SubcategoryModel();

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
        $builder = $this->db->table('subcategories');
        $builder->select('subcategories.*,categories.name as catname');
        $builder->join('categories', 'categories.id = subcategories.category_id', 'inner');
        $data = $builder->get()->getResultArray();
        // dd($data);
        return $this->respond($data, 200);
    }

    public function create()
    {
        $request = request();
        //return $this->respond($_POST,200);
        $data = [
            'name' => $request->getPost('name'),
            'category_id' => $request->getPost('catid'),
        ];
        if ($request->getPost('id') != "") {
            $data['id'] = $request->getPost('id');
        }

        $builder = $this->db->table('subcategories');
        $builder->upsert($data);
        // $this->db
        // ->table('subcategories')
        // ->insert($data);
        return $this->respond([
            'success' => true,
            'message' => "Data Inserted Successfully"
        ], 200);
    }

    public function delete()
    {
        $request = request();
        $id = $request->getPost('id');
        $builder = $this->db->table('subcategories');
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
