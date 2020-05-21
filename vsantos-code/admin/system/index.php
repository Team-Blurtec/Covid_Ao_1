<?php
require_once '../../assets/php/session.php';
?>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="author" content="JSKT">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>COVID.ao | Admin</title>
    <!--Estilo manual-->
    <link href="../../assets/css/vs-styles.css" rel="stylesheet">
    <!--Estilo do bootstrap4-->
    <link href="../../assets/css/bootstrap.min.css" rel="stylesheet">
    <!--Outros estilos-->
    <link href="../../assets/css/all.min.css"> <!--Estilo dos icones FontAwesome5-->
    <link href="../../assets/css/sweetalert2.min.css" rel="stylesheet"> <!--Estilo de alertas e fades com Sweetalert2-->
    <link href="../../assets/css/jquery.dataTables.min.css" rel="stylesheet"> <!--Estilo de tabelas-->
</head>
<body>
<nav class="navbar navbar-expand-md vs-navbar navbar-dark">
    <a class="navbar-brand" href="#"><i class="fa fa-viruses fa-lg"></i>&nbsp;
        COVID.ao</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapseNav">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapseNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="#" id="registrar-casos-link" data-toggle="modal"
                   data-target="#casos-diarios-modal"><i class="fas fa-procedures"></i>&nbsp;Registrar Casos</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#" id="registrar-p-provincias-link" data-toggle="modal"
                   data-target="#provincias-modal"><i class="fas fa-sitemap"></i>&nbsp;Províncias</a>
            </li>
            <li class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" id="navbardrop" data-toggle="dropdown">
                    <i class="fas fa-user-cog"></i>&nbsp;
                    <?= $crr_name; ?>
                </a>
                <div class="dropdown-menu">
                    <a href="../../assets/php/logout.php" class="dropdown-item">
                        <i class="fas fa-sign-out-alt"></i>&nbsp;
                        Sair
                    </a>
                </div>
            </li>
        </ul>
    </div>
</nav>
<div class="container">
    <div class="row">
        <div class="col-lg-12 mt-4">
            <h4 class="text-center text-light">Casos por Províncias</h4>
        </div>
    </div>
    <div class="card border-dark my-3">
        <div class="card-body">
            <div class="table-responsive" id="provincias-table-div">

            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12 mt-4">
            <h4 class="text-center text-light">Casos Diários</h4>
        </div>
    </div>
    <div class="card border-dark my-3">
        <div class="card-body">
            <div class="table-responsive" id="casos-diarios-table-div">

            </div>
        </div>
    </div>
</div>
<!--Provincias Modal-->

<!--Provincias Modal end-->

<!--Casos Diarios Modal-->

<!--Casos Diarios Modal end-->

<script type="text/javascript" src="../../assets/js/jquery.min.js"></script>
<script type="text/javascript" src="../../assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../../assets/js/all.min.js"></script>
<script type="text/javascript" src="../../assets/js/sweetalert2.all.min.js"></script>
<script type="text/javascript" src="../../assets/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {

        apresentarProvincias();
        apresentarCasosDiarios();

        function apresentarCasosDiarios() {
            $.ajax({
                url: '../../assets/php/process.php',
                method: 'post',
                data: {action: 'case'},
                success: function (response) {
                    $("#casos-diarios-table-div").html(response);
                    $("#casos-table").DataTable({
                        order: [0, 'desc'],
                        pageLength: 5,
                        lengthMenu: [5, 10, 15, 20, 50, 75, 100, 200],
                        "language": {
                            "sEmptyTable": "Não foi encontrado nenhum registo",
                            "sLoadingRecords": "A carregar...",
                            "sProcessing": "A processar...",
                            "sLengthMenu": "Mostrar _MENU_ registos",
                            "sZeroRecords": "Não foram encontrados resultados",
                            "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registos",
                            "sInfoEmpty": "Mostrando de 0 até 0 de 0 registos",
                            "sInfoFiltered": "(filtrado de _MAX_ registos no total)",
                            "sInfoPostFix": "",
                            "sSearch": "Procurar:",
                            "sUrl": "",
                            "oPaginate": {
                                "sFirst": "Primeiro",
                                "sPrevious": "Anterior",
                                "sNext": "Seguinte",
                                "sLast": "Último"
                            },
                            "oAria": {
                                "sSortAscending": ": Ordenar colunas de forma ascendente",
                                "sSortDescending": ": Ordenar colunas de forma descendente"
                            }
                        }
                    });
                }
            });
        }

        function apresentarProvincias() {
            $.ajax({
                url: '../../assets/php/process.php',
                method: 'post',
                data: {action: 'prov'},
                success: function (response) {
                    $("#provincias-table-div").html(response);
                    $("#provincias-table").DataTable({
                        order: [0, 'asc'],
                        pageLength: 5,
                        lengthMenu: [5, 10, 15, 20, 50, 75, 100, 200],
                        "language": {
                            "sEmptyTable": "Não foi encontrado nenhum registo",
                            "sLoadingRecords": "A carregar...",
                            "sProcessing": "A processar...",
                            "sLengthMenu": "Mostrar _MENU_ registos",
                            "sZeroRecords": "Não foram encontrados resultados",
                            "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registos",
                            "sInfoEmpty": "Mostrando de 0 até 0 de 0 registos",
                            "sInfoFiltered": "(filtrado de _MAX_ registos no total)",
                            "sInfoPostFix": "",
                            "sSearch": "Procurar:",
                            "sUrl": "",
                            "oPaginate": {
                                "sFirst": "Primeiro",
                                "sPrevious": "Anterior",
                                "sNext": "Seguinte",
                                "sLast": "Último"
                            },
                            "oAria": {
                                "sSortAscending": ": Ordenar colunas de forma ascendente",
                                "sSortDescending": ": Ordenar colunas de forma descendente"
                            }
                        }
                    });
                }
            });
        }
    });
</script>
</body>
</html>