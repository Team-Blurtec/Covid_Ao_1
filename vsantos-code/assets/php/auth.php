<?php
require_once 'config.php';

class Auth extends Database
{

    public function login(string $nome)
    {
        $sql = "SELECT nome,passe FROM admin WHERE nome=:nome";

        $stmt = $this->connect->prepare($sql);
        $stmt->execute(['nome' => $nome]);

        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        return $row;
    }

    public function buscar()
    {
        $sql = "SELECT * FROM provincias ORDER BY nome ASC";

        $stmt = $this->connect->prepare($sql);
        $stmt->execute();

        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return $result;
    }
}