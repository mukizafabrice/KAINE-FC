<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="session.jsp"%>
<%@include file="connection.jsp" %>
<%
    if (request.getParameter("submit") != null) {
        String d_id = request.getParameter("d_id");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String date = request.getParameter("date");
        String email = request.getParameter("email");

        
        try {
            // Prepare the SQL update statement
            pst = con.prepareStatement("UPDATE donors SET fname = ?, lname = ?, date = ?, email = ? WHERE d_id = ?");
            pst.setString(1, fname);
            pst.setString(2, lname);
            pst.setString(3, date);
            pst.setString(4, email);
            pst.setString(5, d_id);
            pst.executeUpdate();

            %>
            <script>
                alert("Donor updated successfully...");
                window.location.href="manger_view_donors.jsp";
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

    // Variables for the form data
    String d_id = request.getParameter("d_id");
   
    try {
        String query = "SELECT * FROM donors WHERE d_id = ?";
       pst = con.prepareStatement(query);
        pst.setString(1, d_id);
        rs = pst.executeQuery();
        while(rs.next()){
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Donor</title>
        <link rel="shortcut icon" href="logo.png" type="">
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }
            .container {
                max-width: 600px;
                margin: 0 auto;
                padding: 20px;
                background-color: #fff;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                margin-top: 20px;
            }
            h1 {
                text-align: center;
                color: #4070f4;
            }
            form {
                display: flex;
                flex-direction: column;
            }
            .form-group {
                margin-bottom: 15px;
            }
            label {
                font-weight: bold;
                margin-bottom: 5px;
            }
            input[type="text"],
            input[type="date"],
            input[type="email"] {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            button {
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                margin-right: 10px;
                color: #fff;
            }
            .btn-info {
                background-color: #4070f4;
            }
            .btn-warning {
                background-color: #f4a407;
            }
            .btn-info:hover {
                background-color: #3057d5;
            }
            .btn-warning:hover {
                background-color: #d59107;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Update Donor</h1>
            <form action="#" method="post">              
                <input type="hidden" name="d_id" value="<%= d_id %>">
                <div class="form-group">
                    <label class="form-label">First Name</label>
                    <input type="text" name="fname" value="<%= rs.getString("fname") %>" required>
                </div>
                <div class="form-group">
                    <label class="form-label">Last Name</label>
                    <input type="text" name="lname" value="<%= rs.getString("lname") %>" required>
                </div>
                <div class="form-group">  
                    <label class="form-label">Date</label>
                    <input type="date" name="date" value="<%= rs.getString("date") %>" required>
                </div>
                <div class="form-group">  
                    <label class="form-label">Email</label>
                    <input type="email" name="email" value="<%= rs.getString("email") %>" required>
                </div>
                <div class="form-group" align="left">
                    <button type="submit" name="submit" class="btn-info">Submit</button>
                    <button type="reset" name="reset" class="btn-warning">Reset</button>
                </div>
            </form>
        </div>
        <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        %>
    </body>
</html>
