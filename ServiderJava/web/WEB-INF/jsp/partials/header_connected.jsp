<%-- 
    Document   : header_connected
    Created on : 2-Oct-2015, 10:53:22 AM
    Author     : gabriel
--%>
<%@include file="/WEB-INF/jsp/include.jsp" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="localisation.messages"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="${language}">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header</title>
        <script src="resources/js/header.js"></script>
    </head>
    <header id="header">
        <!-- Main Header -->
        <div class="main-header">
            <div class="container">
                <!-- Logo -->
                <div class="logo pull-left vertical-center-logo">
                    <h1>
                        <a href="index.htm">
                            <img class="logo-color" src="resources/img/logos/logo_orange.png" alt="gallaxy" width="160" height="60">
                        </a>
                    </h1>
                </div>
                <!-- /Logo -->
                <!-- Mobile Menu -->
                <div class="mobile navbar-header">
                    <!--<a class="navbar-toggle" data-toggle="collapse-mobile" href=".navbar-collapse-mobile">
                        <img src="resources/img/team/team-member-1.jpg" style="width:4em"/>
                        <span class="sf-sub-indicator">
                            <i class="fa fa-angle-down "></i>
                        </span>
                    </a>-->
                    <nav class=" navbar-collapse menu navbar-toggle">
                        <ul class="nav navbar-nav sf-menu">
                            <li style="width: 100%;">
                                <a id="current" href="#">
                                    <img id="imgUserMobile" src="resources/img/team/team-member-1.jpg" style="width:4em"/>
                                    <span class="sf-sub-indicator">
                                        <i class="fa fa-angle-down "></i>
                                    </span>
                                </a>
                                <ul>
                                    <li><a href="profil.htm" class="sf-with-ul"><fmt:message key="menuOptionProfile"/></a></li>
                                    <li><a href="index-2.html" class="sf-with-ul"><fmt:message key="menuOptionSettings"/></a></li>
                                    <li><a href="index-shop.html" class="sf-with-ul"><fmt:message key="menuOptionMailbox"/></a></li>
                                    <li><a href="index-shop.html" class="sf-with-ul"><fmt:message key="menuOptionMyAdds"/></a></li>
                                    <li><a id="btnDisconnectMobile" class="sf-with-ul"><fmt:message key="menuOptionDisconnect"/></a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
                <!--/Mobile Menu -->
                <!-- Menu Start -->
                <nav class="collapse navbar-collapse menu">
                    <ul class="nav navbar-nav sf-menu">
                        <li>
                            <a id="current" href="#">
                                <img id="imgUser" src="resources/img/team/team-member-1.jpg" style="width:4em"/>
                                <span class="sf-sub-indicator">
                                    <i class="fa fa-angle-down "></i>
                                </span>
                            </a>
                            <ul>
                                <li><a href="profil.htm" class="sf-with-ul"><fmt:message key="menuOptionProfile"/></a></li>
                                <li><a href="index-2.html" class="sf-with-ul"><fmt:message key="menuOptionSettings"/></a></li>
                                <li><a href="index-shop.html" class="sf-with-ul"><fmt:message key="menuOptionMailbox"/></a></li>
                                <li><a href="index-shop.html" class="sf-with-ul"><fmt:message key="menuOptionMyAdds"/></a></li>
                                <li><a id="btnDisconnect" class="sf-with-ul"><fmt:message key="menuOptionDisconnect"/></a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
                <!-- /Menu --> 
            </div>
        </div>
        <!-- /Main Header -->
    </header>

    <section id="modals">
        <!-- Login Modal -->
        <div class="modal login fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <a href="#" class="pull-right" data-dismiss="modal">
                            <i class="fa fa-close fa-lg"  style="color:white; margin: 10px;"  ></i>
                        </a>
                        <h2 class="form-signin-heading modal-title" id="myModalLabel">Login</h2>
                    </div>
                    <form method="post" id="login">
                        <div class="modal-body">
                            <fieldset>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <input class="form-control" id="txtEmail" name="username" type="text" placeholder="<fmt:message key="loginUsername"/>" value="" required>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <input class="form-control" type="password" id="txtPass" name="email" placeholder="<fmt:message key="loginPassword"/>" value="" required>
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                        <div class="modal-footer">                   
                            <a href="recuperation.htm" class="pull-left"><fmt:message key="loginLblLost"/></a>
                            <form action="inscription.htm">
                                <input type="button" class="btn btn-default" onclick="location.href = 'inscription.htm';" value="<fmt:message key="loginBtnRegister"/>" />
                            </form>
                            <button id="btnLogin" type="button" class="btn btn-color"><fmt:message key="loginBtnLogin"/></button>
                        </div>
                    </form>
                </div>
            </div>
            <span id="loginValide" style="display:none"><fmt:message key='loginValide'/></span>
            <span id="loginInvalide" style="display:none"><fmt:message key='loginInvalide'/></span>
        </div>
        <!-- /Logan Modal -->
    </section>
</html>
