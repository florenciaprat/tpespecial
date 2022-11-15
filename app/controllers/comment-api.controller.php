<?php
require_once './app/views/apiView.php';
require_once './app/models/CommentModel.php';

class commentApiController
{

    private $model;
    private $view;
    private $data;

    public function __construct()
    {
        $this->model = new CommentModel();
        $this->view = new ApiView();
        // lee el body del request
        $this->data = file_get_contents("php://input");
    }

    private function getData()
    {
        return json_decode($this->data); //convertir el string recibido a json
    }

    public function getComments()
    {
        $comments = $this->model->getAll();
        if (!empty($comments)) {
            $this->view->response($comments);
        } else {
            $this->view->response("No existen comentarios", 404);
        }
    }



    public function getComment($params = null)
    {
        $id = $params[':ID'];
        $comment = $this->model->get($id);

        // si no existe devuelvo 404
        if ($comment)
            $this->view->response($comment);
        else
            $this->view->response("El comentario con el id= $id no existe", 404);
    }


    public function insertComment($params = null)
    {
        $comment = $this->getData();
        if (empty($comment->comment) || empty($comment->product_ID)) {
            $this->view->response("Complete los datos", 400);
        } else {
            $id = $this->model->insert($comment->comment, $comment->product_ID);
            $comment = $this->model->get($id);
            $this->view->response("El comentario se inserto con el id = $id", 201);
        }
    }

    public function deleteComment($params = null)
    {
        $id = $params[':commentID'];

        $comment = $this->model->get($id);
        if ($comment) { //si existe el producto la borro
            $this->model->delete($id);
            $this->view->response('El comentario fue eliminado');
        } else
            $this->view->response("El comentario con el id=$id no existe", 404);
    }

    public function editComment($params = null)
    {
        $id = $params[':ID'];
        $body = $this->getData();
        $comment = $this->model->get($id);
        if ($comment) {
            if (empty($comment->comment) || empty($comment->product_ID)) {
                $this->view->response("Complete los datos", 400);
            } else {
                if ($comment) {
                    $this->model->editComment($body->comment, $body->product_ID, $id);
                    $this->view->response("El producto se actualizó con exito", 200);
                }
            }
        } else {
            $this->view->response("El producto con el id= $id no existe", 404);
        }
    }
}
