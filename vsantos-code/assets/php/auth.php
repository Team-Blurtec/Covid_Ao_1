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

    public function criar_novo_registo($province, $new_case, $rec_case, $dea_case, $dat_case, $u2id)
    {
        $data = $this->verificar_data($dat_case);

        if ($data) {
            $sql = "INSERT INTO casos(novos, recuperados, obitos, idAdmin, idData) VALUES (:novos,:recs,:obts,:idAdm,:idData)";
            $stmt = $this->connect->prepare($sql);
            $stmt->execute(['novos' => $new_case, 'recs' => $rec_case, 'obts' => $dea_case, 'idAdm' => $u2id, 'idData' => $data['id']]);
        } else {
            $sql = "INSERT INTO datas(data)VALUES (:data)";
            $stmt = $this->connect->prepare($sql);
            $stmt->execute(['data' => $dat_case]);

            return $this->criar_novo_registo($province, $new_case, $rec_case, $dea_case, $dat_case, $u2id);
        }

        $sql = "UPDATE provincias SET confirmados=confirmados+(SELECT SUM(novos)FROM casos WHERE id=(SELECT COUNT(id) FROM casos)),activos=activos+(SELECT SUM(novos-recuperados-obitos)FROM casos WHERE id=(SELECT COUNT(id) FROM casos)),recuperados=recuperados+(SELECT SUM(recuperados)FROM casos WHERE id=(SELECT COUNT(id) FROM casos)),obitos=obitos+(SELECT SUM(obitos) FROM casos WHERE id=(SELECT COUNT(id) FROM casos)) WHERE nome=:prov";
        $stmt = $this->connect->prepare($sql);
        $stmt->execute(['prov' => $province]);

        $update = "UPDATE casos SET confirmados=(SELECT SUM(confirmados) FROM provincias), activos=(SELECT SUM(activos) FROM provincias)";
        $st_update = $this->connect->prepare($update);
        $st_update->execute();

        return true;
    }

    public function verificar_data($dat_case)
    {
        $sql = "SELECT id FROM datas WHERE data=:data";
        $stmt = $this->connect->prepare($sql);
        $stmt->execute(['data' => $dat_case]);

        $rest = $stmt->fetch(PDO::FETCH_ASSOC);

        return $rest;
    }
}