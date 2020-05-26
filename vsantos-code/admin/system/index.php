<?php
include_once '../../assets/php/session.php';

$sql = "SELECT nome FROM provincias ORDER BY nome ASC";

$stmt = $session2auth->connect->prepare($sql);
$stmt->execute();
?>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="author" content="JSKT">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>COVID.ao | Admin</title>
    <!--Estilo manual-->
    <link href="../../assets/css/vs-styles.css" rel="stylesheet">
    <!--Estilo do bootstrap4-->
    <link href="../../assets/css/bootstrap.min.css" rel="stylesheet">
    <!--Outros estilos-->
    <link href="../../assets/css/all.min.css"> <!--Estilo dos icones FontAwesome5-->
    <link href="../../assets/css/sweetalert2.min.css" rel="stylesheet"> <!--Estilo de alertas e fades com Sweetalert2-->
    <link href="../../assets/css/jquery.dataTables.min.css" rel="stylesheet"> <!--Estilo de tabelas-->
</head>
<body>
<nav class="navbar navbar-expand-md vs-navbar navbar-dark">
    <a class="navbar-brand vs-modal-title" href="#"><i class="fa fa-viruses fa-lg"></i>&nbsp;
        COVID.ao</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapseNav">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapseNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link vs-navlink" href="#" id="cases-modal-link" data-toggle="modal"
                   data-target="#addNewCaseModal"><i class="fas fa-procedures"></i>&nbsp;Registar Casos</a>
            </li>
            <li class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle vs-inverted-navlink" id="navbardrop" data-toggle="dropdown">
                    <i class="fas fa-user-cog"></i>&nbsp;
                    <?= $u2name; ?>
                </a>
                <div class="dropdown-menu">
                    <a href="../../assets/php/logout.php" class="dropdown-item vs-logout">
                        <i class="fas fa-sign-out-alt"></i>&nbsp;
                        Sair
                    </a>
                </div>
            </li>
        </ul>
    </div>
</nav>
<div class="container">
    <div class="row">
        <div class="col-lg-12 mt-4">
            <h4 class="text-center vs-modal-title">Casos por Províncias</h4>
        </div>
    </div>
    <div class="card border-dark my-3">
        <div class="card-body">
            <div class="table-responsive text-center" id="provincias-table-div">

            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12 mt-4">
            <h4 class="text-center vs-modal-title">Casos Diários</h4>
        </div>
    </div>
    <div class="card border-dark my-3">
        <div class="card-body">
            <div class="table-responsive text-center" id="casos-diarios-table-div">

            </div>
        </div>
    </div>
</div>

<!--Add New Case Modal-->
<div class="modal fade" id="addNewCaseModal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header bg-info vs-modal-header">
                <h4 class="modal-title vs-modal-title text-center"><i
                            class="fas fa-viruses fa-lg"></i>&nbsp</h4>
                <button type="button" class="close vs-modal-close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body vs-modal-body">
                <form action="#" method="post" id="add-case-form" class="px-3">
                    <div class="form-group">
                        <select id="province_select" name="province-select" class="form-control form-control-lg">
                            <?php while ($row = $stmt->fetch(PDO::FETCH_ASSOC)): ?>
                                <option value="<?= $row['nome']; ?>"><?= $row['nome']; ?></option>
                            <?php endwhile; ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="number" name="case-new" class="form-control form-control-lg"
                               placeholder="Novos Casos"
                               required>
                    </div>
                    <div class="form-group">
                        <input type="number" name="case-rec" class="form-control form-control-lg"
                               placeholder="Recuperados" required>
                    </div>
                    <div class="form-group">
                        <input type="number" name="case-death" class="form-control form-control-lg"
                               placeholder="Mortes" required>
                    </div>
                    <div class="form-group">
                        <input type="date" name="case-onDate" class="form-control form-control-lg was-validated"
                               required>
                    </div>
                    <div class="form-group">
                        <input type="submit" name="addCaseByUnifiedBtn" id="addCaseByUnifiedBtn" value="Inserir"
                               class="btn btn-success btn-lg vs-login-btn">
                        <input type="submit" name="moreCaseByUnifiedBtn" id="moreCaseByUnifiedBtn" value="Mais Casos"
                               class="btn btn-primary btn-lg vs-login-btn">
                        <input type="reset" class="btn btn-danger btn-lg vs-login-btn" value="Limpar">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!--Add New Case Modal end-->

