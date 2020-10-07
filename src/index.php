
<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8">
    <meta name="author" content="JSKT">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="shortcut icon" href="styles/assets_news/images/favi.png" type="image/x-icon">
    <title>COVID.AO</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Tempusdominus Bbootstrap 4 -->
    <link rel="stylesheet" href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- JQVMap -->
    <link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="plugins/dist/css/adminlte.min.css">
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
    <!-- summernote -->
    <link rel="stylesheet" href="plugins/summernote/summernote-bs4.css">
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">


    <!-- Font Awesome -->
    <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="plugins/dist/css/adminlte.min.css">
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">




    <link rel="stylesheet" href="styles/assets_main/bootstrap/css/bootstrap.min.css?h=379d66fff8f73d6f7616d69ebc482957">
    <link rel="stylesheet" href="styles/assets_main/fonts/font-awesome.min.css?h=03ab36d1dde930b7d44a712f19075641">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Bitter:400,700">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <link rel="stylesheet" href="styles/assets_main/css/styles.min.css?h=ed56d02c6fccdbb67add3b474feb6354">
    <!--Estilo manual-->
    <link href="styles/assets_main/css/vs-styles.css" rel="stylesheet">
    <!--Estilo do bootstrap4-->
    <link href="styles/assets_main/css/bootstrap.min.css" rel="stylesheet">
    <!--Outros estilos-->
    <link href="styles/assets_main/css/all.min.css"> <!--Estilo dos icones FontAwesome5-->
    <link href="styles/assets_main/css/sweetalert2.min.css" rel="stylesheet"> <!--Estilo de alertas e fades com Sweetalert2-->
    <link href="styles/assets_main/css/jquery.dataTables.min.css" rel="stylesheet"> <!--Estilo de tabelas-->

