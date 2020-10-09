<?php
require_once 'config.php';

class Connection
{

    private $dsn = 'mysql:host=' . HOST . ';dbname=' . DBNAME . ';charset=' . CHARSET;

    private $username = USERNAME;

    private $password = PASSWORD;

    private $options = OPTIONS;

    public $connection;

    public function __construct()
    {
        try {
            $this->connection = new PDO($this->dsn, $this->username, $this->password, $this->options);

        } catch (PDOException $exception) {
            echo '<pre>ERROR: ' . $exception->getMessage();
        }

        return $this->connection;
    }

    public function cleanInput($data)
    {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);

        return $data;
    }

    public function redir($url)
    {
        return '<script>window.location="' . $url . '"</script>';
    }

    public function dimMessage($tipo)
    {
        return '<script>$(".ui.' . $tipo . '.dimmer").dimmer("show")</script>';
    }

    public function alertMessage($titulo, $icone)
    {
        return '<script>
                swal.fire
                (
                    {
                        title: "' . $titulo . '",
                        icon: "' . $icone . '",
                        showConfirmButton: false,
                        timer: 5000,
                        toast: true,
                        position: "bottom"
                    }
                )
            </script>';
    }
}