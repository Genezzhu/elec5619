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
    User loginUser = SessionUtil.getUser(request);
    double total = 0;
    List<Products> productInCart = new ArrayList<Products>();

    if (loginUser == null) {
        response.sendRedirect("Product.htm");
    } else {
        ProductManager productManager = (ProductManager) ctx.getBean("productManager");
        Set<String> cart = SessionUtil.getCart(request);
        productInCart = productManager.getProductList(cart);

        System.out.println(productInCart);
        for (Products product : productInCart) {
            Integer num = 1;
            if (num != null) {
                total += num * product.getPrice();
            }
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

    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/normalize.min.css">
    <link rel="stylesheet" href="../css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/animate.css">
    <link rel="stylesheet" href="../css/templatemo_misc.css">
    <link rel="stylesheet" href="../css/templatemo_style.css">
    <link rel="stylesheet" type="text/css" href="../css/product.css">
    <link rel="stylesheet" type="text/css" href="../css/purchase.css">
    <link rel="stylesheet" type="text/css" href="../css/chosen.css">
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
                        <h1><a href="Product" title="The Instrument Shop" style="color: #ffffff;">H_Advice</a></h1>
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
        <!-- /.container -->
    </div>
    <!-- /.site-header -->
</div>
<!-- /#front -->

<div id="mainContainer" class="row clearfix clear-margin" style="margin: 0 0;">
<div style="margin-top: 30px">
<div id="cartInfo" class="col-sm-offset-1 col-sm-5 panel panel-info">
    <div class="panel-heading">
        <h3 class="panel-title">Your Cart</h3>
    </div>
    <div class="panel-body">
        <table id="cartTable" class="table table-striped table-hover" style="vertical-align: middle;">
            <thead>
            <tr>
                <th></th>
                <th></th>
                <th>Product</th>
                <th>UnitPrice</th>
                <th>Quantity</th>
                <th>Total</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="product" items="<%=productInCart%>">
                <tr id="<c:out value="${product.getProductID()}"></c:out>">
                    <td><span class="delete-row"
                              data-toggle="tooltip" data-placement="bottom"
                              data-original-title="remove this product"
                            >×</span></td>
                    <td><img src="../images/products/${product.getPhoto()}"
                             height="30px" width="30px"></td>
                    <td>
                                        <span class="model">
                                            <c:out value="${product.getModel()}"></c:out>
                                        </span>
                    </td>
                    <td class="unit-price">
                                        <span>
                                            $
                                        </span>
                                        <span class="unit-price">
                                           <fmt:formatNumber value="${product.getPrice()}"></fmt:formatNumber>
                                        </span>
                    </td>
                    <td>
                        <div class="quantity">
                            <input class="plus" type="button" value="+">
                            <input class="productQuantity" value="1">
                            <input class="minus" type="button" value="-">
                        </div>
                    </td>
                    <td class="total-price">
                        <span>$</span>
                                        <span class="total-price">
                                            <fmt:formatNumber value="${product.getPrice()}"></fmt:formatNumber>
                                        </span>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <form id="productForm" class="row clear-fix form-horizontal">
            <div class="form-group col-sm-7 row pull-right">
                <label class="control-label col-sm-7 text-right">Total: </label>

                <div class="col-sm-5">
                    <input id="total" class="form-control pull-left"
                           type="text" disabled value="<%=total%>">
                </div>
            </div>
        </form>
    </div>
</div>
<div id="personalInfo" class="col-sm-offset-1 col-sm-4 text-center panel panel-info" style="color: #000000">
<div class="panel-heading">
    <h3 class="panel-title">Ship Info</h3>
</div>
<div class="panel-body">
<div class="row clear-fix">
<form id="orderForm" class="form-horizontal">
<div class="form-group">
<label class="control-label col-sm-4" for="country">Select Country</label>

<div class="col-sm-8">
<select id="country" class="form-control">
<option selected>Australia</option>
<option>Åland Islands</option>
<option>Afghanistan</option>
<option>Albania</option>
<option>Algeria</option>
<option>Andorra</option>
<option>Angola</option>
<option>Anguilla</option>
<option>Antarctica</option>
<option>Antigua and Barbuda</option>
<option>Argentina</option>
<option>Armenia</option>
<option>Aruba</option>
<option>Austria</option>
<option>Azerbaijan</option>
<option>Bahamas</option>
<option>Bahrain</option>
<option>Bangladesh</option>
<option>Barbados</option>
<option>Belarus</option>
<option>Belau</option>
<option>Belgium</option>
<option>Belize</option>
<option>Benin</option>
<option>Bermuda</option>
<option>Bhutan</option>
<option>Bolivia</option>
<option>Bonaire, Saint Eustatius and Saba</option>
<option>Bosnia and Herzegovina</option>
<option>Botswana</option>
<option>Bouvet Island</option>
<option>Brazil</option>
<option>British Indian Ocean Territory</option>
<option>British Virgin Islands</option>
<option>Brunei</option>
<option>Bulgaria</option>
<option>Burkina Faso</option>
<option>Burundi</option>
<option>Cambodia</option>
<option>Cameroon</option>
<option>Canada</option>
<option>Cape Verde</option>
<option>Cayman Islands</option>
<option>Central African Republic</option>
<option>Chad</option>
<option>Chile</option>
<option>China</option>
<option>Christmas Island</option>
<option>Cocos (Keeling) Islands</option>
<option>Colombia</option>
<option>Comoros</option>
<option>Congo (Brazzaville)</option>
<option>Congo (Kinshasa)</option>
<option>Cook Islands</option>
<option>Costa Rica</option>
<option>Croatia</option>
<option>Cuba</option>
<option>CuraÇao</option>
<option>Cyprus</option>
<option>Czech Republic</option>
<option>Denmark</option>
<option>Djibouti</option>
<option>Dominica</option>
<option>Dominican Republic</option>
<option>Ecuador</option>
<option>Egypt</option>
<option>El Salvador</option>
<option>Equatorial Guinea</option>
<option>Eritrea</option>
<option>Estonia</option>
<option>Ethiopia</option>
<option>Falkland Islands</option>
<option>Faroe Islands</option>
<option>Fiji</option>
<option>Finland</option>
<option>France</option>
<option>French Guiana</option>
<option>French Polynesia</option>
<option>French Southern Territories</option>
<option>Gabon</option>
<option>Gambia</option>
<option>Georgia</option>
<option>Germany</option>
<option>Ghana</option>
<option>Gibraltar</option>
<option>Greece</option>
<option>Greenland</option>
<option>Grenada</option>
<option>Guadeloupe</option>
<option>Guatemala</option>
<option>Guernsey</option>
<option>Guinea</option>
<option>Guinea-Bissau</option>
<option>Guyana</option>
<option>Haiti</option>
<option>Heard Island and McDonald Islands</option>
<option>Honduras</option>
<option>Hong Kong</option>
<option>Hungary</option>
<option>Iceland</option>
<option>India</option>
<option>Indonesia</option>
<option>Iran</option>
<option>Iraq</option>
<option>Isle of Man</option>
<option>Israel</option>
<option>Italy</option>
<option>Ivory Coast</option>
<option>Jamaica</option>
<option>Japan</option>
<option>Jersey</option>
<option>Jordan</option>
<option>Kazakhstan</option>
<option>Kenya</option>
<option>Kiribati</option>
<option>Kuwait</option>
<option>Kyrgyzstan</option>
<option>Laos</option>
<option>Latvia</option>
<option>Lebanon</option>
<option>Lesotho</option>
<option>Liberia</option>
<option>Libya</option>
<option>Liechtenstein</option>
<option>Lithuania</option>
<option>Luxembourg</option>
<option>Macao S.A.R., China</option>
<option>Macedonia</option>
<option>Madagascar</option>
<option>Malawi</option>
<option>Malaysia</option>
<option>Maldives</option>
<option>Mali</option>
<option>Malta</option>
<option>Marshall Islands</option>
<option>Martinique</option>
<option>Mauritania</option>
<option>Mauritius</option>
<option>Mayotte</option>
<option>Mexico</option>
<option>Micronesia</option>
<option>Moldova</option>
<option>Monaco</option>
<option>Mongolia</option>
<option>Montenegro</option>
<option>Montserrat</option>
<option>Morocco</option>
<option>Mozambique</option>
<option>Myanmar</option>
<option>Namibia</option>
<option>Nauru</option>
<option>Nepal</option>
<option>Netherlands</option>
<option>Netherlands Antilles</option>
<option>New Caledonia</option>
<option>New Zealand</option>
<option>Nicaragua</option>
<option>Niger</option>
<option>Nigeria</option>
<option>Niue</option>
<option>Norfolk Island</option>
<option>North Korea</option>
<option>Norway</option>
<option>Oman</option>
<option>Pakistan</option>
<option>Palestinian Territory</option>
<option>Panama</option>
<option>Papua New Guinea</option>
<option>Paraguay</option>
<option>Peru</option>
<option>Philippines</option>
<option>Pitcairn</option>
<option>Poland</option>
<option>Portugal</option>
<option>Qatar</option>
<option>Republic of Ireland</option>
<option>Reunion</option>
<option>Romania</option>
<option>Russia</option>
<option>Rwanda</option>
<option>São Tomé and Príncipe</option>
<option>Saint Barthélemy</option>
<option>Saint Helena</option>
<option>Saint Kitts and Nevis</option>
<option>Saint Lucia</option>
<option>Saint Martin (Dutch part)</option>
<option>Saint Martin (French part)</option>
<option>Saint Pierre and Miquelon</option>
<option>Saint Vincent and the Grenadines</option>
<option>San Marino</option>
<option>Saudi Arabia</option>
<option>Senegal</option>
<option>Serbia</option>
<option>Seychelles</option>
<option>Sierra Leone</option>
<option>Singapore</option>
<option>Slovakia</option>
<option>Slovenia</option>
<option>Solomon Islands</option>
<option>Somalia</option>
<option>South Africa</option>
<option>South Georgia/Sandwich Islands</option>
<option>South Korea</option>
<option>South Sudan</option>
<option>Spain</option>
<option>Sri Lanka</option>
<option>Sudan</option>
<option>Suriname</option>
<option>Svalbard and Jan Mayen</option>
<option>Swaziland</option>
<option>Sweden</option>
<option>Switzerland</option>
<option>Syria</option>
<option>Taiwan</option>
<option>Tajikistan</option>
<option>Tanzania</option>
<option>Thailand</option>
<option>Timor-Leste</option>
<option>Togo</option>
<option>Tokelau</option>
<option>Tonga</option>
<option>Trinidad and Tobago</option>
<option>Tunisia</option>
<option>Turkey</option>
<option>Turkmenistan</option>
<option>Turks and Caicos Islands</option>
<option>Tuvalu</option>
<option>Uganda</option>
<option>Ukraine</option>
<option>United Arab Emirates</option>
<option>United Kingdom (UK)</option>
<option>United States (US)</option>
<option>Uruguay</option>
<option>Uzbekistan</option>
<option>Vanuatu</option>
<option>Vatican</option>
<option>Venezuela</option>
<option>Vietnam</option>
<option>Wallis and Futuna</option>
<option>Western Sahara</option>
<option>Western Samoa</option>
<option>Yemen</option>
<option>Zambia</option>
<option>Zimbabwe</option>
</select>
</div>
</div>
<div class="form-group has-error has-feedback">
    <label class="col-sm-4 text-center control-label" for="personName">Person Name<abbr class="required"
                                                                                        title="required">*</abbr></label>
    <div class="col-sm-8">
        <input class="form-control" id="personName">
        <span class="glyphicon glyphicon-remove form-control-feedback"></span>
    </div>
</div>
<div class="form-group has-error has-feedback">
    <label class="col-sm-4 text-center control-label" for="city">Town/City<abbr class="required"
                                                                                title="required">*</abbr></label>
    <div class="col-sm-8">
        <input class="form-control" id="city">
        <span class="glyphicon glyphicon-remove form-control-feedback"></span>
    </div>
</div>
<div class="form-group has-error has-feedback">
    <label class="col-sm-4 text-center control-label" for="postalCode">Postal Code<abbr class="required"
                                                                                        title="required">*</abbr></label>
    <div class="col-sm-8">
        <input class="form-control" id="postalCode">
        <span class="glyphicon glyphicon-remove form-control-feedback"></span>
    </div>
</div>
<div class="form-group has-error has-feedback">
    <label class="col-sm-4 text-center control-label" for="orderAddress">Address<abbr class="required"
                                                                        title="required">*</abbr></label>
    <div class="col-sm-8">
        <input class="form-control" id="orderAddress">
        <span class="glyphicon glyphicon-remove form-control-feedback"></span>
    </div>
</div>
<div class="form-group">
    <label class="col-sm-4 text-center control-label" for="company">Company</label>
    <div class="col-sm-8">
        <input class="form-control" id="company">
    </div>
</div>
<div class="form-group pull-right col-sm-3">
                        <span id="orderBtn" class="btn btn-success col-sm-11">
                            <span class="glyphicon glyphicon-ok"></span> Order
                        </span>
</div>
</form>
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
<script src="../js/json.js"></script>
<script type="text/javascript" src="../js/chosen.jquery.min.js"></script>
<script type="text/javascript" src="../js/HomePage.js"></script>
<script type="text/javascript" src="../js/purchase.js"></script>
</body>
</html>