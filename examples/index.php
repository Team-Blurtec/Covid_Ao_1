<?php include 'conexao.php' ?>


<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
    google.charts.load('current', {
        'packages':['geochart'],
        // Note: you will need to get a mapsApiKey for your project.
        // See: https://developers.google.com/chart/interactive/docs/basic_load_libs#load-settings
        'mapsApiKey': 'AIzaSyAHmhYYdxcJdfId1UjVR4BH8eLGgeR3fN4'
    });
    google.charts.setOnLoadCallback(drawRegionsMap);

    function drawRegionsMap() {
        var data = google.visualization.arrayToDataTable([
            ['Provincia', 'Casos'],

            <?php include 'conexao.php';
            $sql="SELECT nome,confirmados FROM provincias";
            $buscar = mysqli_query($conexao,$sql);


            while ($dados = mysqli_fetch_array($buscar)){

            $Nome = $dados['nome'];
            $C_activos =$dados['confirmados'];

            ?>
            ['<?php echo $Nome?>',<?php echo $C_activos?>],
            <?php }
            ?>

        ]);

        var options = { region: 'AO',
            resolution: 'provinces',
            colors: ['#acb2b9', '#FF0000']};

        var chart = new google.visualization.GeoChart(document.getElementById('regions_div'));

        chart.draw(data, options);
    }
</script>
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
        <div class="col-sm">
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped text-center my-2" style="color: yellow">
                        <thead>
                        <tr>
                            <th class="border-0 vs-navbar">ANGOLA</th>
                        </tr>
                        <tr>
                            <th>Províncias</th>
                            <th>Casos Confirmados</th>

                        </tr>
                        </thead>
                        <tbody>



                        <?php
                        $sql="SELECT nome,confirmados FROM provincias";
                        $buscar = mysqli_query($conexao,$sql);


                        while ($dados = mysqli_fetch_array($buscar)){

                            $nome = $dados['nome'];
                            $confirmados =$dados['confirmados'];


                            ?>
                            <tr>
                                <td><?php echo $nome?></td>
                                <td><?php echo $confirmados?></td>

                            </tr> <?php }
                        ?>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-sm">
            <div class="card-body">
                <div class="table-responsive" id="regions_div" style="width:max-content; height:max-content;border: red; border-bottom-left-radius: 16px;
border-bottom-right-radius: 16px;border-bottom-left-radius: 16px;border-bottom-rigth-radius: 16px;background-color:red"></div> <!-- DEFINICAO DO MAPA -->
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
                <button type="button" class="close vs-modal-close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body vs-modal-body">
                <form action="#" method="post" id="admin-login-form" class="px-3">
                    <div class="input-group input-group-lg form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text vs-navbar vs-modal-title">
                                <i class="far fa-user fa-lg"></i>
                            </span>
                        </div>
                        <label for="u-name" class="sr-only"></label><input type="text" name="u-name" id="u-name"
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
                        <label for="u-pass" class="sr-only"></label><input type="password" name="u-pass" id="u-pass"
                                                                           class="form-control"
                                                                           placeholder="Palavra passe" required>
                    </div>
                    <div class="form-group">
                        <div class="forgot float-right">
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

<script type="text/javascript" src="assets/js/jquery.min.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/js/all.min.js"></script>
<script type="text/javascript" src="assets/js/sweetalert2.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {

    });
</script>
</body>
</html>