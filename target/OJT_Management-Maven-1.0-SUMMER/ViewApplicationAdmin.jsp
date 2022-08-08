<%-- 
    Document   : ViewApplicationAdmin
    Created on : Jun 21, 2022, 11:51:55 AM
    Author     : Tranduc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <title>Application</title>
    </head>
    <body>
        <div class="container mt-5">
            <div class="d-flex justify-content-center row">
                <div class="col-md-10">
                    <div class="rounded">
                        <div class="table-responsive table-borderless">
                            <table class="table">
                                <thead>

                                    <tr>
                                        <th class="text-center">Application ID</th>
                                        <th>Company name</th>
                                        <th>Job Name</th>  
                                        <th>Apply Date</th>
                                        <th>Status</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody class="table-body">
                                    <c:forEach items="${requestScope.appList}" var="app">   
                                        <c:forEach items="${requestScope.jobList}" var="job">  
                                            <c:forEach items="${requestScope.comList}" var="com">                                                                                                   
                                                <c:forEach items="${requestScope.accList}" var="acc">
                                                    <c:if test="${app.getJobID() eq job.getJobID()}">
                                                        <c:if test="${job.getComID() eq com.getComID()}">
                                                            <c:if test="${acc.getAccId() eq com.getAccID()}">      
                                                                <tr class="cell-1">
                                                                    <td class="text-center">${app.getApplyID()}</td>
                                                                    <td>${acc.getName()}</td>
                                                                    <td>${job.getJobName()}</td>
                                                                    <td>${app.getApplyDate()}</td>
                                                                    <td><c:if test="${app.getStatus() eq 3}"><h5><span class="badge badge-danger">Rejected</span></h5></c:if>
                                                                        <c:if test="${app.getStatus() eq 2}"><h5><span class="badge badge-warning">Pending</span></h5></c:if>
                                                                        <c:if test="${app.getStatus() eq 1}"><h5><span class="badge badge-success">Accepted</span></h5></c:if>
                                                                    </td>
                                                                        <td></td>
                                                                    </tr>
                                                            </c:if>
                                                        </c:if>
                                                    </c:if>
                                                </c:forEach>
                                            </c:forEach>
                                        </c:forEach>
                                    </c:forEach>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <style>
            @import url('https://fonts.googleapis.com/css?family=Assistant');
            body {
                font-family: "Poppins", sans-serif;
                height: 100vh;
                background-color: #f7b42c;
                background-image: linear-gradient(315deg, #f7b42c 0%, #fc575e 74%);
            }

            .cell-1 {
                border-collapse: separate;
                border-spacing: 0 4em;
                background: #ffffff;
                border-bottom: 5px solid transparent;
                /*background-color: gold;*/
                background-clip: padding-box;

            }

            thead {
                background: #dddcdc;
            }


            .table-elipse {
                cursor: pointer;
            }

            #demo {
                -webkit-transition: all 0.3s ease-in-out;
                -moz-transition: all 0.3s ease-in-out;
                -o-transition: all 0.3s 0.1s ease-in-out;
                transition: all 0.3s ease-in-out;
            }

            .row-child {
                background-color: #000;
                color: #fff;
            }
        </style>
    </body>
</html>
