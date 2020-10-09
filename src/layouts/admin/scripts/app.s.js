$(document).ready(function () {

    let form = $("form")

    $("#blurtec").click(function (e) {
        if (form[0].checkValidity()){
            e.preventDefault()

            $.ajax(
                {
                    type: 'post',
                    url: '',
                    data: form.serialize()+'&action=login',
                    success: function (s) {
                        console.log(s)
                    },
                    error: function (error) {

                    }
                }
            )
        }
    })
    /*Sidebar Button Toggle*/
    $('#sidebar-toggler').click(function () {
        $('.ui.sidebar').sidebar
        (
            {
                dimPage: true,
                transition: 'overlay',
                mobileTransition: 'overlay'
            }
        ).sidebar('toggle')
    })
    /*Sidebar Button Toggle end*/

    /*Dropdowns*/
    $('.dropdown-notification').dropdown()
    $('.dropdown-u-options').dropdown()
    $('.dropdown-po-options').dropdown()
    $('select.dropdown').dropdown()
    /*Dropdowns end*/

    /*Modals*/
    $('.modal-sair').click(function () {
        $('.sair').modal('show')
    })
    $('.modal-casos').click(function () {
        $('.casos').modal('show')
    })
    /*Modals end*/

    listar()
})

$('.btn-ls').on("click", function () {
    listar()
})

let listar = function () {
    let table = $('.dataTbl').DataTable({
        "destroy": true,
        "ajax": {
            "type": "GET",
            "url": "../api/ajax.php?createJSON=provincias"
        },
        "columns": [
            {"data": "id"},
            {"data": "nome"},
            {"defaultContent": "<div class='ui blue icon btn-editar button' data-tooltip='editar'><i class='edit icon'></i></div>&nbsp; <div class='ui red icon btn-apagar button' data-tooltip='apagar'><i class='trash alternate icon'></i></div>"}
        ],
        "language": portugues
    })

    editar(".dataTbl tbody", table)
}

let editar = function (tbody, table) {
    $(tbody).on("click", "div.btn-editar", function () {
        let data = table.row($(this).parents("tr")).data()
        let ids = $('.id').val(data.id),
            nome = $('.nome').val(data.nome)
    })
}

let portugues = {
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

function preencher_provincias() {
    /*Select Províncias AJAX*/
    $.ajax(
        {
            type: 'get',
            url: '../api/ajax.php',
            data: {createJSON: 'provincias'},
            dataType: 'json',
            success: s => {
                console.log(s)
            },
            error: err => {
                console.log(err)
            }
        }
    )
    /*Select Províncias AJAX end*/
}