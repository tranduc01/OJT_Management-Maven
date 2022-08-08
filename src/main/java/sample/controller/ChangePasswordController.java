/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.account.AccountDAO;
import sample.account.AccountDTO;

/**
 *
 * @author Tranduc
 */
public class ChangePasswordController extends HttpServlet {

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
            String currentPassword=request.getParameter("currentPassword");
            String newPassword=request.getParameter("newPassword");
            String confirmPassword=request.getParameter("confirmPassword");
            HttpSession session=request.getSession();
            AccountDTO acc=(AccountDTO) session.getAttribute("acc");
            AccountDTO acc1=AccountDAO.getAccountByID(acc.getAccId());
            if(currentPassword.equals(acc1.getPassword())){
                if(newPassword.equals(confirmPassword)){
                    int result=AccountDAO.changePassword(acc1.getEmail(), newPassword);
                    String changePass="Change Password successfully !!!";
                    request.setAttribute("changed", changePass);
                    if (acc.getRole() == 1 ) {
                    request.getRequestDispatcher("security.jsp").forward(request, response);
                }
                    else {
                    request.getRequestDispatcher("securityCompany.jsp").forward(request, response);
                }
                }else{
                    String passwordNotMatch="Password not match !!!!";
                    request.setAttribute("passNotMatch", passwordNotMatch);
                    if (acc.getRole() == 1 ) {
                    request.getRequestDispatcher("security.jsp").forward(request, response);
                }
                    else {
                    request.getRequestDispatcher("securityCompany.jsp").forward(request, response);
                }
                }
                
            }else{
                String wrongPassword="Current Password is wrong !!!";
                request.setAttribute("wrongPassword", wrongPassword);
                if (acc.getRole() == 1 ) {
                    request.getRequestDispatcher("security.jsp").forward(request, response);
                }
                else {
                    request.getRequestDispatcher("securityCompany.jsp").forward(request, response);
                }
            }                     
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
