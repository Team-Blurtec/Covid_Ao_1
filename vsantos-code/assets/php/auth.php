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

    public function login($nomeL2)
    {
        $sql = "SELECT nome,passe FROM admin WHERE nome=:nome";

        $stmt = $this->connect->prepare($sql);
        $stmt->execute(['nome' => $nomeL2]);

        $rest = $stmt->fetch(PDO::FETCH_ASSOC);

        return $rest;
    }

    public function existe_conta($emailR2)
    {
        $sql = "SELECT email FROM admin WHERE email=:email";

        $stmt = $this->connect->prepare($sql);
        $stmt->execute(['email' => $emailR2]);

        $rest = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return $rest;
    }

    public function criar_conta($nomeR2, $emailR2, $auth2Passe)
    {
        $sql = "INSERT INTO admin(nome,email,passe) VALUES(:name,:email,:passe)";

        $stmt = $this->connect->prepare($sql);
        $stmt->execute(['name' => $nomeR2, 'email' => $emailR2, 'passe' => $auth2Passe]);

        return true;
    }

    public function sessao_iniciada($session_name)
    {
        $sql = "SELECT * FROM admin WHERE nome=:nome";

        $stmt = $this->connect->prepare($sql);
        $stmt->execute(['nome' => $session_name]);

        $rest = $stmt->fetch(PDO::FETCH_ASSOC);

        return $rest;
    }
}