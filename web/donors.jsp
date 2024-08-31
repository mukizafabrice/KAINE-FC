<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="session.jsp" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <title>Donation</title>
    <link rel="shortcut icon" href="logo.png" type="">
    <link href="styles/style.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Add your styles here */
        body {
            display: flex;
            flex-direction: column;
        }        
        .main-content {
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: row;
            gap: 100px;
            margin-left: 1%;
        }
        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            margin-top: 110px;
        }
        .input-group {
            margin-bottom: 15px;
        }
        .input-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .input-group input[type="text"],
        .input-group input[type="email"],
        .input-group input[type="date"], 
        select {
            width: calc(100% - 12px);
            padding: 8px 10px;
            margin: 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }
        .input-group input[type="radio"] {
            margin-right: 10px;
        }
        .input-group button {
            background: #4070f4;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        .input-group button:hover {
            background: #305abf;
        }
        .input-group input[type="radio"] + label {
            margin-right: 20px;
            font-weight: normal;
        }
        .card {
            height: 400px;
            background: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
            margin-top: 100px;
        }
        .card-title {
            margin-bottom: 15px;
            font-size: 24px;
            color: #333;
        }
        .card-links {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .card-links li {
            margin-bottom: 10px;
        }
        .card-links a {
            text-decoration: none;
            color: #007bff;
            font-size: 18px;
            transition: color 0.3s ease;
        }
        .card-links a:hover {
            color: #0056b3;
        }
        .announcement-card {
            background: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
            margin-top: 100px;
        }
        .announcement-title {
            margin-bottom: 10px;
            font-size: 24px;
            color: #333;
        }
        .announcement-date,
        .announcement-venue,
        .announcement-details {
            margin: 5px 0;
            font-size: 18px;
            color: #666;
        }
        .announcement-date {
            font-weight: bold;
        }
        .announcement-venue {
            font-style: italic;
        }
        .announcement-details {
            margin-top: 10px;
            font-size: 16px;
            color: #333;
        }
        .foot {
            margin-top: -2px;
        }
    </style>
</head>
<body>
    <%@include file="navigation.jsp" %>
    <%@include file="connection.jsp" %>
    <%
    if (request.getParameter("submit") != null) {
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String sex = request.getParameter("sex");
        String date = request.getParameter("date");
        String email = request.getParameter("email");
        String type = request.getParameter("type");
        String user_id = (String) session.getAttribute("user_id");
        
        try {
            String query = "SELECT * FROM donations WHERE type = ?";
            pst = con.prepareStatement(query);
            pst.setString(1, type);
            rs = pst.executeQuery();

            while (rs.next()) {
                String ot_id = rs.getString("ot_id");
                pst = con.prepareStatement("INSERT INTO donors (d_id, fname, lname, sex, date, email, ot_id, user_id) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?)");

                pst.setString(1, fname);
                pst.setString(2, lname);
                pst.setString(3, sex);
                pst.setString(4, date);
                pst.setString(5, email);
                pst.setString(6, ot_id);
                pst.setString(7, user_id);
                pst.executeUpdate();
            }

            %>
            <script>
                alert("New Donor inserted successfully");
            </script>
            <%
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pst != null) {
                try {
                    pst.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
    %>

    <main class="main-content">     
        <div class="card">
            <h3 class="card-title">Useful Links</h3>
            <ul class="card-links">
                <li><a href="https://www.ferwafa.rw" target="_blank">Ferwafa</a></li>
                <li><a href="https://www.fifa.com" target="_blank">Fifa</a></li>
                <li><a href="https://www.moh.gov.rw" target="_blank">Minisante</a></li>
            </ul>
        </div>

        <form action="#" method="post">
            <h1>Register New Donor</h1><br><br>
            <div class="input-group">
                <label for="fname">First Name</label>
                <input type="text" id="fname" name="fname" required>    
            </div>

            <div class="input-group">
                <label for="lname">Last Name</label>
                <input type="text" id="lname" name="lname" required>    
            </div>

            <div class="input-group">
                <input type="radio" id="female" name="sex" value="female" required>
                <label for="female">Female</label>
                <input type="radio" id="male" name="sex" value="male" required>
                <label for="male">Male</label>
            </div>

            <div class="input-group">
                <label for="date">Date</label>
                <input type="date" id="date" name="date" required>    
            </div>

            <div class="input-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>    
            </div>
            <div class="input-group">
                <label for="type">Type of Donation</label>
                <select name="type" required>
                    <option value="">Choose the type of donations</option> 
                    <%
                    try {
                        String query = "SELECT * FROM donations";
                        Statement st = con.createStatement();
                         rs = st.executeQuery(query);

                        while (rs.next()) {
                    %>
                        <option value="<%= rs.getString("type") %>"><%= rs.getString("type") %></option>
                    <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    %>
                </select>   
            </div>

            <div class="input-group">
                <button type="submit" name="submit">✍️Register</button>    
            </div>
        </form>

        <div class="announcement-card">
            <h3 class="announcement-title">Announcement</h3>
            <p class="announcement-date">6th August 2022</p>
            <p class="announcement-venue">Mariot Hotel</p>
            <p class="announcement-details">Join us for a club fans meeting!</p>
        </div> 
    </main>

    <div class="foot">
        <%@include file="footer.jsp" %>
    </div>
</body>
</html>
