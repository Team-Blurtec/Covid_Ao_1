<?php
include_once 'auth.php';
session_start();

$session2auth = new Auth2();

if (!isset($_SESSION['user'])) {
    header('location: ../covidao/vsantos-code/');
    die;
}

$session_name = $_SESSION['user'];

$session_user_data = $session2auth->sessao_iniciada($session_name);

$u2id = $session_user_data['id'];
$u2name = $session_user_data['nome'];