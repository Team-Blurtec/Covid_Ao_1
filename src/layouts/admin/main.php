<?php include "fast-build/mainHeader.php" ?>
    <title>COVID.AO - Admin</title>
    </head>
    <body>
        <!--Sidebar menu para todos dispositivos-->
        <div class="ui vertical inverted sidebar menu sidebar-ui">
            <div class="item">
                <div class="ui center aligned image item">
                    <img src="styles/img/white_covid19a.png" alt="white_covid19a">
                </div>
                <div class="menu">
                    <a href="/main.php" class="item">
                        <div>
                            <i class="big yellow circular home icon"></i>
                            Iniciar
                        </div>
                    </a>
                    <div class="item">
                        <div class="header">Portal Principal</div>
                        <div class="menu">
                            <a class="modal-casos item">
                                <div>
                                    <i class="big yellow circular plus circle icon"></i>
                                    Registar casos
                                </div>
                            </a>
                            <a href="#" class="item">
                                <div>
                                    <i class="big yellow circular edit icon"></i>
                                    Editar casos
                                </div>
                            </a>
                            <a href="#" class="item">
                                <div>
                                    <i class="big yellow circular chart line circle icon"></i>
                                    Estatística de acessos
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="item">
                        <div class="header">Portal de Notícias</div>
                        <div class="menu">
                            <a href="#" class="item">
                                <div>
                                    <i class="big yellow circular newspaper circle icon"></i>
                                    Publicar notícias
                                </div>
                            </a>
                            <a href="#" class="item">
                                <div>
                                    <i class="big yellow circular chart line circle icon"></i>
                                    Estatística de acessos
                                </div>
                            </a>
                        </div>
                    </div>
                    <a href="#" class="item">
                        <div>
                            <i class="big yellow lightbulb icon"></i>
                            COVID.AO App
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <!--Sidebar menu para todos dispositivos end-->
        <div class="pusher">
            <div class="ui container">
                <div class="ui grid">
                    <div class="row">
                        <!--Versao para pcs-->
                        <div class="sixteen wide computer only column">
                            <nav class="ui inverted basic top fixed menu">
                                <div class="right icon menu">
                                    <div class="ui dropdown dropdown-notification item">
                                        <i class="bell icon"></i>
                                        <div class="menu">
                                            <div class="header">
                                                Notificação
                                            </div>
                                            <div class="disabled item">
                                                <div>
                                                    recurso indisponível
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ui dropdown dropdown-u-options item">
                                        <i class="user circle icon"></i>
                                        <div class="menu">
                                            <div class="header">
                                                Utilizador: example
                                            </div>
                                            <a href="#" class="item">
                                                <i class="user add icon"></i> criar novo admin
                                            </a>
                                            <a class="modal-sair item">
                                                <i class="sign-out icon"></i> sair
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </nav>
                            <div class="main-content">
                                <div class="ui padded grid">
                                    <div class="row">
                                        <div class="eight wide column">
                                            <form class="ui form segment">
                                                <h3 class="ui huge center aligned dividing header">
                                                    Formulário de Registo de Províncias
                                                </h3>
                                                <input type="hidden" name="id" value="0" class="id">
                                                <input type="hidden" name="option" value="registar" class="option">
                                                <div class="field">
                                                    <label>Nome</label>
                                                    <input type="text" name="nome" class="nome">
                                                </div>
                                                <div class="ui btn-save secondary button">Guardar</div>
                                                <div class="ui btn-ls button">Listar</div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="column">
                                            <div class="ui segment">
                                                <table class="ui unstackable internally celled black inverted dataTbl table" cellspacing="0"
                                                       width="100%" style="color: yellow !important;"
                                                >
                                                    <thead class="full-width">
                                                        <tr class="center aligned">
                                                            <th>Id</th>
                                                            <th>Província</th>
                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="center aligned">

                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </div>
                        <!--Versao para pcs end-->
                        <!--Versao para tablets-->
                        <div class="sixteen wide tablet only column">
                            <nav class="ui inverted basic top fixed menu">
                                <div class="right icon menu">
                                    <div class="ui dropdown dropdown-notification item">
                                        <i class="bell icon"></i>
                                        <div class="menu">
                                            <div class="header">
                                                Notificação
                                            </div>
                                            <div class="disabled item">
                                                <div>
                                                    recurso indisponível
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ui dropdown dropdown-u-options item">
                                        <i class="user circle icon"></i>
                                        <div class="menu">
                                            <div class="header">
                                                Utilizador: example
                                            </div>
                                            <a href="#" class="item">
                                                <i class="user add icon"></i> criar novo admin
                                            </a>
                                            <a href="#" class="item">
                                                <i class="sign-out icon"></i> sair
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </nav>
                            <div class="main-content">
                                <div class="ui grid padded">
                                    <h1 class="header">Em manutenção</h1>
                                    <p>De momento, Admin Panel 3 não tem suporte para dispositivos do tipo Tablet-Phablets</p>
                                </div>
                            </div>
                        </div>
                        <!--Versao para tablets end-->
                        <!--Versao para smartphones-->
                        <div class="sixteen wide mobile only column">
                            <nav class="ui inverted basic top fixed inverted menu">
                                <div id="sidebar-toggler" class="item">
                                    <div>
                                        <i class="sidebar icon"></i>
                                        Menu
                                    </div>
                                </div>
                                <div class="right icon menu">
                                    <div class="ui dropdown dropdown-notification item">
                                        <i class="bell icon"></i>
                                        <div class="menu">
                                            <div class="header">
                                                Notificação
                                            </div>
                                            <div class="disabled item">
                                                <div>
                                                    recurso indisponível
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ui dropdown dropdown-u-options item">
                                        <i class="user circle icon"></i>
                                        <div class="menu">
                                            <div class="header">
                                                Utilizador: example
                                            </div>
                                            <a href="#" class="item">
                                                <i class="user add icon"></i> criar novo admin
                                            </a>
                                            <a class="modal-sair item">
                                                <i class="sign-out icon"></i> sair
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </nav>
                            <div class="main-content">
                                <div class="ui grid padded">
                                    <div class="row">
                                        <div class="column">
                                            <form class="ui form segment">
                                                <h3 class="ui huge center aligned dividing header">
                                                    Formulário de Registo de Províncias
                                                </h3>
                                                <input type="hidden" name="id" value="0" class="id">
                                                <input type="hidden" name="option" value="registar" class="option">
                                                <div class="field">
                                                    <label>Nome</label>
                                                    <input type="text" name="nome" class="nome">
                                                </div>
                                                <div class="ui buttons">
                                                    <div class="ui secondary button">Guardar</div>
                                                    <div class="ui btn-ls button">Listar</div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="column">
                                            <div class="ui segment">
                                                <table class="ui black inverted celled dataTbl table" cellspacing="0"
                                                       width="100%" style="color: yellow !important;"
                                                >
                                                    <thead class="full-width">
                                                    <tr class="center aligned">
                                                        <th>Id</th>
                                                        <th>Província</th>
                                                        <th></th>
                                                    </tr>
                                                    </thead>
                                                    <tbody class="center aligned">

                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--Versao para smartphones end-->
                    </div>
                </div>
            </div>
        <!--Modals-->
        <div class="ui basic sair modal">
            <div class="ui huge icon header">
                <i class="sign-out icon"></i>
            </div>
            <div class="content">
                <p>Tem certeza que deseja terminar a sessão?</p>
            </div>
            <div class="actions">
                <div class="ui green ok inverted button">
                    <div>
                        <i class="checkmark icon"></i>
                        Sim
                    </div>
                </div>
                <div class="ui red basic cancel inverted button">
                    <div>
                        <i class="remove icon"></i>
                        Cancelar
                    </div>
                </div>
            </div>
        </div>
        <div class="ui mini casos modal">
            <i class="close icon"></i>
            <div class="ui yellow header">
                <div>
                    Registar casos
                </div>
            </div>

                <form autocomplete="off" class="ui inverted form fluid segment">
                    <div class="three wide fields">
                        <div class="field">
                            <label>Novos</label>
                            <input type="number" placeholder="Novos casos">
                        </div>
                        <div class="field">
                            <label>Recuperados</label>
                            <input type="number" placeholder="Casos recuperados">
                        </div>
                        <div class="field">
                            <label>Óbitos</label>
                            <input type="number" placeholder="Mortes">
                        </div>
                    </div>
                    <div class="field">
                        <label>Província</label>
                        <select class="ui search dropdown">
                            <option value="">--Escolher--</option>
                            <option value="Example">Example</option>
                        </select>
                    </div>
                    <div class="field">
                        <label>Data da actualização</label>
                        <input type="datetime-local">
                    </div>
                    <div class="ui green inverted button">Registar</div>
                    <button type="reset" class="ui yellow basic inverted button">Limpar</button>
                </form>

        </div>
        <!--Modals end-->
<?php include "fast-build/mainFooter.php" ?>