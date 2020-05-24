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

    public function atualizar_caso_por_provincia($c, $a, $r, $o, $nome)
    {
        $sql = "UPDATE provincias SET confirmados=:confirms,activos=:activs,recuperados=:recs,obitos=:obts WHERE nome=:nm";

        $stmt = $this->connect->prepare($sql);
        $stmt->execute(
            [
                'confirms' => $c,
                'activs' => $a,
                'recs' => $r,
                'obts' => $o,
                'nm' => $nome
            ]
        );

        return true;
    }

    public function recuperar_passe($email)
    {
        $sql = "SELECT * FROM admin WHERE email=:email";

        $stmt = $this->connect->prepare($sql);
        $stmt->execute(['email' => $email]);

        return true;
    }

    public function adicionar_mais_casos_unified($mr_provi, $mr_novos, $mr_recup, $mr_obito, $mr_datac, $crr_id)
    {
        $sql = "INSERT INTO casos_registrados(novos,recuperados,obitos,data_casos,admin_id) VALUES(:novos,:recup,:obito,:datac,:adminid)";

        $stmt = $this->connect->prepare($sql);
        $stmt->execute
        (
            [
                'novos' => $mr_novos,
                'recup' => $mr_recup,
                'obito' => $mr_obito,
                'datac' => $mr_datac,
                'adminid' => $crr_id
            ]
        );

        if ($stmt) {
            //
            $update_activos = 'UPDATE casos_registrados SET activos = (SELECT SUM(novos - recuperados - obitos) FROM casos_registrados) WHERE id = (SELECT COUNT(id) FROM casos_registrados)';
            $stmt_activos = $this->connect->prepare($update_activos);
            $stmt_activos->execute();

            //
            $update_confirmados = 'UPDATE casos_registrados SET confirmados = (SELECT SUM(novos) FROM casos_registrados) WHERE id = (SELECT COUNT(id) FROM casos_registrados)';
            $stmt_confirmados = $this->connect->prepare($update_confirmados);
            $stmt_confirmados->execute();

            //
            $update_provincia_rel = 'UPDATE provincias SET confirmados = confirmados + (SELECT SUM(novos) FROM casos_registrados WHERE id=(SELECT COUNT(id) FROM casos_registrados)), activos = activos + (SELECT SUM(novos - recuperados - obitos) FROM casos_registrados WHERE id=(SELECT COUNT(id) FROM casos_registrados)), recuperados = recuperados + (SELECT recuperados FROM casos_registrados WHERE id=(SELECT COUNT(id) FROM casos_registrados)), obitos = obitos + (SELECT obitos FROM casos_registrados WHERE id=(SELECT COUNT(id) FROM casos_registrados)) WHERE nome = :provi';
            $stmt_provincia = $this->connect->prepare($update_provincia_rel);
            $stmt_provincia->execute(['provi' => $mr_provi]);

            return true;
        }
        return true;
    }
}