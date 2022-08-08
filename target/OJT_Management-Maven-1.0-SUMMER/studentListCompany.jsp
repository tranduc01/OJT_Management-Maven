<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%
    String email = (String) session.getAttribute("accEmail");
    if (email == null) {
%>
<script>
    window.alert("You need to login first !!");
    window.location.href = "login.jsp";
</script>
%>
<%
} else {
    int role = (int) session.getAttribute("role");
    if (role == 0 || role == 1) {
%>
<script>
    window.alert("You don't have permission to access this site !!!");
    window.location.href = "JobListController";
</script>
%><%
} else {
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                            <a class="nav-link" href="CompanyHomePageController">
                                <span class="fa fa-home fa-lg"></span>
                                Home
                            </a>
                        </li>                      
                        <li class="nav-item active">
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


        <%
            if (request.getAttribute("success") != null) {
        %>                                   
        <script>
            alert("Send Offer Success !!!");
        </script>
        <%
            }
        %>


        <div class="jumbotron">
            <table id="example" class="table table-striped table-bordered " style="width:100%;">
                <thead>
                    <tr>
                        <th>Student ID</th>
                        <th>Student Name</th>    
                        <th>Day Of Birth</th>
                        <th>Major</th>
                        <th>Semester</th>
                        <th>Created Date</th>
                        <th>CV Status</th>             
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="stu" items="${requestScope.stuList}">
                        <c:forEach var="acc" items="${requestScope.accList}">
                            <c:if test="${stu.getAccID() eq acc.getAccId()}">
                                <tr>
                                    <td>${stu.getStudentID()}</td>
                                    <td>
                                        <a data-toggle="modal" data-target="#myModalAddInfor${stu.getStudentID()}">${stu.getStudentName()}</a>
                                        <div id="myModalAddInfor${stu.getStudentID()}" class="modal fade" role="dialog">
                                            <div class="modal-dialog">
                                                <!-- Modal content-->
                                                <div class="modal-content">
                                                    <div class="modal-header">                           
                                                        <h4 class="modal-title">Student Information</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <input type="hidden" name="accID" value="${acc.getAccId()}" readonly=""/>
                                                        <div class="form-group">
                                                            <label class="col-sm-2 control-label">Name</label>
                                                            <div class="col-sm-12">
                                                                <input class="form-control" name="txtname" type="text" readonly="" value="${stu.getStudentName()}">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-4 control-label">Student ID</label>
                                                            <div class="col-sm-12">
                                                                <input class="form-control" name="txtstudentid" type="text" readonly="" value="${stu.getStudentID()}">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-2 control-label" >Email</label>
                                                            <div class="col-sm-12">
                                                                <input class="form-control" type="text" name="txtemail" readonly="" value="${acc.getEmail()}">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-2 control-label">Phone</label>
                                                            <div class="col-sm-12">
                                                                <input class="form-control"  type="text" readonly="" name="txtphone" value="${acc.getPhone()}">
                                                            </div>
                                                        </div>                                                    
                                                        <div class="form-group">
                                                            <label class="col-sm-2 control-label" >Major</label>
                                                            <div class="col-sm-12">                                                                                                                                     
                                                                <input class="form-control" type="text" readonly="" name="txtphone" value="${stu.getMajorID()}">                                                                                                                                                                    
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <div class="col-md-6">
                                                                <label class="col-sm-2 control-label">Semester</label>
                                                                <div class="col-md-12">
                                                                    <input class="form-control" type="text" name="txtsemester" value="SU2022">
                                                                </div>
                                                            </div>

                                                            <div class="col-md-6">
                                                                <label class="col-sm-8 control-label" >Date Of Birth</label>
                                                                <div class="col-md-12">
                                                                    <input class="form-control" name="txtdateofbirth" type="date" value="${acc.getBirthday()}">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">

                                                            <c:if test="${stu.getCvPath()!=null}">
                                                                <div class="form-group align-items-center" style="text-align: center;">
                                                                    <a href="${stu.getCvPath()}" class="btn btn-primary" target="_blank">View CV</a>
                                                                </div>
                                                            </c:if>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                    </td>
                                    <td>${acc.getBirthday()}</td>
                                    <td>${stu.getMajorID()}</td>
                                    <td>${stu.getSemesterID()}</td>
                                    <td>${acc.getCrateDate()}</td>
                                    <td><c:if test="${stu.getCvPath() eq null}"><span class="badge badge-danger">No</span></c:if>
                                        <c:if test="${stu.getCvPath() ne null}"><span class="badge badge-success">Yes</span></c:if>
                                        </td>

                                        <td>
                                        <c:if test="${stu.getCvPath() != null}">
                                            <a class="btn btn-primary" data-toggle="modal" data-target="#myModal${stu.getStudentID()}">Offer</a>
                                            <!-- Modal -->
                                            <form action="mainController" method="post">
                                                <input type="hidden" name="txtstuid" value="${stu.getStudentID()}">
                                                <div id="myModal${stu.getStudentID()}" class="modal fade" role="dialog">
                                                    <div class="modal-dialog modal-lg">
                                                        <!-- Modal content-->
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h4 class="modal-title">Jobs List</h4>
                                                            </div>
                                                            <div class="modal-body">
                                                                <table>
                                                                    <thead>
                                                                    <th></th>
                                                                    <th>Job Name</th>
                                                                    <th>Job Title</th>
                                                                    <th>Create Date</th>
                                                                    <th>End Date</th>
                                                                    <th>Major</th>
                                                                    <th>Action</th>
                                                                    </thead>
                                                                    <tbody>
                                                                        <c:forEach var="job" items="${requestScope.jobList}">
                                                                            <tr>
                                                                                <td><input type="radio" name="txtjobid" value="${job.getJobID()}"></td>
                                                                                <td>${job.getJobName()}</td>
                                                                                <td>${job.getJobTitle()}</td>
                                                                                <td>${job.getJobCreateDate()}</td>
                                                                                <td>${job.getJobEndDate()}</td>
                                                                                <td>${job.getMajorID()}</td>
                                                                                <td><a href="mainController?action=CompanyPostDetail&id=${job.getJobID()}" class="text-primary" data-toggle="tooltip" title="" data-original-title="view" style="padding-left: 16px;" target="_blank"><i class="far fa-eye"></i></a></td>
                                                                            </tr>
                                                                        </c:forEach>

                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                                <button type="submit" class="btn btn-primary" name="action" value="SendOffer">Send Offer</button>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </form>
                                        </c:if>
                                    </td>
                                </tr>  
                            </c:if>
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
<%}
    }%>