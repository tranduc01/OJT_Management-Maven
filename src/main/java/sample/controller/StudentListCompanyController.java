/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.account.AccountDAO;
import sample.account.AccountDTO;
import sample.application.ApplicationDTO;
import sample.company.CompanyDAO;
import sample.company.CompanyDTO;
import sample.job.JobDAO;
import sample.job.JobDTO;
import sample.student.StudentDAO;
import sample.student.StudentDTO;

/**
 *
 * @author Dell
 */
@WebServlet(name = "StudentListCompanyController", urlPatterns = {"/StudentListCompanyController"})
public class StudentListCompanyController extends HttpServlet {

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
        try  {
            /* TODO output your page here. You may use following sample code. */
            ArrayList<StudentDTO> studentList=StudentDAO.getStudents();
            ArrayList<AccountDTO> accList=new ArrayList<>();
            ArrayList<ApplicationDTO> appList=new ArrayList<>();
            for (StudentDTO stu : studentList) {
                AccountDTO acc=AccountDAO.getAccountByID(stu.getAccID());
                accList.add(acc);
                //appList=ApplicationDAO.getApplicationByID(stu.getStudentID());
            }
            
            HttpSession session = request.getSession();
            AccountDTO account= (AccountDTO) session.getAttribute("acc");
            CompanyDTO com=CompanyDAO.getCompanyByAccID(account.getAccId());
            ArrayList<JobDTO> jobList=JobDAO.getJobByComIDV2(com.getComID());
            
            request.setAttribute("stuList", studentList);
            request.setAttribute("accList", accList);
            request.setAttribute("appList", appList);
            request.setAttribute("jobList", jobList);
            request.getRequestDispatcher("studentListCompany.jsp").forward(request, response);
        }catch(Exception e){
            e.printStackTrace();
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
