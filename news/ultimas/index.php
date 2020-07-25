<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="../images/bulma.png" type="image/x-icon">
      <title>COVID.AO</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/overlayscrollbars/1.9.1/css/OverlayScrollbars.min.css'>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <!-- Bulma Version 0.8.2-->
    <link rel="stylesheet" href="https://unpkg.com/bulma@0.8.2/css/bulma.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/hero.css">
    <link rel="stylesheet" href="https://unpkg.com/bulma-modal-fx/dist/css/modal-fx.min.css" />
      <link rel="stylesheet" href="https://unpkg.com/bulma@0.8.2/css/bulma.min.css" />
      <script src="https://kit.fontawesome.com/7dc3015a44.js" crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/vue"></script>
      <link rel="stylesheet" href="../css/cards.css">



      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Bitter:400,700">
      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700">
      <link rel="stylesheet" href="../../assets/fonts/font-awesome.min.css?h=18313f04cea0e078412a028c5361bd4e">

      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <style>
    .columns:nth-child(2)
    {margin-top: -10rem;}
    </style>
  </head>
  <body style="background-color: white">
  <!-- START NAV -->
  <nav class="navbar" style="background-color: black">
      <div class="container">
          <div class="navbar-brand fixed-top">
              <a class="navbar-item" href="../../index.php"">
                  <img src="../images/bulma.png" alt="Logo">
              </a>

          </div>

      </div>
  </nav>
  <hr>
  <!-- END NAV -->
    <section class="hero is-info is-small">
      <div class="" style="background-color:white;text-decoration-color: black">
        <div class="container has-text-centered">
          <p class="title" style="background-color: rgba(0,0,0,0);color: #ffa900;">
            COVID-19.AO
          </p>
          <p class="subtitle" style="background-color: rgba(0,0,0,0);color: #ffa900;">
            Ultimas Noticías
          </p>
        </div>
      </div>
    </section>

    <section class="container">

        <div class="columns features">
            <?php
            include '../conexao.php';
            $sql="SELECT * FROM post where id=(select max(id) from post)";
            $buscar = mysqli_query($conexao,$sql);


            while ($dados = mysqli_fetch_array($buscar)){
            $id= $dados['id'];
            $c_img = $dados['image'];
            $c_img_text = $dados['image_text'];
            $c_fonte = $dados['fonte'];
            $c_data = $dados['data'];
            $c_title = $dados['titulo'];



            ?>
            <div class="column is-4">
                <div class="card is-shady" style="height: 500px">
                    <div class="card-image">
                        <figure class="image is-4by3">
                            <img src="../../admin/system/post/images/<?php echo $c_img?>" alt="COVID.AO">
                        </figure>
                    </div>
                    <div class="card-content">
                        <div class="content">
                            <h4><?php echo $c_title?></h4>

                            <span class="button is-link modal-button" style="background-color: black" data-target="modal-card<?php echo $id?>">Continuar Leitura</span>
                        </div>
                    </div>
                </div>
            </div>

            <?php }
            ?>
            <?php
            include '../conexao.php';
            $sql="SELECT * FROM post where id=(select max(id-1) from post)";
            $buscar = mysqli_query($conexao,$sql);


            while ($dados = mysqli_fetch_array($buscar)){
                $id= $dados['id'];
                $c_img = $dados['image'];
                $c_img_text = $dados['image_text'];
                $c_fonte = $dados['fonte'];
                $c_data = $dados['data'];
                $c_title = $dados['titulo'];



                ?>
                <div class="column is-4">
                    <div class="card is-shady" style="height: 500px">
                        <div class="card-image">
                            <figure class="image is-4by3">
                                <img src="../../admin/system/post/images/<?php echo $c_img?>" alt="COVID.AO">
                            </figure>
                        </div>
                        <div class="card-content">
                            <div class="content">
                                <h4><?php echo $c_title?></h4>

                                <span class="button is-link modal-button" style="background-color: black" data-target="modal-card<?php echo $id?>">Continuar Leitura</span>
                            </div>
                        </div>
                    </div>
                </div>

            <?php }
            ?>
            <?php
            include '../conexao.php';
            $sql="SELECT * FROM post where id=(select max(id-2) from post)";
            $buscar = mysqli_query($conexao,$sql);


            while ($dados = mysqli_fetch_array($buscar)){
                $id= $dados['id'];
                $c_img = $dados['image'];
                $c_img_text = $dados['image_text'];
                $c_fonte = $dados['fonte'];
                $c_data = $dados['data'];
                $c_title = $dados['titulo'];



                ?>
                <div class="column is-4">
                    <div class="card is-shady" style="height: 500px">
                        <div class="card-image">
                            <figure class="image is-4by3">
                                <img src="../../admin/system/post/images/<?php echo $c_img?>" alt="COVID.AO">
                            </figure>
                        </div>
                        <div class="card-content">
                            <div class="content">
                                <h4><?php echo $c_title?></h4>

                                <span class="button is-link modal-button" style="background-color: black" data-target="modal-card<?php echo $id?>">Continuar Leitura</span>
                            </div>
                        </div>
                    </div>
                </div>

            <?php }
            ?>
        </div>

    </section>
  <hr>
  <section class="hero is-info is-small">
      <div class="" style="background-color: white;text-decoration-color: black">
          <div class="container has-text-centered">
              <p class="title" style="background-color: rgba(0,0,0,0);color: #ffa900;">
                  Medidas de Prevenção.
              </p>
          </div>
      </div>
  </section>


  <section class="container">



      <div class="columns features">

              <div class="column is-4">
                  <div class="card is-shady">
                      <div class="card-image"  data-bs-hover-animate="pulse">
                          <figure class="image">
                              <img class="card-img-top" src="assets/img/1.png?h=e7103690522dc2a80ab29675d7b8545b">
                          </figure>
                      </div>
                      <div class="card-content">
                          <div class="content">
                              <h4></h4>


                          </div>
                      </div>
                  </div>
              </div>



          <div class="column is-4">
              <div class="card is-shady">
                  <div class="card-image"  data-bs-hover-animate="pulse">
                      <figure class="image">
                          <img class="card-img-top" src="assets/img/3.png?h=d4a192e651d1a73bda72cb14b1613187">
                      </figure>
                  </div>
                  <div class="card-content">
                      <div class="content">
                          <h4></h4>


                      </div>
                  </div>
              </div>
          </div>


          <div class="column is-4">
              <div class="card is-shady">
                  <div class="card-image"  data-bs-hover-animate="pulse">
                      <figure class="image">
                          <img class="card-img-top" src="assets/img/2.png?h=a99ee867dd304fbf7c8b102cb393410a">
                      </figure>
                  </div>
                  <div class="card-content">
                      <div class="content">
                          <h4></h4>


                      </div>
                  </div>
              </div>
          </div>
      </div>

  </section>


  <footer class="footer" style="background-color: black">
      <div class="container">
          <div class="content has-text-centered">
              <p style= "color:grey; font-family: raleway">©
                  <script>
                      document.write(new Date().getFullYear())
                  </script>
                  <a href="http://blurtec.epizy.com/" >BlurTec</a>, informando Angola.
              </p>
              <P  style= "color:grey; font-family: raleway">#Fica em Casa</P>
          </div>
      </div>
  </footer>
    <!--  ===============
    HERE BE MODALS
    ===============  -->
    <!-- 3dFlipVertical card tiny -->
  <?php
  include '../conexao.php';
  $sql="SELECT * FROM post where id=(select max(id) from post)";
  $buscar = mysqli_query($conexao,$sql);


  while ($dados = mysqli_fetch_array($buscar)){
  $id= $dados['id'];
  $c_img = $dados['image'];
  $c_img_text = $dados['image_text'];
  $c_fonte = $dados['fonte'];
  $c_data = $dados['data'];
  $c_title = $dados['titulo'];



  ?>
    <div id="modal-card<?php echo $id?>" class="modal modal-fx-3dSlit">
      <div class="modal-background"></div>
      <div class="modal-content is-tiny">
        <!-- content -->
        <div class="card">
          <div class="card-image">
            <figure class="image is-4by3">
                <img class="card-img-top" src="../../admin/system/post/images/<?php echo $c_img?>" alt="COVID.AO"  >
            </figure>
          </div>
          <div class="card-content">
            <div class="media">

              <div class="media-content">
                <p class="title is-4">Fonte</p>
                <p class="subtitle is-6"><?php echo $c_fonte?></p>
              </div>
            </div>
            <div class="content">
                <h4><?php echo $c_title?></h4>
                <?php echo $c_img_text?>
              <br>
                <hr>
                <p class="title is-4">Data</p>
                <p class="subtitle is-6"><?php echo $c_data?></p>
            </div>
          </div>
        </div>
        <!-- end content -->
      </div>
      <button class="modal-close is-large" aria-label="close"></button>
    </div>
  <?php }
  ?>


  <?php
  include '../conexao.php';
  $sql="SELECT * FROM post where id=(select max(id-1) from post)";
  $buscar = mysqli_query($conexao,$sql);


  while ($dados = mysqli_fetch_array($buscar)){
      $id= $dados['id'];
      $c_img = $dados['image'];
      $c_img_text = $dados['image_text'];
      $c_fonte = $dados['fonte'];
      $c_data = $dados['data'];
      $c_title = $dados['titulo'];



      ?>
      <div id="modal-card<?php echo $id?>" class="modal modal-fx-3dSlit">
          <div class="modal-background"></div>
          <div class="modal-content is-tiny">
              <!-- content -->
              <div class="card">
                  <div class="card-image">
                      <figure class="image is-4by3">
                          <img class="card-img-top" src="../../admin/system/post/images/<?php echo $c_img?>" alt="COVID.AO"  >
                      </figure>
                  </div>
                  <div class="card-content">
                      <div class="media">

                          <div class="media-content">
                              <p class="title is-4">Fonte</p>
                              <p class="subtitle is-6"><?php echo $c_fonte?></p>
                          </div>
                      </div>
                      <div class="content">
                          <h4><?php echo $c_title?></h4>
                          <?php echo $c_img_text?>
                          <br>
                          <hr>
                          <p class="title is-4">Data</p>
                          <p class="subtitle is-6"><?php echo $c_data?></p>
                      </div>
                  </div>
              </div>
              <!-- end content -->
          </div>
          <button class="modal-close is-large" aria-label="close"></button>
      </div>
  <?php }
  ?>




  <?php
  include '../conexao.php';
  $sql="SELECT * FROM post where id=(select max(id-2) from post)";
  $buscar = mysqli_query($conexao,$sql);


  while ($dados = mysqli_fetch_array($buscar)){
      $id= $dados['id'];
      $c_img = $dados['image'];
      $c_img_text = $dados['image_text'];
      $c_fonte = $dados['fonte'];
      $c_data = $dados['data'];
      $c_title = $dados['titulo'];



      ?>
      <div id="modal-card<?php echo $id?>" class="modal modal-fx-3dSlit">
          <div class="modal-background"></div>
          <div class="modal-content is-tiny">
              <!-- content -->
              <div class="card">
                  <div class="card-image">
                      <figure class="image is-4by3">
                          <img class="card-img-top" src="../../admin/system/post/images/<?php echo $c_img?>" alt="COVID.AO"  >
                      </figure>
                  </div>
                  <div class="card-content">
                      <div class="media">

                          <div class="media-content">
                              <p class="title is-4">Fonte</p>
                              <p class="subtitle is-6"><?php echo $c_fonte?></p>
                          </div>
                      </div>
                      <div class="content">
                          <h4><?php echo $c_title?></h4>
                          <?php echo $c_img_text?>
                          <br>
                          <hr>
                          <p class="title is-4">Data</p>
                          <p class="subtitle is-6"><?php echo $c_data?></p>
                      </div>
                  </div>
              </div>
              <!-- end content -->
          </div>
          <button class="modal-close is-large" aria-label="close"></button>
      </div>
  <?php }
  ?>
    <!-- end tiny modal card -->
    <!-- 3dFlipVertical card tiny [butterfly] -->


    <script src="https://unpkg.com/bulma-modal-fx/dist/js/modal-fx.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/overlayscrollbars/1.9.1/js/OverlayScrollbars.min.js'></script>  
    <script src="../js/wild.js"></script>
        <script>
        document.addEventListener("DOMContentLoaded", function() {
        //The first argument are the elements to which the plugin shall be initialized
        //The second argument has to be at least a empty object or a object with your desired options
        OverlayScrollbars(document.querySelectorAll("body"), { });
        });
        </script>
  <script src="../js/cardsData.js"></script>

  <!-- Using Vue to populate cards to reduce redundant code -->
  <script>
      var app = new Vue({
          el: '#app',
          data: {
              cardData: cardsData
          }
      })

  </script>

  <script src="assets/js/jquery.min.js?h=83e266cb1712b47c265f77a8f9e18451"></script>
  <script src="../../assets/bootstrap/js/bootstrap.min.js?h=e46528792882c54882f660b60936a0fc"></script>
  <script src="assets/js/chart.min.js?h=18313f04cea0e078412a028c5361bd4e"></script>
  <script src="assets/js/script.min.js?h=53841c6e79f845ab0871ebc550cc4070"></script>


  <script type="text/javascript" src="https://www.google.com/jsapi">
      <script type="text/javascript" src="../assets/js/jquery.min.js"></script>
  <script type="text/javascript" src="../../assets/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="../../assets/js/all.min.js"></script>
  <script type="text/javascript" src="../../assets/js/sweetalert2.min.js"></script>
  <script src="../../assets/bootstrap/js/bootstrap.min.js?h=63715b63ee49d5fe4844c2ecae071373"></script>
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
  <script src="../../dist/js/adminlte.min.js"></script>
  <!-- AdminLTE App -->
  <script src="../../dist/js/adminlte.js"></script>
  <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
  <script src="../../dist/js/pages/dashboard.js"></script>
  <!-- AdminLTE for demo purposes -->
  <script src="../../dist/js/demo.js"></script>
  </body>
</html>
<?php
include ("stats_news/ClassVisitas.php");
$visitas = new ClassVisitas();
$visitas->VerificaUsuario();
?>
