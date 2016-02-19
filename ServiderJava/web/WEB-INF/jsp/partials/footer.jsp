<%-- 
    Document   : footer
    Created on : 2-Oct-2015, 11:12:33 AM
    Author     : hugo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Footer</title>
    </head>
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
                                                <select id="language" name="language" class="form-control" onchange="submit()">
                                                    <option  value="fr" ${language == 'fr' ? 'selected' : ''}>Français</option>
                                                    <option value="en" ${language == 'en' ? 'selected' : ''}>English</option>
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
</html>
