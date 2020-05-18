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
<nav class="navbar navbar-expand-md vs-navbar navbar-dark">
    <!--brand-->
    <a class="navbar-brand vs-navbrand" href="./"><i class="fas fa-viruses fa-lg"></i>&nbsp;
        &nbsp;COVID.ao</a>
    <!--button toggler/collapsibe-->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <!--navbar links-->
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
        <ul class="navbar-nav ml-auto">
            <hr class="my-3" style="background-color: yellow">
            <li class="nav-item">
                <a class="nav-link vs-navlink"
                   href="#" id="admin-link" data-toggle="modal" data-target="#login-modal"><i
                            class="fas fa-user-cog"></i>&nbsp;Admin</a>
            </li>
        </ul>
    </div>
</nav>

<!--Painel Principal-->
<div class="container">
    <div class="row">
        <div class="row-cols-1">
            <div class="card my-4" style="background-color: #1b1e21">
                <div class="card-body" style="background-color: #1b1e21">
                    <div class="table-responsive">
                        <table class="table table-striped text-center">
                            <thead>
                            <tr>
                                <th>ANGOLA</th>
                            </tr>
                            <tr>
                                <th>Província</th>
                                <th>Confirmados</th>
                                <th>Activos</th>
                                <th>Recuperados</th>
                                <th>Óbitos</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php foreach ($dados as $dado): ?>
                                <tr>
                                    <td><?= $dado->nome ?></td>
                                    <td><?= $dado->confirmados ?></td>
                                    <td><?= $dado->activos ?></td>
                                    <td><?= $dado->recuperados ?></td>
                                    <td><?= $dado->obitos ?></td>
                                </tr>
                            <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--Painel Principal end-->
    <!--Modal Login-Form-->
    <div class="modal fade" id="login-modal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header vs-modal-header">
                    <h4 class="modal-title vs-modal-title">
                        <i class="fas fa-user-cog fa-lg"></i><br>
                        Login
                    </h4>
                    <div class="clearfix"></div>
                    <button type="button" class="close vs-modal-close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body vs-modal-body">
                    <div id="loginModalAlert"></div>
                    <form action="#" method="post" id="admin-login-form" class="px-3">
                        <div class="input-group input-group-lg form-group">
                            <div class="input-group-prepend">
                            <span class="input-group-text vs-navbar vs-modal-title">
                                <i class="far fa-user fa-lg"></i>
                            </span>
                            </div>
                            <label for="name" class="sr-only"></label><input type="text" name="name" id="name"
                                                                             class="form-control" placeholder="Nome"
                                                                             required
                                                                             autofocus>
                        </div>
                        <div class="input-group input-group-lg form-group">
                            <div class="input-group-prepend">
                            <span class="input-group-text vs-navbar vs-modal-title">
                                <i class="fas fa-key fa-lg"></i>
                            </span>
                            </div>
                            <label for="password" class="sr-only"></label><input type="password" name="password"
                                                                                 id="password"
                                                                                 class="form-control"
                                                                                 placeholder="Palavra passe" required>
                        </div>
                        <div class="form-group">
                            <div class="float-left">
                                <a href="#" id="registo-modal-link">
                                    <i class="fas fa-user-plus"></i>&nbsp; Nova conta
                                </a>
                            </div>
                            <div class="float-right">
                                <a href="#" id="forgot-link">Esqueceu a sua palavra passe?</a>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="form-group">
                            <input type="submit" value="Entrar" id="admin-login-form-btn"
                                   class="btn btn-lg btn-block vs-login-btn">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--Modal Login-Form end-->
    <!--Modal Registrar admin-->

    <!--Modal Registrar admin end-->
</div>

<script type="text/javascript" src="assets/js/jquery.min.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/js/all.min.js"></script>
<script type="text/javascript" src="assets/js/sweetalert2.min.js"></script>

<!--Scripts e funcoes-->
<script type="text/javascript">
    $("#admin-login-form-btn").click(function (e) {
        if ($("#admin-login-form")[0].checkValidity()) {
            e.preventDefault();

            $("#admin-login-form-btn").val('A verificar...');
            $.ajax({
                url: 'assets/php/action.php',
                method: 'post',
                data: $("#admin-login-form").serialize() + '&action=login',
                success: function (response) {
                    $("#admin-login-form-btn").val('Entrar');
                    if (response === 'login') {
                        window.location = 'admin/index.php';
                    } else {
                        $("#loginModalAlert").html(response);
                        $("#admin-login-form")[0].reset();
                    }
                }
            });
        }
    });
</script>
</body>
</html>