<?php
include("ClassConexao.php");
class ClassVisitas extends ClassConexao{
    private $Id, $Ip , $Data , $Hora , $Limite,$hits;

    #Construtor para setar atributos
    public function __construct()
    {
        $this->Id=0;
        $this->hits=1;
        $this->Ip=$_SERVER['REMOTE_ADDR'];
        $this->Data=date("Y/m/d");
        $this->Hora=date("H:i");
        $this->Limite=50;
    }

    #Verifica se o usuário recebeu visita recentemente
    public function VerificaUsuario()
    {
        $Select=$this->Conectar()->prepare("select * from visitas where Ip=:ip and Data=:datas order by Id desc");
        $Select->bindParam(":ip",$this->Ip,PDO::PARAM_STR);
        $Select->bindParam(":datas",$this->Data,PDO::PARAM_STR);
        $Select->execute();
        if($Select->rowCount() == 0){
            $this->InserindoVisitas();
        }else{
            $FSelect=$Select->fetch(PDO::FETCH_ASSOC);
            $Id_actual=($FSelect['Id']);
            $Hora_1=date("H:i");



                $Select=$this->Conectar()->prepare("update  visitas set hits=hits+1,Hora = '".$Hora_1."' where Id=".$Id_actual);
                $Select->execute();

        }

    }

    #Inseri a visita no banco de dados
    private function InserindoVisitas()
    {
        $Select=$this->Conectar()->prepare("insert into visitas values (:id , :ip , :datas , :hora, :hits)");
        $Select->bindParam(":id",$this->Id,PDO::PARAM_STR);
        $Select->bindParam(":ip",$this->Ip,PDO::PARAM_STR);
        $Select->bindParam(":datas",$this->Data,PDO::PARAM_STR);
        $Select->bindParam(":hora",$this->Hora,PDO::PARAM_STR);
        $Select->bindParam(":hits",$this->hits,PDO::PARAM_STR);
        $Select->execute();
    }
}