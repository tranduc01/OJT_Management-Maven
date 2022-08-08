<%-- 
    Document   : admin_result
    Created on : Aug 5, 2022, 1:32:29 PM
    Author     : Tranduc
--%>

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
                        <li class="nav-item">
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
                        <li class="nav-item active">
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

            <button class="btn" onclick="exportData()" class="brand-logo" style="font-size: 15pt; color: white; background-color: #f27229; float: right; border-radius: 10px; border: 1px grey solid;  ">
                Export To Excel!
            </button>
            <table id="example" class="table table-striped table-bordered" style="width:100%;">
                <thead>
                    <tr>
                        <th>Student ID</th>
                        <th>Student Name</th>    
                        <th>Grade</th>
                        <th>Status</th>                       
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="result" items="${requestScope.resultList}">
                        <c:forEach var="app" items="${requestScope.appList}">
                            <c:forEach var="stu" items="${requestScope.stuList}">
                                <c:forEach var="acc" items="${requestScope.accList}">
                                    <c:if test="${result.getAppID() eq app.getApplyID()}">
                                        <c:if test="${app.getStuID() eq stu.getStudentID()}">
                                            <c:if test="${stu.getAccID() eq acc.getAccId()}">
                                                <tr>
                                                    <td>${stu.getStudentID()}</td>
                                                    <td>${acc.getName()}</td>
                                                    <td>${result.getGrade()}</td>
                                                    <td>${result.getStatus()}</td>                                                      
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
        <script>
            function exportData() {
                /* Get the HTML data using Element by Id */
                var table = document.getElementById("example");

                /* Declaring array variable */
                var rows = [];

                //iterate through rows of table
                for (var i = 0, row; row = table.rows[i]; i++) {
                    //rows would be accessed using the "row" variable assigned in the for loop
                    //Get each cell value/column from the row
                    column1 = row.cells[0].innerText;
                    column2 = row.cells[1].innerText;
                    column3 = row.cells[2].innerText;
                    column4 = row.cells[3].innerText;


                    /* add a new records in the array */
                    rows.push(
                            [
                                column1,
                                column2,
                                column3,
                                column4
                            ]
                            );
                }
                csvContent = "data:text/csv;charset=utf-8,\ufeff";
                /* add the column delimiter as comma(,) and each row splitted by new line character (\n) */
                rows.forEach(function (rowArray) {
                    row = rowArray.join(",");
                    csvContent += row + "\r\n";
                });

                /* create a hidden <a> DOM node and set its download attribute */
                var encodedUri = encodeURI(csvContent);
                var link = document.createElement("a");
                link.setAttribute("href", encodedUri);
                link.setAttribute("download", "OJT_Result.csv");
                document.body.appendChild(link);
                /* download the data file named "Stock_Price_Report.csv" */
                link.click();
            }
        </script>
    </body>
</html>
