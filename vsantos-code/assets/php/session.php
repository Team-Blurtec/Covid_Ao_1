<?php
session_start();

require_once 'auth.php';

$session2auth = new Auth2();

if (!isset($_SESSION['user'])) {
    header('location: /');
    die;
}

$session_name = $_SESSION['user'];

$session_user_data = $session2auth->sessao_iniciada($session_name);

$u2id = $session_user_data['id'];
$u2name = $session_user_data['nome'];