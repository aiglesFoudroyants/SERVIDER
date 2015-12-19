<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/include.jsp" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="localisation.messages"/>
<!DOCTYPE html>
<!--[if IE 8]>          <html class="ie ie8"> <![endif]-->
<!--[if IE 9]>          <html class="ie ie9"> <![endif]-->
<!--[if gt IE 9]><!-->  
<html lang="${language}"> 

    <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <title><fmt:message key="pageTitleResearchResults"/></title>
        <meta name="description" content="Gallaxy Responsive HTML5/CSS3 Template from FIFOTHEMES.COM">
        <meta name="author" content="FIFOTHEMES.COM">
        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Google Fonts -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Raleway:100,200,300,700,800,900' rel='stylesheet' type='text/css'>
        <!-- Library CSS -->
        <link rel="stylesheet" href="resources/css/bootstrap.css">
        <link rel="stylesheet" href="resources/css/bootstrap-theme.css">
        <link rel="stylesheet" href="resources/css/fonts/font-awesome/css/font-awesome.css">
        <link rel="stylesheet" href="resources/css/animations.css" media="screen">
        <link rel="stylesheet" href="resources/css/superfish.css" media="screen">
        <link rel="stylesheet" href="resources/css/revolution-slider/css/settings.css" media="screen">
        <link rel="stylesheet" href="resources/css/revolution-slider/css/extralayers.css" media="screen">
        <link rel="stylesheet" href="resources/css/prettyPhoto.css" media="screen">
        <!-- Theme CSS -->
        <link rel="stylesheet" href="resources/css/style.css">
        <link rel="stylesheet" href="resources/css/main.css">
        <!-- Skin -->
        <link rel="stylesheet" href="resources/css/colors/orange.css" class="colors">
        <!-- Responsive CSS -->
        <link rel="stylesheet" href="resources/css/theme-responsive.css">
        <!-- Switcher CSS -->
        <link href="resources/css/switcher.css" rel="stylesheet">
        <link href="resources/css/spectrum.css" rel="stylesheet">
        <!-- JQuery-ui -->
        <link rel="stylesheet" href="resources/css/jquery-ui.min.css">
        <link rel="stylesheet" href="resources/css/jquery-ui.structure.min.css">
        <link rel="stylesheet" href="resources/css/jquery-ui.theme.min.css">
        <!-- Favicons -->
        <link rel="shortcut icon" href="resources/img/ico/favicon.ico">
        <link rel="apple-touch-icon" href="resources/img/ico/apple-touch-icon.png">
        <link rel="apple-touch-icon" sizes="72x72" href="resources/img/ico/apple-touch-icon-72.png">
        <link rel="apple-touch-icon" sizes="114x114" href="resources/img/ico/apple-touch-icon-114.png">
        <link rel="apple-touch-icon" sizes="144x144" href="resources/img/ico/apple-touch-icon-144.png">
        <link href="resources/css/jquery.rating.css" rel="stylesheet">
        <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
        <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <script src="resources/js/respond.min.js"></script>
        <![endif]-->
        <!--[if IE]>
        <link rel="stylesheet" href="resources/css/ie.css">
        <![endif]-->

        <!-- The Scripts -->
        <script src="resources/js/jquery.min.js"></script>
        <script src="resources/js/jquery-migrate-1.0.0.js"></script>
        <script src="resources/js/jquery-ui.js"></script>
        <script src="resources/js/bootstrap.js"></script>
        <script src="resources/js/revolution-slider/js/jquery.themepunch.plugins.min.js"></script> 
        <script src="resources/js/revolution-slider/js/jquery.themepunch.revolution.min.js"></script>
        <script src="resources/js/jquery.parallax.js"></script>
        <script src="resources/js/jquery.wait.js"></script>
        <script src="resources/js/fappear.js"></script> 
        <!--script src="resources/js/modernizr-2.6.2.min.js"></script-->
        <script src="resources/js/jquery.bxslider.min.js"></script>
        <script src="resources/js/jquery.prettyPhoto.js"></script>
        <script src="resources/js/superfish.js"></script>
        <script src="resources/js/tweetMachine.js"></script>
        <script src="resources/js/tytabs.js"></script>
        <script src="resources/js/jquery.gmap.min.js"></script>
        <script src="resources/js/jquery.sticky.js"></script>
        <script src="resources/js/jquery.countTo.js"></script>
        <script src="resources/js/jflickrfeed.js"></script>
        <script src="resources/js/imagesloaded.pkgd.min.js"></script>
        <script src="resources/js/waypoints.min.js"></script>
        <script src="resources/js/wow.js"></script>
        <script src="resources/js/jquery.fitvids.js"></script>
        <script src="resources/js/spectrum.js"></script>
        <script src="resources/js/switcher.js"></script>
        <script src="resources/js/custom.js"></script>
        <script src="resources/js/recherche.js"></script>

        <script src="resources/js/ratingBar/jquery.MetaData.js"></script>   
        <script src="resources/js/ratingBar/jquery.form.js"></script> 
        <script src="resources/js/ratingBar/jquery.rating.js"></script>  
        <script src="resources/js/ratingBar/jquery.rating.pack.js"></script>
    </head>
    <body class="home">
        <div id="valeur_recherche" style="display:none;">
            ${recherche}
        </div>
        <div class="page-mask">
            <div class="page-loader">
                <div class="spinner"></div>
                Loading...
            </div>
        </div>
        <!-- Wrap -->
        <div class="wrap">
            <!-- Header -->      
            <%@ include file="partials/header.jsp" %>      
            <!-- /Header --> 
            <!-- Main Section -->

            <section id="main">
                <div class="breadcrumb-wrapper">
                    <div class="pattern-overlay">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-xs-12 col-sm-6">
                                    <h2 class="title"><fmt:message key="TitleResearchResults"/></h2>
                                </div>                                
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content margin-top60 margin-bottom60">
                    <div class="row">
                        <div class="col-md-8 col-md-push-2">
                            <div class="col-md-3 col-xs-12 col-sm-12" style="padding:10px;align-items: center;display: flex;; opacity:0;">
                                <div class="col-md-4 col-xs-4">
                                    <fmt:message key="sortBy"/>
                                </div>
                                <div class="col-md-8 col-xs-8">
                                    <select class="form-control" style="margin-bottom:0px !important">
                                        <option><fmt:message key="price"/></option>
                                        <option><fmt:message key="sproximity"/></option>
                                        <option><fmt:message key="rating"/></option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-3 col-xs-12 col-sm-12" style="padding:10px;align-items: center;display: flex; opacity:0;">
                                <div class="col-md-4 col-xs-4">
                                    <fmt:message key="dispoAvailable"/>
                                </div>
                                <div class="col-md-8 col-xs-8">
                                    <select class="form-control" style="margin-bottom:0px !important">
                                        <option><fmt:message key="dispoWeekdays"/></option>
                                        <option><fmt:message key="dispoWeekend"/></option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6 col-xs-12 col-sm-12" style="padding:10px;padding-left:25px;padding-right:25px;">
                                <div class="col-lg-10 col-md-10 col-sm-10" style="padding: 0 !important;">
                                    <input id="search" class="form-control search-text-box" name="search" type="text" placeholder="<fmt:message key="searchBar"/>" value="" required="">
                                </div>
                                <div class="col-lg-2 col-md-2 col-sm-2" style="padding: 0 !important;">
                                    <button id="btnSearch" class="form-control btn btn-color submit" type="submit"><i class="fa fa-search "></i></button>
                                </div>   
                            </div>
                        </div>
                        <div id="annonces" class="col-md-8 col-md-push-2">

                        </div>

                    </div>
                </div>
        </div>
    </section>

    <!-- /Main Section -->
    <!-- Footer -->            
    <footer id="footer">
        <div class="pattern-overlay">
            <!-- Footer Top -->
            <div class="footer-top">
                <div class="container">
                    <div class="row">
                        <section class="col-lg-4 col-md-4 col-xs-12 col-sm-4 footer-one wow fadeIn">
                            <h3 class="light"><fmt:message key="aboutTitle"/></h3>
                            <p> 
                                <fmt:message key="aboutContent"/> 
                            </p>
                        </section>
                        <section class="col-lg-4 col-md-4 col-xs-12 col-sm-4 footer-three wow fadeIn">
                            <h3 class="light"><fmt:message key="contactTitle"/></h3>
                            <ul class="contact-us">
                                <li>
                                    <i class="fa fa-map-marker"></i>
                                    <p> 
                                        <strong class="contact-pad"><fmt:message key="addressLabel"/></strong> <fmt:message key="addressStreet"/><br> <fmt:message key="addressTownProvinceCountry"/> <br>
                                        <fmt:message key="addressPostalCode"/> 
                                    </p>
                                </li>
                                <li>
                                    <i class="fa fa-phone"></i>
                                    <p><strong><fmt:message key="phoneLabel"/></strong> +1 (514) 332-3000</p>
                                </li>
                                <li>
                                    <i class="fa fa-envelope"></i>
                                    <p><strong><fmt:message key="emailLabel"/></strong><a href="mailto:support@fifothemes.com">1302743@bdeb.qc.ca</a></p>
                                </li>
                            </ul>
                        </section>
                        <section class="col-lg-4 col-md-4 col-xs-12 col-sm-4 footer-two wow fadeIn">
                            <h3 class="light"><fmt:message key="languageTitle"/></h3>
                            <ul id="language">
                                <li>
                                    <form>
                                        <select id="language" name="language" class="form-control" onchange="changerLangue()">
                                            <option  value="Fr" ${language == 'Fr' ? 'selected' : ''}>Français</option>
                                            <option value="En" ${language == 'En' ? 'selected' : ''}>English</option>
                                        </select>
                                    </form>
                                </li>
                            </ul>
                        </section>
                    </div>
                </div>
            </div>
            <!-- /Footer Top --> 
            <!-- Footer Bottom -->
            <div class="footer-bottom">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-xs-12 col-sm-6 ">
                            <p class="credits">&copy; <fmt:message key="copyright"/> </p>
                        </div>
                        <div class="col-lg-6 col-md-6 col-xs-12 col-sm-6 ">
                            <ul class="social social-icons-footer-bottom">
                                <li class="facebook"><a href="#" data-toggle="tooltip" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                                <li class="twitter"><a href="#" data-toggle="tooltip" title="Twitter"><i class="fa fa-twitter"></i></a></li>
                                <li class="linkedin"><a href="#" data-toggle="tooltip" title="LinkedIn"><i class="fa fa-linkedin"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Footer Bottom -->
        </div>
    </footer>
    <!-- /Footer -->
    <!-- Scroll To Top --> 
    <a href="#" class="scrollup"><i class="fa fa-angle-up"></i></a>
</div>
<!-- /Wrap -->
</body>
</html>


