/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.account.AccountDAO;
import sample.account.AccountDTO;
import sample.company.CompanyDAO;
import sample.company.CompanyDTO;
import sample.major.MajorDAO;
import sample.major.MajorDTO;
import sample.student.StudentDAO;
import sample.student.StudentDTO;

/**
 *
 * @author Tranduc
 */
public class LoginController extends HttpServlet {

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
            HttpSession session=request.getSession();
            String email = request.getParameter("txtemail");
            String password = request.getParameter("txtpassword");
            AccountDTO acc = AccountDAO.loginAccount(email, password);
          
            
            ArrayList<MajorDTO> list = MajorDAO.getMajors();
            if (acc != null) {
                if (acc.getRole() == 0) {                   
                    session.setAttribute("accEmail", acc.getEmail());
                    session.setAttribute("name", acc.getName());
                    session.setAttribute("role", acc.getRole());
                    session.setAttribute("acc", acc);
                    request.getRequestDispatcher("admin_statistic.jsp").forward(request, response);
                } else if (acc.getRole() == 1) {                 
                    session.setAttribute("accEmail", acc.getEmail());
                    session.setAttribute("name", acc.getName());
                    session.setAttribute("acc", acc);
                    session.setAttribute("role", acc.getRole());   
                    
                    request.getRequestDispatcher("JobListByPageController").forward(request, response);
                } else {
                    session.setAttribute("accEmail", acc.getEmail());
                    session.setAttribute("name", acc.getName());
                    session.setAttribute("role", acc.getRole());
                    session.setAttribute("acc", acc);
                    request.getRequestDispatcher("CompanyHomePageController").forward(request, response);
                }
            } else {
                String loginError = "Invalid Email or Password !!!";
                request.setAttribute("loginError", loginError);
                request.getRequestDispatcher("login.jsp").forward(request, response);
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
