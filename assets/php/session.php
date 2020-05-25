<?php
session_start();

require_once 'auth.php';

$crr_user = new Auth();

if (!isset($_SESSION['user'])) {
    header('location: /');
    die;
}

$crr_acc = $_SESSION['user'];

$data = $crr_user->current_user($crr_acc);

$crr_id = $data['id'];
$crr_name = $data['nome'];
$crr_pass = $data['passe'];
$crr_email = $data['email'];