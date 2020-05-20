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
<div class="main-panel">

<div class="container-fluid">
    <div class="row">

        <div class="cols-1">
            <div class="card my-4" style="background-color: #1b1e21">
                <div class="card-body" style="background-color: #1b1e21">
                    <div class="table-responsive" id="registros">

                    </div>
                </div>
            </div>
        </div>
        <div class="cols-2">
            <div class="card my-4" style="background-color: #1b1e21">
                <div class="card-body" style="background-color: #1b1e21">
                    <div class="table-responsive" id="regions_div">

                    </div>
                </div>
            </div>
        </div>
        <div class="cols-2">
            <div class="card my-4" style="background-color: #1b1e21">
                <div class="card-body" style="background-color: #1b1e21">
                    <div   id="piechart_3d" style="max-height: max-content">

                    </div>
                </div>
            </div>
            <div class="cols-1">
                <div class="card my-4" style="background-color: #1b1e21">
                    <div class="card-body" style="background-color: #1b1e21">
                        <div  id="chart_div" style="width: 100%;height: 100%">

                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
    <footer class="footer" style="height: 100%;width: 100%">
        <div class="container-fluid" style="position: center;background-color: red;text-decoration-color: yellow;padding-top: 15px;padding-bottom: 10px">
            <nav style="position: center">

                <p class="copyright text-center"  style="position: center;text-underline-color: yellow">
                    ©
                    <script>
                        document.write(new Date().getFullYear())
                    </script>
                    <a href="http://blurtec.epizy.com/" >BlurTec</a>, informando Angola, Fica em Casa
                </p>
            </nav>
        </div>
    </footer>
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
<![DESENHA GRAFICO TARTE ]-->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
    google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
        var data = google.visualization.arrayToDataTable([
            ['Task', 'Hours per Day'],

            <?php

            $sql="SELECT confirmados,activos,recuperados,obitos FROM casos_registrados  ORDER BY id DESC LIMIT 1 ";
            $buscar = mysqli_query($conexao,$sql);


            while ($dados = mysqli_fetch_array($buscar)){

            $c_activos = $dados['activos'];
            $c_recuperados = $dados['recuperados'];
            $c_mortes = $dados['obitos'];


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

            $sql="SELECT data_casos,activos,recuperados FROM casos_registrados";
            $buscar = mysqli_query($conexao,$sql);


            while ($dados = mysqli_fetch_array($buscar)){

            $c_data = $dados['data_casos'];
            $c_activos = $dados['activos'];
            $c_recuperados = $dados['recuperados'];

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
</body>
</html>