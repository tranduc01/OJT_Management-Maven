/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Tranduc
 */
public class mainController extends HttpServlet {

    private static final String ERROR = "404.html";
    private static final String LOGIN = "Log In";
    private static final String LOGIN_CONTROLLER = "LoginController";
    private static final String UPDATE = "updateInfor";
    private static final String UPDATE_CONTROLLER = "UpdateInforController";
    private static final String LOGOUT = "logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    private static final String JOBDETAILS = "jobDetails";
    private static final String JOBDETAILS_CONTROLLER = "JobDetailsController";
    private static final String CHANGEPASSWORD = "ChangePassword";
    private static final String CHANGEPASSWORD_CONTROLLER = "ChangePasswordController";
    private static final String GETAPPLICATION = "GetApplication";
    private static final String GETAPPLICATION_CONTROLLER = "GetApplicationController";
    private static final String COMPANYDETAILS = "companyDetails";
    private static final String COMPANYDETAILS_CONTROLLER = "CompanyDetailsController";
    private static final String ADMINCOMPANYDETAILS = "admincompanyDetails";
    private static final String ADMINCOMPANYDETAILS_CONTROLLER = "AdminCompanyDetailsController";
    private static final String ADMIN_STUDENT = "AdminPage";
    private static final String ADMIN_STUDENT_CONTROLLER = "AdminStudentController";
    private static final String INSERTAPPLICATION = "InsertApplication";
    private static final String INSERTAPPLICATION_CONTROLLER = "InsertApplicationController";
    private static final String VIEWAPPLICATIONADMIN = "ViewApplicationAdmin";
    private static final String VIEWAPPLICATIONADMIN_CONTROLLER = "ViewApplicationAdminController";
    private static final String VIEWBYPAGE = "viewbypage";
    private static final String VIEWBYPAGE_CONTROLLER = "JobListByPageController";
    private static final String ADDSTUDENT = "AddStudent";
    private static final String ADDSTUDENT_CONTROLLER = "AddStudentController";
    private static final String POSTDETAIL = "PostDetail";
    private static final String POSTDETAIL_CONTROLLER = "PostDetailController";
    private static final String COMPANYPOSTDETAIL = "CompanyPostDetail";
    private static final String COMPANYPOSTDETAIL_CONTROLLER = "CompanyPostDetailController";
    private static final String REJECT = "Reject";
    private static final String REJECT_CONTROLLER = "RejectPostController";
    private static final String COMPANYREJECT = "CompanyReject";
    private static final String COMPANYREJECT_CONTROLLER = "CompanyRejectController";
    private static final String APPROVE = "Approve";
    private static final String APPROVE_CONTROLLER = "ApprovePostController";
    private static final String SEARCHJOB = "SearchJob";
    private static final String SEARCHJOB_CONTROLLER = "SearchJobController";
    private static final String STUDENTPROFILE = "StudentProfilePage";
    private static final String STUDENTPROFILE_CONTROLLER = "StudentProfileController";
    private static final String UPDATEADMINSTUDENT = "UpdateAdminStudent";
    private static final String UPDATEADMINSTUDENT_CONTROLLER = "UpdateAdminStudentController";
    private static final String LOCKCOMPANY = "lockcompany";
    private static final String LOCKCOMPANY_CONTROLLER = "LockCompanyController";
    private static final String UNLOCKCOMPANY = "unlockcompany";
    private static final String UNLOCKCOMPANY_CONTROLLER = "UnlockCompanyController";
    private static final String FILTERJOB = "jobfilter";
    private static final String FILTERJOB_CONTROLLER = "JobPostByFilterController";
    private static final String FILTERPOST = "postfilter";
    private static final String FILTERPOST_CONTROLLER = "CompanyJobPostByFilterController";
    private static final String SEARCHCOMPANY = "SearchCompany";
    private static final String SEARCHCOMPANY_CONTROLLER = "SearchCompanyController";
    private static final String SENDMAILBOX = "SendBox";
    private static final String SENDMAILBOX_CONTROLLER = "SendMailBoxController";
    private static final String CHANGESTATUS = "ChangeStatus";
    private static final String CHANGESTATUS_CONTROLLER = "ChangeMailStatusController";
    private static final String MAILBYFilter = "FilterMail";
    private static final String MAILBYfilter_CONTROLLER = "MailByFilterController";
    private static final String UPDATEPOST = "UpdatePost";
    private static final String UPDATEPOST_CONTROLLER = "UpdatePostController";
    private static final String SENDOFFER = "SendOffer";
    private static final String SENDOFFER_CONTROLLER = "OfferStudentController";
    private static final String ADDCOMPANY = "AddCompany";
    private static final String ADDCOMPANY_CONTROLLER = "AddCompanyController";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;

