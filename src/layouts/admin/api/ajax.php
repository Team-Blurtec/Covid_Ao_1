<?php
include 'data/database.php';
session_start();

$ajx = new Data();

if (isset($_GET['createJSON']) && $_GET['createJSON'] === 'provincias'){
    $a = $ajx->provincias();

    $json = json_encode($a);

    echo $json;

}

if (isset($_POST['action']) && $_POST['action'] === 'conta') {
    $nUser = $ajx->cleanInput($_POST['usr']);
    $nPsw = $ajx->cleanInput($_POST['psw']);

    $passHash = sha1($nPsw);

    $a = $ajx->existe($nUser);

    if (empty($a)) {
        if ($ajx->criarConta($nUser, $passHash)) {
            echo $ajx->dimMessage('success');
        } else {
            echo $ajx->dimMessage('info');
        }
    } else {
        echo $ajx->dimMessage('warning');
    }
}

if (isset($_POST['action']) && $_POST['action'] === 'login') {
    $usr = $ajx->cleanInput($_POST['usr']);
    $psw = $ajx->cleanInput($_POST['psw']);

    $passHash = sha1($psw);

    $a = $ajx->login($usr);

    if (!empty($a)) {
        if ($passHash === $a->passe) {
            $ajx->mudarEstadoOnline($a->id);
            echo $ajx->redir('main.php');
        } else {
            if (strlen($psw) <= 0) {
                echo $ajx->alertMessage('A Palavra Passe está vazia', 'info');
            } else {
                echo $ajx->alertMessage('Palavra Passe incorrecta. Tente novamente', 'error');
            }
        }
    } else {
        echo $ajx->alertMessage('A conta que pretende aceder não existe', 'warning');
    }
}