<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="session.jsp" %>s
<%@include file="connection.jsp" %>
<%
    if (request.getParameter("register") != null) {
        String name = request.getParameter("name");
        String date = request.getParameter("date");
        String type = request.getParameter("type");
        String amount = request.getParameter("amount");
       
        

        

        try {
            
            pst = con.prepareStatement("INSERT INTO `donations` (`ot_id`, `name`, `date`, `type`, `amount`) VALUES (NULL, ?, ?, ?, ?)");

            pst.setString(1, name);
            pst.setString(2, date);
            pst.setString(3, type);
            pst.setString(4, amount);
            
            pst.executeUpdate();

            %>
            <script>
                alert("new donation inserted successfully");
                window.location.href="accountant.jsp";
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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Donation</title>
        <link rel="shortcut icon" href="logo.png" type="">
        <link href="styles/style.css" rel="stylesheet" type="text/css"/>
        <style>
    body{
                display : flex;
                flex-direction: column;
            }        
 .main-content{
    font-family: Arial, sans-serif;
    display: flex;
    flex-direction: row;
    gap: 100px;
    margin-left: 7%;
    
    
}         
    .donation-form {
    background: #ffffff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    width: 300px;
    margin-top: 100px;
}

.input-group {
    margin-bottom: 15px;
    
}

.input-group input {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 16px;
    box-sizing: border-box;
}

.input-group button {
    width: 100%;
    padding: 10px;
    background: #4070f4;
    border: none;
    border-radius: 5px;
    color: white;
    font-size: 16px;
    cursor: pointer;
    transition: background 0.3s ease;
}

.input-group button:hover {
    background: #4070f4;
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
   .foot{
    margin-top: 3px;
}
         
        </style>
    </head>
    <%@include file="navigation.jsp" %><br>
    <body>
    <main class="main-content">     
        <div class="card"><br><br><br><br><br><br><br>
    <h3 class="card-title">Useful Links</h3>
    <ul class="card-links">
        <li><a href="https://www.ferwafa.rw" target="_blank">Ferwafa</a></li>
        <li><a href="https://www.fifa.com" target="_blank">Fifa</a></li>
        <li><a href="https://www.moh.gov.rw" target="_blank">Minisante</a></li>
    </ul>
</div>
        
   <form action="#" method="post" class="donation-form">
       <h1>Record Donation</h1><br>
    <div class="input-group">
        <input type="text" name="name" placeholder="Enter Donation name" required>
    </div>
    <div class="input-group">
        <input type="date" name="date" placeholder="Enter date" required>
    </div>
    <div class="input-group">
        <input type="text" name="type" placeholder="Enter type" required>
    </div>
    <div class="input-group">
        <input type="text" name="amount" placeholder="Enter amount" required>
    </div>
    <div class="input-group">
        <button type="submit" name="register">Register</button>
    </div>
</form>
<div class="announcement-card"><br><br><br><br><br><br><br>
    <h3 class="announcement-title">Announcement</h3>
    <p class="announcement-date">6th August 2022</p>
    <p class="announcement-venue">Mariot Hotel</p>
    <p class="announcement-details">Join us for a club fans meeting!</p>
</div> 
    </main><br> 
    <div class="foot">
    <%@include file="footer.jsp" %>
    <div>
    </body>
    
</html>

