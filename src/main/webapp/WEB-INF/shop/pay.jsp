<%@ page import="com.usyd.group7.dao.OrderManager" %>
<%@ page import="com.usyd.group7.domain.Order" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.web.context.WebApplicationContext" %>
<%@ page import="java.util.List" %>
<%@ page import="com.usyd.group7.util.SessionUtil" %>
<%@ page import="com.usyd.group7.dao.OrderDetailManager" %>
<%@ page import="com.usyd.group7.service.OrderServices" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.usyd.group7.domain.OrderDetail" %>
<%@ page import="com.usyd.group7.domain.Integral" %>
<%@ page import="com.usyd.group7.dao.IntegralManager" %>
<%@ page import="com.usyd.group7.domain.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %><%
	User user = SessionUtil.getUser(request);
    List<Order> orderList = new ArrayList<Order>();
    Map<Long, Double> orderTotalPrice = new HashMap<Long, Double>();
    Integral integral = new Integral();

    if(user == null){
        response.sendRedirect("Product.htm");
    }else{
        ApplicationContext ctx = (ApplicationContext) config.getServletContext().getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
        OrderManager orderManager = (OrderManager) (ctx.getBean("orderManager"));
        OrderServices orderService = (OrderServices)(ctx.getBean(OrderServices.class));
        IntegralManager integralManager = (IntegralManager)(ctx.getBean(IntegralManager.class));
        long userID = SessionUtil.getUser(request).getUserID();

        integral = integralManager.getIntegral(userID);
        orderList = orderManager.getAllUnPayedOrderList(userID);
        if(orderList == null || orderList.isEmpty()){
            response.sendRedirect("Product.htm");
        }

        orderTotalPrice = orderService.getOrderTotalPrice(orderList);
    }
%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <!--[if IE]>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
    <title>InstrumentShop</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width">

    <link rel="stylesheet" href="../css/normalize.min.css">
    <link rel="stylesheet" href="../css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/animate.css">
    <link rel="stylesheet" href="../css/templatemo_misc.css">
    <link rel="stylesheet" href="../css/templatemo_style.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../css/product.css">
    <link rel="stylesheet" type="text/css" href="../css/pay.css">
    <link rel="stylesheet" type="text/css" href="../css/chosen.css">
    <link rel="stylesheet" type="text/css" href="../css/skin/square/green.css">
    <script src="../js/vendor/modernizr-2.6.2.min.js"></script>

</head>
<body>
<!--[if lt IE 7]>
<p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
    your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to
    improve your experience.</p>
<![endif]-->
<div id="front">
    <div class="site-header">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-6 col-xs-6">
                    <div id="templatemo_logo">
                        <h1><a href="../" title="The Instrument Shop" style="color: #ffffff;">H_Advice</a></h1>
                    </div>
                    <!-- /.logo -->
                </div>
            </div>
        </div>
        <!-- /.container -->
    </div>
    <!-- /.site-header -->
</div>
<!-- /#front -->

<div id="mainContainer" class="row clearfix clear-margin" style="margin: 0 0;">
    <div style="margin-top: 30px" class="col-sm-offset-2 col-sm-8">
        <div id="payPanel" class="panel panel-success">
            <div class="panel-heading">Ensure And Pay</div>
            <div class="panel-body">
                <table id="order" class="table table-bordered table-striped table-hover text-center">
                    <thead>
                    <tr>
                        <td>Order No</td>
                        <td>Order Time</td>
                        <td>Total Price</td>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="<%=orderList%>" var="order">
                        <tr>
                            <td><c:out value="${order.getOrderID()}"></c:out></td>
                            <td><c:out value="${order.getOrderTime()}"></c:out></td>
                            <td class="each-order-price">
                                <%=orderTotalPrice.get(((Order)(pageContext.getAttribute("order"))).getOrderID())%></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="panel panel-success" style="margin: 1%">
                    <div class="panel-heading">
                        <label>Pay:</label>
                    </div>
                    <div class="panel-body">
                        <div id="integralPanel" class="panel panel-success">
                            <div class="panel-body">
                                <div class="col-sm-10">
                                    <input id="useIntegral" type="checkbox" checked>
                                    <label for="useIntegral"
                                           data-toggle="tooltip" data-placement="top"
                                           data-original-title="Check this to use integral">Use Integral</label>
                                </div>
                                <div id="integralInfo" class="col-sm-10 show">
                                    <div class="col-sm-12">
                                        <h5>Need Integral To Pay For&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;
                                            <code id="integralNeed">0</code></h5>
                                        <h5>Remaing Integral To Use&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;
                                            <code id="remaingIntegral">
                                                <%=integral == null ? 0 : integral.getRemainingIntegral()%>
                                            </code></h5>
                                    </div>
                                    <div class="col-sm-12">
                                        <div class="input-group">
                                            <span class="input-group-addon">Input Integral: </span>
                                            <input type="number" id="integralToPay" class="form-control"
                                                   value="0" placeholder="Input integral to use">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="payPalPanel" class="panel panel-success" style="margin-top: 10px;">
                            <div class="panel-body">
                                <div class="col-sm-10">
                                    <input id="usePaypal" type="checkbox">
                                    <label for="usePaypal"
                                           data-toggle="tooltip" data-placement="top"
                                           data-original-title="Check this to use paypal">Use Paypal</label>
                                </div>
                                <div id="paypalInfo" class="col-sm-10 hide">
                                    <h5>Remaing To Pay&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;
                                        <code id="remaingMoney">$200</code></h5>
                                </div>
                                <div class="col-sm-offset-1 col-sm-5 hide">
                                    <script src="../js/paypal-button.min.js?merchant=gene.gn.zhu@gmail.com"
                                            data-button="buynow"
                                            data-name="Shopping Order"
                                            data-amount="2000.00"
                                            data-quantity="1"
                                            async="async"
                                            ></script>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-2 pull-right">
                            <span id="payBtn" class="btn btn-success col-sm-10">
                            <span class="glyphicon glyphicon-gbp"></span> Pay
                        </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="site-footer">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-6">
                <span>Copyright &copy; 2014 <a href="#">Cheerus</a></span>
            </div>
            <!-- /.col-md-6 -->
            <div class="col-md-6 col-sm-6">
                <ul class="social">
                    <li><a href="#" class="fa fa-facebook"></a></li>
                    <li><a href="#" class="fa fa-twitter"></a></li>
                    <li><a href="#" class="fa fa-instagram"></a></li>
                    <li><a href="#" class="fa fa-linkedin"></a></li>
                    <li><a href="#" class="fa fa-rss"></a></li>
                </ul>
            </div>
            <!-- /.col-md-6 -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /.container -->
</div>
<!-- /.site-footer -->

<script src="../js/vendor/jquery-1.10.1.min.js"></script>
<script>window.jQuery || document.write('<script   src="../js/vendor/jquery-1.10.1.min.js"><\/script>')</script>
<script src="../js/jquery.easing-1.3.js"></script>
<script src="../js/bootstrap.js"></script>
<script src="../js/plugins.js"></script>
<script type="text/javascript" src="../js/chosen.jquery.min.js"></script>
<script type="text/javascript" src="../js/icheck.js"></script>
<script type="text/javascript" src="../js/HomePage.js"></script>
<script type="text/javascript" src="../js/pay.js"></script>
</body>
</html>