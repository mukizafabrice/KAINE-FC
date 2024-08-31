<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Google Font Import Link */
        @import url('https://fonts.googleapis.com/css2?family=Ubuntu:wght@400;500;700&display=swap');
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            text-decoration: none;
            font-family: 'Ubuntu', sans-serif;
        }

        nav {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            padding: 15px 30px;
            background: #4070f4;
            color: #fff;
            transition: all 0.4s ease;
            z-index: 1000;
        }

        .nav-content {
            display: flex;
            align-items: center;
            justify-content: space-between;
            max-width: 1200px;
            margin: auto;
        }

        .logo {
            display: flex;
            align-items: center;
        }

        .logo img {
            height: 90px; /* Adjust height as needed */
            width: 100%;
        }

        .logo a {
            font-weight: 500;
            font-size: 35px;
            color: #fff;
            display: flex;
            align-items: center;
        }

        .nav-links {
            display: flex;
            list-style: none;
        }

        .nav-links li {
            margin: 0 12px;
        }

        .nav-links li a {
            text-decoration: none;
            color: #fff;
            font-size: 18px;
            font-weight: 500;
            padding: 10px 5px;
            transition: all 0.3s ease;
        }

        .nav-links li a:hover {
            text-decoration: underline;
        }

        .home {
            height: 100vh;
            width: 100%;
            background: url("images/background.png") no-repeat;
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }

        h2 {
            font-size: 30px;
            margin-bottom: 6px;
            color: #4070f4;
        }

        .text {
            text-align: justify;
            padding: 40px 80px;
            box-shadow: -5px 0 10px rgba(0, 0, 0, 0.1);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .nav-content {
                flex-direction: column;
                align-items: flex-start;
            }

            .nav-links {
                flex-direction: column;
                width: 100%;
                margin-top: 10px;
            }

            .nav-links li {
                margin: 5px 0;
            }
        }
    </style>
</head>
<body>
    <nav>
        <div class="nav-content">
            <div class="logo">
                <a href="#">
                    <img src="logo.png" alt="Kaine FC Logo">KAINE FC
                </a>
            </div>
            <ul class="nav-links">
                 <li><a href="accountant.jsp"><i class="fas fa-home"></i> Home</a></li>
                 <li><a href="donors.jsp"><i class="fas fa-users"></i> Donors</a></li>
                 <li><a href="donation.jsp"><i class="fas fa-hand-holding-usd"></i> Donation</a></li>
                <li><a href="accountantRepo.jsp"><i class="fas fa-file-alt"></i> Report</a></li>
                <li><a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
            </ul>
        </div>
    </nav>
</body>
</html>
