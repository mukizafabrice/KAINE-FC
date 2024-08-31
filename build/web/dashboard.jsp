<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="session.jsp"%>
<%@include file="connection.jsp" %>
<%@include file="managerNav.jsp" %><br><br><br><br><br><br><br><br><br><br><br>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Dashboard</title>
    <link rel="shortcut icon" href="logo.png" type="">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .container {
            width: 60%;
            margin: 0 auto;
            padding: 20px;
            flex: 1;
        }
        .row {
            display: flex;
            justify-content: space-between;
            gap: 80px;
        }
        .card {
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            flex: 1;
            text-align: center;
            position: relative;
            cursor: pointer;
        }
        .card .icon {
            font-size: 40px;
            color: #4070f4;
        }
        .card h3 {
            margin: 15px 0;
            font-size: 24px;
            color: #333;
        }
        .card p {
            font-size: 16px;
            color: #666;
        }
        .card .value {
            font-size: 36px;
            color: #333;
        }
        .foot {
            width: 100%;
            text-align: center;
            background-color: #000;
            color: #fff;
            padding: 10px 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="card" id="card2">
                <i class="fas fa-donate icon"></i>
                <h3>Donations</h3>
                <%
                    String donationCountQuery = "SELECT COUNT(*) AS total FROM donations";
                    pst = con.prepareStatement(donationCountQuery);
                    rs = pst.executeQuery();
                    rs.next();
                    int donationCount = rs.getInt("total");
                %>
                <p class="value"><%= donationCount %></p>
            </div>
            <div class="card" id="card1">
                <i class="fas fa-users icon"></i>
                <h3>Donors</h3>
                <%
                    String donorCountQuery = "SELECT COUNT(*) AS total FROM donors";
                    pst = con.prepareStatement(donorCountQuery);
                    rs = pst.executeQuery();
                    rs.next();
                    int donorCount = rs.getInt("total");
                %>
                <p class="value"><%= donorCount %></p>
            </div>
        </div>
    </div>
    <script>
        const card1 = document.getElementById("card1");
        const card2 = document.getElementById("card2");
        card1.addEventListener("click", () => {
            window.location.href = "manger_view_donors.jsp";
        });
        card2.addEventListener("click", () => {
            window.location.href = "manger_view_donations.jsp";
        });
    </script>
    <div class="foot">
        <%@include file="footer.jsp" %>
    </div>
</body>
</html>
