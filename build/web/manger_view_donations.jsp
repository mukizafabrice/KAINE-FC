<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="session.jsp" %>
<%@include file="connection.jsp" %>
<%@include file="managerNav.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Donation List</title>
    <link rel="shortcut icon" href="logo.png" type="">
    <style>
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
            overflow: hidden; /* Prevent body from having its own scroll */
        }
        .main-cont {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 20px;
            overflow-y: auto; /* Enable vertical scrolling if content overflows */
            width: 100%;
        }
        h1 {
            text-align: center;
            color: #4070f4;
        }
        .table-container {
            width: 80%;
            max-height: 80vh; /* Limit table height to 80% of the viewport */
            overflow-y: auto; /* Enable vertical scrolling within the table */
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
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
        .footeri {
            background-color: #000;
            color: #fff;
            text-align: center;
            padding: 10px 0;
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
    <div class="main-cont">
        <h1>Donation List</h1>
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Date</th>
                        <th>Type</th>
                        <th>Amount</th>
                        <th colspan="2">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        String query = "SELECT * FROM donations";
                        Statement st = con.createStatement();
                        rs = st.executeQuery(query);
                        
                        while(rs.next()){
                            String ot_id = rs.getString("ot_id");
                    %>
                    <tr>
                        <td><%= rs.getString("ot_id") %></td>
                        <td><%= rs.getString("name") %></td>
                        <td><%= rs.getString("date") %></td>
                        <td><%= rs.getString("type") %></td>
                        <td><%= rs.getString("amount") %></td>
                        <td>
                            <a href="javascript:void(0);" onclick="confirmAction('Are you sure you want to edit this donation?', 'u_donation.jsp?ot_id=<%= ot_id %>')">Edit</a> |
                            <a href="javascript:void(0);" onclick="confirmAction('Are you sure you want to delete this donation?', 'd_donation.jsp?ot_id=<%= ot_id %>')">Delete</a>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
    <div class="footeri">
        <%@include file="footer.jsp" %>
    </div>
</body>
</html>
