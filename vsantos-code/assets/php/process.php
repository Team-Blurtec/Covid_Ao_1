<?php
require_once 'auth.php';

$auth2 = new Auth2();

//Apresentar os dados na landing page
if (isset($_POST['action']) && $_POST['action'] == 'atualizacao') {

    $index_main = '';

    $registos = $auth2->buscar_atualizacao();

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