
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        <link rel="shortcut icon" href="logo.png" type="">
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <h1>Hello World!</h1>
        <form action="#" method="post">
            <div class="input-goup">
                <input type="text" name="username" placeholder="Enter Username" required>
             </div>
             <div class="input-goup">
                <input type="text" name="password" placeholder="Enter Password" required>
             </div>
             <div class="input-goup">
                <select name="role" id="role">
                    <option value="#">Choose your Role</option>
                    <option value="manager">Manager</option>
                    <option value="accountant">Accountant</option>
                </select>
             </div>
             <div class="input-goup">
               <button type="submit" name="register">register</button>
             </div>
             <div class="input-goup">
                <p>I'm already a user <a href="index.jsp">Sign in</a></p>
              </div>

        </form>
    </body>
</html>
