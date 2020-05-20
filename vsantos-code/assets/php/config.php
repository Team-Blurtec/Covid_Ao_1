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
        return '<script>
Swal.fire({
text: ' . $message . ',
icon;: ' . $type . ',
buttons;: false;
})
</script>';
    }
}