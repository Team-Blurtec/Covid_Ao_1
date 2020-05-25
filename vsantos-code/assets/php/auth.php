<?php
require_once 'config.php';

class Auth2 extends Database
{

    public function buscar_atualizacao()
    {
        $sql = "SELECT * FROM provincias";

        $stmt = $this->connect->prepare($sql);
        $stmt->execute();

        $rest = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return $rest;
    }
}