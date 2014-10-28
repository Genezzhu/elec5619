$(document).ready(function () {
    var pay = {
        _totalPrice: 0,
        _priceToIntegral: 10,
        _remainIntegral: 100,

        init: function () {
            this.initUI();
            this.bindUI();
        },
        initUI: function () {
            $('#payselection a:last').tab('show');

            /*set margin of maincontainer*/
            var mainContainer = $('#mainContainer');
            var marginHeight = parseInt(mainContainer.css('marginTop')) +
                parseInt(mainContainer.css('marginBottom'));
            var marginTop = 20;
            var ajustedMarginBottom = marginHeight - marginTop;
            mainContainer.css('marginTop', marginTop).css('marginBottom', ajustedMarginBottom);

            $('*[data-toggle=tooltip]').mouseover(function () {
                $(this).tooltip('show');
            });

            var self = this;
            $('#order tbody .each-order-price').each(function () {
                var $this = $(this);
                self._totalPrice += parseFloat($this.html());
            });

            $('#integralNeed').html(this._totalPrice * this._priceToIntegral);

            this._remainIntegral = parseInt($('#remaingIntegral').html());
        },
        bindUI: function () {
            var self = this;

            $('#usePaypal').click(function () {
                $('#paypalInfo').toggleClass('hide').toggleClass('show');
                if ($(this).is(":checked")) {
                    self.calculateRemaingPaypal();
                }
            });

            $('#useIntegral').click(function () {
                $('#integralInfo').toggleClass('hide').toggleClass('show');
            });

            $('#integralToPay').on('keyup', function (e) {
                if (e.keyCode < 48 || e.keyCode > 57) {
                    $(this).val($(this).val().replace(/\D/g, ''));
                }
                if ($(this).val() == '') {
                    $(this).val(0);
                }

                var total = self._remainIntegral;
                if (parseInt($(this).val()) > total) {
                    $(this).val(total);
                }
            });

            $('#integralToPay').blur(function () {
                if ($('#usePaypal').is(":checked")) {
                    self.calculateRemaingPaypal();
                }
            });

            $('#payBtn').click(function () {
                if ($('#useIntegral').is(':checked')) {
                    var data = {
                        integralToUse: $('#integralToPay').val()
                    };

                    $.ajax({
                        url: '../pay/payUsingIntegral',
                        dataType: 'json',
                        type: 'POST',
                        data: data,
                        success: function (json) {
                            if(json.success){
                                if($('#usePaypal').is(':checked')){
                                	alert('using paypal');
                                    self.payUsingPaypal();
                                }else if(parseInt(data.integralToUse) == parseInt($('#integralNeed').html())){
                                    alert('SuccessFully payed');
                                    window.location.href = "Product.htm";
                                }
                            }
                        }
                    });
                }else{
                    if($('#usePaypal').is(':checked')){
                        self.payUsingPaypal();
                    }
                }
            });
        },
        payUsingPaypal: function () {
            $('form.paypal-button').submit();
        },
        calculateRemaingPaypal: function () {
            var remainMoney = this._totalPrice;

            if ($('#useIntegral').is(':checked')) {
                var usedIntegral = parseInt($('#integralToPay').val());
                remainMoney -= usedIntegral / this._priceToIntegral;
            }

            if ($('#usePaypal').is(":checked")) {
                $('#payPalPanel form input[name=amount]').val(remainMoney);
                $('#remaingMoney').html('$' + remainMoney);
            }
        }

    };

    pay.init.apply(pay);
});