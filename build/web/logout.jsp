<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connection.jsp" %>
<%
    
    if (session != null) {
        session.invalidate();
    }
    response.sendRedirect("index.jsp");
%>


