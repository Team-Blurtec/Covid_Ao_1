<?php
require_once 'session.php';


//Adicionar novo caso
if (isset($_POST['action']) && $_POST['action'] == 'case_add') {

    $confirmados = $crr_user->test_input($_POST['case-conf']);
    $activos = $crr_user->test_input($_POST['case-act']);
    $recuperados = $crr_user->test_input($_POST['case-rec']);
    $obitos = $crr_user->test_input($_POST['case-death']);
    $data = $crr_user->test_input($_POST['case-onDate']);

    $crr_user->adicionar_caso($confirmados, $activos, $recuperados, $obitos, $data, $crr_id);

    if ($crr_user) {
        echo 'true';
    }
}

//Apresentar registros de casos diarios
if (isset($_POST['action']) && $_POST['action'] == 'case') {
    $acase = '';

    $case_regs = $crr_user->buscar_por_casos();

    if ($case_regs) {
        $acase .= '<table class="table table-striped table-bordered text-center" id="casos-table" style="width: 100%">
<thead>
<tr>
<th>id</th>
<th>Confirmados</th>
<th>Activos</th>
<th>Recuperados</th>
<th>Mortes</th>
<th>Data</th>
<th>Registrado por</th>
<th>Acção</th>
</tr>
</thead>
<tbody>';
        foreach ($case_regs as $case_reg) {
            $acase .= '<tr>
<td>' . $case_reg['id'] . '</td>
<td>' . $case_reg['confirmados'] . '</td>
<td>' . $case_reg['activos'] . '</td>
<td>' . $case_reg['recuperados'] . '</td>
<td>' . $case_reg['obitos'] . '</td>
<td>' . $case_reg['data_casos'] . '</td>
<td>' . $case_reg['nome'] . '</td>
<td>
<a href="#" title="Ver detalhes" class="text-info">
<i class="fas fa-info-circle fa-lg"></i>
</a>
</td>
</tr>';
        }
        $acase .= '</tbody>
</table>';
        echo $acase;
    } else {
        echo '<h3 class="text-center text-info">:( sem dados registrados.</h3>';
    }
}

//Apresentar registros de casos por provincias
if (isset($_POST['action']) && $_POST['action'] == 'prov') {
    $aprov = '';

    $prov_regs = $crr_user->buscar_por_provincias();

    if ($prov_regs) {
        $aprov .=
            '<table class="table table-striped table-bordered text-center" id="provincias-table" style="width: 100%">
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
<a href="#" title="Ver detalhes" class="text-info">
<i class="fas fa-info-circle fa-lg"></i>
</a>
</td>
</tr>';
        }
        $aprov .= '</tbody>
</table>';
        echo $aprov;
    } else {
        echo '<h3 class="text-center text-info">:( sem dados registrados.</h3>';
    }
}