</head>
<body style="background-image: url(&quot;styles/assets_main/img/7ccb010d8fddc4bcd84587ef3c34d100.jpg?h=c3d0f8c013a249f0ca03f1b6ed591c4f&quot;);padding: 3px;color: rgb(255,255,255);">
<div class="wrapper">
    <div class="header-dark" style="background-image: url(&quot;styles/assets_main/img/download.png?h=c3d0f8c013a249f0ca03f1b6ed591c4f&quot;);padding: 3px;color: rgb(255,255,255);">
        <hr style="background-color: #ffffff;">
        <nav class="navbar navbar-light navbar-expand-md fixed-top" style="background-color: rgb(0,0,0);">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">
                    <img src="styles/assets_main/images/logo_p.png" alt="COVID.AO" onmouseover="this.style.backgroundColor = 'rgb(255,214,0)'"; onmouseout="this.style.backgroundColor = ''";>
                </a><button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1" style="background-color: rgba(255,214,0,0);"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon" style="background-color: #ffffff;"></span></button>
                <div
                        class="collapse navbar-collapse" id="navcol-1">
                    <ul class="nav navbar-nav ml-auto">
                        <li class="nav-item" role="presentation"><a class="nav-link" href="#casos-totais" style="color: #ffffff;" onmouseover="this.style.backgroundColor = 'rgb(255,214,0)'"; onmouseout="this.style.backgroundColor = ''";>Total de Casos</a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link active" href="#provincias" style="color: #ffffff;" onmouseover="this.style.backgroundColor = 'rgb(255,214,0)'"; onmouseout="this.style.backgroundColor = ''";>Casos por Províncias</a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="layouts/Map" style="color: #ffffff;" onmouseover="this.style.backgroundColor = 'rgb(255,214,0)'" ; onmouseout="this.style.backgroundColor = ''" ;>Mapa</a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="#percentagens" style="color: #ffffff;" onmouseover="this.style.backgroundColor = 'rgb(255,214,0)'"; onmouseout="this.style.backgroundColor = ''";>Progressão</a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="layouts/news" style="color: #ffffff;" onmouseover="this.style.backgroundColor = 'rgb(255,214,0)'" ; onmouseout="this.style.backgroundColor = ''" ;>Notícias</a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="layouts/sobre" style="color: #ffffff;" onmouseover="this.style.backgroundColor = 'rgb(255,214,0)'" ; onmouseout="this.style.backgroundColor = ''" ;>Sobre</a></li>
                        <li class="nav-item" role="presentation"></li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
    <div></div>
    <div class="features-clean">
        <div class="container" style="background-color: #ffffff;background-image: url("styles/assets_main/img/7ccb010d8fddc4bcd84587ef3c34d100.jpg")">

            <!-- Content Wrapper. Contains page content -->
            <div class="wrapper">
                <section class="content">


                    <div class="row" id="casos-totais">
                        <?php
                        include 'api/conexao.php';

                        $sql="SELECT DISTINCT confirmados,activos,recuperados,obitos,data,novos FROM casos ORDER BY id DESC LIMIT 1 ";
                        $buscar = mysqli_query($conexao,$sql);


                        while ($dados = mysqli_fetch_array($buscar)){

                        $c_activos = $dados['activos'];
                        $c_recuperados = $dados['recuperados'];
                        $c_mortes = $dados['obitos'];
                        $c_confirm = $dados['confirmados'];
                        $c_data = $dados['data'];
                        $c_novos = $dados['novos'];
                        ?>
                        <?php }
                        ?>



                        <?php
                        include 'api/conexao.php';

                        $sql1="SELECT  activos,recuperados,obitos FROM casos ORDER BY id DESC LIMIT 1";
                        $buscar = mysqli_query($conexao,$sql1);


                        while ($dados = mysqli_fetch_array($buscar)){

                            $c1_activos = $dados['activos'];
                            $c1_recuperados = $dados['recuperados'];
                            $c1_mortes = $dados['obitos'];



                            ?>
                        <?php }
                        ?>


                        <?php
                        include 'api/conexao.php';

                        $sql1="SELECT  activos,recuperados,obitos FROM casos  where id=(select max(id-1) from casos) ";
                        $buscar = mysqli_query($conexao,$sql1);


                        while ($dados = mysqli_fetch_array($buscar)){

                            $c2_activos = $dados['activos'];
                            $c2_recuperados = $dados['recuperados'];
                            $c2_mortes = $dados['obitos'];



                            ?>
                        <?php }
                        ?>

                        <?php
                        $Activos=$c1_activos-$c2_activos;
                        $Recuperados=$c1_recuperados-$c2_recuperados;
                        $Obitos=$c1_mortes-$c2_mortes;
                        $dataf = $c_data;

                        ?>


                        <div class="col">

                            <section class="py-5 bg-info text-white" style="background-color: #626a6c;color: rgba(255,255,255,0.2);background-image: url(&quot;styles/assets_main/img/7ccb010d8fddc4bcd84587ef3c34d100.jpg?h=bf48bdc5edd7f51c23b94bc585baa661&quot;);">

                                <div class="container text-center boxed-countdown">
                                    <div class="row">
                                        <div class="col-12 mb-3">
                                            <!--  <h1 class="border rounded" style="background-color: #000000;color: #ffa900;">COVID-19.AO</h1>-->
                                            <h1 class="border rounded" style="font-size: 27px;background-color: #000000;color: #ffa900;">Total de Casos Acumulados</h1>
                                        </div>
                                        <div class="col-lg-3 col-6" >
                                            <!-- small box -->
                                            <div class="small-box " style="background-color: rgba(139,139,139,0.18);"  >
                                                <div class="inner"data-bs-hover-animate="bounce">
                                                    <h3 class="number-days m-0 rounded-top" style="text-align: center;color: black"data-bs-hover-animate="bounce"><?php echo $c_confirm?></h3>

                                                    <a data-toggle="modal" data-target="#exampleModalCenter1"> <h5 style="text-align: center;color: black"><i class="fas fa-edit"></i> </h5></a>
                                                </div>

                                                <h5 href="#" class="small-box-footer" style="background-color: red;color: black">Confirmados<br> <?php if($c_novos > 0){ echo '+'.$c_novos;}else{ echo 'Nenhum registado';}?></h5>
                                                <a data-toggle="modal" data-target="#exampleModalCenter1" class="small-box-footer"style="background-color: red;color: black"><i class="fas fa-arrow-circle-right"></i></a>
                                            </div>
                                        </div>
                                        <!-- ./col -->
                                        <div class="col-lg-3 col-6" >
                                            <!-- small box -->
                                            <div class="small-box " style="background-color: rgba(139,139,139,0.18);">

                                                <div class="inner"data-bs-hover-animate="bounce">
                                                    <h3 class="number-days m-0 rounded-top" style="text-align: center;color: black"data-bs-hover-animate="bounce"><?php echo $c_activos?></h3>

                                                    <a data-toggle="modal" data-target="#exampleModalCenter2"><h5 style="text-align: center;color: black"><i class="fas fa-procedures"></i> </h5></a>
                                                </div>

                                                <h5 href="#" class="small-box-footer" style="background-color: darkorange;color: black">Activos<br> <?php if($Activos > 0){ echo '+'.$Activos;} else if($Activos == 0){ echo '0';}else{  echo ''.$Activos;}?></h5>
                                                <a  data-toggle="modal" data-target="#exampleModalCenter2" class="small-box-footer" style="background-color: darkorange;color: black"><i class="fas fa-arrow-circle-right"></i></a>
                                            </div>
                                        </div>
                                        <!-- ./col -->
                                        <div class="col-lg-3 col-6">
                                            <!-- small box -->
                                            <div class="small-box " style="background-color: rgba(139,139,139,0.18);">
                                                <div class="inner"data-bs-hover-animate="bounce">
                                                    <h3 class="number-days m-0 rounded-top" style="text-align: center;color: black"data-bs-hover-animate="bounce"><?php echo $c_recuperados?></h3>

                                                    <a data-toggle="modal" data-target="#exampleModalCenter3"><h5 style="text-align: center;color: black"><i class="fas fa-check-circle"></i></h5></a>
                                                </div>

                                                <h5 href="#" class="small-box-footer" style="background-color: #33ff00;color: black">Recuperados<br> <?php if($Recuperados > 0){ echo '+'.$Recuperados;} else if($Recuperados == 0){ echo '0';}else{  echo ''.$Recuperados;}?></h5>
                                                <a data-toggle="modal" data-target="#exampleModalCenter3" class="small-box-footer" style="background-color: #33ff00;color: black"><i class="fas fa-arrow-circle-right"></i></a>
                                            </div>
                                        </div>
                                        <!-- ./col -->
                                        <div class="col-lg-3 col-6">
                                            <!-- small box -->
                                            <div class="small-box" style="background-color: rgba(139,139,139,0.18);">
                                                <div class="inner"data-bs-hover-animate="bounce">
                                                    <h3 class="number-days m-0 rounded-top" style="text-align: center;color: black"data-bs-hover-animate="bounce"><?php echo $c_mortes?></h3>

                                                    <a data-toggle="modal" data-target="#exampleModalCenter4"><h5 style="text-align: center;color: black"><i class="fas fa-cross"></i></h5></a>
                                                </div>

                                                <h5 href="#" class="small-box-footer" style="color: black">Óbitos<br> <?php if($Obitos > 0){ echo '+'.$Obitos;} else if($Obitos == 0){ echo '0';}else{  echo ''.$Obitos;}?></h5>
                                                <a data-toggle="modal" data-target="#exampleModalCenter4" class="small-box-footer" style="color: black"><i class="fas fa-arrow-circle-right"></i></a>
                                            </div>
                                        </div>
                                        <!-- ./col -->
                                    </div>
                                    <div class="container">
                                        <p class="text-center mt-5"  style="color: rgb(0,0,0);">Última Actualização:&nbsp;<?php echo $c_data?></p>

                                        <!--  <p class="text-center mt-5"  style="color: rgb(0,0,0);">Novos Casos:&nbsp;</p>
                                          <p class="text-center mt-5"  style="color: rgb(0,0,0);"> Óbitos: +1</p> <!--Retro changed Óbitos: +1 Casos Recuperados: +6
                                          <p class="text-center mt-5"  style="color: rgb(0,0,0);">Casos Recuperados: </p>-->
                                    </div>

                            </section>
                        </div>
                    </div>


                    <div><hr></div>

                    <!-- /.row -->
                    <!-- Main row -->
                    <div class="row" id="provincias">
                        <section class="col-lg-12 connectedSortable">
                            <!-- Custom tabs (Charts with tabs)-->
                            <div class="row" >
                                <div class="col-12">
                                    <div class="card "  >
                                        <div class="card-header" style="background-color:#1b1e21 ;color:  #eead2d;">
                                            <h3 class="card-title">Tabela</h3>

                                            <!-- card tools -->
                                            <div class="card-tools">
                                                <button type="button" style="background-color:#000001 ;color:  #eead2d;" class="btn btn-tool" data-card-widget="maximize"><i class="fas fa-expand"></i></button>
                                                <button type="button" style="background-color:#000001 ;color:  #eead2d;" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i></button>
                                            </div>
                                            <!-- /.card-tools -->
                                        </div>
                                        <!-- /.card-header -->
                                        <div class="card-body table-responsive p-0" style="height: 500px;">
                                            <table class="table table-head-fixed text-nowrap">
                                                <thead>
                                                <tr>
                                                    <th style="width: 150px ;background-color:#1b1e21 ;color:  #eead2d;text-align: center;">Províncias</th>
                                                    <th style="width: 150px ;background-color:red ;color:  #000001;text-align: center;">Confirmados</th>
                                                    <th style="width: 150px ;background-color:darkorange ;color:  #000001;text-align: center;">Activos</th>
                                                    <th style="width: 150px ;background-color:#1b1e ;color:  #000001;text-align: center;">Recuperados</th>
                                                    <th style="width: 150px ;background-color:grey ;color:  #000001;text-align: center;">Óbitos</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <?php
                                                include 'api/conexao.php';
                                                $sql="SELECT confirmados,activos,recuperados,obitos,nome FROM provincias ORDER BY confirmados DESC";
                                                $buscar = mysqli_query($conexao,$sql);


                                                while ($dados = mysqli_fetch_array($buscar)){

                                                $c_activos = $dados['activos'];
                                                $c_recuperados = $dados['recuperados'];
                                                $c_mortes = $dados['obitos'];
                                                $c_confirm = $dados['confirmados'];
                                                $c_nome = $dados['nome'];


                                                ?>
                                                <tr>
                                                    <td style="background-color: whitesmoke;color: black;text-align: center;"><?php echo $c_nome?></td>
                                                    <td style="background-color: whitesmoke;color: black;text-align: center;"><?php echo $c_confirm?></td>
                                                    <td style="background-color: whitesmoke;color: black;text-align: center;"><?php echo $c_activos?></td>
                                                    <td style="background-color: whitesmoke;color: black;text-align: center;"><?php echo $c_recuperados?></td>
                                                    <td style="background-color: whitesmoke;color: black;text-align: center;"><?php echo $c_mortes?></td>
                                                </tr>

                                                </tbody>
                                                <?php }
                                                ?>
                                            </table>
                                        </div>
                                        <div class="card-footer" style="background-color:#1b1e21 ;color:  #eead2d;">
                                            <p class="card-footer"></p>
                                            <!-- /.row -->
                                        </div>
                                        <!-- /.card-body -->
                                    </div>
                                    <!-- /.card -->
                                </div>

                            </div>
                            <!-- /.row -->

                            <!-- Map card
                            <div class="card " id="Mapa" style="background-color:whitesmoke ;color:  #eead2d;">
                                <div class="card-header border-0" style="background-color:#1b1e21 ;color:  #eead2d;">
                                    <h3 class="card-title">
                                        <i class="fas fa-map-marker-alt mr-1"></i>
                                        Mapa
                                    </h3>

                                    <div class="card-tools">
                                        <button type="button" style="background-color:#000001 ;color:  #eead2d;" class="btn btn-tool" data-card-widget="maximize"><i class="fas fa-expand"></i></button>
                                        <button type="button" style="background-color:#000001 ;color:  #eead2d;" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i></button>
                                    </div>

                                </div>
                                <div class="card-body">
                                    <div id="regions_div"></div>
                                </div>
                                <div class="card-footer" style="background-color:#1b1e21 ;color:  #eead2d;">


                                </div>
                            </div> -->
                            <!-- /.card -->

                            <div class="card">
                                <div class="card-header"  style="background-color:#1b1e21 ;color:  #eead2d;" id="percentagens">
                                    <h3 class="card-title">
                                        Casos Recuperados-Activos por Dia
                                    </h3>
                                    <div class="card-tools">
                                        <ul class="nav nav-pills ml-auto">
                                            <li class="nav-item">
                                                <a class="nav-link active" href="#revenue-chart" data-toggle="tab">Ultimos 7 dias</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#sales-chart" data-toggle="tab">Total</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div><!-- /.card-header -->
                                <div class="card-body">
                                    <div class="tab-content p-0">
                                        <!-- Morris chart - Sales -->
                                        <div class="chart tab-pane active" id="revenue-chart"
                                             style="position: relative; height: 300px;">
                                            <canvas id="barChart1" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
                                        </div>
                                        <div class="chart tab-pane" id="sales-chart" style="position: relative; height: 300px;">
                                            <canvas id="barChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
                                        </div>
                                    </div>
                                </div><!-- /.card-body -->
                                <div class="card-footer" style="background-color:#1b1e21 ;color:  #eead2d;">

                                    <!-- /.row -->
                                </div>
                            </div>


                            <div class="card">


                                <!-- PIE CHART -->
                                <div class="card ">
                                    <div class="card-header"  style="background-color:#1b1e21 ;color:  #eead2d;">
                                        <h3 class="card-title">Progressão</h3>

                                        <!-- card tools -->
                                        <div class="card-tools">
                                            <button type="button" style="background-color:#000001 ;color:  #eead2d;" class="btn btn-tool" data-card-widget="maximize"><i class="fas fa-expand"></i></button>
                                            <button type="button" style="background-color:#000001 ;color:  #eead2d;" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i></button>
                                        </div>
                                        <!-- /.card-tools -->
                                    </div>
                                    <div class="card-body">
                                        <div id="piechart_3d" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></div>
                                    </div>
                                    <div class="card-footer" style="background-color:#1b1e21 ;color:  #eead2d;">

                                        <!-- /.row -->
                                    </div>
                                    <!-- /.card-body -->
                                </div>
                                <!-- /.card -->

                            </div>
                        </section>
                        <!-- /.col (LEFT) -->

                        <!-- /.col (RIGHT) -->
                    </div>
                    <!-- /.row -->


                </section>
            </div>
        </div>
    </div>

    <div class="card" style="background-color: black">
        <footer id="footer">

            <div style= "background: black; text-align: center; margin: 0px; padding:10px">
                <p style= "color:grey; font-family: raleway">©
                    <script>
                        document.write(new Date().getFullYear())
                    </script>
                    <a href="http://blurtec.epizy.com/" target="_blank" >BlurTec</a>-<a href="https://www.facebook.com/JambaGraphics/" target="_blank" >
                        JambaGraphics</a>, informando Angola.
                </p>
                <P  style= "color:grey; font-family: raleway">#Fica em Casa</P>
            </div>
        </footer>
    </div>


