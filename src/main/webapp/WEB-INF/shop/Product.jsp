<%@ page import="com.usyd.group7.dao.OrderManager" %>
<%@ page import="com.usyd.group7.dao.ProductManager" %>
<%@ page import="com.usyd.group7.domain.Products" %>
<%@ page import="com.usyd.group7.domain.User" %>
<%@ page import="com.usyd.group7.util.SessionUtil" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.web.context.WebApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="java.util.List" %>
<%
	ApplicationContext ctx = (ApplicationContext) config.getServletContext().getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
    OrderManager orderManager = (OrderManager) (ctx.getBean("orderManager"));
    ProductManager productManager = (ProductManager) (ctx.getBean(ProductManager.class));
    List<Products> productList = productManager.getProducts();
    System.out.println("User:" + request.getSession().getAttribute("user"));
    User loginUser = SessionUtil.getUser(request);
    System.out.println("IN PRODUCT.JSP: " + (loginUser != null));
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

    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/normalize.min.css">
    <link rel="stylesheet" href="../css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/animate.css">
    <link rel="stylesheet" href="../css/templatemo_misc.css">
    <link rel="stylesheet" href="../css/templatemo_style.css">
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <link rel="stylesheet" type="text/css" href="../css/product.css">
    <link rel="stylesheet" type="text/css" href="../css/login.css">
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
                <div class="col-sm-4">
                    <div id="templatemo_logo">
                        <h1><a href="../" title="The Instrument Shop" style="color: #ffffff;">H_Advice</a></h1>
                    </div>
                    <!-- /.logo -->
                </div>
                <!-- /.col-md-4 -->
                <div class="col-sm-7">
                    <a href="#" class="toggle-menu"><i class="fa fa-bars"></i></a>

                    <div class="main-menu">
                        <ul>
                             <li><a href="pay">Pay</a></li>
                                <li><a href="ProductManage.htm">P.Manage</a></li>
                                <li><a href="Product.htm"  class="current">Products</a></li>
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
        <div class="userPanel">
            <div id="userInfoPanel" class="dropdown hide">
                <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1"
                        data-toggle="dropdown">
                    <code id="userInfo"></code>
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                    <li role="presentation" id="updateUserInfoRole"><a role="menuitem" tabindex="-1" href="#">
                        <span class="glyphicon glyphicon-edit"></span>&nbsp;Update UserInfo</a></li>
                    <li class="divider"></li>
                    <li role="presentation" id="logoutInfoRole"><a role="menuitem" tabindex="-1" href="#">
                        <span class="glyphicon glyphicon-log-out"></span>&nbsp;Log Out</a></li>
                </ul>
            </div>
            <code id="loginEntrance">Login</code>
        </div>
        <!-- /.container -->
    </div>
    <!-- /.site-header -->
</div>
<!-- /#front -->

<div id="mainContainer" class="row clearfix clear-margin" style="margin-top: 50px;">
    <div id="products" class="content-section">
        <div class="container">
            <div class="row">
                <form class="" role="search" action="#">
                    <div class="form-group col-sm-6 row">
                        <input type="text" class="form-control col-sm-4" id="keyword"
                               placeholder="input brandName to search">
                        <button type="button" id="search-btn"
                                class="col-sm-offset-1 col-sm-2 btn btn-success">Search
                        </button>
                    </div>
                </form>
            </div>
            <div class="row">
                <c:forEach var="product" items="<%=productList%>">
                    <div class="col-md-3 col-sm-6">
                        <div class="product-item" id="<c:out value="${product.getProductID()}"></c:out>">
                            <div class="item-thumb">
                                <div class="overlay">
                                    <div class="overlay-inner">
                                        <a href="#nogo" class="view-detail">Add to Cart</a>
                                    </div>
                                </div>
                                <!-- /.overlay -->
                                <img src="../images/products/<c:out value="${product.getPhoto()}"></c:out>" alt="">
                            </div>
                            <!-- /.item-thumb -->
                            <h3>Name : <span class="productName"><c:out
                                    value="${product.getModel()}"></c:out></span></h3>

                            <h3>Brand : <span class="productBrand"><c:out value="${product.getBrand()}"></c:out></span>
                            </h3>
                                <span>Price:
                                    <em class="text-muted">$<c:out value="${product.getPrice() * 1.2}"></c:out></em>
                                    - <em class="price" price="<c:out value="${product.getPrice()}"></c:out>">
                                        $<c:out value="${product.getPrice()}"></c:out></em></span>
                        </div>
                        <!-- /.product-item -->
                    </div>
                    <!-- /.col-md-3 -->
                </c:forEach>
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container -->
    </div>
    <!-- /#products -->
