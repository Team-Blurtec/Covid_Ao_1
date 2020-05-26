<?php
include_once 'auth.php';
include_once 'session.php';

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

//Processos executados na admin panel

if (isset($_POST['action']) && $_POST['action'] == 'more_case') {
}
if (isset($_POST['action']) && $_POST['action'] == 'new_case') {
    $province = $auth2->test_input($_POST['province-select']);
    $new_case = $auth2->test_input($_POST['case-new']);
    $rec_case = $auth2->test_input($_POST['case-rec']);
    $dea_case = $auth2->test_input($_POST['case-death']);
    $dat_case = $auth2->test_input($_POST['case-onDate']);

    $isInserted = $auth2->criar_novo_registo($province, $new_case, $rec_case, $dea_case, $dat_case, $u2id);

    if ($isInserted) {
        echo 'success';
    } else {
        echo 'tem erro';
    }
}
if (isset($_POST['action']) && $_POST['action'] == 'case') {
    $out_cases = '';
    $cases = $auth2->buscar_casos();

    if ($cases) {
        $out_cases .= '<table class="table table-striped vs-navbar table-bordered" id="cases-table">
<thead>
<tr>
<th>Confirmados</th>
<th>Activos</th>
<th>Recuperados</th>
<th>Obitos</th>
<th>Data</th>
<th>Registado por</th>
</tr>
</thead>
<tbody>';
        foreach ($cases as $case) {
            $out_cases .= '<tr>
<td>' . $case['confirmados'] . '</td>
<td>' . $case['activos'] . '</td>
<td>' . $case['recuperados'] . '</td>
<td>' . $case['obitos'] . '</td>
<td>' . $case['data'] . '</td>
<td>' . $case['admin'] . '</td>
</tr>';
        }
        $out_cases .= '</tbody></table>';
        echo $out_cases;
    } else {
        echo '<h3 class="text-center text-success">:( sem casos registados</h3>';
    }
}
if (isset($_POST['action']) && $_POST['action'] == 'province_case') {
    $out_provinces_cases = '';
    $provinces_cases = $auth2->buscar_casos_provincias();

    if ($provinces_cases) {
        $out_provinces_cases .= '<table class="table table-striped vs-navbar table-bordered" id="provincias-table">
<thead>
<tr>
<th>Província</th>
<th>Confirmados</th>
<th>Activos</th>
<th>Recuperados</th>
<th>Obitos</th>
</tr>
</thead>
<tbody>';
        foreach ($provinces_cases as $case) {
            $out_provinces_cases .= '<tr>
<td>' . $case['nome'] . '</td>
<td>' . $case['confirmados'] . '</td>
<td>' . $case['activos'] . '</td>
<td>' . $case['recuperados'] . '</td>
<td>' . $case['obitos'] . '</td>
</tr>';
        }
        $out_provinces_cases .= '</tbody></table>';
        echo $out_provinces_cases;
    }
}