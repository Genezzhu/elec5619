$(document).ready(function () {
    $('.delete-row').click(function () {
        var $this = $(this);
        var orderID = $this.closest('tr').attr('id');

        $.ajax({
            url: '../order/deleteOrder',
            dataType: 'json',
            type:'post',
            data:{
                orderID : orderID
            },
            success: function (json) {
                window.location.reload('#');
            }
        });
    });

    $('*[data-toggle=tooltip]').mouseover(function () {
        $(this).tooltip('show');
    });
});