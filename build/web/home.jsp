<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connection.jsp" %>

<%
    String name = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");
    String user_id = (String) session.getAttribute("user_id");

    if ("manager".equals(role)) {
        response.sendRedirect("dashboard.jsp");
    } else if ("accountant".equals(role)) {
        response.sendRedirect("accountant.jsp");
    } else {
        response.sendRedirect("index.jsp");
    }
%>

