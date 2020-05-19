<?php
require_once 'assets/php/config.php';
?>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="author" content="JSKT">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>COVID.AO</title>
    <!--Estilo manual-->
    <link href="assets/css/vs-styles.css" rel="stylesheet">
    <!--Estilo do bootstrap4-->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <!--Outros estilos-->
    <link href="assets/css/all.min.css"> <!--Estilo dos icones FontAwesome5-->
    <link href="assets/css/sweetalert2.css" rel="stylesheet"> <!--Estilo de alertas e fades com Sweetalert2-->
</head>
<body>
<nav class="navbar navbar-expand-md vs-navbar">
    <!--brand-->
    <a class="navbar-brand vs-navbrand" href="./"><i class="fas fa-viruses fa-lg"></i>&nbsp;
        &nbsp;COVID.ao</a>
</nav>

<!--Painel Principal-->
<div class="container">
    <div class="row style-wrapper my-auto">
        <div class="row-cols-1">
            <div class="card my-4" style="background-color: #1b1e21">
                <div class="card-body" style="background-color: #1b1e21">
                    <div class="table-responsive" id="registros">

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--Painel Principal end-->
</div>
<script type="text/javascript" src="assets/js/jquery.min.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/js/all.min.js"></script>
<script type="text/javascript" src="assets/js/sweetalert2.min.js"></script>
<!--Scripts e funcoes-->
<script type="text/javascript">
    $(document).ready(function () {

        registros();

        function registros() {
            $.ajax({
                url: 'assets/php/process.php',
                method: 'post',
                data: {action: 'apresentar'},
                success: function (response) {
                    console.log(response);
                    $("#registros").html(response);
                }
            });
        }
    });
</script>
</body>
</html>