<!DOCTYPE html>

<html lang="pt">
<head>
    <meta charset="utf-8">
    <meta name="author" content="JSKT">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="shortcut icon" href="../../styles/assets_news/images/favi.png" type="image/x-icon">
    <title>COVID.AO</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Tempusdominus Bbootstrap 4 -->
    <link rel="stylesheet" href="../../plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="../../plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- JQVMap -->
    <link rel="stylesheet" href="../../plugins/jqvmap/jqvmap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../../plugins/dist/css/adminlte.min.css">
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="../../plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="../../plugins/daterangepicker/daterangepicker.css">
    <!-- summernote -->
    <link rel="stylesheet" href="../../plugins/summernote/summernote-bs4.css">
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">


    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../../plugins/dist/css/adminlte.min.css">
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">



    <link rel="stylesheet" href="../../styles/assets_footer/web/assets/mobirise-icons2/mobirise2.css">
    <link rel="stylesheet" href="../../styles/assets_footer/tether/tether.min.css">
    <link rel="stylesheet" href="../../styles/assets_footer/bootstrap/css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="../../styles/assets_footer/socicon/css/styles.css">

    <link rel="preload" as="style" href="../../styles/assets_footer/mobirise/css/mbr-additional.css"><link rel="stylesheet" href="../../styles/assets_footer/mobirise/css/mbr-additional.css" type="text/css">








    <link rel="stylesheet" href="../../styles/assets_main/bootstrap/css/bootstrap.min.css?h=379d66fff8f73d6f7616d69ebc482957">
    <link rel="stylesheet" href="../../styles/assets_main/fonts/font-awesome.min.css?h=03ab36d1dde930b7d44a712f19075641">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Bitter:400,700">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <link rel="stylesheet" href="../../styles/assets_main/css/styles.min.css?h=ed56d02c6fccdbb67add3b474feb6354">
    <!--Estilo manual-->
    <link href="../../styles/assets_main/css/vs-styles.css" rel="stylesheet">
    <!--Estilo do bootstrap4-->
    <link href="../../styles/assets_main/css/bootstrap.min.css" rel="stylesheet">
    <!--Outros estilos-->
    <link href="../../styles/assets_main/css/all.min.css"> <!--Estilo dos icones FontAwesome5-->
    <link href="../../styles/assets_main/css/sweetalert2.min.css" rel="stylesheet"> <!--Estilo de alertas e fades com Sweetalert2-->
    <link href="../../styles/assets_main/css/jquery.dataTables.min.css" rel="stylesheet"> <!--Estilo de tabelas-->


