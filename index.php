<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="author" content="JSKT">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>COVID.AO</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css?h=2052ea9a9121a620be3348c23fc7bfdb">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css?h=03ab36d1dde930b7d44a712f19075641">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Bitter:400,700">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700">
    <link rel="stylesheet" href="assets/css/styles.min.css?h=77bdba3dbbd47f3262456160263e36fc">
    <!--Estilo manual-->
    <link href="assets/css/vs-styles.css" rel="stylesheet">
    <!--Estilo do bootstrap4-->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <!--Outros estilos-->
    <link href="assets/css/all.min.css"> <!--Estilo dos icones FontAwesome5-->
    <link href="assets/css/sweetalert2.min.css" rel="stylesheet"> <!--Estilo de alertas e fades com Sweetalert2-->
    <link href="assets/css/jquery.dataTables.min.css" rel="stylesheet"> <!--Estilo de tabelas-->
</head>

<body STYLE="color: red">
    <div>
        <div class="header-dark" style="background-image: url(&quot;assets/img/download.png?h=c3d0f8c013a249f0ca03f1b6ed591c4f&quot;);padding: 3px;">
            <nav class="navbar navbar-dark navbar-expand-md navigation-clean-search">
                <div class="container">
                    <h4 class="heading"><a title="COVID-19 TRACKER BY BLURTEC" href="#"><span class="background" style="background-color: rgb(199,12,0);">ANGOLA&nbsp;</span><span class="border" style="background-color: rgb(255,207,35);color: rgb(0,0,0);">COVID-19</span></a></h4>
                </div>
            </nav>
        </div>
        <div></div>
    </div>
    <div class="features-clean">
        <div class="container" style="background-color: #000000;">
            <div class="intro">
                <h2 class="text-center" style="background-color: rgba(0,0,0,0);color:  #eead2d;">COVID-19.AO</h2>
            </div>
            <div class="row features">
                <div class="col-sm-6 col-lg-4 item">
                    <h3 class="name" style="color:  #eead2d;">O portal para seguir o covid-19</h3>
                    <p class="description">O portal Covid-19_AO monitora Registro da Covid-19 no nosso país. Destacando 4 pontos importantes, os quais:</p>
                    <p class="description"> 1)Casos Confirmados,</p>
                    <p class="description"> 2)Activos,</p>
                    <p class="description"> 3)Recuperados,</p>
                    <p class="description"> 4)Óbitos.</p>
                    <p class="description"> Assim, levando em consideração informações da propagação e medidas de prevenção da Covi-19 no país.</p>
                </div>
                <div class="col-sm-6 col-lg-4 item">
                    <h3 class="name" style="color:  #eead2d;">Como Funciona o nosso portal</h3>
                    <p class="description">Este portal funciona de modo a manter informado a população
                        Angolana no âmbito da pandemia que propagou-se pelo mundo.
                        Levando informações em dados da Covid-19 pelas 18 Províncias, Deste Casos Confirmados, Activos, Recuperados e Óbitos.</p>
                </div>
                <div class="col-sm-6 col-lg-4 item">
                    <h3 class="name" style="color:  #eead2d;">De onde vem os nossos dados</h3>
                    <p class="description">Os Dados do Portal Covid-19_AO,
                        Proveem de Actualizaçōes Feitas Diariamente  Pelo Sector do Ministério da Saúde de Angola 🇦🇴 .
                        O portal Comporta um Banco de Dados Estruturado e Normalizado que alberga Os Registro da Pandemia nos País.</p>
                </div>
            </div>
            <div class="row">
                <div class="container">
                    <div class="row">

                    </div>
                    <div class="card-header" style="background-color:#1b1e21 ;color:  #eead2d;">

                        <?php
                        include 'conexao.php';
                        $sql="SELECT DISTINCT confirmados,activos,recuperados,obitos FROM casos_registrados  ORDER BY id DESC LIMIT 1 ";
                        $buscar = mysqli_query($conexao,$sql);


                        while ($dados = mysqli_fetch_array($buscar)){

                            $c_activos = $dados['activos'];
                            $c_recuperados = $dados['recuperados'];
                            $c_mortes = $dados['obitos'];
                            $c_confirm = $dados['confirmados'];


                            ?>
                            <h4  class="heading" style="background-color: rgba(0,0,0,0);color:  #eead2d; animation: ease-in-out" >
                                <span class="border" style="background-color:black;color:red;">CONFIRMADOS-<?php echo $c_confirm?></span> -
                                <span class="border" style="background-color:red;color: rgb(0,0,0);">ACTIVOS-<?php echo $c_activos?></span> -
                                <span class="border" style="background-color:green;color: rgb(0,0,0);">RECUPERADOS-<?php echo $c_recuperados?></span> -
                                <span class="border" style="background-color:gray;color: rgb(0,0,0);">OBITOS-<?php echo $c_mortes?></span> - TOTAL NO PAIS
                            </h4>

                        <?php }
                        ?>



                         </div>
                    <div class="card border-dark my-3">
                        <div class="card-body" style="background-color:#1b1e21 ;color:  #eead2d;">
                            <div class="table-responsive" id="registros">

                            </div>
                        </div>
                    </div>


                </div>
            </div>
            <div class="row">
                <div class="col" >
                    <div class="card-header"style="background-color:#1b1e21 ;color:  #eead2d;">
                        <h4 class="card-title" style="text-align: center" style="background-color: rgba(0,0,0,0);color:  #eead2d;">Angola</h4>

                    </div>
                    <div class="card my-4" style="background-color: #1b1e21">
                        <div class="card-body" style="background-color: #1b1e21">
                            <div  id="regions_div"  >

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div> <div class="card  card-tasks">
                            <div class="card-header  "style="background-color:#1b1e21 ;color:  #eead2d;">
                                <h4 class="card-title">Casos Activos/Recuperados</h4>

                            </div>
                            <div class="card-body ">
                                <div class="card-body ">
                                    <div id="chart_div" ></div><!-- DEFINICAO DO GRAFICO DE LINHAS -->
                                </div>
                            </div>
                        </div></div>
                </div>

            </div>

            <div class="col">
                <hr>
            </div>

            <div class="row">
                <div class="col">
                    <div><div class="card ">
                            <div class="card-header " style="background-color:#1b1e21 ;color:  #eead2d;">
                                <h4 class="card-title" style="text-decoration-color: yellow" >Progreção Covid_19 Angola</h4>

                            </div>
                            <div class="card-body ">
                                <div id="piechart_3d" ></div><!-- DEFINICAO DO GRAFICO 3D -->
                            </div>


                        </div></div>
                </div></div>
            <div class="row">
                <div class="col">
                    <hr><footer id="footer">
    
    <div style= "background: black; text-align: center; margin: 0px; padding:10px">
        <p style= "color:grey; font-family: raleway">©
            <script>
                document.write(new Date().getFullYear())
            </script>
            <a href="http://blurtec.epizy.com/" >BlurTec</a>, informando Angola, Fica em Casa
        </p>
    </div>
</footer></div>
            </div>
        </div>
    </div>
    <script src="assets/js/jquery.min.js?h=83e266cb1712b47c265f77a8f9e18451"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js?h=63715b63ee49d5fe4844c2ecae071373"></script>
    <script src="assets/js/chart.min.js?h=03ab36d1dde930b7d44a712f19075641"></script>
    <script src="assets/js/script.min.js?h=fa379663f8cd2e1f63dd10d7222a5714"></script>
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
                    url: 'assets/php/action.php',
                    method: 'post',
                    data: {action: 'apresentar'},
                    success: function (response) {
                        $("#registros").html(response);
                    }
                });
            }
        });
    </script>




    <!--MAPA-->
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

                $sql="SELECT DISTINCT confirmados,activos,recuperados,obitos FROM casos_registrados  ORDER BY id DESC LIMIT 1 ";
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

                $sql="SELECT DISTINCT data_casos,activos,recuperados FROM casos_registrados";
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