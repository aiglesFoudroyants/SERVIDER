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
        <title><fmt:message key="pageTitlepasswordRecovery"/></title>
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
        <script src="resources/js/inscription.js"></script>
    </head>
    <body class="home">
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
                                    <h2 class="title"><fmt:message key="passwordRecovery"/></h2>
                                </div>                                
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content margin-top60 margin-bottom60">
                    <div class="container">
                        <div class="row vertical-center-bar">
                            <div class="col-md-8 col-md-push-2">
                                <div class="box-content">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <input id="txtCourriel" class="form-control" type="email" placeholder="<fmt:message key="plhEmail"/>" value="">
                                            </div>
                                        </div>
                                                
                                </div>
                                <div class="row">
                                    <div class="col-md-3 pull-right">
                                        <input id="btnRegister" class="btn btn-color push-bottom" style="width: 100%;" type="button" data-loading-text="Loading..." value="<fmt:message key="btnSend"/>">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
    </div>
</section>


<!-- /Main Section -->
<!-- Footer -->            
<%@ include file="partials/footer.jsp" %>  
<!-- /Footer -->
<!-- Scroll To Top --> 
<a href="#" class="scrollup"><i class="fa fa-angle-up"></i></a>
</div>
<!-- /Wrap -->
</body>
</html>