</head>
<body style="background-image: url(&quot;styles/assets_main/img/7ccb010d8fddc4bcd84587ef3c34d100.jpg?h=c3d0f8c013a249f0ca03f1b6ed591c4f&quot;);padding: 3px;color: rgb(255,255,255);">
<div class="wrapper">
    <div class="header-dark" style="background-image: url(&quot;styles/assets_main/img/download.png?h=c3d0f8c013a249f0ca03f1b6ed591c4f&quot;);padding: 3px;color: rgb(255,255,255);">
        <hr style="background-color: #ffffff;">
        <nav class="navbar navbar-light navbar-expand-md fixed-top" style="background-color: rgb(0,0,0);">
            <div class="container-fluid">
                <a class="navbar-brand" href="../../index2.php">
                    <img src="../../styles/assets_main/images/logo_p.png" alt="COVID.AO" onmouseover="this.style.backgroundColor = 'rgb(255,214,0)'" ; onmouseout="this.style.backgroundColor = ''" ;>
                </a>

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
                    include '../../api/conexao.php';

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
                    include '../../api/conexao.php';

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
                    include '../../api/conexao.php';

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

                        <section class="py-5 bg-info text-white" style="background-color: #626a6c;color: rgba(255,255,255,0.2);background-image: url(&quot;../../styles/assets_main/img/7ccb010d8fddc4bcd84587ef3c34d100.jpg?h=bf48bdc5edd7f51c23b94bc585baa661&quot;);">

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
                                            <a data-toggle="modal" data-target="#exampleModalCenter1" class="small-box-footer"style="background-color: red;color: black"><i class="fas fa-arrow-circle-right animated rotateIn infinite"></i></a>
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
                                            <a  data-toggle="modal" data-target="#exampleModalCenter2" class="small-box-footer" style="background-color: darkorange;color: black"><i class="fas fa-arrow-circle-right animated rotateIn infinite"></i></a>
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
                                            <a data-toggle="modal" data-target="#exampleModalCenter3" class="small-box-footer" style="background-color: #33ff00;color: black"><i class="fas fa-arrow-circle-right animated rotateIn infinite"></i></a>
                                        </div>
                                    </div>
                                    <!-- ./col -->
                                    <div class="col-lg-3 col-6" id="news">
                                        <!-- small box -->
                                        <div class="small-box" style="background-color: rgba(139,139,139,0.18);">
                                            <div class="inner"data-bs-hover-animate="bounce">
                                                <h3 class="number-days m-0 rounded-top" style="text-align: center;color: black"data-bs-hover-animate="bounce"><?php echo $c_mortes?></h3>

                                                <a data-toggle="modal" data-target="#exampleModalCenter4"><h5 style="text-align: center;color: black"><i class="fas fa-cross"></i></h5></a>
                                            </div>

                                            <h5 href="#" class="small-box-footer" style="color: black">Óbitos<br> <?php if($Obitos > 0){ echo '+'.$Obitos;} else if($Obitos == 0){ echo '0';}else{  echo ''.$Obitos;}?></h5>
                                            <a data-toggle="modal" data-target="#exampleModalCenter4" class="small-box-footer" style="color: black"><i class="fas fa-arrow-circle-right animated rotateIn infinite"></i></a>
                                        </div>
                                    </div>
                                    <!-- ./col -->
                                </div>
                                <div class="container" >

                                    <p class="text-center mt-5"  style="color: rgb(0,0,0);">Última Actualização:&nbsp;<?php echo $c_data?></p>

                                    <!--    <div class="col-xs-12">
                                        <div  class="text-center mt-5">
                                            <a class="btn btn-warning btn-lg text-center"  data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample" style="color: black"  role="button">Noticias</a>


                                        </div>

                                    </div>
                                    <br>

                                    <div class="collapse" id="collapseExample">
                                        <div class="row">
                                        <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
                                            <div class="carousel-inner">
                                                <div class="carousel-item active">
                                                    <div class="card ">
                                                        <?php
                                    include '../../api/conexao.php';
                                                        $sql="SELECT * FROM post where id=(select max(id) from post)";
                                                        $buscar = mysqli_query($conexao,$sql);


                                                        while ($dados = mysqli_fetch_array($buscar)){
                                                        $id= $dados['id'];
                                                        $c_img = $dados['image'];
                                                        $c_img_text = $dados['image_text'];
                                                        $c_fonte = $dados['fonte'];
                                                        $c_datar = $dados['data'];
                                                        $c_title = $dados['titulo'];



                                                        ?>
                                                        <figure class="image is-4by3">
                                                            <img   class="w-50" src="admin/system/post/images/<?php echo $c_img?>" alt="COVID.AO">
                                                        </figure>
                                                        <div class="card-body">
                                                            <h5 class="card-title" style="color: black"><?php echo $c_title?></h5>
                                                            <p class="card-text "><?php echo $c_img_text?></p>
                                                            <p class="card-text"><small class="text-muted"><?php echo $c_fonte?></small></p>
                                                            <p class="card-text"><small class="text-muted"><?php echo $c_datar?></small></p>
                                                        </div>
                                                    </div><?php }
                                                    ?>
                                                </div>
                                                <div class="carousel-item">
                                                    <div class="card ">
                                                        <?php
                                    include '../../api/conexao.php';
                                                        $sql="SELECT * FROM post where id=(select max(id-1) from post)";
                                                        $buscar = mysqli_query($conexao,$sql);


                                                        while ($dados = mysqli_fetch_array($buscar)){
                                                        $id= $dados['id'];
                                                        $c_img = $dados['image'];
                                                        $c_img_text = $dados['image_text'];
                                                        $c_fonte = $dados['fonte'];
                                                        $c_datar = $dados['data'];
                                                        $c_title = $dados['titulo'];



                                                        ?>
                                                        <figure class="image is-4by3">
                                                            <img   class="w-50" src="admin/system/post/images/<?php echo $c_img?>" alt="COVID.AO">
                                                        </figure>
                                                        <div class="card-body">
                                                            <h5 class="card-title" style="color: black"><?php echo $c_title?></h5>
                                                            <p class="card-text"><?php echo $c_img_text?></p>
                                                            <p class="card-text"><small class="text-muted"><?php echo $c_fonte?></small></p>
                                                            <p class="card-text"><small class="text-muted"><?php echo $c_datar?></small></p>
                                                        </div>
                                                    </div><?php }
                                                    ?>
                                                </div>
                                                <div class="carousel-item">
                                                    <div class="card ">
                                                        <?php
                                    include '../../api/conexao.php';
                                                        $sql="SELECT * FROM post where id=(select max(id-2) from post)";
                                                        $buscar = mysqli_query($conexao,$sql);


                                                        while ($dados = mysqli_fetch_array($buscar)){
                                                        $id= $dados['id'];
                                                        $c_img = $dados['image'];
                                                        $c_img_text = $dados['image_text'];
                                                        $c_fonte = $dados['fonte'];
                                                        $c_datar = $dados['data'];
                                                        $c_title = $dados['titulo'];



                                                        ?>
                                                        <figure class="image is-4by3">
                                                            <img   class="w-50" src="admin/system/post/images/<?php echo $c_img?>" alt="COVID.AO">
                                                        </figure>
                                                        <div class="card-body">
                                                            <h5 class="card-title" style="color: black"><?php echo $c_title?></h5>
                                                            <p class="card-text"><?php echo $c_img_text?></p>
                                                            <p class="card-text"><small class="text-muted"><?php echo $c_fonte?></small></p>
                                                            <p class="card-text"><small class="text-muted"><?php echo $c_datar?></small></p>
                                                        </div>
                                                    </div><?php }
                                                    ?>
                                                </div>
                                            </div>
                                        </div>

                                        </div>
                                    </div>-->

                                    <!--  <p class="text-center mt-5"  style="color: rgb(0,0,0);">Novos Casos:&nbsp;</p>
                                      <p class="text-center mt-5"  style="color: rgb(0,0,0);"> Óbitos: +1</p> <!--Retro changed Óbitos: +1 Casos Recuperados: +6
                                      <p class="text-center mt-5"  style="color: rgb(0,0,0);">Casos Recuperados: </p>-->
                                </div>

                        </section>
                    </div>
                </div>


                <div  id="Mapa"><hr></div>

                <!-- /.row -->
                <!-- Main row -->
                <div class="row" >
                    <section class="col-lg-12 connectedSortable">
                        <!-- Custom tabs (Charts with tabs)-->
                        <!-- Map card-->
                        <div class="card " style="background-color:whitesmoke ;color:  #eead2d;">
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
                            <div class="card-footer" id="provincias"  style="background-color:#1b1e21 ;color:  #eead2d;">


                            </div>
                        </div>
                        <!-- /.card -->
                        <div class="row"  >
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
                                            include '../../api/conexao.php';
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
                                    <h3 class="card-title centere" >Progressão</h3>

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

                                <!-- /.card-body -->
                            </div>
                            <div class="card-footer" style="background-color:#1b1e21 ;color:  #eead2d;">

                                <!-- /.row -->
                            </div>
                            <!-- /.card -->

                        </div>

                        <!-- <div class="container">
                        <div class="col-xs-12">
                            <div  class="text-center mt-5">
                                <a class="btn btn-warning btn-lg text-center" id="sobre" data-toggle="collapse" data-target="#collapseExample1" aria-expanded="false" aria-controls="collapseExample" style="color: black"  role="button">Sobre</a>


                            </div>

                        </div>

                        <br>
                            <div class="collapse" id="collapseExample1">
                                <div class="card-deck">
                                    <div class="card">

                                        <div class="card-body">
                                            <h5 class="card-title" style="font-size: 20px;color: #ffa900;"><strong>O portal Covid.AO</strong></h5>
                                            <p class="card-text" style="color: #000000;">&nbsp; O portal Covid-19.AO monitora registros da Covid-19 no nosso país. Destacando 4 pontos importantes, os quais:<br>&nbsp; &nbsp;1)Casos Confirmados,<br>&nbsp; &nbsp;2)Activos,&nbsp;<br>&nbsp; &nbsp;3)Recuperados,<br>&nbsp;
                                                &nbsp;4)Óbitos.<br>&nbsp; Assim, levando as informações da propagação e medidas de prevenção da Covid-19 no país.</p>

                                        </div>
                                    </div>
                                    <div class="card">

                                        <div class="card-body">
                                            <h5 class="card-title"style="font-size: 20px;color: #ffa900;"><strong>Como Funciona o nosso portal ?</strong></h5>
                                            <p class="card-text" style="color: #000000;">Este portal funciona de modo a manter informado a população Angolana no âmbito da pandemia que propagou-se pelo mundo. Levando informações em dados da Covid-19 pelas 18 províncias, deste casos confirmados, activos,
                                                recuperados e óbitos.</p>

                                        </div>
                                    </div>
                                    <div class="card">

                                        <div class="card-body">
                                            <h5 class="card-title" style="font-size: 20px;color: #ffa900;"><strong>De onde vem os nossos dados</strong></h5>
                                            <p class="card-text" style="color: #000000;">Os dados do portal Covid-19.AO, provêem de actualizaçōes feitas diariamente pelo sector do Ministério da Saúde de Angola 🇦🇴 . O portal comporta um banco de dados estruturado e normalizado que alberga os registros
                                                da pandemia no país.</p>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> -->

                        <br>

