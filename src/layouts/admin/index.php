<?php include "fast-build/loginHeader.php" ?>
    <title>login | COVID.AO</title>
</head>
<body>
<div class="ui middle aligned center aligned grid container">
    <div class="column">
        <form autocomplete="off" class="ui inverted large form fluid rounded segment">
            <div class="ui center aligned" id="serve"></div>
            <div class="ui inverted stacked segment">
                <h2 class="ui small image">
                    <img src="styles/img/white_covid19a.png" alt="black_covid19a">
                </h2>
                <div class="field">
                    <div class="ui left icon input">
                        <i class="user circle icon"></i>
                        <input type="text" name="usr" placeholder="ID de Utilizador">
                    </div>
                </div>
                <div class="field">
                    <div class="ui left icon input">
                        <i class="lock icon"></i>
                        <input type="password" name="psw" placeholder="Palavra Passe">
                    </div>
                </div>
                <div class="ui yellow fluid huge animated fade submit circular button" tabindex="0">
                    <div class="visible content">login</div>
                    <div class="hidden content">
                        <i class="sign-in icon"></i>
                    </div>
                </div>
            </div>
            <div class="ui error message"></div>
        </form>
        <div class="ui inverted message" id="effect">
            Feito com &nbsp;<i class="red heart icon"></i>por&nbsp; <a data-tooltip="Team Blur&trade;" data-position="top center" id="blurtec">Blurtec</a>
        </div>
    </div>
</div>
<?php include "fast-build/loginFooter.php"; ?>