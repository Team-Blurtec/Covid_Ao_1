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
    <link href="../assets/css/sweetalert2.css" rel="stylesheet"> <!--Estilo de alertas e fades com Sweetalert2-->
</head>
<body>
<nav class="navbar navbar-expand-md vs-navbar">
    <!--brand-->
    <a class="navbar-brand vs-navbrand" href="./"><i class="fas fa-viruses fa-lg"></i>&nbsp;
        &nbsp;COVID.ao</a>
</nav>

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

<script type="text/javascript" src="../assets/js/jquery.min.js"></script>
<script type="text/javascript" src="../assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../assets/js/all.min.js"></script>
<script type="text/javascript" src="../assets/js/sweetalert2.min.js"></script>

<!--Scripts e funcoes-->
<script type="text/javascript">
    $(document).ready(function () {

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
                            window.location = 'system/index.php';
                        } else {
                            $("#loginModalAlert").html(response);
                            $("#admin-login-form")[0].reset();
                        }
                    }
                });
            }
        });
    });
</script>
</body>
</html>