<%-- 
    Document   : company_postdetails
    Created on : Jul 22, 2022, 8:49:35 PM
    Author     : Tranduc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                            <a class="nav-link" href="CompanyHomePageController">
                                <span class="fa fa-home fa-lg"></span>
                                Home
                            </a>
                        </li>                      
                        <li class="nav-item">
                            <a class="nav-link" href="StudentListCompanyController">
                                <span class="fa-solid fa-users"></span>
                                Students
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="ApplicationForCompanyController">
                                <span class="fa-solid fa-users"></span>
                                Application
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="CompanyProfileController">
                                <span class="fa fa-building-o fa-lg"></span>
                                Company Profile
                            </a>
                        </li>    
                        <li class="nav-item">
                            <a class="nav-link" href="ResultListController">
                                <span class="fa fa-graduation-cap fa-lg"></span>
                                OJT Results
                            </a>
                        </li>
                    </ul>
                    <ul class="navbar-nav navbar-nav-right ml-auto align-items-center">
                        <li class="nav-item dropdown">
                            <a class="nav-link count-indicator dropdown-toggle" id="notificationDropdown" href="#" data-toggle="dropdown">
                                <i class="fa-regular fa-bell mx-0"></i>
                                <span class="count"></span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="notificationDropdown">
                                <p class="mb-0 font-weight-normal float-left dropdown-header">Notifications</p>
                                <c:if test="${sessionScope.role==1}">
                                    <c:forEach items="${requestScope.appList1}" var="app">   
                                        <c:forEach items="${requestScope.jobList1}" var="job">  
                                            <c:forEach items="${requestScope.comList1}" var="com">                                                                                                   
                                                <c:forEach items="${requestScope.accList1}" var="acc">
                                                    <c:if test="${app.getJobID() eq job.getJobID()}">
                                                        <c:if test="${job.getComID() eq com.getComID()}">
                                                            <c:if test="${acc.getAccId() eq com.getAccID()}">   
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
                                                                        <h5 class="preview-subject font-weight-normal">${acc.getName()}</h5>
                                                                        <h6 class="preview-subject font-weight-normal">${job.getJobName()}</h6>

                                                                        <p class="font-weight-light small-text mb-0 text-muted">
                                                                            ${app.getApplyDate()}
                                                                        </p>
                                                                    </div>
                                                                </a>
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
                                <a class="dropdown-item" href="securityCompany.jsp">
                                    <span class="fa fa-user-lock" style="color: #f27229;"></span> Security</a>
                                <a class="dropdown-item" href="mainController?action=logout">
                                    <i class="fa fa-power-off" style="color: #f27229;"></i>
                                    Logout
                                </a>
                            </div>
                        </li>       
                    </ul>
                </div>          
            </div> 
        </nav>
        
         <c:set var="job" value="${requestScope.job}"/>
        <c:set var="com" value="${requestScope.com}"/>
        <c:set var="acc" value="${requestScope.acc}"/>
        
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
                                    <a href="#"><img src="${acc.getAvatar()}" style="height: 70px; width: 70px;"></a>
                                </div>
                                <div class="job-tittle">

                                    <h4 style="font-weight: bold;">${job.getJobName()}</h4>

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
                                    <a type="button" class="btn" data-toggle="modal" data-target="#exampleModal" >
                                        Apply Now
                                    </a>                                                                                                                                       
                                </div>
                            </div>
                            <div class="post-details4  mb-50">
                                <!-- Small Section Tittle -->
                                <div class="small-section-tittle">
                                    <h4>Company Information</h4>
                                </div>
                                <span>${acc.getName()}</span>
                            <img src="${acc.getAvatar()}" style="height: 225px; width: 225px;"></br>
                            Website:<a href="${com.getWebsite()}"> ${com.getWebsite()}</a>
                        </div>
                    </div>
                </div>
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
