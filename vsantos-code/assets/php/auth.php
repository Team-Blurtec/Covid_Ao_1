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
        $sql = "SELECT confirmados,activos,recuperados,obitos,datas.data as 'data',admin.nome as 'admin' FROM casos,datas,admin WHERE casos.idData=datas.id AND casos.idAdmin=admin.id";

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

    public function verificarData($datas)
    {
        $sql_vd = "SELECT DISTINCT id FROM datas WHERE data=:datas";
        $stmt_vd = $this->connect->prepare($sql_vd);
        $stmt_vd->execute(['datas' => $datas]);

        $rs_vd = $stmt_vd->fetch(PDO::FETCH_ASSOC);

        return $rs_vd;
    }

    public function atualizar_registo($province, $new_case, $rec_case, $dea_case, $dat_case)
    {
        $uql = "UPDATE casos SET confirmados=confirmados+:novs,activos=activos+:novs-:recs-:obts,novos=novos+:novs,recuperados=recuperados+:recs,obitos=obitos+:obts WHERE idData=:idata";
        $utm = $this->connect->prepare($uql);
        $utm->execute(['novs' => $new_case, 'recs' => $rec_case, 'obts' => $dea_case, 'idata' => $dat_case]);

        $sql = "UPDATE provincias SET confirmados=confirmados+:novs,activos=activos+:novs-:recs-:obts,recuperados=recuperados+:recs,obitos=obitos+:obts WHERE nome=:prov";
        $stm = $this->connect->prepare($sql);
        $stm->execute(['novs' => $new_case, 'recs' => $rec_case, 'obts' => $dea_case, 'prov' => $province]);

        return true;
    }

    public function novo_registo($province, $new_case, $rec_case, $dea_case, $dat_case, $u2id)
    {
        $vql = "INSERT INTO datas(data)VALUES (:datas)";
        $vtm = $this->connect->prepare($vql);
        $vtm->execute(['datas' => $dat_case]);

        $rvql = "SELECT DISTINCT id FROM datas WHERE data=:datar";
        $rvtm = $this->connect->prepare($rvql);
        $rvtm->execute(['datar' => $dat_case]);

        if ($rvs = $rvtm->fetch(PDO::FETCH_ASSOC)) {
            $wql = "INSERT INTO casos(novos, confirmados, activos, recuperados, obitos, idAdmin, idData) VALUES (:novs,:novs,:novs-:recs-:obts,:recs,:obts,:iadm,:idat)";
            $wtm = $this->connect->prepare($wql);
            $wtm->execute(['novs' => $new_case, 'recs' => $rec_case, 'obts' => $dea_case, 'iadm' => $u2id, 'idat' => $rvs['id']]);
        }

        $mql = "UPDATE provincias SET confirmados=confirmados+:novs,activos=activos+:novs-:recs-:obts,recuperados=recuperados+:recs,obitos=obitos+:obts WHERE nome=:prov";
        $mtm = $this->connect->prepare($mql);
        $mtm->execute(['novs' => $new_case, 'recs' => $rec_case, 'obts' => $dea_case, 'prov' => $province]);

        return true;
    }
}