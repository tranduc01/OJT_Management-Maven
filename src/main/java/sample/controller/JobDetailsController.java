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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.account.AccountDAO;
import sample.account.AccountDTO;
import sample.application.ApplicationDAO;
import sample.application.ApplicationDTO;
import sample.company.CompanyDAO;
import sample.company.CompanyDTO;
import sample.job.JobDAO;
import sample.job.JobDTO;
import sample.major.MajorDAO;
import sample.major.MajorDTO;
import sample.student.StudentDAO;
import sample.student.StudentDTO;

/**
 *
 * @author Tranduc
 */
public class JobDetailsController extends HttpServlet {

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
        try {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
            String availabe = null;
            AccountDTO accStu = (AccountDTO) session.getAttribute("acc");
            int jobID = Integer.parseInt(request.getParameter("jobid"));
            JobDTO job = JobDAO.getJobByID(jobID);
            CompanyDTO com = CompanyDAO.getCompanyByID(job.getComID());
            AccountDTO acc = AccountDAO.getAccountByID(com.getAccID());
            if(accStu!=null){
            StudentDTO stu = StudentDAO.getStudentByAccount(accStu.getAccId());
            if(stu!=null){
            ArrayList<ApplicationDTO> appList = ApplicationDAO.getApplicationByID(stu.getStudentID());
            for (ApplicationDTO app : appList) {           
                    if (job.getJobID() == app.getJobID()) {
                        availabe = "Applied";
                        request.setAttribute("availabe", availabe);
                    
                }                   
            }
            request.setAttribute("stu", stu);
            }
            }
            
            
            ArrayList<JobDTO> listJob = JobDAO.getJobByMajor(job.getMajorID());
            ArrayList<CompanyDTO> listCompany = CompanyDAO.getCompanies();
            ArrayList<AccountDTO> listAccount=new ArrayList<>();
                
            
            for (CompanyDTO comm : listCompany) {
                AccountDTO account=AccountDAO.getAccountByID(comm.getAccID());
                if(account.getAccId()==comm.getAccID()){
                listAccount.add(account);
                }
            }
            
            request.setAttribute("companyList", listCompany);
                request.setAttribute("jobList", listJob);
                request.setAttribute("accList", listAccount);
            
            request.setAttribute("com", com);
            request.setAttribute("job", job);
            request.setAttribute("acc", acc);          
            request.getRequestDispatcher("jobDetails.jsp").forward(request, response);
        } catch (Exception e) {
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
