<%-- 
    Document   : admin_company
    Created on : Aug 2, 2022, 1:23:51 PM
    Author     : Tranduc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/admin.css"  />
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
                        <li class="nav-item ">
                            <a class="nav-link" href="AdminStudentController">
                                <span class="fa-solid fa-users"></span>
                                Students
                            </a>
                        </li>
                        <li class="nav-item active">
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

        <div class="jumbotron">
            <div style="float: top;">
                
                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModalAdd" style="margin-bottom: 20px; float: right;">Add Company</button>
                <!-- Modal -->
                <form action="mainController" method="post">
                    <div id="myModalAdd" class="modal fade" role="dialog">
                        <div class="modal-dialog">
                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">                           
                                    <h4 class="modal-title">Add Company</h4>
                                </div>
                                <div class="modal-body">

                                    <div class="form-group">
                                        <label class="col-sm-6 control-label">Company Name</label>
                                        <div class="col-sm-10">
                                            <input class="form-control" name="txtname" type="text" required="">
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
                                 
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary" name="action" value="AddCompany">Add</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <table id="example" class="table table-striped table-bordered text-center" style="width:100%;">
                <thead>
                    <tr>
                        <th></th>
                        <th>Company ID</th>  
                        <th>Name</th>
                        <th>Create Date</th>   
                        <th>Status</th>
                        <th>Established Date</th>  
                        <th>Action</th>                                    
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="com" items="${requestScope.comList}">
                        <c:forEach var="acc" items="${requestScope.accList}">
                            <c:if test="${com.getAccID() eq acc.getAccId()}">
                                <tr>
                                    <td><img src="${acc.getAvatar()}" style="object-fit: cover;
                                             overflow: hidden;
                                             height: 100%;
                                             width: 80px;
                                             padding-right: 20px;"></td>
                                    <td>${com.getComID()}</td>
                                    <td>${acc.getName()}</td>
                                    <td>${acc.getCrateDate()}</td>
                                    <td>
                                        <c:if test="${acc.getStatus()==1}"><span class="badge badge-success">Active</span></c:if>
                                        <c:if test="${acc.getStatus()==0}"><span class="badge badge-danger">Inactive</span></c:if>
                                        </td>
                                    <td>${acc.getBirthday()}</td>
                                    <td><h5><a href="mainController?action=admincompanyDetails&comID=${com.getComID()}" target="_blank" class="text-center" style="padding-left: 16px;"><i class="fa fa-eye"></i></a>
                                            <c:if test="${acc.getStatus()==1}"><a href="mainController?action=lockcompany&comID=${com.getComID()}" class="text-center" style="padding-left: 16px;" onclick="return check();"><i class="fa fa-ban"></i></a></c:if>
                                            <c:if test="${acc.getStatus()==0}"><a href="mainController?action=unlockcompany&comID=${com.getComID()}" class="text-center" style="padding-left: 16px;"><i class="fa fa-lock-open"></i></a></c:if>
                                        </h5></td>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </c:forEach>
                </tbody>
            </table>
        </div>







        <script>
            var loader = document.getElementById("preloader");
            window.addEventListener("load", function () {
                loader.style.display = "none";
            });
        </script>
        <script>
            $(document).ready(function () {
                $('#example').DataTable();
            });
        </script>
        <script>
            function check() {
                if (confirm("Are you sure to disable this company?") === false) {
                    return false;
                } else {
                    return true;
                }
            }
        </script>
    </body>
</html>
