$(document).ready(function () {

    var purchase = {
        init: function () {
            this.initUI();
            this.initData();
            this.bindUI();
        },
        initUI: function () {
            $('*[data-toggle=tooltip]').mouseover(function () {
                $(this).tooltip('show');
            });
            $('#country').chosen();
            $('#personName').focus();
        },
        initData: function () {
            this.calculatePrice();
        },
        bindUI: function () {
            var self = this;

            $('.productQuantity').change(function () {
                var $this = $(this);
                var quan = parseInt($this.val());

                self.calculatePrice($this.parent().parent(), quan);
            });

            $('.plus, .minus').click(function () {
                var $this = $(this);
                var quan = $this.siblings('.productQuantity').eq(0);

                if ($this.hasClass('plus')) {
                    quan.val(parseInt(quan.val()) + 1);
                } else {
                    if (parseInt(quan.val()) > 0) {
                        quan.val(parseInt(quan.val()) - 1);
                    }
                }

                self.calculatePrice($this.parent().parent(), parseInt(quan.val()));
            });

            $('#orderForm .form-group.has-feedback input').blur(function () {
                var $this = $(this);

                if ($this.val() == '') {
                    $this.parent().parent().addClass('has-error').removeClass('has-success');
                    $this.siblings().addClass('glyphicon-remove').removeClass('glyphicon-ok ');
                } else {
                    $this.parent().parent().removeClass('has-error').addClass('has-success');
                    $this.siblings().removeClass('glyphicon-remove').addClass('glyphicon-ok ');
                }
            });

            $('#orderBtn').click(function () {
                var data = {};
                var orderDetailString = {};

                $('#cartTable tbody tr').each(function () {
                    var $this = $(this);
                    orderDetailString[$this.attr('id')] = parseInt($this.find('.productQuantity').eq(0).val());
                });
                data['orderDetailString'] = JSON.stringify(orderDetailString);

                $('#orderForm').find('input,select').each(function () {
                    var $this = $(this);
                    data[$this.attr('id')] = $this.val();
                });

                $.ajax({
                    url: '../order/addOrder',
                    type: 'POST',
                    async: true,
                    dataType: 'json',
                    data: data,
                    success: function (resultInfo) {
                        if(resultInfo.success){
                            window.location.href = 'pay.htm';
                        }
                    }
                });
            });
        },
        calculatePrice: function (productItem, quan) {
            if (productItem != null) {
                var unitPrice = productItem.siblings('.unit-price').eq(0);
                unitPrice = unitPrice.find('span.unit-price').eq(0);
                var totalPrice = productItem.siblings('.total-price').eq(0);
                var priceInput = totalPrice.find('span.total-price').eq(0);
                priceInput.html(priceInput.html().replace(/[\d.]+/, parseInt(unitPrice.html().replace(/\D/g, '')) * quan));
            }

            var sumPrice = 0;
            $('#cartTable tbody tr').each(function () {
                var $this = $(this);
                var eachTotal = $this.find('span.total-price').eq(0);

                sumPrice += parseInt(eachTotal.html().replace(/[^0-9.]/g, ''));
            });

            $('#total').val('$ ' + sumPrice);
        }
    };

    purchase.init.apply(purchase);
});