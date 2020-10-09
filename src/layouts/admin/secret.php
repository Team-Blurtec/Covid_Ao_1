<?php
include "fast-build/secretHeader.php";
?>

<?php if (isset($_GET) && $_GET['code'] == '20162020covidao'){ ?>
        <title>acesso restricto | COVID.AO</title>
    </head>
    <body>
        <div class="ui center aligned middle aligned grid container">
            <div class="column">
                <div class="ui black attached message">
                    <div class="header">
                        Nova Conta
                    </div>
                    <p>Preenche devidamente o formulário a fim de criar nova conta</p>
                </div>
                <form class="ui form attached fluid segment">
                    <div class="ui centered blurring warning page dimmer">
                        <div class="content">
                            <h2 class="ui inverted image">
                                <img src="styles/img/white_covid19a.png" alt="white_covid19a" class="ui centered small image">
                                Existe uma conta associada a esse nome de utilizador.<br>Clica <a href="./">aqui</a> para login.
                            </h2>
                        </div>
                    </div>
                    <div class="ui centered blurring success page dimmer">
                        <div class="content">
                            <h2 class="ui inverted image">
                                <img src="styles/img/white_covid19a.png" alt="white_covid19a" class="ui centered small image">
                                Conta criada com sucesso.<br>Clica <a href="./">aqui</a> para login.
                            </h2>
                        </div>
                    </div>
                    <div class="field">
                        <div class="required field">
                            <label>ID de utilizador</label>
                            <input placeholder="Seu nome de utilizador" name="usr" type="text">
                        </div>
                    </div>
                    <div class="required field">
                        <label>Palavra Passe</label>
                        <input placeholder="Sua palavra passe" name="psw" type="password">
                    </div>
                    <div class="field">
                        <label>Confirmar a Palavra Passe</label>
                        <input placeholder="Introduza novamente a palavra passe" name="cpsw" type="password">
                    </div>
                    <div class="ui fluid yellow submit animated button" tabindex="0">
                        <div class="visible content"><i class="check circle icon"></i></div>
                        <div class="hidden content">
                            Submeter
                        </div>
                    </div>
                </form>
                <div class="ui black bottom attached message">
                    <img src="styles/img/white_covid19a.png" alt="white_covid19a" class="ui centered tiny image">
                    <i class="icon help"></i>
                    Possui conta&nbsp;?&nbsp; Clica <a href="./">aqui</a> para login.
                </div>
                <div class="ui centered" id="serve"></div>
            </div>
        </div>
<?php } else {?>
    <title>Em manutenção</title>
    </head>
    <body>
    <div class="ui middle aligned center aligned grid container">
        <div class="row">
            <h1 class="header">Página em manutenção</h1>
        </div>
    </div>
<?php } include "fast-build/secretFooter.php"; ?>