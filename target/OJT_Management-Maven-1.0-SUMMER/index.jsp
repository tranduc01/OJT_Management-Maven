<%-- 
    Document   : index
    Created on : Jun 6, 2022, 9:59:41 AM
    Author     : Tranduc
--%>

<%@page import="java.time.Period"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@page import="sample.student.StudentDTO"%>
<%@page import="sample.account.AccountDTO"%>
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
                        <li class="nav-item active">
                            <a class="nav-link" href="JobListByPageController">
                                <span class="fa fa-home fa-lg"></span>
                                Home
                            </a>
                        </li>                     
                        <li class="nav-item">
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

        <div id="demo" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ul class="carousel-indicators">
                <li data-target="#demo" data-slide-to="0" class="active"></li>
                <li data-target="#demo" data-slide-to="1"></li>
                <li data-target="#demo" data-slide-to="2"></li>
            </ul>

            <!-- The slideshow -->
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img style="width: 1550px; height: 500px;" src="img/slide-1.jpg">
                </div>
                <div class="carousel-item">
                    <img style="width: 1550px; height: 500px;" src="img/slide-2.jpg">
                </div>
                <div class="carousel-item">
                    <img style="width: 1550px; height: 500px;" src="img/slider-3.jpg">
                </div>
            </div>

            <!-- Left and right controls -->
            <a class="carousel-control-prev" href="#demo" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#demo" data-slide="next">
                <span class="carousel-control-next-icon"></span>
            </a>
        </div>

        <div class="jumbotron">            
            <div class="row">
                <div class="col-lg-10 mx-auto">
                    <div class="career-search mb-60">
                        <form action="mainController" class="career-form mb-60">
                            <div class="row">
                                <div class="form-group col-md-6 col-lg-4 my-4">
                                    <div class="input-group position-relative">
                                        <input style="height: auto;" type="text" class="form-control" placeholder="Enter Your Keywords" id="keywords" name="keyword" value="<%= (request.getParameter("keyword") == null) ? "" : (request.getParameter("keyword"))%>">
                                    </div>
                                </div>

                                <div class=" form-group col-md-6 col-lg-4 my-4">
                                    <div class="select-container">
                                        <select class="custom-select" name="txtmajor">
                                            <option selected="" style="color: black;" value="all">All Majors</option>
                                            <c:forEach var="major" items="${requestScope.majorList}">
                                                <option value="${major.getMajorID()}" style="color: black;">${major.getMajorName()}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group col-md-6 col-lg-4 my-4">
                                    <button type="submit" class="btn btn-lg btn-block btn-light btn-custom" id="contact-submit" name="action" value="SearchJob">
                                        Search
                                    </button>
                                </div>
                            </div>
                        </form>
                        <%
                            if (request.getAttribute("jobList") != null) {
                        %>
                        <c:forEach var="job" items="${requestScope.jobList}">
                            <c:forEach var="com" items="${requestScope.companyList}">
                                <c:forEach var="acc" items="${requestScope.accList}">
                                    <c:if test="${job.getComID() eq com.getComID()}">
                                        <c:if test="${com.getAccID() eq acc.getAccId()}">
                                            <div class="filter-result">                 
                                                <div class="job-box d-md-flex align-items-center justify-content-between mb-30">
                                                    <div class="job-left my-4 d-md-flex align-items-center flex-wrap">
                                                        <div class="img-holder mr-md-4 mb-md-0 mb-4 mx-auto mx-md-0 d-md-none d-lg-flex">
                                                            <img src="${acc.getAvatar()}" style="height: 100px; width: 150px;">
                                                        </div>
                                                        <a href="mainController?action=jobDetails&jobid=${job.getJobID()}" style="text-decoration: none; color: black;">
                                                            <div class="job-content" style="padding-left: 50px;">
                                                                <h4 class="text-center text-md-left">${job.getJobName()}</h4>
                                                                <ul class="d-md-flex flex-wrap text-capitalize ff-open-sans">
                                                                    <li class="mr-md-4">
                                                                        <i class="zmdi zmdi-pin mr-2" style="padding-left: 3px; padding-top: 5px;"></i> ${com.getComAddress()} </br>                                                              
                                                                    </li>                                                                                                                                                                                                  
                                                                </ul>
                                                            </div>
                                                        </a>
                                                    </div>
                                                    <c:set var="end" value="${job.getJobEndDate()}" scope="request"/>
                                                    <% Date d = (Date) request.getAttribute("current");
                                                        Date d2 = (Date) request.getAttribute("end");
                                                        LocalDate date = d.toLocalDate();
                                                        LocalDate end = d2.toLocalDate();
                                                        Period p = Period.between(date, end);
                                                    %>
                                                    <div class="job-right my-4 flex-shrink-0">
                                                        <i class="fa fa-user" style="padding-top: 5px;"></i> ${job.getAmount()}
                                                        </br>
                                                        <i class="fa fa-calendar-alt" style="padding-top: 7px;"></i> Create Date: ${job.getJobCreateDate()} 
                                                        </br>                                                              
                                                        <p>Remaining: <%= p.getDays()%> days<p>
                                                    </div>

                                                </div>
                                            </div>
                                        </c:if>
                                    </c:if>
                                </c:forEach>
                            </c:forEach>
                        </c:forEach>
                    </div>

                    <!-- START Pagination -->
                    <nav aria-label="Page navigation">
                        <ul class="pagination pagination-reset justify-content-center">
                            <c:if test="${requestScope.pagenum-1 ==0}"><li class="page-item"> <a class="page-link" href="mainController?action=viewbypage&page=1">Prev</a> </li></c:if>
                            <c:if test="${requestScope.pagenum-1 !=0}"><li class="page-item"> <a class="page-link" href="mainController?action=viewbypage&page=${requestScope.pagenum-1}">Prev</a> </li></c:if>
                                <li class="page-item"><a class="page-link" href="mainController?action=viewbypage&page=1">1</a></li>
                                <li class="page-item"><a class="page-link" href="mainController?action=viewbypage&page=2">2</a></li>
                                <li class="page-item"><a class="page-link" href="mainController?action=viewbypage&page=3">3</a></li>
                                <li class="page-item"><a class="page-link" href="mainController?action=viewbypage&page=4">4</a></li>
                                <li class="page-item"><a class="page-link" href="mainController?action=viewbypage&page=5">5</a></li>
                                <li class="page-item"><a class="page-link" href="mainController?action=viewbypage&page=6">6</a></li>
                            <c:if test="${requestScope.pagenum+1 >6}"><li class="page-item"> <a class="page-link" href="mainController?action=viewbypage&page=6">Next</a> </li></c:if>
                            <c:if test="${requestScope.pagenum+1 <7}"><li class="page-item"> <a class="page-link" href="mainController?action=viewbypage&page=${requestScope.pagenum+1}">Next</a> </li></c:if>

                            </ul>
                        </nav>
                        <!-- END Pagination -->
                    </div>   

                </div>
                <!-- Swiper -->
                <div class="container">
                    <div class="swiper card_slider">
                        <!-- Additional required wrapper -->
                        <div class="swiper-wrapper">
                            <!-- Slides -->
                        <c:forEach var="com" items="${requestScope.companyList}">
                            <c:forEach var="acc" items="${requestScope.accList}">
                                <c:if test="${com.getAccID() eq acc.getAccId()}">
                                    <div class="swiper-slide">              
                                        <a href="mainController?action=companyDetails&comID=${com.getComID()}"><img style="width:100% ;" src="${acc.getAvatar()}"></a>            
                                    </div>
                                </c:if>
                            </c:forEach>
                        </c:forEach>
                    </div>

                    <!-- If we need navigation buttons -->
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>

                </div>
            </div>
        </div>  
        <%
            } else {
                response.sendRedirect("JobListByPageController");
            }
        %>

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


        <script src="node_modules/jquery/dist/jquery.slim.min.js"></script>
        <script src="node_modules/popper.js/dist/umd/popper.min.js"></script>
        <script src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
        <script>
            var loader = document.getElementById("preloader");
            window.addEventListener("load", function () {
                loader.style.display = "none";
            });
        </script>
        <script>
            $(document).ready(function () {
                $(".carousel-inner").carousel({interval: 2000});
            });
        </script>
        <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
        <script type="text/javascript">
            var swiper = new Swiper(".card_slider", {
                spaceBetween: 30,
                loop: true,
                speed: 1000,
                autoplay: {
                    delay: 2000,
                },
                pagination: {
                    el: ".swiper-pagination",
                    clickable: true,
                },
                navigation: {
                    nextEl: ".swiper-button-next",
                    prevEl: ".swiper-button-prev"
                },
                breakpoints: {
                    1200: {
                        slidesPerView: 4,
                    },
                    768: {
                        slidesPerView: 3,
                    },
                    480: {
                        slidesPerView: 2,
                    },
                    320: {
                        slidesPerView: 1,
                    },
                },
            });
        </script>
    </body>
</html>