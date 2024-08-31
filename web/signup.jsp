<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connection.jsp" %>
<%
    if (request.getParameter("signup") != null) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
         try {  
            pst = con.prepareStatement("INSERT INTO `users` (`user_id`, `username`, `password`, `role`) VALUES (NULL, ?, ?, ?)");

            pst.setString(1, username);
            pst.setString(2, password);
            pst.setString(3, role);
            pst.executeUpdate();

            %>
            <script>
                alert("Account is created Successfully successfully");
                window.location.href="index.jsp";
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
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Create Account</title>
  <link rel="shortcut icon" href="logo.png" type="">
  <link rel="stylesheet" href="main.css">
  <style>
      @import url("https://fonts.googleapis.com/css2?family=Poppins&display=swap");

* {
  margin: 0;
  padding: 0;
  font-family: "Poppins", sans-serif;
}

section {
  height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
}

a {
  color: #3c67b2;
  text-decoration: none;
}

a:hover {
  text-decoration: underline;
}

.login-box {
  width: 20rem;
  margin: 0px 10px;
  text-align: center;
  border-radius: 0.5rem;
  background-color: #fff;
  box-shadow: 0px 0px 20px 4px #cecece;
}

.header {
  color: #fff;
  padding: 1.4rem;
  margin-bottom: 0.8rem;
  border-radius: 0.5rem 0.5rem 0 0;
  background: #4157be;
}

.input-box {
  margin-top: 0.6rem;
  margin-bottom: 0.6rem;
}

.input-box input[type="text"],
.input-box input[type="password"] {
  width: 85%;
  height: 2rem;
  border-radius: 20px;
  margin-bottom: 0.6rem;
  outline: none;
  border: 1px solid #a7a7a7;
  padding: 0 8px 0px 8px;
  color: grey;
}

.input-box input[type="text"]:focus-visible,
.input-box input[type="password"]:focus-visible {
  border: 1px solid #3c67b2;
}

.input-box .options {
  display: flex;
  justify-content: space-around;
}

.input-box .options label,
.input-box .options a {
  font-size: 15px;
  cursor: pointer;
}

.input-box input[type="submit"] {
  color: #fff;
  cursor: pointer;
  font-size: 16px;
  padding: 5px 5rem;
  border-radius: 50px;
  margin: 10px 0px 0px 0px;
  border: 1px solid transparent;
  transition: background 0.3s ease;
  background: #4157be;
}

.input-box input[type="submit"]:hover {
  background: #202020;
}

.link {
  font-size: 14px;
  margin: 0px 0px 10px 0px;
}
.options select{
  width: 90%;
  height: 2rem;
  border-radius: 20px;
  margin-bottom: 0.6rem;
  outline: none;
  border: 1px solid #a7a7a7;
  padding: 0 8px 0px 8px;
  color: grey;
}
</style>
</head>
<section>
  <div class="login-box">
    <div class="header">
      <h2>Create Account Here</h2>
    </div>
    <div class="input-box">
      <form action="#" method="POST">
        <input type="text" name="username" placeholder="UserName" required>
        <input type="password" name="password" placeholder="Password" required>
        <div class="options" >
              <select name="role">
                  <option value=" ">Select Account Type</option>
                  <option value="accountant">Accountant</option>
                  <option value="manager">Manager</option>
              </select>          
        </div>
        <input type="submit" name="signup" value="SignUp">
      </form>
    </div>
    <div class="link">
        <p>Already have an account? <a href="index.jsp"><span>Login In Here</span></a></p>
    </div>
  </div>
    </section>
</html>