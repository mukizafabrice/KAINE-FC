<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="connection.jsp" %>
<%@include file="session.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>kaine fc</title>
    <link rel="shortcut icon" href="logo.png" type="">
    <%@include file="managerNav.jsp" %><br><br><br><br><br><br><br><br>
    <style>
     
        .main-co {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 20px;
    background-color: #f4f4f4;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    max-height: 100vh; /* Ensures the div does not exceed viewport height */
    overflow-y: auto;  /* Adds vertical scrolling */
}


        h1 {
            text-align: center;
            color: #4070f4;
        }

        form {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        form input[type="date"] {
            padding: 10px;
            margin: 0 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        form input[type="submit"] {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            background-color: #4070f4;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
        }

        form input[type="submit"]:hover {
            background-color: #3050c4;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        table thead tr {
            background-color: #4070f4;
            color: #fff;
            text-align: left;
        }

        table th, table td {
            padding: 12px;
            border: 1px solid #ddd;
        }

        table tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        table tbody tr:hover {
            background-color: #f1f1f1;
        }

        table th {
            font-weight: bold;
        }

        table td {
            color: #333;
        }

        .print-button {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .print-button button {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            background-color: #4070f4;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
        }

        .print-button button:hover {
            background-color: #3050c4;
        }

          .foot {
            width: 100%;
            text-align: center;
            background-color: #000;
            color: #fff;
            padding: 10px 0;
            margin-top: 110px;
        } 
    </style>
    <script>
        function printReport() {
            window.print();
        }
    </script>
</head>
<body>
    <div class="main-co">
        <h1>Generate Report</h1><br>
        <form action="#" method="post">
            From: <input type="date" name="from"> To: <input type="date" name="to">
            <input type="submit" name="submit" value="🔎Generate">
        </form>
        <table cellpadding="0">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Date</th>
                    <th>Email</th>
                    <th>Donation Name</th>
                    <th>Type</th>
                    <th>Amount</th>
                </tr>
            </thead>
            <tbody>
                <%
                if (request.getParameter("submit") != null) {
                    int id = 1;
                    String from = request.getParameter("from");
                    String to = request.getParameter("to");
                    String query = "SELECT * FROM donors INNER JOIN donations ON donors.ot_id = donations.ot_id WHERE donors.date BETWEEN ? AND ?";
                    try {
                        pst = con.prepareStatement(query);
                        pst.setString(1, from);
                        pst.setString(2, to);
                        rs = pst.executeQuery();

                        while (rs.next()) {
                %>
                <tr>
                    <td><%= id++ %></td>
                    <td><%= rs.getString("fname") %></td>
                    <td><%= rs.getString("lname") %></td>
                    <td><%= rs.getString("date") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("type") %></td>
                    <td><%= rs.getString("amount") %></td>
                </tr>
                <%
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                %>
            </tbody>
        </table>
        <div class="print-button">
            <button onclick="printReport()">Print Report</button>
        </div>
    </div>
    <div class="foot">
        <%@include file="footer.jsp" %>
    </div>
</body>
</html>
