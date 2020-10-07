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
    <link rel="shortcut icon" href="../../styles/assets_news/images/favi.png" type="image/x-icon">
    <!--Estilo manual-->
    <link href="../../styles/assets_main/css/vs-styles.css" rel="stylesheet">
    <!--Estilo do bootstrap4-->
    <link href="../../styles/assets_main/css/bootstrap.min.css" rel="stylesheet">
    <!--Outros estilos-->
    <link href="../../styles/assets_main/css/all.min.css"> <!--Estilo dos icones FontAwesome5-->
    <link href="../../styles/assets_main/css/sweetalert2.min.css" rel="stylesheet"> <!--Estilo de alertas e fades com Sweetalert2-->
</head>
<body>
<nav class="navbar navbar-expand-md vs-navbar navbar-dark">

    <a class="navbar-brand vs-navbrand" href=""><i class="fas fa-viruses fa-lg"></i>&nbsp;
        &nbsp;COVID.ao | Admin</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse navbar-right" id="navbarCollapse">
        <ul class="navbar-nav ml-auto">
            <hr class="my-3 bg-light">
            <form action="#" method="post" id="AdminSystem-login-form" class="px-3 custom-control">
                <label for="text">
                    <input type="text" name="name" id="name" value="<?php if (isset($_COOKIE['name'])) {
                        echo $_COOKIE['name'];
                    } ?>" class="form-control" placeholder="Nome de admin" required
                           autofocus>
                </label>
                <label for="password">
                    <input type="password" name="password" id="password" value="<?php if (isset($_COOKIE['password'])) {
                        echo $_COOKIE['password'];
                    } ?>" class="form-control"
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
                    <input type="checkbox" name="rem" class="custom-control-input"
                           id="customCheck" <?php if (isset($_COOKIE['name'])): ?> checked <?php endif; ?>>
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
            <div class="jumbotron vs-shadow rounded-lg text-center vs-navbar mt-5" id="jumbotron">
                <h3 class="text-center vs-modal-title">
                    "Com grandes poderes surgem grandes responsabilidades" - Peter Parker
                </h3>
                <br>
                <input type="button" id="AdminSys-nc-btn" value="Nova conta" class="btn btn-dark btn-lg vs-login-btn">
            </div>
            <div class="row justify-content-center" id="AdminSystem-register">
                <div class="col-lg-12 mt-4">
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
                                    <br>
                                    <a class="text-warning" href="">Voltar para login</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Recuperar a palavra passe-->
        <div class="row justify-content-center vs-wrapper" id="forgot-box">
            <div class="col-lg-10 my-5">
                <div class="card-group justify-content-center vs-shadow">
                    <div class="card rounded-left vs-navbar p-4">
                        <h1 class="text-center font-weight-bold vs-modal-title">
                            Esqueceu a sua palavra passe&nbsp;<br><i class="fas fa-question fa-lg"></i></h1>
                        <hr class="my-5" style="background-color:yellow;">
                        <button class="btn btn-outline-primary vs-login-btn btn-lg" id="back-link">Voltar para login
                        </button>
                    </div>
                    <div class="card rounded-right p-4" style="flex-grow: 1.4; background-color:#000000;">
                        <h1 class="text-center font-weight-bold" style="color: yellow">
                            Reposição de palavra passe
                        </h1>
                        <hr class="my-2" style="background-color:yellow;">
                        <p class="lead text-center text-secondary">
                            Para repôr a sua palavra passe introduz abaixo o seu e-mail de modo a verificar se está na
                            plataforma. Caso esteja, poderá ser liberado para efectuar a reposição.
                        </p>
                        <form action="#" method="post" class="px-3" id="forgot-form">
                            <div id="forgotAlert"></div>
                            <div class="input-group input-group-lg form-group">
                                <div class="input-group-prepend">
                            <span class="input-group-text rounded-0">
                                <i class="far fa-envelope fa-lg"></i>
                            </span>
                                </div>
                                <input type="email" name="femail" id="femail" class="form-control rounded-0"
                                       placeholder="E-mail" required>
                            </div>
                            <div class="form-group">
                                <input type="submit" id="fr-btn"
                                       class="btn btn-outline-primary btn-lg btn-block vs-login-btn" value="Submeter">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--Recuperar a palavra passe end-->
    </div>
</div>

<script type="text/javascript" src="../../styles/assets_main/js/jquery.min.js"></script>
<script type="text/javascript" src="../../styles/assets_main/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../../styles/assets_main/js/all.min.js"></script>
<script type="text/javascript" src="../../styles/assets_main/js/sweetalert2.all.min.js"></script>

<!--Scripts e funcoes-->
<script type="text/javascript">
    $(document).ready(function () {
        $("#forgot-link").click(function () {
            $("#jumbotron").hide();
            $("nav").hide();
            $("#forgot-box").show();
        });
        $("#AdminSys-nc-btn").click(function () {
            $("#jumbotron").hide();
            $("nav").hide();
            $("#AdminSystem-register").show();
        });
        $("#back-link").click(function () {
            window.location = './';
        });

        //Recuperar a conta ou palavra passe
        $("#fr-btn").click(function (e) {
            if ($("#forgot-form")[0].checkValidity()) {
                e.preventDefault();

                $.ajax({
                    url: '../../api/php/action.php',
                    method: 'post',
                    data: $("#forgot-form").serialize() + '&action=forgot',
                    success: function (response) {

                        $("#forgot-form")[0].reset();
                        $("#forgotAlert").html(response);
                    }
                });
            }
        });

        //Login com conta admin
        $("#AdminSystem-login-btn").click(function (e) {
            if ($("#AdminSystem-login-form")[0].checkValidity()) {
                e.preventDefault();

                $.ajax({
                    url: '../../api/php/action.php',
                    method: 'post',
                    data: $("#AdminSystem-login-form").serialize() + '&action=login',
                    success: function (response) {
                        if (response === 'login') {
                            window.location = 'system/';
                        } else {
                            console.log(response);
                            Swal.fire({
                                text: 'Incorrecto. Verifique o seu e-mail e/ou sua palavra passe',
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
                        url: '../../api/php/action.php',
                        method: 'post',
                        data: $("#AdminSystem-RForm").serialize() + '&action=register',
                        success: function (response) {

                            $("#AdminSystem-register-btn").val('Submeter');
                            if (response === 'register') {
                                Swal.fire({
                                    text: 'Conta Criada!',
                                    icon: 'success',
                                    timer: 10000,
                                    timerProgressBar: true
                                });
                                $("#AdminSystem-RForm")[0].reset();
                                $("#AdminSystem-register").hide();
                                $("#jumbotron").show();
                                $("nav").show();
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
