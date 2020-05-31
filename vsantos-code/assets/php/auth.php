<?php
include_once 'config.php';

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
        $sql = "SELECT nome,passe FROM admin WHERE nome=:name";

        $stmt = $this->connect->prepare($sql);
        $stmt->execute(['name' => $nomeL2]);

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

    public function buscar_casos()
    {
        $sql = "SELECT confirmados,activos,recuperados,obitos,data,admin.nome as 'admin' FROM casos,admin WHERE casos.idAdmin=admin.id ORDER BY data ASC";

        $stmt = $this->connect->prepare($sql);
        $stmt->execute();

        $rs = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return $rs;
    }

    public function buscar_casos_provincias()
    {
        $sql = "SELECT * FROM provincias";

        $stmt = $this->connect->prepare($sql);
        $stmt->execute();

        $rs = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return $rs;
    }

    public function atualizar_registo($province, $new_case, $rec_case, $dea_case, $dat_case, $u2id)
    {
        $upd_provincias = "UPDATE provincias SET confirmados=confirmados+:n,activos=activos+:n-:r-:o,recuperados=recuperados+:r,obitos=obitos+:o WHERE nome=:pr";
        $stmt_provincias = $this->connect->prepare($upd_provincias);
        $query_p = $stmt_provincias->execute(['n' => $new_case, 'r' => $rec_case, 'o' => $dea_case, 'pr' => $province]);

        $upd_casos = "UPDATE casos SET confirmados=confirmados+:n,activos=activos+:n-:r-:o,novos=novos+:n,recuperados=recuperados+:r,obitos=obitos+:o,idAdmin=:id WHERE data=:datai";
        $stmt_casos = $this->connect->prepare($upd_casos);
        $query_c = $stmt_casos->execute(['n' => $new_case, 'r' => $rec_case, 'o' => $dea_case, 'id' => $u2id, 'datai' => $dat_case]);

        return $query_c + $query_p;
    }

    public function existe_data($dat_case)
    {
        $sql = "SELECT data FROM casos WHERE data=:datai";
        $stmt = $this->connect->prepare($sql);
        $stmt->execute(['datai' => $dat_case]);

        $rest = $stmt->fetch(PDO::FETCH_ASSOC);

        return $rest;
    }

    public function criar_registo($province, $new_case, $rec_case, $dea_case, $dat_case, $u2id)
    {
        $first_ql = "UPDATE provincias SET confirmados=confirmados+:n,activos=activos+:n-:r-:o,recuperados=recuperados+:r,obitos=obitos+:o WHERE nome=:pr";
        $ql_stmt = $this->connect->prepare($first_ql);
        $query_p = $ql_stmt->execute(['n' => $new_case, 'r' => $rec_case, 'o' => $dea_case, 'pr' => $province]);

        $sql = "INSERT INTO casos(novos, confirmados, activos, recuperados, obitos, data, idAdmin) VALUES (:n,(SELECT SUM(confirmados) FROM provincias),(SELECT SUM(activos) FROM provincias),(SELECT SUM(recuperados) FROM provincias),(SELECT SUM(obitos) FROM provincias),:datai,:id)";
        $stmt = $this->connect->prepare($sql);
        $query_c = $stmt->execute(['n' => $new_case, 'datai' => $dat_case, 'id' => $u2id]);

        return $query_p + $query_c;
    }
}