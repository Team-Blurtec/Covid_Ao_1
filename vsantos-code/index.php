<?php
require_once 'assets/php/config.php';
?>
<?php require_once 'assets/php/header.php'; ?>

<!--Painel Principal-->
<div class="container">
    <div class="row">
        <div class="row-cols-1">
            <div class="card my-4" style="background-color: #1b1e21">
                <div class="card-body" style="background-color: #1b1e21">
                    <div class="table-responsive">
                        <table class="table table-striped text-center">
                            <thead>
                            <tr>
                                <th>ANGOLA</th>
                            </tr>
                            <tr>
                                <th>Província</th>
                                <th>Confirmados</th>
                                <th>Activos</th>
                                <th>Recuperados</th>
                                <th>Óbitos</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php foreach ($dados as $dado): ?>
                                <tr>
                                    <td><?= $dado->nome ?></td>
                                    <td><?= $dado->confirmados ?></td>
                                    <td><?= $dado->activos ?></td>
                                    <td><?= $dado->recuperados ?></td>
                                    <td><?= $dado->obitos ?></td>
                                </tr>
                            <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--Painel Principal end-->
</div>

<!--Scripts e funcoes-->
<script type="text/javascript">
    $("#admin-login-form-btn").click(function (e) {
        if ($("#admin-login-form")[0].checkValidity()) {
            e.preventDefault();

            $("#admin-login-form-btn").val('A verificar...');
            $.ajax({
                url: 'assets/php/action.php',
                method: 'post',
                data: $("#admin-login-form").serialize() + '&action=login',
                success: function (response) {
                    $("#admin-login-form-btn").val('Entrar');
                    if (response === 'login') {
                        window.location = 'admin/index.php';
                    } else {
                        $("#loginModalAlert").html(response);
                        $("#admin-login-form")[0].reset();
                    }
                }
            });
        }
    });
</script>