<%@ page import="com.usyd.group7.domain.Products" %>
<%@ page import="com.usyd.group7.domain.User" %>
<%@ page import="com.usyd.group7.util.SessionUtil" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.web.context.WebApplicationContext" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Set" %>
<%@ page import="com.usyd.group7.dao.ProductManager" %>
<%@ page import="java.util.ArrayList" %>
<%
	ApplicationContext ctx = (ApplicationContext) config.getServletContext().getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
    double total = 0;

    ProductManager productManager = (ProductManager) ctx.getBean("productManager");
    List<Products> productList = productManager.getProducts();
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
                                <li><a href="ProductManage.htm" class="current">P.Manage</a></li>
                                <li><a href="Product.htm"  >Products</a></li>
                                <li><a href="orderManage" >O.Manage</a></li>
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
                                <li><a href="#front">Home</a></li>
                                <li><a href="#services">Services</a></li>
                                <li><a href="#products">Products</a></li>
                                <li><a href="AboutUs.htm">Contact</a></li>
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
    <div style="margin-top: 30px">
        <div id="productList" class="col-sm-offset-3 col-sm-6 panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">All Products&nbsp;<span id="addBtn" class="glyphicon glyphicon-plus"></span> </h3>
            </div>
            <div class="panel-body">
                <table id="cartTable" class="table table-striped table-hover" style="vertical-align: middle;">
                    <thead>
                    <tr>
                        <th></th>
                        <th>photo</th>
                        <th>#</th>
                        <th>model</th>
                        <th>category</th>
                        <th>brand</th>
                        <th>price</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="product" items="<%=productList%>">
                        <tr id="<c:out value="${product.getProductID()}"></c:out>">
                            <td><span class="product-control" productID="<c:out value="${product.getProductID()}"></c:out>"
                                    ><span class="glyphicon glyphicon-cog"></span></span></td>
                            <td><img src="../images/products/${product.getPhoto()}"
                                     height="30px" width="30px">
                                <span class="photo hidden"><c:out value="${product.getPhoto()}"></c:out></span></td>
                            <td>
                                        <span class="productID"><c:out value="${product.getProductID()}"></c:out></span>
                            </td>
                            <td>
                                        <span class="model"><c:out value="${product.getModel()}"></c:out></span>
                            </td>
                            <td>
                                        <span class="category"><c:out value="${product.getCategory()}"></c:out></span>
                            </td>
                            <td>
                                        <span class="brand"><c:out value="${product.getBrand()}"></c:out></span>
                            </td>
                            <td class="unit-price">
                                        <span>
                                            $
                                        </span>
                                        <span class="price"><c:out value="${product.getPrice()}"></c:out></span>
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

<form id="editForm" action="../product/update" method="post"></form>

<div id="product-toolbar-options" style="display: none">
    <a href="#"><i class="glyphicon glyphicon-trash" id="delete"
                   data-toggle="tooltip" title="delete this product" data-placement="bottom"></i></a>
    <a href="#"><i class="glyphicon glyphicon-pencil" id="update"
                   data-toggle="tooltip" title="update this product" data-placement="bottom"></i></a>
</div>

<div class="modal fade" id="updateModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Update/Add Product Panel</h4>
            </div>
            <div class="modal-body" id="modalbody">
                <div class="row text-center clear-margin">
                    <div class="row clear-margin">
                        <form id="productForm" method="post">
                            <div class="form-group">
                                <h4 class="col-sm-offset-1 col-sm-3">ProductID : </h4>
                                <input name="productID" class="col-sm-offset-1 col-sm-4 form-control"
                                       style="width: 33%"
                                        >
                            </div>
                            <div class="form-group">
                                <h4 class="col-sm-offset-1 col-sm-3">Category : </h4>
                                <input name="category" class="col-sm-offset-1 col-sm-4 form-control"
                                       style="width: 33%"
                                        >
                            </div>
                            <div class="form-group">
                                <h4 class="col-sm-offset-1 col-sm-3">Brand : </h4>
                                <input name="brand" class="col-sm-offset-1 col-sm-4 form-control"
                                       style="width: 33%">
                            </div>
                            <div class="form-group">
                                <h4 class="col-sm-offset-1 col-sm-3">Model : </h4>
                                <input name="model" class="col-sm-offset-1 col-sm-4 form-control"
                                       style="width: 33%">
                            </div>
                            <div class="form-group">
                                <h4 class="col-sm-offset-1 col-sm-3">price : </h4>
                                <input name="price" class="col-sm-offset-1 col-sm-4 form-control"
                                       style="width: 33%"
                                       type="number" value="0">
                            </div>
                            <div class="form-group">
                                <h4 class="col-sm-offset-1 col-sm-3">Photo : </h4>
                                <input name="photo" class="col-sm-offset-1 col-sm-4 form-control"
                                       style="width: 33%"
                                       >
                            </div>
                            <div class="form-group">
                                <span id="updateBtn" class="btn btn-success col-sm-offset-7 col-sm-2">
                                    <span class="glyphicon glyphicon-user"></span> Submit
                                </span>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
<script type="text/javascript" src="../js/productmanage.js"></script>
</body>
</html>

