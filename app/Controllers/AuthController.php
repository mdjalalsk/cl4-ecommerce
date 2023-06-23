<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\UserModel;

class AuthController extends BaseController
{
    public $session;

    public function __construct()
    {
        helper("form");
        $this->session = session();
    }

    public function index()
    {
        return view('users/user');
    }

    public function login()
    {
        return view('users/login');
    }

    public function register()
    {
        return view('users/register');
    }

    public function formRegister()
    {
        // Retrieve input data
        $name = $this->request->getPost('name');
        $email = $this->request->getPost('email');
        $password = $this->request->getPost('password');
    
        // Set validation rules
        $rules = [
            'name' => 'required',
            'email' => 'required|valid_email',
            'password' => 'required|min_length[6]'
        ];
    
        // Validate the input data
        if (! $this->validate($rules)) {
            // Validation failed, redirect back to the registration form with errors
            return redirect()->back()->withInput()->with('errors', $this->validator->getErrors());
        }
    
        // Create a new user record or perform any other registration logic here
        // For example, you can use the UserModel to save the user to the database
    
        $userModel = new UserModel();
        $userData = [
            'name' => $name,
            'email' => $email,
            'role' => '2',
            'password' => password_hash($password, PASSWORD_DEFAULT) // Hash the password
        ];
    
        $userModel->insert($userData);
    
        // Redirect the user to a success page or perform any other actions
        return redirect()->to('/login');
    }
    

    public function loginForm()
    {
        $email = $this->request->getPost('email');
        $password = $this->request->getPost('password');

        // Check if the user exists in the database
        $userModel = new UserModel();
        $user = $userModel->where('email', $email)->first();

        if ($user) {
            // User found, check password
            if (password_verify($password, $user['password'])) {
                // Password matches, store user data in session or perform other authentication actions
                $userData = [
                    'user_id' => $user['id'],
                    'name' => $user['name'],
                    'email' => $user['email'],
                    'role' => $user['role'],
                    // Add other user data if needed
                ];

                $this->session->set('user', $userData);

                // Redirect the user to the authenticated area or perform other actions
                   if($user['role']==2){
                    return redirect()->to('/dashboard');
                   }
                elseif($user['role']==1)
                {
                    return redirect()->to('/user');
                   }
                   else{
                    return redirect()->to("/"); 
                }
              
            } else {
                // Password does not match
                $this->session->setFlashdata('error', 'Invalid email or password.');
            }
        } else {
            // User not found
            $this->session->setFlashdata('error', 'Invalid email or password.');
        }

        // Redirect the user back to the login page if authentication fails
        return redirect()->back();
    }

    public function logout()
    {
        // Clear the user session and redirect to the login page
        $this->session->remove('user');
        return redirect()->to('/');
    }
}
