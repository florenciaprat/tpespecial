<?php
require_once './libs/Router.php';
require_once './app/controllers/product-api.controller.php';
require './app/controllers/comment-api.controller.php';
require_once'./app/controllers/auth-api.controller.php';


// crea el router
$router = new Router();

// tabla productos
$router->addRoute('products', 'GET', 'productApiController', 'getProducts');
$router->addRoute('products/:ID', 'GET', 'productApiController', 'getProduct');
$router->addRoute('products/:ID', 'DELETE', 'productApiController', 'deleteProduct');
$router->addRoute('products', 'POST', 'productApiController', 'insertProduct');
$router->addRoute('products/:ID', 'PUT', 'productApiController', 'updateProduct');


//tabla comentarios
$router->addRoute('comments', 'POST', 'commentApiController', 'insertComment'); //esta
$router->addRoute('comments/:commentID', 'DELETE', 'commentApiController', 'deleteComment'); //esta
$router->addRoute('comments/:ID', 'GET', 'commentApiController', 'getComment'); //esta
$router->addRoute('products/:ID/comments', 'GET', 'productApiController', 'getProductComments'); //esta
$router->addRoute('comments', 'GET', 'commentApiController', 'getComments');
$router->addRoute('comments/:ID', 'PUT', 'commentApiController', 'editComment');  //esta

$router->addRoute("auth/token", "GET", "authApiController", "getToken");

// ejecuta la ruta (sea cual sea)
$router->route($_GET["resource"], $_SERVER['REQUEST_METHOD']);
