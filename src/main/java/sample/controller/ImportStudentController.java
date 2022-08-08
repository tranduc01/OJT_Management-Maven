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
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import sample.account.AccountDAO;
import sample.account.AccountDTO;
import sample.student.StudentDTO;
import static sample.readExcel.readExcel.readExcel;
import sample.student.StudentDAO;

/**
 *
 * @author Tranduc
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class ImportStudentController extends HttpServlet {

    public static final int COLUMN_INDEX_ID = 0;
    public static final int COLUMN_INDEX_EMAIL = 1;
    public static final int COLUMN_INDEX_NAME = 2;
    public static final int COLUMN_INDEX_SEMESTER = 3;
    public static final int COLUMN_INDEX_MAJOR = 4;

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
            int role = 1;
            int status = 1;
            Part filePart = request.getPart("file");
            String fileName = filePart.getSubmittedFileName();
            for (Part part : request.getParts()) {
                part.write("D:\\SWP391\\OJT_Management\\web\\Student\\" + fileName);
            }
            String filePath = "D:\\SWP391\\OJT_Management\\web\\Student\\" + fileName;
            ArrayList<StudentDTO> list = readExcel(filePath);
            Date d = new Date(System.currentTimeMillis());

            //insert Account
            for (StudentDTO student : list) {
                
                if(student.getEmail()!=null){
                int result = AccountDAO.insertAccount(student.getStudentID(), student.getEmail(), student.getStudentName(), null, null, d.toString(), role, status);
                }
                }
            //insert Student
            for (StudentDTO student : list) {
                ArrayList<AccountDTO> list1 = AccountDAO.getAccounts();
                for (AccountDTO account : list1) {
                    if(student.getEmail()!=null){
                    if (student.getEmail().equals(account.getEmail())) {
                        int result1 = StudentDAO.insertStudent(student.getStudentID(), account.getAccId(), student.getMajorID(), student.getSemesterID());
                    }
                    }
                }
            }

            request.getRequestDispatcher("AdminStudentController").forward(request, response);
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
