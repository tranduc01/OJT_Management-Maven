<%-- 
    Document   : about
    Created on : Jun 8, 2022, 10:37:43 PM
    Author     : Tranduc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css"  />
        <link rel="stylesheet" href="css/about.css"  />
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
                        <li class="nav-item">
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
                        <li class="nav-item active">
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
        <div class="row justify-content-center mt-5">
            <div class="col-12 col-md-6">
                <h1 class="display-4" style="top:100px">
                    TRƯỜNG ĐẠI HỌC FPT
                </h1>
                <div class="row align-items-center border-top border-bottom mb-4">

                </div>
                <div class="ck-content text-justify col-md-12">
                    <p>Trường Đại học FPT chính thức thành lập ngày 08/09/2006 theo quyết định số 208/2006/QĐ-TTg của Thủ tướng Chính phủ. Thời điểm đó, Đại học FPT là trường đại học đầu tiên của Việt Nam do một doanh nghiệp thành lập với 100% vốn đầu tư từ Công ty Cổ phần FPT - tập đoàn tiên phong trong lĩnh vực Công nghệ thông tin của Việt Nam.</p>
                    <figure class="image"><img src="img/fpt-star.png"><figcaption>Trụ sở chính Đại học FPT tại Hà Nội</figcaption></figure>
                    <p>Sứ mệnh của trường Đại học FPT là xây dựng mô hình của một trường Đại học thế hệ mới, có triết lý giáo dục hiện đại, gắn liền đào tạo với thực tiễn cuộc sống và nhu cầu nhân lực của đất nước, góp phần đưa giáo dục Việt nam lên ngang tầm các nước tiên tiến trên thế giới. Sự khác biệt trong phương pháp đào tạo của trường Đại học FPT là gắn kết chặt chẽ với các doanh nghiệp, đào tạo theo chương trình chuẩn công nghệ quốc tế, sinh viên thành thạo hai ngoại ngữ, được rèn luyện kỹ năng mềm, được chú trọng phát triển con người toàn diện, hài hòa.</p>
                    <figure class="image"><img src="img/fpt-total.jpg"><figcaption>Phân hiệu Đại học FPT tại TP. Hồ Chí Minh</figcaption></figure>
                    <p><br>Sau hơn 10 năm thành lập, trường Đại học FPT từ vai trò tiên phong đổi mới giáo dục đại học trong nước đã bước sang vai trò trường đại học đi đầu trong phong trào quốc tế hóa. Năm 2012, Đại học FPT là trường đại học Việt Nam đầu tiên đạt chứng nhận chuẩn 3 sao của Tổ chức Giáo dục Quốc tế QS (Quaccquarelli Symonds) - một trong các chuẩn xếp hạng hàng đầu dành cho các trường đại học trên toàn thế giới. Năm 2015 trường tái kiểm định đạt mức điểm 3,5 trong đó có 4 hạng mục được đánh giá tuyệt đối 5 sao là Giảng dạy, Việc làm, Cơ sở vật chất, Trách nhiệm xã hội và Hoạt động cộng đồng.<br><br>Hiện nay, trường Đại học FPT đã triển khai đào tạo tại 4 phân hiệu thuộc 4 vùng kinh tế trọng điểm: Hà Nội, Đà Nẵng, TP. Hồ Chí Minh và Cần Thơ với hơn 20.000 sinh viên theo học.</p>
                    <figure class="image"><img src="img/fpt-hcm.jpg"><figcaption>Phân hiệu Đại học FPT tại TP. Hồ Chí Minh</figcaption></figure>
                </div>
            </div>
            <div class="col-12 col-md-2 d-none d-md-block">
                <div class="sticky-container">
                    <img src="img/hiring.jpg" style="height: 800px; width:400px; "/>



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
    </body>
</html>
