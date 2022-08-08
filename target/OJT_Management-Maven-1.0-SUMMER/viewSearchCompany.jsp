<%-- 
    Document   : viewSearchCompany
    Created on : Aug 5, 2022, 3:28:25 AM
    Author     : Tranduc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css"  />
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css" integrity="sha256-3sPp8BkKUE7QyPSl6VfBByBroQbKxKG7tsusY2mhbVY=" crossorigin="anonymous" />
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
        <script src="https://kit.fontawesome.com/12c372e324.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
        <link rel="shortcut icon" href="img/FPT-logoo.jpg">

        <title>FPT OJT</title>
        <style>
            * {
                outline: none;
            }

            .tb {
                display: table;
                width: 100%;
            }

            .td {
                display: table-cell;
                vertical-align: middle;
            }

            input,
            button {
                color: #fff;
                font-family: Nunito;
                padding: 0;
                margin: 0;
                border: 0;
                background-color: transparent;
            }

            #cover {
                position: absolute;
                right: 100px;
                width: 550px;
                padding: 5px;
                margin: -83px auto 0 auto;
                background-color: #f27229;
                border-radius: 20px;
                box-shadow: 0 10px 40px #f27229, 0 0 0 20px #ffffffeb;
                transform: scale(0.6);
            }

            form {
                height: 60px;
            }

            input[type="text"] {
                width: 100%;
                height: 50px;
                font-size: 45px;
                line-height: 1;
                color: black;
            }

            input[type="text"]::placeholder {
                color: grey;
            }

            #s-cover {
                width: 1px;
                padding-left: 35px;
            }

            button {
                position: relative;
                display: block;
                width: 84px;
                height: 60px;
                cursor: pointer;
            }

            #s-circle {
                position: relative;
                top: -8px;
                left: 0;
                width: 40px;
                height: 40px;
                margin-top: 0;
                border-width: 15px;
                border: 15px solid #fff;
                background-color: transparent;
                border-radius: 50%;
                transition: 0.5s ease all;
            }

            button span {
                position: absolute;
                top: 35px;
                left: 22px;
                display: block;
                width: 40px;
                height: 15px;
                background-color: transparent;
                border-radius: 10px;
                transform: rotateZ(52deg);
                transition: 0.5s ease all;
            }

            button span:before,
            button span:after {
                content: "";
                position: absolute;
                bottom: 0;
                right: 0;
                width: 45px;
                height: 15px;
                background-color: #fff;
                border-radius: 10px;
                transform: rotateZ(0);
                transition: 0.5s ease all;
            }

            #s-cover:hover #s-circle {
                top: -1px;
                width: 67px;
                height: 15px;
                border-width: 0;
                background-color: #fff;
                border-radius: 20px;
            }

            #s-cover:hover span {
                top: 50%;
                left: 56px;
                width: 25px;
                margin-top: -9px;
                transform: rotateZ(0);
            }

            #s-cover:hover button span:before {
                bottom: 11px;
                transform: rotateZ(52deg);
            }

            #s-cover:hover button span:after {
                bottom: -11px;
                transform: rotateZ(-52deg);
            }
            #s-cover:hover button span:before,
            #s-cover:hover button span:after {
                right: -6px;
                width: 40px;
                background-color: #fff;
            }
        </style>
    </head>
    <body>

        <div id="preloader">
            <img src="img/loader.gif"/>
        </div>

        <nav class="navbar navbar-dark navbar-expand-md">
            <div class="container">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#Navbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <a class="navbar-brand mr-auto" href="JobListByPageController"><img src="img/logo.png" height="30" width="41"></a>
                <div class="collapse navbar-collapse" id="Navbar">
                    <ul class="navbar-nav">
                        <li class="nav-item ">
                            <a class="nav-link" href="JobListByPageController">
                                <span class="fa fa-home fa-lg"></span>
                                Home
                            </a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="IndexCompanyListController">
                                <span class="fas fa-building-o"></span>
                                Company
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="about.jsp">
                                <span class="fas fa-graduation-cap"></span>
                                About
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="contactus.jsp">
                                <span class="fas fa-address-book"></span>
                                Contact Us
                            </a>
                        </li>
                    </ul>
                </div>
                <% String email = (String) session.getAttribute("accEmail");
                    if (email != null) {
                        int role = (int) session.getAttribute("role");
                        String link = "";
                        if (role == 0) {
                            link = "JobsPostController";

                        } else if (role == 1) {
                            link = "mainController?action=StudentProfilePage";

                        } else {
                            link = "CompanyHomePageController";
                        }
                %> 

                <ul class="navbar-nav navbar-nav-right ml-auto align-items-center">
                    <li class="nav-item dropdown">
                        <a class="nav-link count-indicator dropdown-toggle" id="notificationDropdown" href="#" data-toggle="dropdown">
                            <i class="fa-regular fa-bell mx-0"></i>
                            <span class="count"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="notificationDropdown">
                            <p class="mb-0 font-weight-normal float-left dropdown-header">Notifications</p>
                            <c:if test="${sessionScope.role ==1}">
                                <c:forEach items="${requestScope.appList1}" var="app">   
                                    <c:forEach items="${requestScope.jobList1}" var="job">  
                                        <c:forEach items="${requestScope.comList1}" var="com">                                                                                                   
                                            <c:forEach items="${requestScope.accList1}" var="acc">
                                                <c:if test="${app.getJobID() eq job.getJobID()}">
                                                    <c:if test="${job.getComID() eq com.getComID()}">
                                                        <c:if test="${acc.getAccId() eq com.getAccID()}">   
                                                            <c:if test="${app.getStu_confirm() eq 1 && app.getCom_conirm() eq 0 }">
                                                                <a class="dropdown-item preview-item" href="mainController?action=GetApplication">
                                                                    <div class="preview-thumbnail">
                                                                        <div class="preview-icon">
                                                                            <img src="${acc.getAvatar()}" style="object-fit: cover;
                                                                                 overflow: hidden;
                                                                                 height: 100%;
                                                                                 width: 80px;
                                                                                 padding-right: 20px;"/>
                                                                        </div>
                                                                    </div>
                                                                    <div class="preview-item-content">
                                                                        <p class="preview-subject font-weight-normal" style="margin-bottom: 0px;">${acc.getName()}</p>
                                                                        <p style="color: green;margin-bottom: 0px;">Successfully submitted your application !!!</p>
                                                                        <p class="font-weight-light small-text mb-0 text-muted" style="margin-bottom: 0px;">
                                                                            ${app.getApplyDate()}
                                                                        </p>
                                                                    </div>
                                                                </a>
                                                            </c:if>
                                                            <c:if test="${app.getStu_confirm() eq 1 && app.getCom_conirm() eq 2 }">
                                                                <a class="dropdown-item preview-item" href="mainController?action=GetApplication">
                                                                    <div class="preview-thumbnail">
                                                                        <div class="preview-icon">
                                                                            <img src="${acc.getAvatar()}" style="object-fit: cover;
                                                                                 overflow: hidden;
                                                                                 height: 100%;
                                                                                 width: 80px;
                                                                                 padding-right: 20px;"/>
                                                                        </div>
                                                                    </div>
                                                                    <div class="preview-item-content">
                                                                        <p class="preview-subject font-weight-normal" style="margin-bottom: 0px;">${acc.getName()}</p>
                                                                        <p style="color: tomato;margin-bottom: 0px;">New update on application !!!</p>
                                                                        <p class="font-weight-light small-text mb-0 text-muted">
                                                                            ${app.getApplyDate()}
                                                                        </p>
                                                                    </div>
                                                                </a>
                                                            </c:if>
                                                            <c:if test="${app.getStu_confirm() eq 1 && app.getCom_conirm() eq 1 }">
                                                                <a class="dropdown-item preview-item" href="mainController?action=GetApplication">
                                                                    <div class="preview-thumbnail">
                                                                        <div class="preview-icon">
                                                                            <img src="${acc.getAvatar()}" style="object-fit: cover;
                                                                                 overflow: hidden;
                                                                                 height: 100%;
                                                                                 width: 80px;
                                                                                 padding-right: 20px;"/>
                                                                        </div>
                                                                    </div>
                                                                    <div class="preview-item-content">
                                                                        <p class="preview-subject font-weight-normal" style="margin-bottom: 0px;">${acc.getName()}</p>
                                                                        <p style="color: tomato;margin-bottom: 0px;">New update on application !!!</p>
                                                                        <p class="font-weight-light small-text mb-0 text-muted">
                                                                            ${app.getApplyDate()}
                                                                        </p>
                                                                    </div>
                                                                </a>
                                                            </c:if>
                                                            <c:if test="${app.getStu_confirm() eq 0 && app.getCom_conirm() eq 1 }">
                                                                <a class="dropdown-item preview-item" href="mainController?action=GetApplication">
                                                                    <div class="preview-thumbnail">
                                                                        <div class="preview-icon">
                                                                            <img src="${acc.getAvatar()}" style="object-fit: cover;
                                                                                 overflow: hidden;
                                                                                 height: 100%;
                                                                                 width: 80px;
                                                                                 padding-right: 20px;"/>
                                                                        </div>
                                                                    </div>
                                                                    <div class="preview-item-content">
                                                                        <p class="preview-subject font-weight-normal" style="margin-bottom: 0px;">${acc.getName()}</p>
                                                                        <p style="color: yellowgreen;margin-bottom: 0px;">Received a new offer !!!</p>
                                                                        <p class="font-weight-light small-text mb-0 text-muted">
                                                                            ${app.getApplyDate()}
                                                                        </p>
                                                                    </div>
                                                                </a>
                                                            </c:if>
                                                        </c:if>
                                                    </c:if>
                                                </c:if>
                                            </c:forEach>
                                        </c:forEach>
                                    </c:forEach>
                                </c:forEach>
                            </c:if>
                            <c:if test="${sessionScope.role==2}">
                                <c:set var="acc" value="${sessionScope.acc}"></c:set>
                                <c:forEach var="job" items="${requestScope.comJob}">
                                    <c:if test="${job.getStatus() eq 1}">
                                        <a class="dropdown-item preview-item" href="CompanyHomePageController">
                                            <div class="preview-thumbnail">
                                                <div class="preview-icon">
                                                    <img src="${acc.getAvatar()}" style="object-fit: cover;
                                                         overflow: hidden;
                                                         height: 100%;
                                                         width: 80px;
                                                         padding-right: 20px;"/>
                                                </div>
                                            </div>
                                            <div class="preview-item-content">
                                                <p class="preview-subject font-weight-normal" style="margin-bottom: 0px;">${job.getJobName()}</p>
                                                <p style="color: green;margin-bottom: 0px;">Your Post have been Approved !!!</p>
                                                <p class="font-weight-light small-text mb-0 text-muted" style="margin-bottom: 0px;">
                                                    ${job.getModifyDate()}
                                                </p>
                                            </div>
                                        </a>
                                    </c:if>
                                    <c:if test="${job.getStatus() eq 2}">
                                        <a class="dropdown-item preview-item" href="CompanyHomePageController">
                                            <div class="preview-thumbnail">
                                                <div class="preview-icon">
                                                    <img src="${acc.getAvatar()}" style="object-fit: cover;
                                                         overflow: hidden;
                                                         height: 100%;
                                                         width: 80px;
                                                         padding-right: 20px;"/>
                                                </div>
                                            </div>
                                            <div class="preview-item-content">
                                                <p class="preview-subject font-weight-normal" style="margin-bottom: 0px;">${job.getJobName()}</p>
                                                <p style="color: tomato;margin-bottom: 0px;">Your Post have been Rejected !!!</p>
                                                <p class="font-weight-light small-text mb-0 text-muted" style="margin-bottom: 0px;">
                                                    ${job.getModifyDate()}
                                                </p>
                                            </div>
                                        </a>
                                    </c:if>
                                    <c:if test="${job.getStatus() eq 3}">
                                        <a class="dropdown-item preview-item" href="CompanyHomePageController">
                                            <div class="preview-thumbnail">
                                                <div class="preview-icon">
                                                    <img src="${acc.getAvatar()}" style="object-fit: cover;
                                                         overflow: hidden;
                                                         height: 100%;
                                                         width: 80px;
                                                         padding-right: 20px;"/>
                                                </div>
                                            </div>
                                            <div class="preview-item-content">
                                                <p class="preview-subject font-weight-normal" style="margin-bottom: 0px;">${job.getJobName()}</p>
                                                <p style="color: grey;margin-bottom: 0px;">Post Expired !!!</p>
                                                <p class="font-weight-light small-text mb-0 text-muted" style="margin-bottom: 0px;">
                                                    ${job.getModifyDate()}
                                                </p>
                                            </div>
                                        </a>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                        </div>
                    </li>

                    <li class="nav-item nav-profile dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
                            <img src="${sessionScope.acc.getAvatar()}" style="width: 40px;
                                 height: 40px;
                                 border-radius: 100%;"/>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
                            <a class="dropdown-item" href="<%=link%>">
                                <i class="fa-solid fa-address-card " style="color: #f27229;"></i>
                                Profile
                            </a>
                            <a class="dropdown-item" href="mainController?action=logout">
                                <i class="fa fa-power-off" style="color: #f27229;"></i>
                                Logout
                            </a>
                        </div>
                    </li>       
                </ul>

                <%
                } else {
                %>
                <span class="navbar-text ml-auto">
                    <a href="login.jsp">
                        <span class="fa fa-sign-in"></span> Login</a>
                </span>
                <%
                    }
                %>

            </div>
        </nav>




        <div class="jumbotron">
            <div style="padding-top: 50px;">
                <div id="cover">
                    <form method="post" action="mainController">
                        <div class="tb">
                            <div class="td"><input type="text" name="txtsearch" placeholder="Search..." required></div>
                            <div class="td" id="s-cover">
                                <button type="submit" name="action" value="SearchCompany">
                                    <div id="s-circle"></div>
                                    <span></span>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="container" style="padding-top: 50px; ">
                <div class="row">       
                    <div class="col-lg-12">
                        <div class="row">
                            <c:forEach var="com" items="${requestScope.comList}">
                                <c:forEach var="acc" items="${requestScope.accList}">
                                    <c:if test="${com.getAccID() eq acc.getAccId()}">
                                        <div class="col-sm-6 col-lg-4 mb-4">
                                            <div class="candidate-list candidate-grid" style="border: 1px #f27229 solid; border-radius: 10px; padding-top: 10px;">
                                                <div class="candidate-list-image">
                                                    <img class="img-fluid" src="${acc.getAvatar()}" style="object-fit: cover;
                                                         overflow: hidden;
                                                         height: 100%;
                                                         width: 200px;
                                                         padding-right: 20px;">
                                                </div>
                                                <div class="candidate-list-details">
                                                    <div class="candidate-list-info">
                                                        <div class="candidate-list-title">
                                                            <h4>${acc.getName()}</h4>
                                                        </div>
                                                        <div class="candidate-list-option">
                                                            <ul class="list-unstyled">
                                                                <li><i class="fas fa-map-marker-alt pr-1"></i>${com.getComAddress()}</li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="candidate-list-favourite-time">
                                                        <a class="candidate-list-favourite order-2" href="mainController?action=companyDetails&comID=${com.getComID()}" style="text-decoration: none; border-color: orange;">View</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </c:forEach>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <footer class="footer">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-2 col-sm-2 col-md-2">
                        <a class="navbar-brand mr-auto" href="#"><img src="img/logo.png" height="50" width="70"></a><br>
                    </div>
                    <div class="col-7 col-sm-7 col-md-7">
                        <i class="fa fa-phone fa-lg"></i> 028.73005585<br>
                        <i class="fa fa-envelope fa-lg"></i>
                        <a href="mailto:sschcm@fe.edu.vn"> sschcm@fe.edu.vn</a><br>
                        <a class="btn btn-social-icon btn-facebook" href="https://www.facebook.com/FPTU.HCM"><i
                                class="fa fa-facebook"></i></a>
                        <a class="btn btn-social-icon btn-twitter" href="#"><i class="fa fa-twitter"></i></a>
                        <a class="btn btn-social-icon btn-instagram" href="#"><i class='fa fa-instagram'
                                                                                 style='font-size:36px'></i></a><br>
                        <p class="p-footer">Lô E2a-7, Đường D1, Đ. D1, Long Thạnh Mỹ, Thành Phố Thủ Đức, Thành phố Hồ Chí Minh</p>
                    </div>
                    <div class="col-3 col-sm-3 col-md-3">
                        <iframe class="fpt-map"
                                src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15674.440041588125!2d106.809883!3d10.8411276!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xb752b24b379bae5e!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBGUFQgVFAuIEhDTQ!5e0!3m2!1svi!2s!4v1653973736338!5m2!1svi!2s"
                                width="300" height="200" style="border:0;" allowfullscreen="" loading="lazy"
                                referrerpolicy="no-referrer-when-downgrade"></iframe>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-auto">
                        <p class="p-footer">© Copyright <span class="text-primary">2022</span> Group 7</p>
                    </div>
                </div>
            </div>
        </footer>
        <script>
            var loader = document.getElementById("preloader");
            window.addEventListener("load", function () {
                loader.style.display = "none";
            });
        </script>
    </body>
</html>