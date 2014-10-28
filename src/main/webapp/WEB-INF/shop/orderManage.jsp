<%@ page import="com.usyd.group7.dao.OrderManager" %>
<%@ page import="com.usyd.group7.domain.Order" %>
<%@ page import="com.usyd.group7.domain.User" %>
<%@ page import="com.usyd.group7.util.SessionUtil" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.web.context.WebApplicationContext" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.usyd.group7.dao.OrderDetailManager" %>
<%
    ApplicationContext ctx = (ApplicationContext) config.getServletContext().getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);

    User user = SessionUtil.getUser(request);
    List<Order> orderList = new ArrayList<Order>();
    Map<Long, Double> orderPriceInfo = new HashMap<Long, Double>();

    if(user == null){
        response.sendRedirect("Product.htm");
    }else{
        OrderManager orderManager = ctx.getBean(OrderManager.class);
        OrderDetailManager orderDetailManager = ctx.getBean(OrderDetailManager.class);
        List<Long> orderIDList = new ArrayList<Long>();

        orderList = orderManager.getAllOrderList(user.getUserID());

        if(orderList != null && orderList.size() > 0){
            for(Order order : orderList){
                orderIDList.add(order.getOrderID());
            }

            orderPriceInfo = orderDetailManager.getOrderTotalPrice(orderIDList);
            System.out.println(orderIDList);
            System.out.println(orderPriceInfo);
        }
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
    <title>Cheerus</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width">

    <link rel="stylesheet" href="../css/normalize.min.css">
    <link rel="stylesheet" href="../css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/animate.css">
    <link rel="stylesheet" href="../css/templatemo_misc.css">
    <link rel="stylesheet" href="../css/templatemo_style.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../css/product.css">
    <link rel="stylesheet" type="text/css" href="../css/productmanage.css">
    <link rel="stylesheet" type="text/css" href="../css/purchase.css">
    <link rel="stylesheet" type="text/css" href="../css/chosen.css">
    <link rel="stylesheet" href="../css/bootstrap.icons.css">
    <link rel="stylesheet" href="../css/jquery.toolbars.css">
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
                <!-- /.col-md-4 -->
                <div class="col-md-8 col-sm-6 col-xs-6">
                    <a href="#" class="toggle-menu"><i class="fa fa-bars"></i></a>

                    <div class="main-menu">
                        <ul>
                             <li><a href="pay">Pay</a></li>
                                <li><a href="ProductManage.htm">P.Manage</a></li>
                                <li><a href="Product.htm"  >Products</a></li>
                                <li><a href="orderManage" class="current">O.Manage</a></li>
                        </ul>
                    </div>
                    <!-- /.main-menu -->
                </div>
                <!-- /.col-md-8 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-md-12">
                    <div class="responsive">
                        <div class="main-menu">
                            <ul>
                               <li><a href="pay">Pay</a></li>
                                <li><a href="ProductManage.htm">Product Manage</a></li>
                                <li><a href="Product.htm">Products</a></li>
                                <li><a href="orderManage" class="current">Order Manage</a></li>
                                 <li><a href="../products" class="current">Back to Roo</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.container -->
    </div>
    <!-- /.site-header -->
</div>
<!-- /#front -->

<div id="mainContainer" class="row clearfix clear-margin" style="margin: 0 0;">
    <div style="padding-top: 60px">
        <div id="orderList" class="col-sm-offset-2 col-sm-8 panel panel-info" style="margin-top: 30px;padding: 0">
            <div class="panel-heading">
                <h3 class="panel-title">All Orders</h3>
            </div>
            <div class="panel-body">
                <table id="orderTable" class="table table-striped table-hover text-center" style="vertical-align: middle;">
                    <thead>
                    <tr>
                        <th></th>
                        <th>OrderTime</th>
                        <th>OrderAddress</th>
                        <th>IsPayed</th>
                        <th>TotalPrice</th>
                        <th>PersonName</th>
                        <th>City</th>
                        <th>PostalCode</th>
                        <th>Country</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="order" items="<%=orderList%>">
                        <tr id="<c:out value="${order.getOrderID()}"></c:out>">
                            <td><span class="delete-row"
                                      data-toggle="tooltip" data-placement="bottom"
                                      data-original-title="remove this product"
                                    >×</span></td>
                            <td>
                                        <span class="orderTime"><c:out value="${order.getOrderTime()}"></c:out></span>
                            </td>
                            <td>
                                        <span class="orderAddress"><c:out value="${order.getOrderAddress()}"></c:out></span>
                            </td>
                            <td>
                                        <span class="isPayed"><c:out value="${order.isPayed()}"></c:out></span>
                            </td>
                            <td>
                                        <span class="totalPrice"><%=
                                        orderPriceInfo.containsKey(((Order) pageContext.getAttribute("order")).getOrderID())
                                        ? orderPriceInfo.get(((Order) pageContext.getAttribute("order")).getOrderID())
                                        : 0 %></span>
                            </td>
                            <td>
                                        <span class="personName"><c:out value="${order.getPersonName()}"></c:out></span>
                            </td>
                            <td>
                                        <span class="city"><c:out value="${order.getCity()}"></c:out></span>
                            </td>
                            <td>
                                        <span class="postalCode"><c:out value="${order.getPostalCode()}"></c:out></span>
                            </td>
                            <td>
                                        <span class="country"><c:out value="${order.getCountry()}"></c:out></span>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
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

<form id="editForm" action="../product/edit" method="post"></form>

<div id="product-toolbar-options" style="display: none">
    <a href="#"><i class="glyphicon glyphicon-trash" id="delete"
                   data-toggle="tooltip" title="delete this product" data-placement="bottom"></i></a>
    <a href="#"><i class="glyphicon glyphicon-pencil" id="update"
                   data-toggle="tooltip" title="update this product" data-placement="bottom"></i></a>
</div>

<script src="../js/vendor/jquery-1.10.1.min.js"></script>
<script>window.jQuery || document.write('<script   src="../js/vendor/jquery-1.10.1.min.js"><\/script>')</script>
<script src="../js/jquery.easing-1.3.js"></script>
<script src="../js/bootstrap.js"></script>
<script src="../js/plugins.js"></script>
<script src="../js/json.js"></script>
<script type="text/javascript" src="../js/chosen.jquery.min.js"></script>
<script type="text/javascript" src="../js/HomePage.js"></script>
<script type="text/javascript" src="../js/jquery.toolbar.js"></script>
<script type="text/javascript" src="../js/orderManage.js"></script>
</body>
</html>

