<?php
include ("post.php");
?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="author" content="JSKT">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>COVID.AO</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css?h=71d7135d77b6e35a715e2bbfaa219cf6">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Bitter:400,700">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css?h=18313f04cea0e078412a028c5361bd4e">
    <link rel="stylesheet" href="assets/css/styles.min.css?h=c1b37e708ebae212a1cdac820a4c56fe">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
</head>

<body>
    <div>
        <div class="header-dark" style="background-image: url(&quot;assets/img/download.png?h=c3d0f8c013a249f0ca03f1b6ed591c4f&quot;);padding: 3px;color: rgb(255,255,255);">
            <hr style="background-color: #ffffff;">
            <nav class="navbar navbar-light navbar-expand-md fixed-top" style="background-color: rgb(0,0,0);">
                <div class="container-fluid">
                    <div>
                        <h4 class="heading"><a title="Jeroen van der Merwe" href="#"><span class="background" style="background-color: rgb(255,0,0);">ANGOLA</span><span class="border" style="background-color: rgb(255,214,0);color: rgb(0,0,0);">COVID-19</span></a></h4>
                    </div><button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1" style="background-color: rgba(255,214,0,0);"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon" style="background-color: #ffffff;"></span></button>
                    <div
                        class="collapse navbar-collapse" id="navcol-1">
                        <ul class="nav navbar-nav ml-auto">
                            <li class="nav-item" role="presentation"><a class="nav-link active" href="../" style="color: #ffffff;" onmouseover="this.style.backgroundColor = 'rgb(255,214,0)'"; onmouseout="this.style.backgroundColor = ''";>Sair</a></li>

                        </ul>
                </div>
        </div>
        </nav>
    </div>
    <div></div>
    </div>
    <div class="features-clean">
        <div class="container" style="background-color: #ffffff;background-image: url(&quot;assets/img/7ccb010d8fddc4bcd84587ef3c34d100.jpg?h=bf48bdc5edd7f51c23b94bc585baa661&quot;);">
            <div class="intro">
                <h2 class="text-center" data-bs-hover-animate="bounce" style="background-color: rgba(0,0,0,0);color: #ffa900;">COVID-19.AO</h2>
            </div>
            <div class="row features">
                <div class="col">
                    <form class="bootstrap-form-with-validation" method="post" action="index.php" enctype="multipart/form-data">
                        <div class="form-group"><label for="text-input">Titulo</label><input class="form-control" type="text" id="text-input" name="titulo" placeholder="insira o titulo"></div>
                        <div class="form-group"><label for="textarea-input">Noticia</label><textarea class="form-control" id="textarea-input" name="image_text" placeholder="Escreva aqui a noticia"></textarea></div>
                        <div class="form-group"><label for="text-input">Fonte</label><input class="form-control" type="text" id="text-input" name="fonte" placeholder="insira a fonte da Noticia"></div>
                        <input type="hidden" name="size" value="1000000">
                        <div class="form-group"><input type="file" id="file-input" name="image"></div>
                        <div class="form-group"><button class="btn btn-primary" type="submit" style="background-color: rgb(255,169,0);color: rgb(0,0,0);" name="upload">Postar</button></div>
                    </form>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <hr>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <hr>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <hr><footer id="footer">

                        <div style= "background: black; text-align: center; margin: 0px; padding:10px">
                            <p style= "color:grey; font-family: raleway">©
                                <script>
                                    document.write(new Date().getFullYear())
                                </script>
                                <a href="http://blurtec.epizy.com/"  target="_blank">BlurTec</a>, informando Angola.
                            </p>
                            <P  style= "color:grey; font-family: raleway">#Fica em Casa</P>
                        </div>
</footer></div>
            </div>
        </div>
    </div>
    <script src="assets/js/jquery.min.js?h=83e266cb1712b47c265f77a8f9e18451"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js?h=e46528792882c54882f660b60936a0fc"></script>
    <script src="assets/js/chart.min.js?h=18313f04cea0e078412a028c5361bd4e"></script>
    <script src="assets/js/script.min.js?h=53841c6e79f845ab0871ebc550cc4070"></script>
</body>

</html>