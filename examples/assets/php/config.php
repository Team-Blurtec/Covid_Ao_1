<?php

class Database
{

    public $connect;
    private $dsn = 'mysql:host=localhost;dbname=cvao_db';
    private $dbuser = 'root';
    private $dbpass = '';

    public function __construct()
    {
        try {
            $this->connect = new PDO($this->dsn, $this->dbuser, $this->dbpass);

        } catch (PDOException $e) {
            echo 'Error: ' . $e->getMessage();
        }

        return $this->connect;
    }

    //Check Input
    public function test_input($data)
    {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);

        return $data;
    }

    //Error Success Message Alert
    public function showMessage($type, $message)
    {
        return '<div class="alert alert-' . $type . ' alert-dismissible">
<button type="button" class="close" data-dismiss="alert">&times;</button>
<strong class="text-center">' . $message . '</strong>
</div>';
    }

    //Error Sucess Modal Alert
    public function showModalAlert($type, $message)
    {
        return '<div></div>';
    }
}