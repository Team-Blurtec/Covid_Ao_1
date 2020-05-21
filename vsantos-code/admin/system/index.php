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
                <a class="nav-link <?= (basename($_SERVER['PHP_SELF']) == "registrar-casos") ? "active" : ""; ?>"
                   href="registrar-casos.php"><i class="fas fa-procedures"></i>&nbsp;Registrar Casos</a>
            </li>
            <li class="nav-item">
                <a class="nav-link <?= (basename($_SERVER['PHP_SELF']) == "registrar-p-provincias") ? "active" : ""; ?>"
                   href="registrar-p-provincias.php"><i class="fas fa-sitemap"></i>&nbsp;Províncias</a>
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
    <div class="card border-dark">
        <div class="card-body" style="background-color: whitesmoke;">
            <div class="table-responsive" id="provincias-table">

            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="../../assets/js/jquery.min.js"></script>
<script type="text/javascript" src="../../assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../../assets/js/all.min.js"></script>
<script type="text/javascript" src="../../assets/js/sweetalert2.all.min.js"></script>
<script type="text/javascript" src="../../assets/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("table").DataTable();

        apresentarProvincias();

        function apresentarProvincias() {
            $.ajax({
                url: '../../assets/php/process.php',
                method: 'post',
                data: {action: 'prov'},
                success: function (response) {
                    $("#provincias-table").html(response);
                    $("table").DataTable({
                        order: [0, 'asc']
                    });
                }
            });
        }
    });
</script>
</body>
</html>