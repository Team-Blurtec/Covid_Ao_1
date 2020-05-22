<?php
session_start();

if (isset($_SESSION['user'])) {
    header('location: system/');
}
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
    <link href="../assets/css/vs-styles.css" rel="stylesheet">
    <!--Estilo do bootstrap4-->
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet">
    <!--Outros estilos-->
    <link href="../assets/css/all.min.css"> <!--Estilo dos icones FontAwesome5-->
    <link href="../assets/css/sweetalert2.min.css" rel="stylesheet"> <!--Estilo de alertas e fades com Sweetalert2-->
</head>
<body>
<nav class="navbar navbar-expand-md vs-navbar navbar-dark">

    <a class="navbar-brand vs-navbrand" href="./"><i class="fas fa-viruses fa-lg"></i>&nbsp;
        &nbsp;COVID.ao | Admin</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse navbar-right" id="navbarCollapse">
        <ul class="navbar-nav ml-auto">
            <hr class="my-3 bg-light">
            <form action="#" method="post" id="AdminSystem-login-form" class="px-3 custom-control">
                <label for="text">
                    <input type="text" name="name" id="name" class="form-control" placeholder="Nome de admin" required
                           autofocus>
                </label>
                <label for="password">
                    <input type="password" name="password" id="password" class="form-control"
                           placeholder="Palavra passe" required>
                </label>
                <input type="submit" id="AdminSystem-login-btn" value="Entrar"
                       class="btn btn-dark vs-login-btn">
                <div class="form-group">
                    <div class="float-left">
                        <a href="#" id="forgot-link">Esqueceu a sua palavra passe?</a>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="custom-control custom-checkbox float-left">
                    <input type="checkbox" name="rem" class="custom-control-input" id="customCheck">
                    <label for="customCheck" class="custom-control-label" style="color: yellow">Manter-me
                        conectado</label>
                </div>
            </form>
        </ul>
    </div>
</nav>
<div class="container">
    <div class="row">
        <div class="col-lg-12 my-auto">
            <div class="jumbotron rounded-pill text-center vs-navbar mt-5" id="jumbotron">
                <h3 class="text-center vs-modal-title">
                    "Com grandes poderes surgem grandes responsabilidades" - Peter Parker
                </h3>
                <br>
                <input type="button" id="AdminSys-nc-btn" value="Nova conta" class="btn btn-dark btn-lg vs-login-btn">
            </div>
            <div class="row justify-content-center" id="AdminSystem-register" style="display: none">
                <div class="col-lg-10 mt-4">
                    <div class="card-group vs-shadow">
                        <div class="card rounded-left p-4 vs-navbar" style="flex-grow: 1.4;">
                            <h1 class="text-center font-weight-bold" style="color: #000000">
                                <span><i class="fas fa-user-plus fa-lg"></i></span><br>
                                Criar nova conta
                            </h1>
                            <hr class="my-3 bg-light">
                            <form action="#" method="post" class="px-3" id="AdminSystem-RForm">
                                <div class="input-group form-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text rounded-0">
                                            <i class="far fa-user fa-lg" aria-hidden="true"></i>
                                        </span>
                                    </div>
                                    <input type="text" name="r-name" id="r-name" class="form-control rounded-0"
                                           placeholder="Nome" required minlength="4">
                                </div>
                                <div id="regAlert"></div>
                                <div class="input-group form-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text rounded-0">
                                            <i class="far fa-envelope fa-lg" aria-hidden="true"></i>
                                        </span>
                                    </div>
                                    <input type="email" name="r-email" id="r-email" class="form-control rounded-0"
                                           placeholder="E-mail" required minlength="4">
                                </div>
                                <div class="input-group form-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text rounded-0">
                                            <i class="fas fa-key fa-lg" aria-hidden="true"></i>
                                        </span>
                                    </div>
                                    <input type="password" name="r-pass" id="r-pass" class="form-control rounded-0"
                                           placeholder="Palavra passe" required minlength="6">
                                </div>
                                <div class="input-group form-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text rounded-0">
                                            <i class="fas fa-key fa-lg" aria-hidden="true"></i>
                                        </span>
                                    </div>
                                    <input type="password" name="cr-pass" id="cr-pass" class="form-control rounded-0"
                                           placeholder="Confirme a palavra passe" required minlength="6">
                                </div>
                                <div class="form-group">
                                    <div id="passError" class="text-warning font-weight-bold"></div>
                                </div>
                                <div class="form-group">
                                    <input type="submit" value="Submeter" id="AdminSystem-register-btn"
                                           class="btn btn-dark btn-lg btn-block vs-login-btn">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="../assets/js/jquery.min.js"></script>
<script type="text/javascript" src="../assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../assets/js/all.min.js"></script>
<script type="text/javascript" src="../assets/js/sweetalert2.all.min.js"></script>

<!--Scripts e funcoes-->
<script type="text/javascript">
    $(document).ready(function () {
        $("#AdminSys-nc-btn").click(function () {
            $("#jumbotron").hide();
            $("#AdminSystem-register").show();
        });

        //Login com conta admin
        $("#AdminSystem-login-btn").click(function (e) {
            if ($("#AdminSystem-login-form")[0].checkValidity()) {
                e.preventDefault();

                $.ajax({
                    url: '../assets/php/action.php',
                    method: 'post',
                    data: $("#AdminSystem-login-form").serialize() + '&action=login',
                    success: function (response) {
                        if (response === 'login') {
                            window.location = 'system/';
                        } else {
                            console.log(response);
                            Swal.fire({
                                text: 'As credenciais não se encontram certas.',
                                icon: 'error'
                            });
                        }
                    }
                });
            }
        });

        // Criar nova conta admin
        $("#AdminSystem-register-btn").click(function (e) {
            if ($("#AdminSystem-RForm")[0].checkValidity()) {
                e.preventDefault();

                $("#AdminSystem-register-btn").val('a submeter...');
                if ($("#r-pass").val() !== $("#cr-pass").val()) {
                    $("#passError").text('* a palavra passe não coincide. Deve digitar a mesma palavra passe');
                    $("#AdminSystem-register-btn").val('Submeter');

                } else {
                    $("#passError").text('');
                    $.ajax({
                        url: '../assets/php/action.php',
                        method: 'post',
                        data: $("#AdminSystem-RForm").serialize() + '&action=register',
                        success: function (response) {
                            $("#AdminSystem-register-btn").val('Submeter');
                            if (response === 'register') {
                                Swal.fire({
                                    text: 'Nova conta criada com sucesso!',
                                    icon: 'success',
                                    timer: 10000,
                                    timerProgressBar: true
                                });
                                $("#AdminSystem-RForm")[0].reset();
                                $("#AdminSystem-register").hide();
                                $("#jumbotron").show();
                            } else {
                                $("#regAlert").html(response);
                            }
                        }
                    });
                }
            }
        });
    });
</script>
</body>
</html>