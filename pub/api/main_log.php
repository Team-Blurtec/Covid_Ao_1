<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8">
    <meta name="author" content="JSKT">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>COVID.AO</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="../styles/assets_news/images/favi.png" type="image/x-icon">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Tempusdominus Bbootstrap 4 -->
    <link rel="stylesheet" href="../plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="../plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- JQVMap -->
    <link rel="stylesheet" href="../plugins/jqvmap/jqvmap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../plugins/dist/css/adminlte.min.css">
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="../plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="../plugins/daterangepicker/daterangepicker.css">
    <!-- summernote -->
    <link rel="stylesheet" href="../plugins/summernote/summernote-bs4.css">
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">


    <!-- Font Awesome -->
    <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../plugins/dist/css/adminlte.min.css">
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">



    <link rel="stylesheet" href="../styles/assets_main/bootstrap/css/bootstrap.min.css?h=379d66fff8f73d6f7616d69ebc482957">
    <link rel="stylesheet" href="../styles/assets_main/fonts/font-awesome.min.css?h=03ab36d1dde930b7d44a712f19075641">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Bitter:400,700">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <link rel="stylesheet" href="../styles/assets_main/css/styles.min.css?h=ed56d02c6fccdbb67add3b474feb6354">
    <!--Estilo manual-->
    <link href="../styles/assets_main/css/vs-styles.css" rel="stylesheet">
    <!--Estilo do bootstrap4-->
    <link href="../styles/assets_main/css/bootstrap.min.css" rel="stylesheet">
    <!--Outros estilos-->
    <link href="../styles/assets_main/css/all.min.css"> <!--Estilo dos icones FontAwesome5-->
    <link href="../styles/assets_main/css/sweetalert2.min.css" rel="stylesheet"> <!--Estilo de alertas e fades com Sweetalert2-->
    <link href="../styles/assets_main/css/jquery.dataTables.min.css" rel="stylesheet"> <!--Estilo de tabelas-->

</head>


    <!-- Content Wrapper. Contains page content -->







<!--MAPA-->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="../map.js"></script>
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
            ['Provincia','Casos Confirmados','Recuperados'],

            <?php include 'conexao.php';
            $sqlw="SELECT provincias.nome as 'n',provincias.confirmados as 'confir',provincias.recuperados as 'rec'
