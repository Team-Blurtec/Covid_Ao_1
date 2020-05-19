<?php
if (isset($_SESSION['admin'])) {
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
                    <input type="text" class="form-control" placeholder="Nome de admin" required autofocus>
                </label>
                <label for="password">
                    <input type="password" class="form-control" placeholder="Palavra passe" required>
                </label>
                <input type="button" id="AdminSystem-login-btn" value="Entrar"
                       class="btn vs-login-btn">
                <div class="form-group">
                    <div class="float-left">
                        <a href="#" id="forgot-link">Esqueceu a sua palavra passe?</a>
                    </div>
                </div>
            </form>
        </ul>
    </div>
</nav>
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div class="jumbotron rounded-pill vs-navbar mt-5">
                <h4 class="text-center vs-modal-title">
                    "Com grandes poderes surgem grandes responsabilidades" - Peter Parker
                </h4>
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
        const Toast = Swal.mixin({
            toast: true,
            position: 'top-end',
            timer: 3000,
            timerProgressBar: true,
            onOpen: (toast) => {
                toast.addEventListener('mouseenter', Swal.stopTimer);
                toast.addEventListener('mouseleave', Swal.resumeTimer)
            }
        });
        Toast.fire({
            icon: 'success',
            title: 'Signed in successfully'
        });
        $("#AdminSystem-login-btn").click(function (e) {

        });
    });
</script>
</body>
</html>