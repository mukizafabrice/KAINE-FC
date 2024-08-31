
<%@page import="java.sql.*"%>
<%
DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/kaine_fc","root","");
PreparedStatement pst=null;
ResultSet rs=null;

%>