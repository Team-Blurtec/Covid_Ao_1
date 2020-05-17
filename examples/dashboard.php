<!-- 
=========================================================
 Light Bootstrap Dashboard - v2.0.1
=========================================================

 Product Page: https://www.creative-tim.com/product/light-bootstrap-dashboard
 Copyright 2019 Creative Tim (https://www.creative-tim.com)
 Licensed under MIT (https://github.com/creativetimofficial/light-bootstrap-dashboard/blob/master/LICENSE)

 Coded by Creative Tim

=========================================================

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.  -->
<!DOCTYPE html>
<?php include 'conexao.php' ?>

<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="../assets/img/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Light Bootstrap Dashboard - Free Bootstrap 4 Admin Dashboard by Creative Tim</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <!-- CSS Files -->
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/css/light-bootstrap-dashboard.css?v=2.0.0 " rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="../assets/css/demo.css" rel="stylesheet" />


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
            $sql="SELECT Nome,C_activos FROM provincia";
            $buscar = mysqli_query($conexao,$sql);


            while ($dados = mysqli_fetch_array($buscar)){

                $Nome = $dados['Nome'];
                $C_activos =$dados['C_activos'];

                    ?>
                ['<?php echo $Nome?>',<?php echo $C_activos?>],
            <?php }
                ?>

        ]);

            var options = { region: 'AO',
                resolution: 'provinces',
                colors: ['#acb2b9', '#2f3f4f']};

            var chart = new google.visualization.GeoChart(document.getElementById('regions_div'));

            chart.draw(data, options);
        }
    </script>

    <![DESENHA GRAFICO TARTE ]-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load("current", {packages:["corechart"]});
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Task', 'Hours per Day'],

                <?php

                $sql="SELECT c_confirmados,c_activos,c_recuperados,Mortes FROM casos_diarios  ORDER BY id DESC LIMIT 1 ";
                $buscar = mysqli_query($conexao,$sql);


                while ($dados = mysqli_fetch_array($buscar)){

                $c_activos = $dados['c_activos'];
                $c_recuperados = $dados['c_recuperados'];
                $c_mortes = $dados['Mortes'];


                ?>
                ['Activos',<?php echo $c_activos?>],
                ['Recuperados',<?php echo $c_recuperados?>],
                ['Mortes',<?php echo $c_mortes?>]
                <?php }
                ?>

            ]);

            var options = {
                title: 'COVID-19 PROGREÇÂO AO',
                is3D: true,
            };

            var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
            chart.draw(data, options);
        }
    </script>

    <![FIM DESENHA GRAFICO TARTE ]-->
    <![DESENHA GRAFICO DE LINHAS ]-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Dias', 'Casos Activos', 'Casos Recuperados'],



                <?php

                $sql="SELECT data_d,c_activos,c_recuperados FROM casos_diarios";
                $buscar = mysqli_query($conexao,$sql);


                while ($dados = mysqli_fetch_array($buscar)){

                $c_data = $dados['data_d'];
                $c_activos = $dados['c_activos'];
                $c_recuperados = $dados['c_recuperados'];

                ?>
                ['<?php echo $c_data?>',<?php echo $c_activos?>,<?php echo $c_recuperados?>],
                <?php }
                ?>


            ]);

            var options = {
                title: 'Casos/Dias',
                hAxis: {title: 'Dias',  titleTextStyle: {color: '#333'}},
                vAxis: {minValue: 0}
            };

            var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
            chart.draw(data, options);
        }
    </script>

    <![ FIM DESENHA GRAFICO DE LINHAS ]-->


</head>

<body>
<div class="wrapper" style="background-color: black">
    <div class="sidebar" data-image="../assets/img/sidebar-5.jpg" data-color="red">
        <!--
    Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

    Tip 2: you can also add an image using data-image tag
