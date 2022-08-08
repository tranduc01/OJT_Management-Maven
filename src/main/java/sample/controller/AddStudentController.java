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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.account.AccountDAO;
import sample.account.AccountDTO;
import sample.student.StudentDAO;

/**
 *
 * @author Tranduc
 */
@WebServlet(name = "AddStudentController", urlPatterns = {"/AddStudentController"})
public class AddStudentController extends HttpServlet {

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
            String name = request.getParameter("txtname");
            String stuid = request.getParameter("txtstudentid");
            String mail = request.getParameter("txtemail");
            String phone = request.getParameter("txtphone");
            String major = request.getParameter("txtmajor");
            String semester = request.getParameter("txtsemester");
            String birthday = request.getParameter("txtdateofbirth");
            int role = 1;
            int status = 1;
            Date d = new Date(System.currentTimeMillis());
            
            AccountDTO acc=AccountDAO.loginAccount_V2(mail);
            if(acc!=null){
                String error="loi";
                request.setAttribute("error", error);
                request.getRequestDispatcher("AdminStudentController").forward(request, response);
            }else{
            int result = AccountDAO.insertAccount(stuid, mail, name, phone, birthday, d.toString(), role, status);

            ArrayList<AccountDTO> list1 = AccountDAO.getAccounts();
            for (AccountDTO account : list1) {
                if (mail.equals(account.getEmail())) {
                    int result1 = StudentDAO.insertStudent(stuid, account.getAccId(), major, semester);
                }
            }
            request.getRequestDispatcher("AdminStudentController").forward(request, response);
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
