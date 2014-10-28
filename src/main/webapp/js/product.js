$(document).ready(function () {
    $('#search-btn').click(function () {
        if($('#keyword').val() == ""){
            $('.product-item').parent().show();
            $('#keyword').focus();
        }else{
            var keyword = $('#keyword').val();
            $('.product-item').each(function(index, ele){
               if($(ele).find('.productBrand').html() != keyword){
                   $(ele).parent().hide();
               }
            });
        }
    });

    $('.view-detail').click(function(){
        var id = $(this).parents('.product-item').attr('id');
        addToCart(id);
        $('#productArea').slideDown();
    });

    $('#collapseProductArea').add($('#showControllerBtn')).click(function(){
        $('#selectProduct').add($('#showControllerBtn')).slideToggle();
    });

    $('#purchase').click(function(){

        if(!isLogin){
            $('#myModal').modal('show');
            $('#loginUserName').focus();
            return;
        }

        var $productList = $('#productList');

        if( $productList.children().length == 0) {
            alert('Please select some produt first!');
        }else{
            var productList = [];

            $('#productList .productItem').each(function(){
                productList.push(this.id.replace(/[^-]+-/,''));
            });

            productList = productList.join(',');

            $.ajax({
                url : '../cart/addToCart',
                dataType : 'json',
                type : 'POST',
                async : true,
                data:{
                    products: productList
                },
                success: function(data){
                    if(data.success){
                        window.location.href = "purchase.htm";
                    }else{
                        if(data.errorCode == '401'){
                            alert('Oops, something went wrong!Try again!')
                        }
                    }
                }
            });
        }
    });

    var productTemplate = "<div id='productItem-$ID' class='productItem'></div>";
    var productNameTemplate = "<span class='productItemModel'>$Name</span>";
    var productQuanControllerTemplate = "<img class='productItemQuanController' src='$photo' width='30' height='30'/>";
    var productQuanTemplate = "<input class='productItemQuan form-control' value='$quan' disabled/>";
    var replaceRegex = /\$\w+/;

    function addToCart(id){
        var $productList = $('#productList');
        var productInfo = $('#productItem-' + id);
        var productIndicator = $('#noProductIndicator');
        var product = $('#' + id);

        if(productInfo.length != 0){
//            var quanEle = productInfo.find('.productItemQuan').eq(0);
//            var quan = parseInt(quanEle.val());
//            quanEle.val(quan + 1);
        }else{
            var productItem = $(productTemplate.replace(replaceRegex, id));
            var productName = $(productNameTemplate.
                replace(replaceRegex, (product.find('.productName').eq(0).text())));
            productName.css('marginTop', (productItem.height() - productName.css('offsetHeight')) /2);
            var thumbNail = $(productQuanControllerTemplate.replace(
                replaceRegex, product.find('.item-thumb img').attr('src')));
            thumbNail.css('marginTop', (productItem.height() - thumbNail.height()) /2);
            var productQuan = $(productQuanTemplate.replace(replaceRegex, 1));

            productItem.append(thumbNail).append(productName).append(productQuan);
            $productList.prepend(productItem);
            productIndicator.hide();

            productQuan.change(function () {
                calculatePrice();
            });

        }
    }

    function productControll(e){
        var $this = $(this);
        var currentProductItem = $this.parent();
        var currentProductQuan = $(this).siblings('input');
        var currentQuanValue = parseInt(currentProductQuan.val());
        var $productList = $('#productList');
        var productIndicator = $('#noProductIndicator');

        if($(this).hasClass('minus')){
            if( currentQuanValue == 1){
                currentProductItem.remove();
                if($productList.children().length == 0){
                    productIndicator.show();
                }
            }else{
                currentProductQuan.val(currentQuanValue - 1);
            }
        }else{
            currentProductQuan.val( currentQuanValue + 1);
        }

        calculatePrice();
    }

    function calculatePrice(){
        var sumPrice = 0.0;

        $('.productItem').each(function(){
            var $this = $(this);
            var id = $(this).attr('id').replace(/\D+/,'');

            var productPrice = $('#product' + id).find('.price').eq(0).text().replace(/^\D*/,'');
            productPrice = parseFloat(productPrice);

            var quan = $(this).find('.productItemQuan').eq(0).val();
            quan = parseInt(quan);

            sumPrice += quan * productPrice;
        });

        $('#total').val(sumPrice);
    }

    void function checkIfLogin(){
        $.ajax({
            url : 'login',
            dataType : 'json',
            type : 'POST',
            data:{
                username : 1,
                passwd :1

            },
            success: function(data){
                if(data.success){
                    window.location.href = 'purchase.htm';
                }else{
                    if(data.errorCode == '401'){
                        window.location.href = 'login.html';
                    }
                }
            }
        });
    }

    $('#keyword').focus();
});