<!-- Modal -->
<div class="modal fade" id="exampleModalCenter1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" style="color: black" id="exampleModalLongTitle"><i class="fas fa-edit"></i> Dados da actualização</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <div class="" >
                    <!-- small box -->
                    <div class="small-box " style="background-color: rgba(139,139,139,0.18);"  >
                        <div class="inner"data-bs-hover-animate="bounce">

                            <?php
                            include 'api/conexao.php';
                            $d=$c_data;

                            $sql="SELECT confirmados,nome FROM provincias_filtros where data = '$d' and confirmados > 0";
                            $buscar = mysqli_query($conexao,$sql);

                            while ($dados = mysqli_fetch_array($buscar)){
                                $cf_confirm = $dados['confirmados'];
                                $cf_nome = $dados['nome'];
                                ?>
                            <h5 style="text-align: center;color: black"> <?php echo $cf_nome ?> <i class="fas fa-arrow-right"></i> <?php echo $cf_confirm ?> <br> </h5>
                            <?php }
                            ?>
                        </div>

                        <h5 href="#" class="small-box-footer" style="background-color: red;color: black">Confirmados<br> <?php if($c_novos > 0){ echo '+'.$c_novos;}else{ echo 'Nenhum registado';}?></h5>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter2" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" style="color: black" id="exampleModalLongTitle"><i class="fas fa-procedures"></i> Dados da actualização</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="" >
                    <!-- small box -->
                    <div class="small-box " style="background-color: rgba(139,139,139,0.18);"  >
                        <div class="inner"data-bs-hover-animate="bounce">
                            <?php
                            include 'api/conexao.php';
                            $d=$c_data;

                            $sql="SELECT activos,nome FROM provincias_filtros where data = '$d' ";
                            $buscar = mysqli_query($conexao,$sql);

                            while ($dados = mysqli_fetch_array($buscar)){
                                $cf_activos = $dados['activos'];
                                $cf_nome = $dados['nome'];
                                ?>
                                <h5 style="text-align: center;color: black"> <?php echo $cf_nome ?> <i class="fas fa-arrow-right"></i> <?php echo $cf_activos ?> <br> </h5>
                            <?php }
                            ?>
                        </div>

                        <h5 href="#" class="small-box-footer" style="background-color: darkorange;color: black">Activos<br> <?php if($Activos > 0){ echo '+'.$Activos;} else if($Activos == 0){ echo '0';}else{  echo ''.$Activos;}?></h5>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter3" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" style="color: black" id="exampleModalLongTitle"><i class="fas fa-check-circle"></i> Dados da actualização</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="" >
                    <!-- small box -->
                    <div class="small-box " style="background-color: rgba(139,139,139,0.18);"  >
                        <div class="inner"data-bs-hover-animate="bounce">
                            <?php
                            include 'api/conexao.php';
                            $d=$c_data;

                            $sql="SELECT Recuperados,nome FROM provincias_filtros where data = '$d' and Recuperados > 0";
                            $buscar = mysqli_query($conexao,$sql);

                            while ($dados = mysqli_fetch_array($buscar)){
                                $cf_recuperados = $dados['Recuperados'];
                                $cf_nome = $dados['nome'];
                                ?>
                                <h5 style="text-align: center;color: black"> <?php echo $cf_nome ?> <i class="fas fa-arrow-right"></i> <?php echo $cf_recuperados ?> <br> </h5>
                            <?php }
                            ?>
                        </div>

                        <h5 href="#" class="small-box-footer" style="background-color: #33ff00;color: black">Recuperados<br> <?php if($Recuperados > 0){ echo '+'.$Recuperados;} else if($Recuperados == 0){ echo '0';}else{  echo ''.$Recuperados;}?></h5>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter4" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" style="color: black" id="exampleModalLongTitle"><i class="fas fa-cross"></i> Dados da actualização</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="" >s
                    <!-- small box -->
                    <div class="small-box " style="background-color: rgba(139,139,139,0.18);"  >
                        <div class="inner"data-bs-hover-animate="bounce">
                            <?php
                            include 'api/conexao.php';
                            $d=$c_data;

                            $sql="SELECT Obitos,nome FROM provincias_filtros where data = '$d' and Obitos > 0";
                            $buscar = mysqli_query($conexao,$sql);

                            while ($dados = mysqli_fetch_array($buscar)){
                                $cf_obitos = $dados['Obitos'];
                                $cf_nome = $dados['nome'];
                                ?>
                                <h5 style="text-align: center;color: black"> <?php echo $cf_nome ?> <i class="fas fa-arrow-right"></i> <?php echo $cf_obitos ?> <br> </h5>
                            <?php }
                            ?>
                        </div>

                        <h5 href="#" class="small-box-footer" style="color: black">Óbitos<br> <?php if($Obitos > 0){ echo '+'.$Obitos;} else if($Obitos == 0){ echo '0';}else{  echo ''.$Obitos;}?></h5>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<!-- jQuery -->
