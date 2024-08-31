<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.sql.*" %>
<%
    if(session == null || session.getAttribute("role") == null) {
        response.sendRedirect("index.jsp");
        return; 
    }
%>