<script type="text/javascript" src="../../assets/js/jquery.min.js"></script>
<script type="text/javascript" src="../../assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../../assets/js/all.min.js"></script>
<script type="text/javascript" src="../../assets/js/sweetalert2.all.min.js"></script>
<script type="text/javascript" src="../../assets/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        apresentarProvincias();
        apresentarCasosDiarios();
        $("#moreCaseByUnifiedBtn").click(function (e) {
            if ($("#add-case-form")[0].checkValidity()) {
                e.preventDefault();

                $.ajax({
                    url: '../../assets/php/process.php',
                    method: 'post',
                    data: $("#add-case-form").serialize() + '&action=more_case',
                    success: function (response) {
                        console.log(response);
                        $("#addCaseByUnifiedBtn").val('Terminar');
                        if (response === 'success') {
                            $("#add-case-form")[0].reset();
                            Swal.fire({
                                title: 'Inserido :>',
                                text: 'Tem a possibilidade de inserir novamente ou terminar',
                                icon: 'info',
                                showConfirmButton: false,
                                timer: 3500
                            });
                            apresentarProvincias();
                            apresentarCasosDiarios();
                        } else {
                            Swal.fire({
                                title: 'Falhado :<',
                                text: 'Tenta novamente',
                                icon: 'warning',
                                showConfirmButton: false,
                                timer: 3000
                            });
                        }
                    }
                });
            }
        });

        $("#addCaseByUnifiedBtn").click(function (e) {
            if ($("#addCaseByUnifiedBtn").val() === 'Terminar') {
                $("#add-case-form")[0].reset();
                $("#addNewCaseModal").modal("hide");
                $(this).val('Inserir');
            } else {
                if ($("#add-case-form")[0].checkValidity()) {
                    e.preventDefault();

                    $.ajax({
                        url: '../../assets/php/process.php',
                        method: 'post',
                        data: $("#add-case-form").serialize() + '&action=new_case',
                        success: function (response) {
                            console.log(response);
                            if (response === 'success') {
                                Swal.fire({
                                    title: 'Inserido :>',
                                    icon: 'success',
                                    timer: 2000,
                                    timerProgressBar: true,
                                    showConfirmButton: false
                                });
                                $("#add-case-form")[0].reset();
                                $("#addNewCaseModal").modal("hide");
                                apresentarProvincias();
                                apresentarCasosDiarios();
                            } else {
                                Swal.fire({
                                    title: 'Falhado :<',
                                    icon: 'error',
                                    showConfirmButton: false,
                                    timer: 1000
                                });
                            }
                        }
                    });
                }
            }
        });

        function apresentarCasosDiarios() {
            $.ajax({
                url: '../../assets/php/process.php',
                method: 'post',
                data: {action: 'case'},
                success: function (response) {
                    $("#casos-diarios-table-div").html(response);
                    $("#cases-table").DataTable({
                        order: [0, 'asc'],
                        pageLength: 5,
                        lengthMenu: [5, 10, 15, 20, 50, 75, 100, 200],
                        "language": {
                            "sEmptyTable": "Não foi encontrado nenhum registo",
                            "sLoadingRecords": "A carregar...",
                            "sProcessing": "A processar...",
                            "sLengthMenu": "Mostrar _MENU_ registos",
                            "sZeroRecords": "Não foram encontrados resultados",
                            "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registos",
                            "sInfoEmpty": "Mostrando de 0 até 0 de 0 registos",
                            "sInfoFiltered": "(filtrado de _MAX_ registos no total)",
                            "sInfoPostFix": "",
                            "sSearch": "Procurar:",
                            "sUrl": "",
                            "oPaginate": {
                                "sFirst": "Primeiro",
                                "sPrevious": "Anterior",
                                "sNext": "Seguinte",
                                "sLast": "Último"
                            },
                            "oAria": {
                                "sSortAscending": ": Ordenar colunas de forma ascendente",
                                "sSortDescending": ": Ordenar colunas de forma descendente"
                            }
                        }
                    });
                }
            });
        }

        function apresentarProvincias() {
            $.ajax({
                url: '../../assets/php/process.php',
                method: 'post',
                data: {action: 'province_case'},
                success: function (response) {
                    $("#provincias-table-div").html(response);
                    $("#provincias-table").DataTable({
                        order: [0, 'asc'],
                        pageLength: 5,
                        lengthMenu: [5, 8, 13, 21, 33, 54, 89, 200],
                        "language": {
                            "sEmptyTable": "Não foi encontrado nenhum registo",
                            "sLoadingRecords": "A carregar...",
                            "sProcessing": "A processar...",
                            "sLengthMenu": "Mostrar _MENU_ registos",
                            "sZeroRecords": "Não foram encontrados resultados",
                            "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registos",
                            "sInfoEmpty": "Mostrando de 0 até 0 de 0 registos",
                            "sInfoFiltered": "(filtrado de _MAX_ registos no total)",
                            "sInfoPostFix": "",
                            "sSearch": "Procurar:",
                            "sUrl": "",
                            "oPaginate": {
                                "sFirst": "Primeiro",
                                "sPrevious": "Anterior",
                                "sNext": "Seguinte",
                                "sLast": "Último"
                            },
                            "oAria": {
                                "sSortAscending": ": Ordenar colunas de forma ascendente",
                                "sSortDescending": ": Ordenar colunas de forma descendente"
                            }
                        }
                    });
                }
            });
        }
    });
</script>
</body>
</html>