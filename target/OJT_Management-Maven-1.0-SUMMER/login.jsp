<%-- 
    Document   : login
    Created on : Jun 7, 2022, 9:44:06 AM
    Author     : Tranduc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/login.css"  />
        <link rel="shortcut icon" href="img/FPT-logoo.jpg">
        <title>Login</title>
    </head>
    <body>
        <div id="preloader">
            <img src="img/loader.gif"/>
        </div>
        <div class="wrapper fadeInDown">
            <div id="formContent">
                <!-- Tabs Titles -->
                <h2 class="active"> Sign In </h2>


                <!-- Icon -->
                <div class="fadeIn first">

                    <img src="img/fpt-university.png" alt="" style="height: 100px; width: 250px;"/>
                </div>

                <!-- Login Form -->
                <form action="mainController" method="post">
                    <input type="text" id="login" class="fadeIn second" name="txtemail" placeholder="login" required="">
                    <input type="password" id="password" class="fadeIn third" name="txtpassword" placeholder="password" required="">
                    <input type="submit" class="fadeIn fourth" value="Log In" name="action">
                    </br>
                    <p style="color: red;"><%= (request.getAttribute("loginError") == null) ? "" : request.getAttribute("loginError")%></p>
                </form>




            </div>
        </div>
        <script>
            var loader = document.getElementById("preloader");
            window.addEventListener("load", function () {
                loader.style.display = "none";
            });
        </script>
    </body>
</html>