<div class="row">
                            <!-- PIE CHART -->
    <!--   <div class="col-md-6">
                            <div class="card ">
                                <div class="card-body  ">
                                    <div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
                                        <div class="carousel-inner">
                                            <div class="carousel-item active ">

                                                <img class="card-img-top w-100"  src="styles/assets_ultimas/img/3.png?h=d4a192e651d1a73bda72cb14b1613187">

                                                </div>
                                            <div class="carousel-item ">
                                                <figure class="image">
                                                    <img class="card-img-top w-100"  src="styles/assets_ultimas/img/3.png?h=d4a192e651d1a73bda72cb14b1613187">
                                                </figure>
                                            </div>
                                            <div class="carousel-item ">
                                                <figure class="image ">
                                                    <img class="card-img-top w-100"  src="styles/assets_ultimas/img/1.png?h=e7103690522dc2a80ab29675d7b8545b">
                                                </figure>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                /.card-body -->
                            </div>
    </div>
    <!--
    <div class="col-md-6">
        <div class="card ">
            <div class="card-body  ">
                <div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active ">

                            <img class="card-img-top w-100"  src="styles/assets_ultimas/img/1.png?h=e7103690522dc2a80ab29675d7b8545b">

                        </div>
                        <div class="carousel-item ">
                            <figure class="image">
                                <img class="card-img-top w-100"  src="styles/assets_ultimas/img/3.png?h=d4a192e651d1a73bda72cb14b1613187">
                            </figure>
                        </div>
                        <div class="carousel-item ">
                            <figure class="image ">
                                <img class="card-img-top w-100"  src="styles/assets_ultimas/img/2.png?h=a99ee867dd304fbf7c8b102cb393410a">
                            </figure>
                        </div>
                    </div>

                </div>
            </div>

            /.card-body -->
        </div>
    </div>


