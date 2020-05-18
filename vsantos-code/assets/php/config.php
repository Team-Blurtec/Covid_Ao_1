<?php

$dsn = 'mysql:host=localhost;dbname=cvao_db';
$duname = 'root';
$dpass = '';
$options = [];

try {

    $connection = new PDO($dsn, $duname, $dpass, $options);

} catch (PDOException $PDOException) {

    echo $PDOException->getMessage();

}