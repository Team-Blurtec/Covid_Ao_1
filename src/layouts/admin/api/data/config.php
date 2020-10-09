<?php
define('HOST', 'localhost');
define('USERNAME', 'root');
define('PASSWORD', '');
define('DBNAME', 'api_cvao');
define('CHARSET', 'utf8');
define('OPTIONS', [
    PDO::ATTR_ERRMODE               =>      PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE    =>      PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES      =>      false,
]);