</div>

<div id="selectProduct">
    <div id="productArea">
        <div id="popupTitle" class="row clear-fix">
            <label class="cart_product_info col-sm-offset-1 col-sm-8" style="font-size: 14px;"> Shopping Cart
            </label>
                    <span id="collapseProductArea" title="minimized the shopping cart"
                          class="glyphicon glyphicon-minus pull-right"
                          style="margin: 5px 5px 0 0;cursor: pointer"></span>
        </div>
        <div id="noProductIndicator" class="text-center" style="padding: 10px;">
            Select Your Favourite!
        </div>
        <div id="productList" class="clear-float">
        </div>
    </div>
    <div id="calculate" class="clear-float">
        <span id="purchase" class="btn btn-info pull-right">
            <span class="glyphicon glyphicon-shopping-cart"></span>
            buy
        </span>
    </div>
</div>

<span class="btn btn-success" id="showControllerBtn" style="display: none;">
    <span class="glyphicon glyphicon-shopping-cart"></span>
    Show/Hide Cart
</span>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Login/Register Panel</h4>
            </div>
            <div class="modal-body" id="modalbody">
                <div id="navPanel" class="row clear-margin">
                    <ul class="nav nav-pills col-sm-offset-1 col-sm-10">
                        <li class="active col-sm-offset-2 col-sm-4 text-center">
                            <a href="#" panel="loginPanel">
                                <span class="glyphicon glyphicon glyphicon-home"></span>
                                Login
                            </a>
                        </li>
                        <li class="col-sm-offset-2 col-sm-4 text-center">
                            <a href="#" panel="registerPanel">
                                <span class="glyphicon glyphicon-user"></span>
                                Register
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="banner">
                    <div id="loginPanel" class="slide-panel">
                        <div class="row text-center">
                            <div class="row">
                                <form id="loginForm" action="user/login.htm" method="post">
                                    <div class="form-group">
                                        <h4 class="col-sm-offset-1 col-sm-3">UserName : </h4>
                                        <input id="loginUserName" class="col-sm-offset-1 col-sm-4 form-control"
                                               style="width: 33%"
                                               type="text">
                                    </div>
                                    <div class="form-group">
                                        <h4 class="col-sm-offset-1 col-sm-3">PassWord : </h4>
                                        <input id="loginPasswd" class="col-sm-offset-1 col-sm-4 form-control"
                                               style="width: 33%"
                                               type="password">
                                    </div>
                                    <div class="form-group">
                                        <span class="col-sm-offset-6 col-sm-1"> </span>
                        <span id="loginBtn" class="btn btn-success col-sm-2">
                            <span class="glyphicon glyphicon-ok"></span> Login
                        </span>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div id="registerPanel" class="slide-panel" style="display: none;">
                        <div class="row text-center">
                            <div class="row">
                                <form id="loginForm">
                                    <div class="form-group">
                                        <h4 class="col-sm-offset-1 col-sm-3">UserName : </h4>
                                        <input id="userName" class="col-sm-offset-1 col-sm-4 form-control"
                                               style="width: 33%"
                                               >
                                    </div>
                                    <div class="form-group">
                                        <h4 class="col-sm-offset-1 col-sm-3">PassWord : </h4>
                                        <input id="passwd" class="col-sm-offset-1 col-sm-4 form-control"
                                               style="width: 33%"
                                               type="password">
                                    </div>
                                    <div class="form-group">
                                        <h4 class="col-sm-offset-1 col-sm-3">PassWord : </h4>
                                        <input id="repeatPasswd" class="col-sm-offset-1 col-sm-4 form-control"
                                               style="width: 33%"
                                               type="password">
                                    </div>
                                    <div class="form-group">
                                        <h4 class="col-sm-offset-1 col-sm-3">Telephone : </h4>
                                        <input id="telephone" class="col-sm-offset-1 col-sm-4 form-control"
                                               style="width: 33%"
                                               type="telephone">
                                    </div>
                                    <div class="form-group">
                                        <h4 class="col-sm-offset-1 col-sm-3">Address: </h4>
                                        <input id="address" class="col-sm-offset-1 col-sm-4 form-control"
                                               style="width: 33%"
                                               type="address">
                                    </div>
                                    <div class="form-group">
                                        <h4 class="col-sm-offset-1 col-sm-3">Sex: </h4>
                                        <input id="sex" class="col-sm-offset-1 col-sm-4 form-control"
                                               style="width: 33%"
                                               >
                                    </div>
                                    <div class="form-group">
                                        <span id="registerBtn" class="btn btn-success col-sm-offset-7 col-sm-2">
                                            <span class="glyphicon glyphicon-user"></span> Register
                                        </span>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<div class="modal fade" id="updateModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Update UserInfo Panel</h4>
            </div>
            <div class="modal-body" id="modalbody">
                <div class="row text-center">
                    <div class="row">
                        <form id="loginForm">
                            <div class="form-group">
                                <h4 class="col-sm-offset-1 col-sm-3">UserName : </h4>
                                <input id="updateUserName" class="col-sm-offset-1 col-sm-4 form-control"
                                       style="width: 33%" disabled
                                        >
                            </div>
                            <div class="form-group">
                                <h4 class="col-sm-offset-1 col-sm-3">PassWord : </h4>
                                <input id="updatePasswd" class="col-sm-offset-1 col-sm-4 form-control"
                                       style="width: 33%"
                                       type="password">
                            </div>
                            <div class="form-group">
                                <h4 class="col-sm-offset-1 col-sm-3">PassWord : </h4>
                                <input id="updateRepeatPasswd" class="col-sm-offset-1 col-sm-4 form-control"
                                       style="width: 33%"
                                       type="password">
                            </div>
                            <div class="form-group">
                                <h4 class="col-sm-offset-1 col-sm-3">Telephone : </h4>
                                <input id="telephone" class="col-sm-offset-1 col-sm-4 form-control"
                                       style="width: 33%"
                                       type="telephone">
                            </div>
                            <div class="form-group">
                                <h4 class="col-sm-offset-1 col-sm-3">Address: </h4>
                                <input id="updateAddress" class="col-sm-offset-1 col-sm-4 form-control"
                                       style="width: 33%"
                                       type="address">
                            </div>
                            <div class="form-group">
                                <h4 class="col-sm-offset-1 col-sm-3">Sex: </h4>
                                <input id="updateSex" class="col-sm-offset-1 col-sm-4 form-control"
                                       style="width: 33%"
                                        >
                            </div>
                            <div class="form-group">
                                <span id="updateBtn" class="btn btn-success col-sm-offset-7 col-sm-2">
                                    <span class="glyphicon glyphicon-user"></span> Update
                                </span>
                            </div>
                        </form>
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

<script>
    var isLogin =
    <%=loginUser != null%>
</script>
<script src="../js/vendor/jquery-1.10.1.min.js"></script>
<script>window.jQuery || document.write('<script   src="../js/vendor/jquery-1.10.1.min.js"><\/script>')</script>
<script src="../js/jquery.easing-1.3.js"></script>
<script src="../js/bootstrap.js"></script>
<script src="../js/plugins.js"></script>
<script type="text/javascript" src="../js/slider.js"></script>
<script type="text/javascript" src="../js/product.js"></script>
<script type="text/javascript" src="../js/login.js"></script>
<script type="text/javascript">
    var isLogin = <%=loginUser != null%>;
    if (isLogin == true) {
        var loginUserName = '<%=loginUser == null ? "" : loginUser.getUserName()%>';
        $('#userInfoPanel').removeClass('hide').addClass('show');
        $('#userInfo').html(loginUserName);
        $('#loginEntrance').addClass('hide');
        $('#updateUserName').val(loginUserName);
    }
</script>
</body>
</html>