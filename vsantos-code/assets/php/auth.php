<?php
require_once 'config.php';

class Auth extends Database
{

    public function login($nome)
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

    public function existe_conta(string $email)
    {
        $sql = "SELECT email FROM admin WHERE email=:email";

        $stmt = $this->connect->prepare($sql);
        $stmt->execute(['email' => $email]);

        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        return $row;
    }

    public function register($name, $hpass, $email)
    {
        $sql = "INSERT INTO admin(nome,passe,email)VALUES(:nome,:passe,:email)";

        $stmt = $this->connect->prepare($sql);
        $stmt->execute(['nome' => $name, 'passe' => $hpass, 'email' => $email]);

        return true;
    }
}