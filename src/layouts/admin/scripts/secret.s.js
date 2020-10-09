$(document).ready(() => {

    $('.ui.form').form
    (
        {
            inline: true,
            on: 'change',
            fields: {
                usr: {
                    identifier: 'usr',
                    rules: [
                        {
                            type: 'empty',
                            prompt: '{name} é um campo obrigatório'
                        },
                        {
                            type: 'minLength[4]',
                            prompt: '{name} deve conter {ruleValue} caracteres'
                        },
                        {
                            type: 'maxLength[15]',
                            prompt: 'O limite de caracteres é {ruleValue}'
                        }
                    ]
                },
                psw: {
                    identifier: 'psw',
                    rules: [
                        {
                            type: 'empty',
                            prompt: '{name} é um campo obrigatório'
                        },
                        {
                            type: 'length[6]',
                            prompt: '{name} deve ter pelo menos {ruleValue} caracteres'
                        }
                    ]
                },
                cpsw: {
                    identifier: 'cpsw',
                    depends: 'psw',
                    rules: [
                        {
                            type: 'empty',
                            prompt: '{name}'
                        },
                        {
                            type: 'match[psw]',
                            prompt: 'Palavra Passe inválida. Deve igualar a Palavra Passe* inserida'
                        }
                    ]
                }
            },
            onSuccess: function (e) {
                e.preventDefault()

                $('.ui.button').addClass('loading')

                $.ajax({
                    type: 'post',
                    url: '../api/ajax.php',
                    data: $('.ui.form').serialize()+'&action=conta',
                    dataType: 'html',
                    success: e => {
                        $('.ui.button').removeClass('loading')
                        $('#serve').html(e)

                        if (e === '<script>$(".ui.success.dimmer").dimmer("show")</script>'){
                            $('.ui.form').form('reset')
                        }
                    },
                    error: err => {
                        swal.fire("error","error","error")
                        console.log(err)
                    }
                })
            }
        }
    )
})