<?php
require_once 'auth.php';

$crr = new Auth();

//Apresentar registros de casos por provincias
if (isset($_POST['action']) && $_POST['action'] == 'prov') {
    $aprov = '';

    $prov_regs = $crr->buscar_por_provincias();

    if ($prov_regs) {
        $aprov .=
            '<table class="table table-striped text-center">
<thead>
<tr>
<th>id</th>
<th>Província</th>
<th>Confirmados</th>
<th>Activos</th>
<th>Recuperados</th>
<th>Mortes</th>
<th>Acção</th>
</tr>
</thead>
<tbody>';
        foreach ($prov_regs as $reg) {
            $aprov .= '<tr>
<td>' . $reg['id'] . '</td>
<td>' . $reg['nome'] . '</td>
<td>' . $reg['confirmados'] . '</td>
<td>' . $reg['activos'] . '</td>
<td>' . $reg['recuperados'] . '</td>
<td>' . $reg['obitos'] . '</td>
<td>
<a href="#" title="Ver detalhes" class="text-success">
<i class="fas fa-info-circle fa-lg"></i>
</a>
</td>
</tr>';
        }
        $aprov .= '</tbody>
</table>';
        echo $aprov;
    } else {
        echo '<h3 class="text-center text-success">:( sem dados registrados.</h3>';
    }
}

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