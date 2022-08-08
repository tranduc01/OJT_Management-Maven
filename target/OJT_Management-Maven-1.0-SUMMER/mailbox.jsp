<%-- 
    Document   : mailbox
    Created on : Aug 4, 2022, 3:27:28 PM
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
        <link href="statistic/css/sb-admin-2.min.css" rel="stylesheet">
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
        <script src="https://kit.fontawesome.com/12c372e324.js" crossorigin="anonymous"></script>
        <link rel="shortcut icon" href="img/FPT-logoo.jpg">
        <title>Adminastor</title>
        <style>
            .card {
                position: relative;
                display: flex;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: #fff;
                background-clip: border-box;
                border: 0 solid transparent;
                border-radius: 0;
            }
            .mailbox-widget .custom-tab .nav-item .nav-link {
                border: 0;
                color: #fff;
                border-bottom: 3px solid transparent;
            }
            .mailbox-widget .custom-tab .nav-item .nav-link.active {
                background: 0 0;
                color: #fff;
                border-bottom: 3px solid #2cd07e;
            }
            .no-wrap td, .no-wrap th {
                white-space: nowrap;
            }
            .table td, .table th {
                padding: .9375rem .4rem;
                vertical-align: top;
                border-top: 1px solid rgba(120,130,140,.13);
            }
            .font-light {
                font-weight: 300;
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
                        <li class="nav-item active">
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


        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body bg-primary text-white mailbox-widget pb-0">
                            <h2 class="text-white pb-3">Your Mailbox</h2>

                        </div>
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade active show" id="inbox" aria-labelledby="inbox-tab" role="tabpanel">
                                <div>
                                    <div class="row p-4 no-gutters align-items-center">                                    
                                        <div class="col-sm-12 col-md-12 mr-auto">
                                            <ul class="list-inline dl mb-0 float-left float-md-right">
                                                <li class="list-inline-item text-info mr-3">
                                                    
                                                        <a class="btn btn-circle btn-success text-white" href="mainController?action=FilterMail&status=1">
                                                            <i class="fa fa-check"></i>
                                                        </a>
                                                        <span class="ml-2 font-normal text-dark">Read</span>
                                                    
                                                </li>
                                                <li class="list-inline-item text-danger">
                                                   
                                                        <a class="btn btn-circle btn-danger text-white" href="mainController?action=FilterMail&status=0">
                                                            <i class="fa fa-window-close"></i>
                                                        </a>
                                                        <span class="ml-2 font-normal text-dark">Unread</span>                                              
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- Mail list-->
                                    <div class="table-responsive">
                                        <table class="table email-table no-wrap table-hover v-middle mb-0 font-14">
                                            <tbody>
                                                <!-- row -->
                                                <c:forEach var="mail" items="${requestScope.listMail}">
                                                    <tr>
                                                        <td></td>
                                                        <td>
                                                            <span class="mb-0 text-muted">${mail.getName()}</span>
                                                        </td>
                                                        <td></td>
                                                        <!-- Message -->
                                                        <td>
                                                            <a class="link" data-toggle="modal" data-target="#myModal${mail.getBoxID()}">
                                                                <c:if test="${mail.getStatus()==0}"><span class="badge badge-pill text-white font-medium badge-danger mr-2">Unread</span></c:if>
                                                                <c:if test="${mail.getStatus()==1}"><span class="badge badge-pill text-white font-medium badge-success mr-2">Read</span></c:if>
                                                                <span class="text-dark">${mail.getCompanyName()}</span>
                                                            </a>
                                                            <form action="mainController" method="post">
                                                            <div id="myModal${mail.getBoxID()}" class="modal fade" role="dialog">
                                                                <div class="modal-dialog">
                                                                    <!-- Modal content-->
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">                           
                                                                            <h4 class="modal-title">Mail Box</h4>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <input type="hidden" name="txtid" value="${mail.getBoxID()}">
                                                                            <div class="form-group">
                                                                                <label class="col-sm-2 control-label">Sender: </label>
                                                                                <div class="col-sm-10">
                                                                                    <input class="form-control" name="txtname" type="text" readonly="" value="${mail.getName()}">
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label class="col-sm-4 control-label">Email</label>
                                                                                <div class="col-sm-10">
                                                                                    <input class="form-control" name="txtstudentid" type="text" readonly="" value="${mail.getEmail()}">
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label class="col-sm-2 control-label" >Phone</label>
                                                                                <div class="col-sm-10">
                                                                                    <input class="form-control" type="email" name="txtemail" readonly="" value="${mail.getPhone()}">
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label class="col-sm-2 control-label">Company Name</label>
                                                                                <div class="col-sm-10">
                                                                                    <input class="form-control"  type="text" name="txtphone" readonly="" value="${mail.getCompanyName()}">
                                                                                </div>
                                                                            </div>                                                    

                                                                          
                                                                            <div class="form-group">
                                                                                <label class="col-sm-2 control-label">Company's Description</label>
                                                                                <div class="col-sm-10">
                                                                                    <textarea class="form-control" type="text" name="txtsemester">${mail.getDescription()}</textarea>
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label class="col-sm-4 control-label" >File</label>
                                                                                <div class="col-sm-10">
                                                                                    <input class="form-control" name="txtdateofbirth" value="${mail.getUrl()}" readonly="">
                                                                                </div>
                                                                            </div>


                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button class="btn btn-default" name="action" value="ChangeStatus">Close</button>                                               
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            </form>
                                                        </td>
                                                        <!-- Attachment -->
                                                        <td><i class="fa fa-paperclip text-muted"></i></td>
                                                        <!-- Time -->
                                                        <td class="text-muted">${mail.getSendDate()}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="sent" aria-labelledby="sent-tab" role="tabpanel">
                                <div class="row p-3 text-dark">
                                    <div class="col-md-6">
                                        <h3 class="font-light">Lets check profile</h3>
                                        <h4 class="font-light">you can use it with the small code</h4>
                                    </div>
                                    <div class="col-md-6 text-right">
                                        <p>Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="spam" aria-labelledby="spam-tab" role="tabpanel">
                                <div class="row p-3 text-dark">
                                    <div class="col-md-6">
                                        <h3 class="font-light">Come on you have a lot message</h3>
                                        <h4 class="font-light">you can use it with the small code</h4>
                                    </div>
                                    <div class="col-md-6 text-right">
                                        <p>Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="delete" aria-labelledby="delete-tab" role="tabpanel">
                                <div class="row p-3 text-dark">
                                    <div class="col-md-6">
                                        <h3 class="font-light">Just do Settings</h3>
                                        <h4 class="font-light">you can use it with the small code</h4>
                                    </div>
                                    <div class="col-md-6 text-right">
                                        <p>Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a.</p>
                                    </div>
                                </div>
                            </div>
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
