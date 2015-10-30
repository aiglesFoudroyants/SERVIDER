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
        <title>Servider | Profil</title>
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
                <div class="content-about margin-top60">
                    <div class="container">
                        <div class="row">

                            <div class="posts-block col-md-3">  
                                <h2>Carlos Gringo</h2>
                                <img class="logo-color" src="resources/img/client1.jpg" alt="profil picture" >
                                <div class = "btn contact col-md-12">

                                    <div><p style="float: left;"><img src="resources/img/offline.png" ></p>
                                        <p>offline</p>
                                    </div>


                                    <input type="submit" value="<fmt:message key="btnContacter"/>" data-loading-text="Loading..." class="btn btn-color push-bottom col-md-12">
                                </div>
                            </div>
                            <div class="posts-block col-lg-9">
                                <h2>Bio</h2>
                                <p>Carlos, de son vrai nom Yvan-Chrysostome Dolto, est un chanteur, acteur et fantaisiste français né le 20 février 1943 dans le 5e arrondissement de Paris1,2, et mort à Clichy le 17 janvier 2008. Incarnant la variété populaire, il fut un ami proche de Dorothée, d'Eddie Barclay, de Chantal Goya, de Sim, de Dave, d'Annie Cordy, de Johnny Hallyday, de Joe Dassin, de Jeane Manson, de Coluche et surtout de Sylvie Vartan qui lui permit de faire ses premiers pas sur scène à ses côtés.

                                    Son vaste répertoire est enjoué et festif, avec souvent une connotation grivoise ludique, comme Le Tirelipimpon ou Papayou. Doté d'un fort embonpoint et d'un visage naturellement débonnaire et jovial, Carlos a rapidement adopté une allure propre (colliers de fleurs, chemises hawaïennes) similaire à celle d'un autre chanteur français, 
                                </p>

                            </div>
                        </div>
                        <!-- Star -->
                        <div class="star">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="star-divider">
                                        <div class="star-divider-icon">
                                            <i class=" fa fa-star"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <c:forEach items="${commentaires}" var="item">
                            <div class="row col-xs-12" >
                                <div class="media-photo-badge col-xs-2" >
                                    <img  alt="shared.user_profile_image" data-pin-nopin="true" src="resources/img/team/team-member-1.jpg" title="image du profil" >
                                    <p>${item.getsNom()}</p>
                                </div> 
                                <div class="avatar-wrapper "></div>
                                <div class="media-photo-badge col-xs-10" >
                                    <p>${item.getlCommentaire()}</p>
                                </div> 
                            </div>
                        </c:forEach>
                        <!-- Star-->
                        <div class="star">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="star-divider">
                                        <div class="star-divider-icon">
                                            <i class=" fa fa-star"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Star -->  
                        <div class="reply col-md-push-3">
                            <h3 class="title">Leave a reply</h3>
                            <form class="reply" id="reply">
                                <fieldset>
                                    <div class="row">
                                        <div>
                                            <input class="form-control" type="text" value="" placeholder="Name" required>

                                        </div>
                                        
                                            <div >
                                                <textarea class="form-control" rows="3" cols="40" placeholder="Comment" required></textarea>
                                            </div>
                                  
                                    </div>
                                </fieldset>
                                <button class="btn btn-color pull-right" type="submit">Post Reply</button>
                                <div class="clearfix">
                                </div>
                            </form>
                        </div>
                        <!-- /Reply Section -->

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
        <script src="resources/js/home.js"></script>
    </body>
</html>


