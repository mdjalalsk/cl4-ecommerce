<?php

namespace Config;

use App\Database\Migrations\Subcategories;

// Create a new instance of our RouteCollection class.
$routes = Services::routes();

/*
 * --------------------------------------------------------------------
 * Router Setup
 * --------------------------------------------------------------------
 */
$routes->setDefaultNamespace('App\Controllers');
$routes->setDefaultController('Home');
$routes->setDefaultMethod('index');
$routes->setTranslateURIDashes(false);
$routes->set404Override();
// The Auto Routing (Legacy) is very dangerous. It is easy to create vulnerable apps
// where controller filters or CSRF protection are bypassed.
// If you don't want to define all routes, please use the Auto Routing (Improved).
// Set `$autoRoutesImproved` to true in `app/Config/Feature.php` and set the following to true.
// $routes->setAutoRoute(false);

/*
 * --------------------------------------------------------------------
 * Route Definitions
 * --------------------------------------------------------------------
 */

// We get a performance increase by specifying the default
// route since we don't have to scan directories.
$routes->get('/', 'Home::index');
$routes->get('/dashboard', 'AdminController::index');
$routes->get('/user', 'AuthController::index');
$routes->get('/login', 'AuthController::Login');
$routes->post('/login', 'AuthController::loginForm');
$routes->get('/register', 'AuthController::Register');
$routes->post('/registration', 'AuthController::formRegister');
$routes->get('/logout', 'AuthController::logout');
// $routes->get('/registration', 'AuthController::register');
// $routes->post('/registration', 'AuthController::register');
//    user table 
$routes->get('admin/users', 'Admin\UserController::index');
$routes->get('admin/users/all', 'Admin\UserController::all');
$routes->post('admin/users/new', 'Admin\UserController::create');
$routes->post('admin/users/delete', 'Admin\UserController::delete');

// Subcategories 
$routes->get('subcategory', 'Admin\SubcategoryController::index');
$routes->get('subcategory/page/(:num)', 'Admin\SubcategoryController::getPaginatedData/$1');
$routes->get('subcategory/all', 'Admin\SubcategoryController::all');
$routes->get('getsubcat/(:num)', 'Admin\SubcategoryController::subcat/$1');
$routes->post('subcategory/new', 'Admin\SubcategoryController::create');
$routes->post('subcategory/delete', 'Admin\SubcategoryController::delete');
// Categories 
$routes->get('category', 'Admin\CategoryController::index');
$routes->get('category/page/(:num)', 'Admin\CategoryController::getPaginatedData/$1');
$routes->get('category/all', 'Admin\CategoryController::all');
$routes->post('category/new', 'Admin\CategoryController::create');
$routes->post('category/delete', 'Admin\CategoryController::delete');

//admin product 
$routes->get('admin/product/create', 'Admin\ProductController::create');
$routes->post('admin/product/create', 'Admin\ProductController::create');
$routes->post('admin/product/delete', 'Admin\ProductController::deleteProduct');
$routes->get('admin/product/all', 'Admin\ProductController::index');

// user subcategory
// $routes->get('getsubcat/(:num)', 'User\SubcategoryController::subcat/$1');
$routes->get('subcategory/(:num)', 'User\SubcategoryController::Products/$1');
// user product 
$routes->get('singleproduct/(:num)', 'User\ProductController::singleProduct/$1');
//user category
$routes->get('show/category', 'User\CategoryController::index');
$routes->get('showsubcat/(:num)', 'User\CategoryController::showproduct/$1');





/*
 * --------------------------------------------------------------------
 * Additional Routing
 * --------------------------------------------------------------------
 *
 * There will often be times that you need additional routing and you
 * need it to be able to override any defaults in this file. Environment
 * based routes is one such time. require() additional route files here
 * to make that happen.
 *
 * You will have access to the $routes object within that file without
 * needing to reload it.
 */
if (is_file(APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php')) {
    require APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php';
}
