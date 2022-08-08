/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import sample.account.AccountDAO;
import sample.account.AccountDTO;
import sample.major.MajorDAO;
import sample.major.MajorDTO;

/**
 *
 * @author Tranduc
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
@WebServlet(name = "UploadImageCompanyController", urlPatterns = {"/UploadImageCompanyController"})
public class UploadImageCompanyController extends HttpServlet {

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
            HttpSession session = request.getSession();
            String email = (String) session.getAttribute("accEmail");

//            Part filePart = request.getPart("file");
//            String fileName = filePart.getSubmittedFileName();
//            if (!fileName.isEmpty()) {
//                for (Part part : request.getParts()) {
//                    part.write("D:\\SWP391\\OJT_Management\\web\\img\\" + fileName);
//                }
//                String path = "img\\" + fileName;
            Part filePart = request.getPart("file");
            String realPath = request.getServletContext().getRealPath("/img");
            String filename = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            if (!filename.isEmpty()) {
                if (!Files.exists(Paths.get(realPath))) {
                    Files.createDirectory(Paths.get(realPath));
                }

                String path;
                if (!"".equals(filename)) {
                    Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                    filePart.write(realPath + "/" + filename);
                    path = "img\\" + filename;
                } else {
                    AccountDTO acc = AccountDAO.loginAccount_V2(email);
                    path = acc.getAvatar();
                }
                int result = AccountDAO.updateAvatarPath(email, path);
                ArrayList<MajorDTO> list = MajorDAO.getMajors();
                AccountDTO acc = AccountDAO.loginAccount_V2(email);
                session.setAttribute("acc", acc);
                
                request.getRequestDispatcher("CompanyProfileController").forward(request, response);
            } else {
                ArrayList<MajorDTO> list = MajorDAO.getMajors();
                AccountDTO acc = AccountDAO.loginAccount_V2(email);
                String noFile = "No file to upload !!!!";
                request.setAttribute("noFile", noFile);
                session.setAttribute("acc", acc);
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
