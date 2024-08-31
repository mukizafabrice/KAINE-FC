<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="utf-8">
  <title>Welcome to Kaine FC</title>
  <link rel="shortcut icon" href="logo.png" type="">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: Arial, sans-serif;
    }

    body {
      background-color: #f5f5f5;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      padding: 20px;
    }

    .main-content {
      width: 100%;
      max-width: 1200px;
      display: flex;
      flex-direction: column;
      gap: 50px;
      background-color: white;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .logo {
      width: 100%;
      display: flex;
      align-items: center;
      background-color: #4070f4;
      padding: 20px;
      border-radius: 10px;
    }

    .logo img {
      width: 100px;
      height: auto;
      margin-right: 20px;
    }

    .logo h1 {
      color: white;
      font-size: 2rem;
    }

    .subsection {
      display: flex;
      justify-content: space-between;
      gap: 20px;
    }

    .nav__menu {
      list-style: none;
      padding: 0;
    }

    .nav__menu li {
      margin-bottom: 15px;
    }

    .nav__menu li a {
      text-decoration: none;
      color: black;
      font-size: 1.2rem;
    }

    .staff {
      width: 50%;
    }

    .staff h1 {
      font-size: 1.5rem;
      margin-bottom: 10px;
    }

    .staff div {
      margin-bottom: 15px;
    }

    .staff h5 {
      font-size: 1.1rem;
      margin-bottom: 5px;
    }

    .lastsec {
      max-width: 300px;
    }

    .lastsec h3 {
      font-size: 1.5rem;
      margin-bottom: 10px;
    }

    .lastsec p {
      font-size: 1rem;
      line-height: 1.5;
      margin-bottom: 10px;
    }

    .lastsec hr {
      border: 0;
      border-top: 1px solid #ccc;
    }

    .action-button {
      font: inherit;
      font-size: 1.25rem;
      padding: 1em;
      margin: 20px 0;
      width: 200px;
      font-weight: 500;
      background-color: #4070f4;
      border-radius: 6px;
      color: #FFF;
      border: none;
      cursor: pointer;
      text-align: center;
      display: block;
      text-decoration: none;
    }

    .action-button a {
      text-decoration: none;
      color: white;
    }

    .foot {
      text-align: center;
      margin-top: 20px;
    }
  </style>
</head>

<body>
  <section class="main-content">
    <div class="logo">
      <img src="logo.png" alt="Kaine Fc Logo" />
      <div class="header">
        <h1>Welcome to Kaine FC Official Platform</h1>
      </div>
    </div>

    <div class="subsection">
      <nav class="nav">
        <ul class="nav__menu">
          <li><a href="https://www.ferwafa.rw">Ferwafa</a></li>
          <li><a href="https://www.fifa.com">Fifa</a></li>
          <li><a href="https://www.moh.gov.rw">Minisante</a></li>
        </ul>
      </nav>

      <div class="staff">
        <h1>Here Is Our Staff</h1>
        <div>
          <h5>President: Jeff MUHINYUZA</h5><br>
          <h5>Manager: Dreck GATO</h5>
        </div>
        <div>
          <h5>Accountant: Monday Chrito</h5><br>
          <h5>Secretary: Jeanne KAYITERA</h5>
        </div>
        <h5>Captain: Rico Pie</h5>
      </div>

      <div class="lastsec">
        <h3>Club Fans Meeting</h3>
        <p>Join us for a club fans meeting on <strong>6th August 2022</strong> at <strong>Mariot Hotel</strong>.</p>
        <hr>
      </div>
    </div>

    <button class="action-button">
      <a href="index.jsp">Get Started</a>
    </button>
  </section>

</body>

</html>
