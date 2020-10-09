$(document).ready(() => {

    $('.ui.form').form
    (
        {
            inline: true,
            fields: {
                usr:{
                    identifier: 'usr',
                    rules: [
                        {
                            type: 'empty',
                            prompt: '{name}'
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
                    data: $('.ui.form').serialize()+'&action=login',
                    dataType: 'html',
                    success: s => {
                        $('.ui.button').removeClass('loading')
                        $('#serve').html(s)
                        console.log(s)
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