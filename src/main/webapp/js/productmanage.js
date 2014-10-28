$(document).ready(function () {
    var currentUpdateProductID = -1;

    $('*[data-toggle=tooltip]').mouseover(function () {
        $(this).tooltip('show');
    });

    $('.product-control').toolbar({
        content: '#product-toolbar-options',
        position: 'top',
        hover: true
    });

    $('.product-control').on('toolbarItemClick', function (event, item) {
        var $this = $(this);
        var target = $(item);
        var isUpdate = target.children().hasClass('glyphicon-pencil');
        var productItem = $this.closest('tr');

        if(isUpdate){
            currentUpdateProductID = $this.attr('productid');

            $('#productForm input[name=productID]').val(currentUpdateProductID);
            $('#productForm input[name=category]').val(productItem.find('.category').eq(0).html());
            $('#productForm input[name=brand]').val(productItem.find('.brand').eq(0).html());
            $('#productForm input[name=model]').val(productItem.find('.model').eq(0).html());
            $('#productForm input[name=price]').val(productItem.find('.price').eq(0).html());
            $('#productForm input[name=photo]').val(productItem.find('.photo').eq(0).html());

            $('#updateModel').on('shown.bs.modal', function(){
                $('#productForm input[name=category]').focus();
            });
            $('#updateModel').modal('show');
        }else{
            window.location.href = "../product/delete.htm?productid=" + $this.attr('productid');
        }
    });

    $('#updateBtn').click(function () {
        $('#productID').val(currentUpdateProductID);
        $('#productForm').attr("action","../product/update/").submit();
    });

    $('#addBtn').click(function () {
        $('#productForm input[name=productID]').attr('disabled', false);
        $('#productForm input[name=productID]').val();
        $('#productForm input[name=category]').val();
        $('#productForm input[name=brand]').val();
        $('#productForm input[name=model]').val();
        $('#productForm input[name=price]').val();
        $('#productForm input[name=photo]').val();

        $('#productForm').attr("action","../product/add/");

        $('#updateModel').on('shown.bs.modal', function(){
            $('#productForm input[name=category]').focus();
        });
        $('#updateModel').modal('show');
    });
});