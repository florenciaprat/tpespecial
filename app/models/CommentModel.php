<?php
class CommentModel
{

    private $db;

    public function __construct()
    {
        $this->db = new PDO('mysql:host=localhost;' . 'dbname=tpespecial;charset=utf8', 'root', '');
    }


    public function getAll()
    {
        $query = $this->db->prepare("SELECT * FROM comments");
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }



    public function insert($comment, $productID)
    {
        $query = $this->db->prepare("INSERT INTO comments (comment, product_ID) VALUES (?, ?)");
        $query->execute([$comment, $productID]);

        return $this->db->lastInsertId();
    }

    public function get($id)
    {
        $query = $this->db->prepare("SELECT * FROM comments WHERE comment_ID = ?");
        $query->execute(array($id));
        $comment = $query->fetch(PDO::FETCH_OBJ);
        return $comment;
    }


    public function delete($id)
    {
        $sentencia = $this->db->prepare("DELETE FROM comments WHERE comment_ID = ?");
        $response = $sentencia->execute(array($id));
    }

    public function editComment($comment, $productID, $id){
        $query = $this->db->prepare('UPDATE comments SET comment = ?, product_ID = ? WHERE comment_ID = ?');
        $query->execute([$comment, $productID, $id]);
    }
}
