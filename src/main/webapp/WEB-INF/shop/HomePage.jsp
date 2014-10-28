<%@ page import="com.usyd.group7.domain.User" %>
<%@ page import="com.usyd.group7.util.SessionUtil" %>
<%
    User user = SessionUtil.getUser(request);
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
                        <h1><a href="#" title="The Instrument Shop">Cheerus</a></h1>
                    </div>
                    <!-- /.logo -->
                </div>
                <!-- /.col-md-4 -->
                <div class="col-sm-7">
                    <a href="#" class="toggle-menu"><i class="fa fa-bars"></i></a>

                    <div class="main-menu">
                        <ul>
                            <li><a class="current" href="#">Home</a></li>
                            <li><a href="FeatureProduct.htm">Feature</a></li>
                            <li><a href="Product.htm">Products</a></li>
                            <li><a href="AboutUs.htm">Contact</a></li>
                        </ul>
                    </div>
                    <!-- /.main-menu -->
                </div>
                <!-- /.col-md-8 -->
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

<div id="mainContainer" class="row clearfix clear-margin" style="margin-top: 50px;">
    <div id="front" class="content-section">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="service-item">
                        <span class="service-icon first"></span>

                        <h3>Easy Customization</h3>

                        <p>Easy Customization, as we are so professional of kinds of instrument, we can diy it for you
                            if you need any manipulation of them.</p>
                    </div>
                    <!-- /.service-item -->
                </div>
                <!-- /.col-md-3 -->
                <div class="col-md-3 col-sm-6">
                    <div class="service-item">
                        <span class="service-icon second"></span>

                        <h3>Small Surprise</h3>

                        <p>We will offer you high quality of any kinds of instrument, also, we will give you some small
                            suprises when you buy given quanlity of instruments.</p>
                    </div>
                    <!-- /.service-item -->
                </div>
                <!-- /.col-md-3 -->
                <div class="col-md-3 col-sm-6">
                    <div class="service-item">
                        <span class="service-icon third"></span>

                        <h3>High Quality</h3>

                        <p>All of our instruments are of high quality, we also provide good service quanlity for you,
                            Buy our instruments, it will make you feel comfortable.</p>
                    </div>
                    <!-- /.service-item -->
                </div>
                <!-- /.col-md-3 -->
                <div class="col-md-3 col-sm-6">
                    <div class="service-item">
                        <span class="service-icon fourth"></span>

                        <h3>Professional Design</h3>

                        <p>Morbi id nisi enim. Ut congue interdum pharetra facilisi. Aenean consectetur pellentesque
                            mauris
                            nec ornare. Nam tortor justo, rutrum ut condimentum.</p>
                    </div>
                    <!-- /.service-item -->
                </div>
                <!-- /.col-md-3 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container -->
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

<script src="../js/vendor/jquery-1.10.1.min.js"></script>
<script>window.jQuery || document.write('<script   src="../js/vendor/jquery-1.10.1.min.js"><\/script>')</script>
<script src="../js/jquery.easing-1.3.js"></script>
<script src="../js/bootstrap.js"></script>
<script src="../js/plugins.js"></script>
<script type="text/javascript" src="../js/HomePage.js"></script>
<script type="text/javascript" src="../js/login.js"></script>
<script type="text/javascript">
    var isLogin = <%=user != null%>;
    if (isLogin == true) {
        var loginUserName = '<%=user == null ? "" : user.getUserName()%>';
        $('#userInfoPanel').removeClass('hide').addClass('show');
        $('#userInfo').html(loginUserName);
        $('#loginEntrance').addClass('hide');
        $('#updateUserName').val(loginUserName);
    }
</script>
</body>
</html>