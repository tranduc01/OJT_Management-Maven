/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.application.ApplicationDAO;
import sample.application.ApplicationDTO;
import sample.company.CompanyDAO;
import sample.company.CompanyDTO;
import sample.job.JobDAO;
import sample.job.JobDTO;

/**
 *
 * @author Tranduc
 */
public class InsertApplicationController extends HttpServlet {

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
            int jobID=Integer.parseInt(request.getParameter("jobID"));
            String stuID=request.getParameter("stuID");
            int stu_confirm=1;
            int com_confirm=0;
            int status=2;
            Date applyDate=new Date(System.currentTimeMillis());
            
            ArrayList<ApplicationDTO> appList=ApplicationDAO.getApplicationByID(stuID);
            ArrayList<JobDTO> jobList=new ArrayList<>();
            for (ApplicationDTO applicationDTO : appList) {
                JobDTO job=JobDAO.getJobByID_V2(applicationDTO.getJobID());
                jobList.add(job);
            }
            ArrayList<CompanyDTO> companyList=new ArrayList<>();
            for (JobDTO jobDTO : jobList) {
                CompanyDTO com=CompanyDAO.getCompanyByID(jobDTO.getComID());
                companyList.add(com);
            }
            
            JobDTO job=JobDAO.getJobByID_V2(jobID);
            CompanyDTO c=CompanyDAO.getCompanyByID(job.getComID());
            
//                boolean check=companyList.stream().anyMatch(com ->com.getComID()==c.getComID());
//                           
//            if(check==true){
//                String error="error";
//                request.setAttribute("error", error);
//                request.getRequestDispatcher("mainController?action=jobDetails&jobid="+jobID).forward(request, response);
//            }else{
                int result=ApplicationDAO.insertApplication(status, applyDate, stu_confirm, com_confirm, stuID, jobID);
            request.getRequestDispatcher("mainController?action=jobDetails&jobid="+jobID).forward(request, response);
//            }
            
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
