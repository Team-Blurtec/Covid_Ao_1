<?php
require_once 'config.php';

class Auth extends Database
{

    public function buscar_por_provincias()
    {
        $sql = "SELECT * FROM provincias";

        $stmt = $this->connect->prepare($sql);
        $stmt->execute();

        $rs = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return $rs;
    }

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

    public function current_user($crr_acc)
    {
        $sql = "SELECT * FROM admin WHERE nome=:nome";

        $stmt = $this->connect->prepare($sql);
        $stmt->execute(['nome' => $crr_acc]);

        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        return $row;
    }

    public function buscar_por_casos()
    {
        $sql = "SELECT casos_registrados.id as 'id', confirmados, activos, recuperados, obitos, data_casos, admin.nome as 'nome' FROM casos_registrados,admin WHERE casos_registrados.admin_id = admin.id";

        $stmt = $this->connect->prepare($sql);
        $stmt->execute();

        $rs = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return $rs;
    }

    public function adicionar_caso($confirmados, $activos, $recuperados, $obitos, $data, $crr_id)
    {
        $sql = "INSERT INTO casos_registrados
    (confirmados,activos,recuperados,obitos,data_casos,admin_id)
    VALUES(:confirmados,:activos,:recuperados,:obitos,:data_casos,:admin_id)";
        $stmt = $this->connect->prepare($sql);
        $stmt->execute([
            'confirmados' => $confirmados,
            'activos' => $activos,
            'recuperados' => $recuperados,
            'obitos' => $obitos,
            'data_casos' => $data,
            'admin_id' => $crr_id
        ]);

        return true;
    }
}