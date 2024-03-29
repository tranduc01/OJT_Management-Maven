/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.account.AccountDAO;
import sample.account.AccountDTO;
import sample.company.CompanyDAO;
import sample.company.CompanyDTO;
import sample.job.JobDAO;
import sample.job.JobDTO;
import sample.major.MajorDAO;
import sample.major.MajorDTO;

/**
 *
 * @author Tranduc
 */
@WebServlet(name = "CompanyHomePageController", urlPatterns = {"/CompanyHomePageController"})
public class CompanyHomePageController extends HttpServlet {

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
            HttpSession session=request.getSession();
            AccountDTO acc=(AccountDTO) session.getAttribute("acc");
            CompanyDTO company=CompanyDAO.getCompanyByAccID(acc.getAccId());
            ArrayList<JobDTO> listJob1 = JobDAO.getJobByComID(company.getComID());
            ArrayList<CompanyDTO> listCompany = CompanyDAO.getCompanies();
            ArrayList<AccountDTO> listAccount=new ArrayList<>();
            ArrayList<MajorDTO> listMajor=MajorDAO.getMajors();
                
            for (CompanyDTO com : listCompany) {
                AccountDTO account=AccountDAO.getAccountByID(com.getAccID());
                if(account.getAccId()==com.getAccID()){
                listAccount.add(account);
                }
            }
            Date d=new Date(System.currentTimeMillis());
            request.setAttribute("current", d.toString());
                request.setAttribute("companyList", listCompany);
                request.setAttribute("jobList", listJob1);
                request.setAttribute("accList", listAccount);
                request.setAttribute("majorList", listMajor);
                request.getRequestDispatcher("company_page.jsp").forward(request, response);
            } catch (Exception ex) {
                ex.printStackTrace();
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
