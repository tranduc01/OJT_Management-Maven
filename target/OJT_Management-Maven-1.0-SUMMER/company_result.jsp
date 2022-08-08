<%-- 
    Document   : company_result
    Created on : Aug 4, 2022, 8:14:07 PM
    Author     : Tranduc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css"  />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css"></script>
        <script src="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap4.min.css"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap4.min.js"></script>

        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
        <script src="https://kit.fontawesome.com/12c372e324.js" crossorigin="anonymous"></script>
        <link rel="shortcut icon" href="img/FPT-logoo.jpg">
        <title>FPT OJT</title>

        <style>
            *{
                padding: 0px;
                margin: 0px;
            }

            .form{
                display: flex-end;
                margin: 0rem 10rem 0rem 10rem ;
                padding: 20px 50px;
                border-radius: 10px;
                color: black;
                border: #000 solid 1px;  
                text-align: center;

            }

            .button-submit{
                padding: 5px 50px;
                background-color: #f27229;
                color: white;
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
                        <li class="nav-item">
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
                        <li class="nav-item active">
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
        <div class="jumbotron">
            
            <a style="font-size: 15pt; color: white; background-color: #f27229; float: right; border-radius: 10px; border: 1px grey solid; text-decoration: none;" href="result-template/OJT_Result.xlsx" download="">Download Template</a>
            
            <div class="container submit-OJT-container row">
                <form class="form col-md-12" action="ImportResultController" enctype="multipart/form-data" method="post"> 
                    <div class="form-title">
                        <h2>Upload File Excel</h2>               
                    </div>
                    <div class="form-group">
                        <input type="file" id="myfile" name="myfile" accept=".csv, .xlsx">
                    </div>

                    <div class="button">
                        <button type="submit" class="btn button-submit">
                            <span class="fa fa-upload fa-lg"></span>
                            Upload
                        </button>
                    </div>
                </form>
            </div>


            <table id="example" class="table table-striped table-bordered" style="width:100%;">
                <thead>
                    <tr>
                        <th>Student ID</th>
                        <th>Student Name</th>    
                        <th>Grade</th>
                        <th>Comment</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.appList}" var="app">   
                        <c:forEach items="${requestScope.jobList}" var="job">  
                            <c:forEach items="${requestScope.resultList}" var="res">
                            <c:forEach items="${requestScope.stuList}" var="stu">                                                                                                   
                                <c:forEach items="${requestScope.accList}" var="acc">                                   
                                        <c:if test="${app.getJobID() eq job.getJobID()}">
                                            <c:if test="${res.getAppID() eq app.getApplyID()}">   
                                            <c:if test="${app.getStuID() eq stu.getStudentID()}">
                                                <c:if test="${acc.getAccId() eq stu.getAccID()}">                                                                                                        
                                                        <tr>
                                                            <td>${stu.getStudentID()}</td>
                                                            <td>${acc.getName()}</td>
                                                            <td>${res.getGrade()}</td>
                                                            <td>${res.getComment()}</td>
                                                            <td>${res.getStatus()}</td>
                                                        </tr>                                                                                                                                       
                                                    </c:if>                                                                                                                              
                                                </c:if>
                                            </c:if> 
                                        </c:if>
                                    </c:forEach>
                                </c:forEach>
                            </c:forEach>
                        </c:forEach>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <script>
            $(document).ready(function () {
                $('#example').DataTable();
            });
        </script>
        <script>
            var loader = document.getElementById("preloader");
            window.addEventListener("load", function () {
                loader.style.display = "none";
            });
        </script> 
    </body>
</html>
