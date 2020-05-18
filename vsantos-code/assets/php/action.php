<?php
require_once 'auth.php';

$user = new Auth();

//Login com Ajax
if (isset($_POST['action']) && $_POST['action'] == 'login') {
    $nome = $user->test_input($_POST['name']);
    $passe = $user->test_input($_POST['password']);

    $log = $user->login($nome);

    if ($log != null) {
        if (password_verify($passe, $log['password'])) {
            echo 'login';
        } else {
            echo $user->showMessage('warning', 'As credenciais são inválidas. Verifique o seu nome e/ou sua palavra passe');
        }
    } else {
        echo $user->showMessage('danger', 'Esta conta não se encontra registrada.');
    }
}