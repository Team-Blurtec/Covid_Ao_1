<?php
require_once 'auth.php';

$crr = new Auth();

//Apresentar registros contidos na base de dados
if (isset($_POST['action']) && $_POST['action'] == 'apresentar') {
    $apresentar = '';

    $registros = $crr->buscar();

    if ($registros) {
        $apresentar .=
            '<table class="table table-striped text-center">
                <thead>
                    <tr>
                        <th>ANGOLA</th>
                    </tr>
                    <tr>
                        <th>Províncias</th>
                        <th>Confirmados</th>
                        <th>Activos</th>
                        <th>Recuperados</th>
                        <th>Óbitos</th>
                    </tr>
                </thead>
                <tbody>';
        foreach ($registros as $registro) {
            $apresentar .=
                '<tr>
                    <td>' . $registro['nome'] . '</td>
                    <td>' . $registro['confirmados'] . '</td>
                    <td>' . $registro['activos'] . '</td>
                    <td>' . $registro['recuperados'] . '</td>
                    <td>' . $registro['obitos'] . '</td>
                </tr>';
        }
        $apresentar .= '</tbody>';
        echo $apresentar;
    }
}