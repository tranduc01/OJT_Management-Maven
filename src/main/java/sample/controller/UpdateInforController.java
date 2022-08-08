/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.account.AccountDAO;
import sample.account.AccountDTO;
import sample.company.CompanyDAO;
import sample.major.MajorDAO;
import sample.major.MajorDTO;
import sample.student.StudentDAO;

/**
 *
 * @author Tranduc
 */
public class UpdateInforController extends HttpServlet {

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
            String name = request.getParameter("txtname");
            String phone = request.getParameter("txtphone");
            
            
            String discription = request.getParameter("comdiscription");
            String address = request.getParameter("comaddress");
            String website = request.getParameter("linkwebsite");
            
            String email = (String) session.getAttribute("accEmail");
            
            String birthday =request.getParameter("txtbirthday");         
            String success="Updated!!!";
            request.setAttribute("success", success);
            int result = AccountDAO.updateProfile(email, name, phone, birthday);  
                 
            AccountDTO acc = AccountDAO.loginAccount_V2(email);
            
            
            session.setAttribute("acc", acc);
            
            if (acc.getRole() == 1) {
                
                ArrayList<MajorDTO> list = MajorDAO.getMajors();
                session.setAttribute("majorList", list);
                request.getRequestDispatcher("StudentProfileController").forward(request, response);
            }
            if (acc.getRole() == 2) {
                CompanyDAO.updateCompanyProfile(email, discription, address, website);     
                request.getRequestDispatcher("CompanyProfileController").forward(request, response);
            }
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
