<%-- 
    Document   : admin_page
    Created on : Jun 13, 2022, 11:37:22 PM
    Author     : Tranduc
--%>

<%@page import="sample.application.ApplicationDAO"%>
<%@page import="sample.application.ApplicationDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
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
        <title>Adminastor</title>
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
                            <a class="nav-link" href="admin_statistic.jsp">                            
                                <span class="fa-solid fa-house"></span>
                                Home
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="JobsPostController">
                                <span class="fa-solid fa-briefcase"></span>
                                Post
                            </a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="AdminStudentController">
                                <span class="fa-solid fa-users"></span>
                                Students
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="CompanyListController">
                                <span class="fa-solid fa-building"></span>
                                Companies
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="AdminResultController">
                                <span class="fa-solid fa-square-poll-vertical"></span>
                                Results
                            </a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="MailBoxController">
                                <span class="fa-solid fa-inbox"></span>
                                Mail Box
                            </a>
                        </li>
                    </ul>
                </div>
                <span class="navbar-text ml-auto">
                    <a href="mainController?action=logout">
                        <span class="fa fa-sign-in"></span> Logout</a>
                </span>
            </div>
        </nav>

        
        <% 
            if(request.getAttribute("error")!=null){
                %>
                <script>
                    window.alert("Email is already exist !!!");                                                        
                </script>                   
        <%
            }    
        %>
        
        <div class="jumbotron">
            <div style="float: top;">
                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal" style="margin-bottom: 20px; float: right;margin-left: 20px;">Import Student</button>
                <!-- Modal -->
                <form action="ImportStudentController" method="post" enctype="multipart/form-data">
                    <div id="myModal" class="modal fade" role="dialog">
                        <div class="modal-dialog">
                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">                           
                                    <h4 class="modal-title">Import Student</h4>
                                </div>
                                <div class="modal-body">
                                    <input type="file" name="file" size="60" accept=".xlsx"/><br /><br /> 
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary" value="ImportStudent">Import</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>

                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModalAdd" style="margin-bottom: 20px; float: right;">Add Student</button>
                <!-- Modal -->
                <form action="mainController" method="post">
                    <div id="myModalAdd" class="modal fade" role="dialog">
                        <div class="modal-dialog">
                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">                           
                                    <h4 class="modal-title">Add Student</h4>
                                </div>
                                <div class="modal-body">

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Name</label>
                                        <div class="col-sm-10">
                                            <input class="form-control" name="txtname" type="text" required="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">Student ID</label>
                                        <div class="col-sm-10">
                                            <input class="form-control" name="txtstudentid" type="text" required="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" >Email</label>
                                        <div class="col-sm-10">
                                            <input class="form-control" type="email" name="txtemail" required="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Phone</label>
                                        <div class="col-sm-10">
                                            <input class="form-control"  type="text" name="txtphone">
                                        </div>
                                    </div>                                                    

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" >Major</label>
                                        <div class="col-sm-10">
                                            <select name="txtmajor" class="form-control">
                                                <c:forEach var="major" items="${requestScope.majorList}">
                                                    <option value="${major.getMajorID()}">${major.getMajorName()}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Semester</label>
                                        <div class="col-sm-10">
                                            <input class="form-control" type="text" name="txtsemester" value="SU2022">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" >Date Of Birth</label>
                                        <div class="col-sm-10">
                                            <input class="form-control" name="txtdateofbirth" type="date">
                                        </div>
                                    </div>


                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary" name="action" value="AddStudent">Add</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>

            </div>

            <table id="example" class="table table-striped table-bordered" style="width:100%;">
                <thead>
                    <tr>
                        <th>Student ID</th>
                        <th>Student Name</th>    
                        <th>Major</th>
                        <th>Semester</th>
                        <th>Created Date</th>
                        <th>CV</th>      
                        <th>Status</th>
                        <th>Application</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="stu" items="${requestScope.stuList}">
                        <c:forEach var="acc" items="${requestScope.accList}">
                            <c:if test="${stu.getAccID() eq acc.getAccId()}">
                                <tr>
                                    <td>${stu.getStudentID()}</td>
                                    <td>
                                        <c:set var="modalvalue" value="${stu.getStudentID()}" ></c:set>
                                        <a data-toggle="modal" data-target="#${modalvalue}">${stu.getStudentName()}</a>
                                        <form action="mainController" method="post">
                                            <div id="${modalvalue}" class="modal fade" role="dialog">
                                                <div class="modal-dialog">
                                                    <!-- Modal content-->
                                                    <div class="modal-content">
                                                        <div class="modal-header">                           
                                                            <h4 class="modal-title">Student Information</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <input type="hidden" name="accID" value="${acc.getAccId()}"/>
                                                            <div class="form-group">
                                                                <label class="col-sm-2 control-label">Name</label>
                                                                <div class="col-sm-12">
                                                                    <input class="form-control" name="txtname" type="text" required="" value="${stu.getStudentName()}">
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
                                                                    <input class="form-control" type="text" name="txtemail" required="" value="${acc.getEmail()}">
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-2 control-label">Phone</label>
                                                                <div class="col-sm-12">
                                                                    <input class="form-control"  type="text" name="txtphone" value="${acc.getPhone()}">
                                                                </div>
                                                            </div>                                                    
                                                            <div class="form-group">
                                                                <label class="col-sm-2 control-label" >Major</label>
                                                                <div class="col-sm-12">
                                                                    <select name="txtmajor" class="form-control">
                                                                        <c:forEach var="major" items="${requestScope.majorList}">
                                                                            <option value="${major.getMajorID()}" <c:if test="${stu.getMajorID() eq major.getMajorID()}">selected=""</c:if>>${major.getMajorName()}</option>                                            
                                                                        </c:forEach>
                                                                    </select>
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
                                                                <div class="row">
                                                                <div class="col-sm-6">
                                                                <label class="col-sm-2 control-label">Status</label>
                                                                </div>
                                                                <div>
                                                                    <div class="form-check-inline">
                                                                        <label class="form-check-label">
                                                                            <input type="radio" class="form-check-input" name="txtstatus" value="1" <c:if test="${acc.getStatus()==1}">checked=""</c:if>>Active
                                                                        </label>
                                                                    </div>
                                                                    <div class="form-check-inline">
                                                                        <label class="form-check-label">
                                                                            <input type="radio" class="form-check-input" name="txtstatus" value="0" <c:if test="${acc.getStatus()==0}">checked=""</c:if>>Inactive
                                                                        </label>

                                                                    </div>
                                                                </div>  
                                                                    </div>
                                                                <c:if test="${stu.getCvPath()!=null}">
                                                                    <div class="form-group align-items-center" style="text-align: center;">
                                                                        <a href="${stu.getCvPath()}" class="btn btn-primary" target="_blank">View CV</a>
                                                                    </div>
                                                                </c:if>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                                <button type="submit" class="btn btn-primary" name="action" value="UpdateAdminStudent">Update</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                        </form>


                                    </td>

                                    <td>${stu.getMajorID()}</td>
                                    <td>${stu.getSemesterID()}</td>
                                    <td>${acc.getCrateDate()}</td>
                                    <td><c:if test="${stu.getCvPath() eq null}"><span class="badge badge-danger">No</span></c:if>
                                        <c:if test="${stu.getCvPath() ne null}"><span class="badge badge-success">Yes</span></c:if>
                                        </td>
                                        <td>
                                        <c:if test="${acc.getStatus()==1}"><span class="badge badge-success">Active</span></c:if>
                                        <c:if test="${acc.getStatus()==0}"><span class="badge badge-danger">Inactive</span></c:if>
                                        </td>
                                    <c:set var="app" scope="request" value="${ApplicationDAO.getApplicationByID(stu.getStudentID())}"/>                                   
                                    <td>
                                        <c:if test="${requestScope.app != '[]'}">
                                            <a class="btn btn-primary" href="mainController?action=ViewApplicationAdmin&stuID=${stu.getStudentID()}" target="_blank">
                                                View Application
                                            </a> 
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
