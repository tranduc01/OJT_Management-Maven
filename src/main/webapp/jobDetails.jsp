<%-- 
    Document   : jobDetails
    Created on : Jun 7, 2022, 1:46:35 PM
    Author     : Tranduc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
        <link rel="stylesheet" href="css/style.css"  />
        <link rel="stylesheet" href="css/jobDetails.css"  />
        <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets/css/flaticon.css">
        <link rel="stylesheet" href="assets/css/slicknav.css">
        <link rel="stylesheet" href="assets/css/price_rangs.css">
        <link rel="stylesheet" href="assets/css/animate.min.css">
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
        <link rel="stylesheet" href="assets/css/themify-icons.css">
        <link rel="stylesheet" href="assets/css/slick.css">
        <link rel="stylesheet" href="assets/css/nice-select.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="manifest" href="site.webmanifest">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
        <script src="https://kit.fontawesome.com/12c372e324.js" crossorigin="anonymous"></script>
        <link rel="shortcut icon" href="img/FPT-logoo.jpg">
        <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>

        <title>FPT OJT</title>


        <style>

            h2 {
                color: #000;
                font-size: 26px;
                font-weight: 300;
                text-transform: uppercase;
                position: relative;
                margin: 30px 0 60px;
            }
            h2::after {
                content: "";
                width: 100px;
                position: absolute;
                margin: 0 auto;
                height: 4px;
                border-radius: 1px;
                background: #f27229;
                left: 0;
                bottom: -20px;
            }
            .carousel {
                margin: 50px auto;
                padding: 0 70px;
            }
            .carousel .item {
                color: #747d89;
                min-height: 325px;
                text-align: center;
                overflow: hidden;
            }
            .carousel .thumb-wrapper {
                padding: 25px 15px;
                background: #fff;
                border-radius: 6px;
                text-align: center;
                position: relative;
                box-shadow: 0 2px 3px rgba(0,0,0,0.2);
            }
            .carousel .item .img-box {
                height: 120px;
                margin-bottom: 20px;
                width: 100%;
                position: relative;
            }
            .carousel .item img {	
                max-width: 100%;
                max-height: 100%;
                display: inline-block;
                position: absolute;
                bottom: 0;
                margin: 0 auto;
                left: 0;
                right: 0;
            }
            .carousel .item h4 {
                font-size: 18px;
            }
            .carousel .item h4, .carousel .item p, .carousel .item ul {
                margin-bottom: 5px;
            }
            .carousel .thumb-content .btn {
                color: #f27229;
                font-size: 11px;
                text-transform: uppercase;
                font-weight: bold;
                background: none;
                border: 1px solid #f27229;
                padding: 6px 14px;
                margin-top: 5px;
                line-height: 16px;
                border-radius: 20px;
            }
            .carousel .thumb-content .btn:hover, .carousel .thumb-content .btn:focus {
                color: #fff;
                background: #f27229;
                box-shadow: none;
            }
            .carousel .thumb-content .btn i {
                font-size: 14px;
                font-weight: bold;
                margin-left: 5px;
            }
            .carousel .item-price {
                font-size: 13px;
                padding: 2px 0;
            }
            .carousel .item-price strike {
                opacity: 0.7;
                margin-right: 5px;
            }
            .carousel-control-prev, .carousel-control-next {
                height: 44px;
                width: 40px;
                background: #f27229;	
                margin: auto 0;
                border-radius: 4px;
                opacity: 0.8;
            }
            .carousel-control-prev:hover, .carousel-control-next:hover {
                background: #f27229;
                opacity: 1;
            }
            .carousel-control-prev i, .carousel-control-next i {
                font-size: 36px;
                position: absolute;
                top: 50%;
                display: inline-block;
                margin: -19px 0 0 0;
                z-index: 5;
                left: 0;
                right: 0;
                color: #fff;
                text-shadow: none;
                font-weight: bold;
            }
            .carousel-control-prev i {
                margin-left: -2px;
            }
            .carousel-control-next i {
                margin-right: -4px;
            }		
            .carousel-indicators {
                bottom: -50px;
            }
            .carousel-indicators li, .carousel-indicators li.active {
                width: 10px;
                height: 10px;
                margin: 4px;
                border-radius: 50%;
                border: none;
            }
            .carousel-indicators li {	
                background: rgba(0, 0, 0, 0.2);
            }
            .carousel-indicators li.active {	
                background: rgba(0, 0, 0, 0.6);
            }
            .carousel .wish-icon {
                position: absolute;
                right: 10px;
                top: 10px;
                z-index: 99;
                cursor: pointer;
                font-size: 16px;
                color: #abb0b8;
            }
            .carousel .wish-icon .fa-heart {
                color: #ff6161;
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
            
            <%
                if(request.getAttribute("error")!=null){
                    %>
                    <script>
                        alert("You have already applied for this company !!!");
                    </script>
        
        <%
                }
            %>
            
            
        <c:set var="job" value="${requestScope.job}"/>
        <c:set var="com" value="${requestScope.com}"/>
        <c:set var="acc" value="${requestScope.acc}"/>
        <c:set var="stuAcc" value="${sessionScope.acc}"/>
        <!-- job post company Start -->
        <div class="job-post-company pt-120 pb-120">
            <div class="container">
                <div class="row justify-content-between">
                    <!-- Left Content -->
                    <div class="surround col-xl-7 col-lg-8">
                        <!-- job single -->
                        <div class="single-job-items mb-50">
                            <div class="job-items">
                                <div class="company-img company-img-details">
                                    <a href="mainController?action=companyDetails&comID=${com.getComID()}" target="_blank"><img src="${acc.getAvatar()}" style="object-fit: cover;
                                                                                                                                overflow: hidden;
                                                                                                                                height: 100%;
                                                                                                                                width: 200px;
                                                                                                                                padding-right: 20px;"></a>
                                </div>
                                <div class="job-tittle">

                                    <h4 style="font-weight: bold; padding-top: 10px;">${job.getJobName()}</h4>

                                    <ul>
                                        <li>${job.getJobTitle()}</li>                                       
                                        <li>$${job.getJobSalary()}</li>

                                    </ul>
                                    <i class="fas fa-map-marker-alt"></i> ${com.getComAddress()}
                                </div>
                            </div>
                        </div>
                        <!-- job single End -->

                        <div class="job-post-details">
                            <div class="post-details1 mb-50">
                                <!-- Small Section Tittle -->
                                <div class="small-section-tittle">
                                    <h4 style="font-weight: bold;">Job Description</h4>
                                </div>
                                <div class="long-text"><pre>${job.getJobDescription()}</pre></div>
                            </div>
                            <div class="post-details2  mb-50">
                                <!-- Small Section Tittle -->
                                <div class="small-section-tittle">
                                    <h4 style="font-weight: bold;">Requirements</h4>
                                </div>
                                <pre>${job.getJobRequirement()}</pre>
                            </div>
                            <div class="post-details2  mb-50">
                                <!-- Small Section Tittle -->
                                <div class="small-section-tittle">
                                    <h4 style="font-weight: bold;">Benefits</h4>
                                </div>
                                <pre>${job.getJobBenefits()}</pre>
                            </div>
                        </div>

                    </div>
                    <!-- Right Content -->
                    <div class="col-xl-4 col-lg-4">
                        <div class="post-details3  mb-50">
                            <!-- Small Section Tittle -->
                            <div class="small-section-tittle">
                                <h4 style="font-weight: bold;">Job Overview</h4>
                            </div>
                            <ul>
                                <li>Posted date : <span>${job.getJobCreateDate()}</span></li>

                                <li>Amount : <span>${job.getAmount()}</span></li>

                                <li>Salary :  <span>$${job.getJobSalary()}</span></li>
                                <li>End date : <span>${job.getJobEndDate()}</span></li>
                            </ul>
                            <div class="apply-btn2">
                                <div class="line"></div>
                                <c:if test="${sessionScope.role==null}">
                                    <a type="button" class="btn" data-toggle="modal" data-target="#exampleModal" <c:if test="${sessionScope.acc eq null}">onclick="warning()"</c:if>>
                                            Apply Now
                                        </a>
                                </c:if>
                                <c:if test="${sessionScope.role==1}">
                                    <c:if test="${requestScope.availabe == null}">
                                        <a type="button" class="btn" data-toggle="modal" data-target="#exampleModal">
                                            Apply Now
                                        </a>
                                    </c:if>
                                    <c:if test="${requestScope.availabe !=null}">
                                        <a type="button" class="btn">
                                            Applied
                                        </a>
                                    </c:if>
                                </c:if>   
                                <c:if test="${sessionScope.role==0 || sessionScope.role==2}">
                                    <a type="button" class="btn" >
                                        Apply Now
                                    </a> 
                                </c:if>

                            </div>
                        </div>
                        <div class="post-details4  mb-50">
                            <!-- Small Section Tittle -->
                            <div class="small-section-tittle">
                                <h4>Company Information</h4>
                            </div>
                            <span>${acc.getName()}</span>


                            <a href="mainController?action=companyDetails&comID=${com.getComID()}" target="_blank"><img src="${acc.getAvatar()}" style="height: 225px; width: 225px;"></a></br>
                            Website:<a href="${com.getWebsite()}"> ${com.getWebsite()}</a>


                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- job post company End -->

        <!-- Modal -->
        <form action="mainController" method="post">
            <input type="hidden" name="jobID" value="${job.getJobID()}">

            <c:set var="stu" value="${requestScope.stu}"/>
            <input type="hidden" name="stuID" value="${stu.getStudentID()}">           


            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel" style="font-weight: bold;">Application</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <c:if test="${stu.getCvPath() != null}">
                                Your CV: <a href="${stu.getCvPath()}" target="_blank">View</a>
                            </c:if>
                            <c:if test="${stu.getCvPath() == null}">
                                <p>Please Upload your CV first !!!</p>
                            </c:if>


                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn" data-dismiss="modal" style="font-weight: bold;">Close</button>
                            <c:if test="${stu.getCvPath() != null}">
                                <button type="submit" class="btn" style="font-weight: bold;" value="InsertApplication" name="action">Apply</button>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </form>


        <div class="container-xl">
            <div class="row">
                <div class="col-md-12">
                    <h2>Similar <b>Jobs</b></h2>
                    <div class="carousel">

                        <div class="item">
                            <div class="row">
                                <c:forEach var="job" items="${requestScope.jobList}">
                                    <c:forEach var="com" items="${requestScope.companyList}">
                                        <c:forEach var="acc" items="${requestScope.accList}">
                                            <c:if test="${job.getComID() eq com.getComID()}">
                                                <c:if test="${com.getAccID() eq acc.getAccId()}">
                                                    <div class="col-sm-3" style="padding-top: 20px; padding-bottom: 5px;">
                                                        <div class="thumb-wrapper">
                                                            <div class="img-box">
                                                                <img src="${acc.getAvatar()}" class="img-fluid" alt="">									
                                                            </div>
                                                            <div class="thumb-content">
                                                                <h4>${acc.getName()}</h4>									                                             
                                                                <p class="item-price"><b>${job.getJobName()}</b></p>
                                                                <a href="mainController?action=jobDetails&jobid=${job.getJobID()}" class="btn btn-primary">View</a>
                                                            </div>						
                                                        </div>
                                                    </div>   
                                                </c:if>
                                            </c:if>
                                        </c:forEach>
                                    </c:forEach>
                                </c:forEach>                                                                   
                            </div>
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
        <script>
            function warning() {
                window.alert("You need to login first !!!");
                window.location.href = "login.jsp";
            }
        </script>
    </body>
</html>
