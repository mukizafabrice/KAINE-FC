<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connection.jsp" %>
<%@include file="managerNav.jsp" %><br><br><br><br><br><br><br><br><br>
<%

    if (session == null || session.getAttribute("role") == null) {
        response.sendRedirect("index.jsp");
        return; 
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Donors List</title>
    <link rel="shortcut icon" href="logo.png" type="">
    <style>
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
        }
        h1 {
            text-align: center;
            color: #4070f4;
        }
        .main-content {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            width: 80%;
            margin: auto;
            max-height: 500px; /* Adjust the height as needed */
            overflow-y: auto;
        }
        table {
            width: 100%; /* Take full width of the container */
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #4070f4;
            color: #fff;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        a {
            text-decoration: none;
            color: #4070f4;
            font-weight: bold;
        }
        a:hover {
            text-decoration: underline;
        }
        .foot {
            width: 100%;
            text-align: center;
            background-color: #000;
            color: #fff;
            padding: 10px 0;
            margin-top: 20px;
        }
    </style>
    <script>
        function confirmAction(message, url) {
            if (confirm(message)) {
                window.location.href = url;
            }
        }
    </script>
</head>
<body>
    <h1>Donors List</h1>
    <div class="main-content">
        <table cellpadding="0">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Sex</th>
                    <th>Date</th>
                    <th>Email</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    String query = "SELECT * FROM donors";
                    Statement st = con.createStatement();
                    rs = st.executeQuery(query);

                    while(rs.next()){
                        String d_id = rs.getString("d_id");
                %>
                <tr>
                    <td><%= rs.getString("d_id") %></td>
                    <td><%= rs.getString("fname") %></td>
                    <td><%= rs.getString("lname") %></td>
                    <td><%= rs.getString("sex") %></td>
                    <td><%= rs.getString("date") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td>
                        <a href="javascript:void(0);" onclick="confirmAction('Are you sure you want to edit this donor?', 'u_donor.jsp?d_id=<%= d_id %>')">Edit</a> | 
                        <a href="javascript:void(0);" onclick="confirmAction('Are you sure you want to delete this donor?', 'd_donor.jsp?d_id=<%= d_id %>')">Delete</a>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
    <div class="foot">
        <%@include file="footer.jsp" %>
    </div>
</body>
</html>