</div>


                            <!-- /.card -->






                    </section>
                    <!-- /.col (LEFT) -->

                    <!-- /.col (RIGHT) -->
                </div>
                <!-- /.row -->



                  <footer id="footer">

                      <div style= "background: black; text-align: center; margin: 0px; padding:10px">
                          <p style= "color:grey; font-family: raleway">©
                              <script>
                                  document.write(new Date().getFullYear())
                              </script>

                              <a href="http://blurtec.epizy.com/" target="_blank" >BlurTec</a> & <a href="https://www.facebook.com/JambaGraphics/" target="_blank" >
                                  JambaGraphics</a><br>Informando Angola.<br>#Proteja-se
                          </p>

                      </div>
                  </footer>
            </div>
    <div class="card">

    </div>
        </section>

    </div><!--
<footer>
   <section class="footer3 cid-sfoIzt5W0P" once="footers" id="footer4-13" style="background-color: black">



       <div class="container" style="background-color: black">
           <div class="row mbr-white">
               <div class="col-12 col-md-6 col-lg-3">
                   <div class="media-wrap col-md-12 col-12">
                       <img src="styles/assets_footer/images/logo-covid-ao-prancheta-1-cpia-3-337x329.png" alt="Mobirise">
                   </div>
               </div>
               <div class="col-12 col-md-6 col-lg-3">
               </div>
               <div class="col-12 col-md-6 col-lg-3">
                   <br>
                   <br>
                   <br>
                   <a href="http://blurtec.epizy.com/"><h5 class="mbr-section-subtitle mbr-fonts-style mb-2 display-7" style="color: whitesmoke">
                           Blurtec
                       </h5></a>
                   <ul class="list">
                       <li class="mbr-text item-wrap">Web Design</li>
                       <li class="mbr-text item-wrap">Criação de Sistemas</li>
                       <li class="mbr-text item-wrap">Vetorização</li>
                   </ul>
               </div>
               <div class="col-12 col-md-6 col-lg-3">
                   <br>
                   <br>
                   <br>
                   <a  href="https://www.facebook.com/JambaGraphics/"><h5 class="mbr-section-subtitle mbr-fonts-style mb-2 display-7" style="color: whitesmoke">
                           JambaGraphics
                       </h5></a>
                   <ul class="list">
                       <li class="mbr-text item-wrap">Design Grafico</li>
                       <li class="mbr-text item-wrap">Criação de Logo</li>
                       <li class="mbr-text item-wrap">Criação de Flyers</li>
                   </ul>
               </div>
               <div class="col-12 ">

               </div>

           </div>
           <div style= "background: black; text-align: center; margin: 0px; padding:10px">
               <p style= "color:grey; font-family: raleway">©
                   <script>
                       document.write(new Date().getFullYear())
                   </script>

                   <a href="http://blurtec.epizy.com/" target="_blank" >BlurTec</a> & <a href="https://www.facebook.com/JambaGraphics/" target="_blank" >
                       JambaGraphics</a><br>Informando Angola.<br>#Proteja-se
               </p>

           </div>
       </div>
   </section>
   <section style="background-color: #fff; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', Arial, sans-serif; color:#aaa; font-size:12px; padding: 0; align-items: center; display: flex;"></a></section>
