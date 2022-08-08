/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import sample.account.AccountDTO;
import sample.application.ApplicationDAO;
import sample.application.ApplicationDTO;
import sample.company.CompanyDAO;
import sample.company.CompanyDTO;
import sample.job.JobDAO;
import sample.job.JobDTO;
import static sample.readExcel.readExcelResult.readExcelResult;
import sample.result.ResultDAO;
import sample.result.ResultDTO;

/**
 *
 * @author Tranduc
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
@WebServlet(name = "ImportResultController", urlPatterns = {"/ImportResultController"})
public class ImportResultController extends HttpServlet {

    public static final int COLUMN_INDEX_STUID = 0;
    public static final int COLUMN_INDEX_GRADE = 1;
    public static final int COLUMN_INDEX_COMMENT = 2;
    public static final int COLUMN_INDEX_STATUS = 3;
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
            Part filePart = request.getPart("myfile");
            String fileName = filePart.getSubmittedFileName();
            for (Part part : request.getParts()) {
                part.write("D:\\SWP391\\OJT_Management\\web\\Result\\" + fileName);
            }
            String filePath = "D:\\SWP391\\OJT_Management\\web\\Result\\" + fileName;
            ArrayList<ResultDTO> list = readExcelResult(filePath);
            Date d = new Date(System.currentTimeMillis());
            
            HttpSession session=request.getSession();
            AccountDTO acc=(AccountDTO) session.getAttribute("acc");
            CompanyDTO com=CompanyDAO.getCompanyByAccID(acc.getAccId());
            ArrayList<JobDTO> listJob=JobDAO.getJobByComID(com.getComID());
            
            //insert Account
            for (ResultDTO result : list) {
                    
                ArrayList<ApplicationDTO> listApp=ApplicationDAO.getApplicationByIDV2(result.getStuID());
                for (ApplicationDTO applicationDTO : listApp) {
                    for (JobDTO job : listJob) {
                        if(applicationDTO.getJobID()==job.getJobID()){    
                            int res = ResultDAO.insertResult(result.getComment(), result.getGrade(), result.getStatus(),applicationDTO.getApplyID());
                        }
                    }
                }
            }
            request.getRequestDispatcher("ResultListController").forward(request, response);
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
