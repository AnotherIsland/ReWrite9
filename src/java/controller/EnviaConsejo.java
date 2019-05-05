/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Database.DataBase;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ACIE
 */
public class EnviaConsejo extends HttpServlet {


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
        
        RequestDispatcher rd = request.getRequestDispatcher("./jsp/MISOBRAS/MisObras.jsp");
                rd.forward(request, response);
        
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
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        String consejo = "";
        String idUsuario = "";
        String categoria = "";
        String idObra = "";
        
        consejo = request.getParameter("consejo");
        idUsuario = request.getParameter("idUs");
        categoria = request.getParameter("categoria");
        idObra = request.getParameter("idObra");
        
        
        //Insertar en BD 
        
        DataBase db = new DataBase();
        ResultSet rs = null;
        
        try{
            db.connect();
            db.update("INSERT INTO consejo(consejo,categoria,idUsuarioC,idObraC) "
                    + "VALUES('"+consejo+"','"+categoria+"',"+idUsuario+","+idObra+");");
            db.closeConnection();
        }catch(Exception e){ 
            System.out.println(e.getMessage());
        }
        
        
        
        
        RequestDispatcher rd = request.getRequestDispatcher("./jsp/MISOBRAS/MisObras.jsp");
        rd.forward(request, response);
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