-->
        <div class="sidebar-wrapper" >
            <div class="logo">
                <a class="simple-text">
                    BLURTEC
                </a>
            </div>
            <ul class="nav">
                <li class="nav-item active">
                    <a class="nav-link" href="dashboard.html" style="background-color: black">
                        <i class="nc-icon nc-alien-33"></i>
                        <p>BLURTEC</p>
                    </a>
                </li>

            </ul>
        </div>
    </div>
    <div class="main-panel">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg " color-on-scroll="500">
            <!--   -->   <div class="container-fluid">
                <a class="navbar-brand" href="#pablo">  BLURTEC </a>

                <div class="collapse navbar-collapse justify-content-end" id="navigation">
                    <ul class="nav navbar-nav mr-auto">
                        <li class="nav-item">
                            <a href="#" class="nav-link" data-toggle="dropdown">

                                <span class="d-lg-none">Dashboard</span>
                            </a>
                        </li>


                    </ul>
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="#pablo">
                                <span class="no-icon">Admin</span>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="#pablo">
                                <span class="no-icon">Log out</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="card strpied-tabled-with-hover">
                                <div class="card-header ">
                                    <h4 class="card-title">ANGOLA</h4>
                                    <p class="card-category">Fique em Casa</p>
                                </div>
                                <!-- iNICIO DA TABELA -->
                                <div class="card-body table-full-width table-responsive">
                                    <table class="table table-hover table-striped">
                                        <thead>
                                        <th>Provincia</th>
                                        <th>Casos Activos</th>
                                        </thead>
                                        <tbody>



                                        <?php
                                        $sql="SELECT Nome,C_activos FROM provincia";
                                        $buscar = mysqli_query($conexao,$sql);


                                        while ($dados = mysqli_fetch_array($buscar)){

                                        $Nome = $dados['Nome'];
                                        $C_activos =$dados['C_activos'];

                                        ?>
                                        <tr>
                                            <td><?php echo $Nome?></td>
                                            <td><?php echo $C_activos?></td>
                                        </tr> <?php }
                                        ?>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- FIM DA TABELA -->
                        </div>

                        <div class="col-md-8">
                            <div class="card " style="height: auto">
                                <div class="card-header ">
                                    <h4 class="card-title">Provincias e seus casos registados</h4>
                                </div>
                                <div class="card-body ">
                                    <div id="regions_div" style="width:max-content; height:max-content;"></div> <!-- DEFINICAO DO MAPA -->
                                </div>
                                <div class="card-footer ">

                                    <hr>
                                    <div class="stats">
                                        <i class="fa fa-history"></i>Last Updated Time
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4" style="grid-area: 4 / 4 / 5 / 6;">
                            <div class="card ">
                                <div class="card-header ">
                                    <h4 class="card-title">Progreção Covid_19 Angola</h4>

                                </div>
                                <div class="card-body ">
                                    <div id="piechart_3d" class="ct-chart"></div><!-- DEFINICAO DO GRAFICO 3D -->
                                </div>
                                <div class="card-footer ">

                                    <hr>
                                    <div class="stats">

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="card  card-tasks">
                                <div class="card-header ">
                                    <h4 class="card-title">Casos Activos/Recuperados</h4>

                                </div>
                                <div class="card-body ">
                                    <div class="card-body ">
                                        <div id="chart_div" class="ct-chart"></div><!-- DEFINICAO DO GRAFICO DE LINHAS -->
                                    </div>
                                </div>
                                <div class="card-footer ">
                                    <hr>
                                    <div class="stats">
                                        <i class="now-ui-icons loader_refresh spin"></i> Updated 3 minutes ago
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="footer">
                <div class="container-fluid" style="position: center">
                    <nav style="position: center">

                        <p class="copyright text-center"  style="position: center">
                            ©
                            <script>
                                document.write(new Date().getFullYear())
                            </script>
                            <a href="#">BlurTec</a>, informando Angola, Fica em Casa
                        </p>
                    </nav>
                </div>
            </footer>
        </div>
    </div>
    <!--   -->
    <!-- <div class="fixed-plugin">
    <div class="dropdown show-dropdown">
        <a href="#" data-toggle="dropdown">
            <i class="fa fa-cog fa-2x"> </i>
        </a>

        <ul class="dropdown-menu">
			<li class="header-title"> Sidebar Style</li>
            <li class="adjustments-line">
                <a href="javascript:void(0)" class="switch-trigger">
                    <p>Background Image</p>
                    <label class="switch">
                        <input type="checkbox" data-toggle="switch" checked="" data-on-color="primary" data-off-color="primary"><span class="toggle"></span>
                    </label>
                    <div class="clearfix"></div>
                </a>
            </li>
            <li class="adjustments-line">
                <a href="javascript:void(0)" class="switch-trigger background-color">
                    <p>Filters</p>
                    <div class="pull-right">
                        <span class="badge filter badge-black" data-color="black"></span>
                        <span class="badge filter badge-azure" data-color="azure"></span>
                        <span class="badge filter badge-green" data-color="green"></span>
                        <span class="badge filter badge-orange" data-color="orange"></span>
                        <span class="badge filter badge-red" data-color="red"></span>
                        <span class="badge filter badge-purple active" data-color="purple"></span>
                    </div>
                    <div class="clearfix"></div>
                </a>
            </li>
            <li class="header-title">Sidebar Images</li>

            <li class="active">
                <a class="img-holder switch-trigger" href="javascript:void(0)">
                    <img src="../assets/img/sidebar-1.jpg" alt="" />
                </a>
            </li>
            <li>
                <a class="img-holder switch-trigger" href="javascript:void(0)">
                    <img src="../assets/img/sidebar-3.jpg" alt="" />
                </a>
            </li>
            <li>
                <a class="img-holder switch-trigger" href="javascript:void(0)">
                    <img src="..//assets/img/sidebar-4.jpg" alt="" />
                </a>
            </li>
            <li>
                <a class="img-holder switch-trigger" href="javascript:void(0)">
                    <img src="../assets/img/sidebar-5.jpg" alt="" />
                </a>
            </li>

            <li class="button-container">
                <div class="">
                    <a href="http://www.creative-tim.com/product/light-bootstrap-dashboard" target="_blank" class="btn btn-info btn-block btn-fill">Download, it's free!</a>
                </div>
            </li>

            <li class="header-title pro-title text-center">Want more components?</li>

            <li class="button-container">
                <div class="">
                    <a href="http://www.creative-tim.com/product/light-bootstrap-dashboard-pro" target="_blank" class="btn btn-warning btn-block btn-fill">Get The PRO Version!</a>
                </div>
            </li>

            <li class="header-title" id="sharrreTitle">Thank you for sharing!</li>

            <li class="button-container">
				<button id="twitter" class="btn btn-social btn-outline btn-twitter btn-round sharrre"><i class="fa fa-twitter"></i> · 256</button>
                <button id="facebook" class="btn btn-social btn-outline btn-facebook btn-round sharrre"><i class="fa fa-facebook-square"></i> · 426</button>
            </li>
        </ul>
    </div>
</div>
 -->
</body>
<!--   Core JS Files   -->
<script src="../assets/js/core/jquery.3.2.1.min.js" type="text/javascript"></script>
<script src="../assets/js/core/popper.min.js" type="text/javascript"></script>
<script src="../assets/js/core/bootstrap.min.js" type="text/javascript"></script>
<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script src="../assets/js/plugins/bootstrap-switch.js"></script>
<!--  Google Maps Plugin    -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!--  Chartist Plugin  -->
<script src="../assets/js/plugins/chartist.min.js"></script>
<!--  Notifications Plugin    -->
<script src="../assets/js/plugins/bootstrap-notify.js"></script>
<!-- Control Center for Light Bootstrap Dashboard: scripts for the example pages etc -->
<script src="../assets/js/light-bootstrap-dashboard.js?v=2.0.0 " type="text/javascript"></script>
<!-- Light Bootstrap Dashboard DEMO methods, don't include it in your project! -->
<script src="../assets/js/demo.js"></script>
<script type="text/javascript">

</script>


</html>