        /* TODO output your page here. You may use following sample code. */
        try {
            String action = request.getParameter("action");
            if (LOGIN.equals(action)) {
                url = LOGIN_CONTROLLER;
            } else if (UPDATE.equals(action)) {
                url = UPDATE_CONTROLLER;
            } else if (LOGOUT.equals(action)) {
                url = LOGOUT_CONTROLLER;
            } else if (JOBDETAILS.equals(action)) {
                url = JOBDETAILS_CONTROLLER;
            } else if (CHANGEPASSWORD.equals(action)) {
                url = CHANGEPASSWORD_CONTROLLER;
            } else if (GETAPPLICATION.equals(action)) {
                url = GETAPPLICATION_CONTROLLER;
            } else if (COMPANYDETAILS.equals(action)) {
                url = COMPANYDETAILS_CONTROLLER;
            } else if (ADMIN_STUDENT.equals(action)) {
                url = ADMIN_STUDENT_CONTROLLER;
            } else if (INSERTAPPLICATION.equals(action)) {
                url = INSERTAPPLICATION_CONTROLLER;
            } else if (VIEWAPPLICATIONADMIN.equals(action)) {
                url = VIEWAPPLICATIONADMIN_CONTROLLER;
            } else if (VIEWBYPAGE.equals(action)) {
                url = VIEWBYPAGE_CONTROLLER;
            } else if (ADDSTUDENT.equals(action)) {
                url = ADDSTUDENT_CONTROLLER;
            } else if (POSTDETAIL.equals(action)) {
                url = POSTDETAIL_CONTROLLER;
            } else if (REJECT.equals(action)) {
                url = REJECT_CONTROLLER;
            } else if (APPROVE.equals(action)) {
                url = APPROVE_CONTROLLER;
            } else if (SEARCHJOB.equals(action)) {
                url = SEARCHJOB_CONTROLLER;
            }else if(STUDENTPROFILE.equals(action)){
                url=STUDENTPROFILE_CONTROLLER;
            }else if(COMPANYPOSTDETAIL.equals(action)){
                url=COMPANYPOSTDETAIL_CONTROLLER;
            }else if(ADMINCOMPANYDETAILS.equals(action)){
                url=ADMINCOMPANYDETAILS_CONTROLLER;
            }else if(UPDATEADMINSTUDENT.equals(action)){
                url=UPDATEADMINSTUDENT_CONTROLLER;
            }else if(LOCKCOMPANY.equals(action)){
                url=LOCKCOMPANY_CONTROLLER;
            }else if(UNLOCKCOMPANY.equals(action)){
                url=UNLOCKCOMPANY_CONTROLLER;
            }else if(FILTERJOB.equals(action)){
                url=FILTERJOB_CONTROLLER;
            }else if(SEARCHCOMPANY.equals(action)){
                url=SEARCHCOMPANY_CONTROLLER;
            }else if(SENDMAILBOX.equals(action)){
                url=SENDMAILBOX_CONTROLLER;
            }else if(CHANGESTATUS.equals(action)){
                url=CHANGESTATUS_CONTROLLER;
            }else if(MAILBYFilter.equals(action)){
                url=MAILBYfilter_CONTROLLER;
            }else if(UPDATEPOST.equals(action)){
                url=UPDATEPOST_CONTROLLER;
            }else if(SENDOFFER.equals(action)){
                url=SENDOFFER_CONTROLLER;
            }else if(ADDCOMPANY.equals(action)){
                url=ADDCOMPANY_CONTROLLER;
            }else if(FILTERPOST.equals(action)){
                url=FILTERPOST_CONTROLLER;
            }else if(COMPANYREJECT.equals(action)){
                url=COMPANYREJECT_CONTROLLER;
            }
        } catch (Exception e) {
            log("Error at mainController: " + e.toString());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
