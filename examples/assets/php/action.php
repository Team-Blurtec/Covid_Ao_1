<?php
require_once 'auth.php';

session_start();

$user = new Auth();

//Registrar com Ajax
if (isset($_POST['action']) && $_POST['action'] == 'register') {
    $name = $user->test_input($_POST['r-name']);
    $pass = $user->test_input($_POST['r-pass']);

    $hpass = password_hash($pass, PASSWORD_DEFAULT);

    if ($user->existe_conta($name)) {
        echo $user->showMessage('warning', 'Esta conta já se encontra em uso.');
    } else {
        if ($user->register($name, $hpass)) {
            echo 'register';

            $_SESSION['user'] = $name;
        } else {
            echo $user->showMessage('error', 'Algo errado ocorreu, porfavor tente novamente.');
        }
    }
}

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