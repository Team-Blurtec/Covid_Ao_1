<?php
session_start();
include_once 'auth.php';

$user2 = new Auth2();

//Ajax Login
if (isset($_POST['action']) && $_POST['action'] == 'login') {
    $nomeL2 = $user2->test_input($_POST['name']);
    $passeL2 = $user2->test_input($_POST['password']);

    $login = $user2->login($nomeL2);

    if ($login != null) {
        if (password_verify($passeL2, $login['passe'])) {
            if (!empty($_POST['rem'])) {
                setcookie("name", $nomeL2, time() + (10 * 24 * 60 * 60), '/');
                setcookie("password", $passeL2, time() + (10 * 24 * 60 * 60), '/');
            } else {
                setcookie("name", "", 1, '/');
                setcookie("password", "", 1, '/');
            }
            echo 'login';
            $_SESSION['user'] = $nomeL2;
        } else {
            echo $user2->showMessage('warning', 'Incorrecto. Verifique o seu e-mail e/ou sua palavra passe');
        }
    } else {
        echo $user2->showMessage('danger', 'Esta conta não existe.');
    }
}

//Ajax Registrar
if (isset($_POST['action']) && $_POST['action'] == 'register') {
    $nomeR2 = $user2->test_input($_POST['r-name']);
    $emailR2 = $user2->test_input($_POST['r-email']);
    $passeR2 = $user2->test_input($_POST['r-pass']);

    $auth2Passe = password_hash($passeR2, PASSWORD_DEFAULT);

    if ($user2->existe_conta($emailR2)) {
        echo $user2->showMessage('warning', 'Esta conta já existe. Tenta outro e-mail porfavor.');
    } else {
        if ($user2->criar_conta($nomeR2, $emailR2, $auth2Passe)) {
            echo 'register';
        } else {
            echo $user->showMessage('danger', 'Algo errado ocorreu, porfavor tente novamente.');
        }
    }
}

//Apresentar os dados na landing page
if (isset($_POST['action']) && $_POST['action'] == 'atualizacao') {

    $index_main = '';

    $registos = $user2->buscar_atualizacao();

    if ($registos) {
        $index_main .= '<table class="table table-striped text-center">
<thead>
<tr>
<th>ANGOLA</th>
</tr>
<tr>
<th>Província</th>
<th>Casos Confirmados</th>
<th>Casos Activos</th>
<th>Casos Recuperados</th>
<th>Óbitos</th>
</tr>
</thead>
<tbody>';
        foreach ($registos as $registo) {
            $index_main .= '<tr>
<td>' . $registo['nome'] . '</td>
<td>' . $registo['confirmados'] . '</td>
<td>' . $registo['activos'] . '</td>
<td>' . $registo['recuperados'] . '</td>
<td>' . $registo['obitos'] . '</td>
</tr>';
        }
        $index_main .= '</tbody></table>';
        echo $index_main;
    } else {
        echo '<h3 class="text-center text-warning"> Em processamento ...</h3>';
    }

}