<script type="text/javascript" src="https://www.google.com/jsapi">
    <script type="text/javascript" src="assets/js/jquery.min.js"></script>
<script type="text/javascript" src="styles/assets_main/js/bootstrap.min.js"></script>
<script type="text/javascript" src="styles/assets_main/js/all.min.js"></script>
<script type="text/javascript" src="styles/assets_main/js/sweetalert2.min.js"></script>
<script src="styles/assets_main/bootstrap/js/bootstrap.min.js?h=63715b63ee49d5fe4844c2ecae071373"></script>
<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
    $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script src="plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="plugins/moment/moment.min.js"></script>
<script src="plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<script src="plugins/dist/js/adminlte.min.js"></script>
<!-- AdminLTE App -->
<script src="plugins/dist/js/adminlte.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="plugins/dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="plugins/dist/js/demo.js"></script>

<script> $(document).on('click','.navbar-collapse.show',function(e) {
        $(this).collapse('hide');
    }); </script>



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
            ['Provincia', 'Casos Confirmados','Recuperados'],

            <?php include 'api/conexao.php';
            $sql="SELECT nome,confirmados,recuperados FROM provincias";
            $buscar = mysqli_query($conexao,$sql);


            while ($dados = mysqli_fetch_array($buscar)){

            $Nome = $dados['nome'];
            $C_confirm =$dados['confirmados'];
            $C_recuperados =$dados['recuperados'];


            ?>
            ['<?php echo $Nome?>',<?php echo $C_confirm?>,<?php echo $C_recuperados?>],
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


<![DESENHA GRAFICO DE LINHAS ]-->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
        var data = google.visualization.arrayToDataTable([
            ['Dias', 'Casos Activos', 'Casos Recuperados'],



            <?php

            $sql="SELECT DISTINCT data,activos,recuperados FROM casos";
            $buscar = mysqli_query($conexao,$sql);


            while ($dados = mysqli_fetch_array($buscar)){

            $c_data = $dados['data'];
            $c_activos = $dados['activos'];
            $c_recuperados = $dados['recuperados'];

            ?>
            ['<?php echo $c_data?>',<?php echo $c_activos?>,<?php echo $c_recuperados?>],
            <?php }
            ?>


        ]);

        var options = {
            title: 'Casos/Dias',
            colors:['darkorange','#33ff00'],
            hAxis: {title: 'Dias',  titleTextStyle: {color: '#333'}},
            vAxis: {minValue: 0}
        };

        var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
        chart.draw(data, options);
    }
</script>

<![ FIM DESENHA GRAFICO DE LINHAS ]-->
<script>
    <?php
    include 'api/conexao.php';
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
    include 'api/conexao.php';
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
</body>

</html>
<?php
include("api/stats/ClassVisitas.php");
$visitas = new ClassVisitas();
$visitas->VerificaUsuario();
?>