,casos.confirmados as 'total' FROM provincias,casos where casos.id=(select max(id) from casos)";
            $buscarw= mysqli_query($conexao,$sqlw);


            while ($dadosw = mysqli_fetch_array($buscarw)){

            $Nomew = $dadosw['n'];
            $C_confirmw =$dadosw['confir'];
            $C_recuperadosw =$dadosw['rec'];
            $C_totalw =$dadosw['total'];


            ?>
            ['<?php echo $Nomew?>',<?php echo $C_confirmw?>,<?php echo $C_recuperadosw?>],
            ['',<?php echo $C_totalw?>,0],
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

<script type="text/javascript">
    google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
        var data = google.visualization.arrayToDataTable([
            ['Task', 'Hours per Day'],

            <?php

            $sql="SELECT DISTINCT confirmados,activos,recuperados,obitos FROM casos ORDER BY id DESC LIMIT 1 ";
            $buscar = mysqli_query($conexao,$sql);


            while ($dados = mysqli_fetch_array($buscar)){

            $c_activos = $dados['activos'];
            $c_recuperados = $dados['recuperados'];
            $c_mortes = $dados['obitos'];


            ?>
            ['Activos',<?php echo $c_activos?>],
            ['Recuperados',<?php echo $c_recuperados?>],
            ['Óbitos',<?php echo $c_mortes?>]
            <?php }
            ?>

        ]);

        var options = {
            title: 'COVID-19.AO Progressão',
            is3D: true,
            colors:['darkorange','#33ff00','#9f9f9f'],


        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
    }
</script>

<![FIM DESENHA GRAFICO TARTE ]-->


<![ FIM DESENHA GRAFICO DE LINHAS ]-->
<script>
    <?php
    include 'conexao.php';
    $dias='';
    $c_activos='';
    $c_recuperados='';
    $data='';
    $sql = mysqli_query($conexao,"SELECT data,activos,recuperados FROM casos");

    while($row = mysqli_fetch_array($sql)){

        $dias = $dias . '"'. $row['data'].'",';
        $c_activos = $c_activos . '"'. $row['activos'] .'",';
        $c_recuperados = $c_recuperados . '"'. $row['recuperados'] .'",';
    }

    $dias = trim($dias,",");
    $c_activos = trim($c_activos,",");
    $c_recuperados = trim($c_recuperados,",");
    ?>
    $(function () {
        /* ChartJS
         * -------
         * Here we will create a few charts using ChartJS
         */

        //-------------
        //- BAR CHART -
        //-------------
        var barChartCanvas = $('#barChart').get(0).getContext('2d')
        var barChartData ={
            labels  : [<?php echo $dias; ?>],
            datasets: [
                {
                    label               : 'Activos',
                    backgroundColor     : 'darkorange',
                    borderColor         : 'rgba(60,141,188,0.8)',
                    pointRadius          : false,
                    pointColor          : '#3b8bba',
                    pointStrokeColor    : 'rgba(60,141,188,1)',
                    pointHighlightFill  : '#fff',
                    pointHighlightStroke: 'rgba(60,141,188,1)',
                    data                : [<?php echo $c_activos; ?>]
                },
                {
                    label               : 'Recuperados',
                    backgroundColor     : '#33ff00',
                    borderColor         : 'rgba(210, 214, 222, 1)',
                    pointRadius         : false,
                    pointColor          : 'rgba(210, 214, 222, 1)',
                    pointStrokeColor    : '#c1c7d1',
                    pointHighlightFill  : '#fff',
                    pointHighlightStroke: 'rgba(220,220,220,1)',
                    data                : [<?php echo $c_recuperados; ?>]
                },
            ]
        }
        var barChartOptions = {
            responsive              : true,
            maintainAspectRatio     : false,
            datasetFill             : false
        }

        var barChart = new Chart(barChartCanvas, {
            type: 'bar',
            data: barChartData,
            options: barChartOptions
        })


    })
</script>








<![ FIM DESENHA GRAFICO DE LINHAS ]-->
<script>
    <?php
    include 'conexao.php';
    $dias='';
    $c_activos='';
    $c_recuperados='';
    $data='';
    $sql = mysqli_query($conexao,"Select distinct data,activos,recuperados from casos where id>=(select count(id)+7 from casos)");

    while($row = mysqli_fetch_array($sql)){

        $dias = $dias . '"'. $row['data'].'",';
        $c_activos = $c_activos . '"'. $row['activos'] .'",';
        $c_recuperados = $c_recuperados . '"'. $row['recuperados'] .'",';
    }

    $dias = trim($dias,",");
    $c_activos = trim($c_activos,",");
    $c_recuperados = trim($c_recuperados,",");
    ?>
    $(function () {
        /* ChartJS
         * -------
         * Here we will create a few charts using ChartJS
         */

        //-------------
        //- BAR CHART -
        //-------------
        var barChartCanvas = $('#barChart1').get(0).getContext('2d')
        var barChartData ={
            labels  : [<?php echo $dias; ?>],
            datasets: [
                {
                    label               : 'Activos',
                    backgroundColor     : 'darkorange',
                    borderColor         : 'rgba(60,141,188,0.8)',
                    pointRadius          : false,
                    pointColor          : '#3b8bba',
                    pointStrokeColor    : 'rgba(60,141,188,1)',
                    pointHighlightFill  : '#fff',
                    pointHighlightStroke: 'rgba(60,141,188,1)',
                    data                : [<?php echo $c_activos; ?>]
                },
                {
                    label               : 'Recuperados',
                    backgroundColor     : '#33ff00',
                    borderColor         : 'rgba(210, 214, 222, 1)',
                    pointRadius         : false,
                    pointColor          : 'rgba(210, 214, 222, 1)',
                    pointStrokeColor    : '#c1c7d1',
                    pointHighlightFill  : '#fff',
                    pointHighlightStroke: 'rgba(220,220,220,1)',
                    data                : [<?php echo $c_recuperados; ?>]
                },
            ]
        }
        var barChartOptions = {
            responsive              : true,
            maintainAspectRatio     : false,
            datasetFill             : false
        }

        var barChart = new Chart(barChartCanvas, {
            type: 'bar',
            data: barChartData,
            options: barChartOptions
        })


    })
</script>





<!-- Go to www.addthis.com/dashboard to customize your tools -->
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5f6a53157b45af71"></script>
</html>
</body>