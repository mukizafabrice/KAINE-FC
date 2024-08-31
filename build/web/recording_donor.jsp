<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connection.jsp" %>
<%@include file="session.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Donors</title>
        <link rel="shortcut icon" href="logo.png" type="">
        <style>
            .table {
            width: 90%;
            border-collapse: collapse;
            margin-bottom: 1em;
            background-color: #fff;
            margin-left: 5%;
            margin-top: 100px;
        }

        .table th, .table td {
            padding: 12px;
            text-align: left;
            border: 1px solid #dee2e6;
        }

        .table th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        /* Responsive layout */
        @media (max-width: 768px) {
            .table-responsive {
                display: block;
                width: 100%;
                overflow-x: auto;
                -webkit-overflow-scrolling: touch;
            }
        }

        /* Add some padding to the action link */
        .table a {
            color: #007bff;
            text-decoration: none;
        }

        .table a:hover {
            text-decoration: underline;
        }
        .foot{
            margin-top: 299px;
        }
        </style>
    </head>
    <%@include file="navigation.jsp" %><br><br>
    <body> 
        <div class="main-vov">
    <table id="tbl-student" class="table table-responsive table-bordered" cellpadding="0" width="100%">
      <h1>Regist New Donar</h1>
    <thead>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Type</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <%
           String query = "SELECT * FROM donations";
           Statement st = con.createStatement();
           rs = st.executeQuery(query);

            while(rs.next()) {
                String ot_id = rs.getString("ot_id");
        %>
        <tr>
            <td><%= rs.getString("ot_id") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("type") %></td>
            <td><a href="donars.jsp?ot_id=<%= ot_id %>">Register</a></td>
        </tr>
        <%
            }
        %>
    </tbody>
    </table></div>
    <div class="foot">
        <%@include file="footer.jsp" %>
    </div>
        
    </body>
</html>
