<?php
abstract class ClassConexao{
    public function Conectar()
    {
        try{
            $Con=new PDO("mysql:host=localhost;dbname=cvao2_db","root","");
            return $Con;
        }catch (PDOException $Erro){
            return $Erro->getMessage();
        }
    }
}