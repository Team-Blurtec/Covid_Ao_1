<?php
include 'connection.php';


class Data extends Connection
{

    public function login($usr)
    {
        $sql = 'select id, nome, passe from administradores where nome=:nome';
        $stm = $this->connection->prepare($sql);
        $stm->execute([
            'nome' => $usr
        ]);

        return $stm->fetch(PDO::FETCH_OBJ);
    }

    public function mudarEstadoOnline($uid)
    {
        $sql = 'update administradores set online=1 where id=:uid';
        $stm = $this->connection->prepare($sql);
        $stm->execute([
            'uid' => $uid
        ]);
    }

    public function mudarEstadoOffline($uid)
    {
        $sql = 'update administradores set online=0 where id=:uid';
        $stm = $this->connection->prepare($sql);
        $stm->execute([
            'uid' => $uid
        ]);
    }

    public function existe($nUser)
    {
        $sql = 'select * from administradores where nome=:n';
        $stm = $this->connection->prepare($sql);
        $stm->execute([
            'n' => $nUser
        ]);

        return $stm->fetchAll();
    }

    public function criarConta($nUser, $passHash)
    {
        $sql = 'insert into administradores(nome, passe) values(:n, :p)';
        $stm = $this->connection->prepare($sql);
        return $stm->execute([
            'n' => $nUser,
            'p' => $passHash
        ]);
    }

    public function provincias()
    {
        $array = array();

        $sql = 'select * from provincias';
        $stm = $this->connection->prepare($sql);
        $stm->execute();

        header('Content-type: application/json');

        while ($rows = $stm->fetch(PDO::FETCH_ASSOC)) {
            $array["data"][] = $rows;
        }

        return $array;
    }
}