</footer>-->
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
                            include '../../api/conexao.php';
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
                            include '../../api/conexao.php';
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
                            include '../../api/conexao.php';
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
                            include '../../api/conexao.php';
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

<script src="../../styles/assets_footer/popper/popper.min.js"></script>
<script src="../../styles/assets_footer/tether/tether.min.js"></script>
<script src="../../styles/assets_footer/bootstrap/js/bootstrap.min.js"></script>
<script src="../../styles/assets_footer/smoothscroll/smooth-scroll.js"></script>
<script src="../../styles/assets_footer/theme/js/script.js"></script>






<script type="text/javascript" src="https://www.google.com/jsapi">
    <script type="text/javascript" src="../assets/js/jquery.min.js"></script>
<script type="text/javascript" src="../../styles/assets_main/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../../styles/assets_main/js/all.min.js"></script>
<script type="text/javascript" src="../../styles/assets_main/js/sweetalert2.min.js"></script>
<script src="../../styles/assets_main/bootstrap/js/bootstrap.min.js?h=63715b63ee49d5fe4844c2ecae071373"></script>
<!-- jQuery -->
<script src="../../plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="../../plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
    $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="../../plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="../../plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script src="../../plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="../../plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="../../plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="../../plugins/moment/moment.min.js"></script>
<script src="../../plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="../../plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="../../plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="../../plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<script src="../../plugins/dist/js/adminlte.min.js"></script>
<!-- AdminLTE App -->
<script src="../../plugins/dist/js/adminlte.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="../../plugins/dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../plugins/dist/js/demo.js"></script>
<script> $(document).on('click','.navbar-collapse.show',function(e) {
        $(this).collapse('hide');
    }); </script>
</body>

</html>
<?php
include '../../api/main_log_apk.php';
?>


