<%-- 
    Document   : header
    Created on : 2-Oct-2015, 10:53:22 AM
    Author     : hugo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/include.jsp" %>
<c:choose>
    <c:when test="${cookie.containsKey('servider-user-id')}">
        <%@ include file="header_connected.jsp" %>
    </c:when>
    <c:otherwise>
        <%@ include file="header_disconected.jsp" %>
    </c:otherwise>
</c:choose>
