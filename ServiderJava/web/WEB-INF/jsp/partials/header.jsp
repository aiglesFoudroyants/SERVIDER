<%-- 
    Document   : header
    Created on : 2-Oct-2015, 10:53:22 AM
    Author     : hugo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header</title>
    </head>
    <header id="header">
        <!-- Main Header -->
        <div class="main-header">
            <div class="container">
                <!-- Logo -->
                <div class="logo pull-left">
                    <h1>
                        <a href="index.html">
                            <img class="logo-color" src="resources/img/logos/logo_green.png" alt="gallaxy" width="160" height="60">
                        </a>
                    </h1>
                </div>
                <!-- /Logo -->
                <!-- Mobile Menu -->
                <div class="mobile navbar-header">
                    <!--<a class="navbar-toggle" data-toggle="collapse" href=".navbar-collapse">
                        <i class="fa fa-bars fa-2x"></i>
                    </a> -->
                    <a href="#" data-toggle="modal" data-target="#loginModal" class="no-border navbar-toggle">
                        <i class="fa fa-3x fa-user clean"></i>
                    </a>
                </div>
                <!--/Mobile Menu -->
                <!-- Menu Start -->
                <nav class="collapse navbar-collapse menu">
                    <ul class="nav navbar-nav sf-menu">
                        <li>
                            <a href="#" data-toggle="modal" data-target="#loginModal" class="no-border">
                                <i class="fa fa-3x fa-user"></i>
                            </a>
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
                            <i class="fa fa-close"  style="color:black; font-size:30px;"  ></i>
                        </a>
                        <h2 class="form-signin-heading modal-title" id="myModalLabel">Login</h2>
                    </div>
                    <form method="post" id="login">
                        <div class="modal-body">
                            <fieldset>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <input class="form-control" id="username" name="username" type="text" placeholder="<fmt:message key="loginUsername"/>" value="" required>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <input class="form-control" type="email" id="email" name="email" placeholder="<fmt:message key="loginPassword"/>" value="" required>
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                        <div class="modal-footer">
                            <a href="password-recovery.html" class="pull-left">Lost Password</a>
                            <form action="inscription.htm">
                                <input type="button" class="btn btn-default" onclick="location.href='inscription.htm';" value="Register" />
                            </form>
                            <button type="button" class="btn btn-color">Login</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- /Logan Modal -->
    </section>
</html>
