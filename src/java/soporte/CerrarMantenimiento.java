/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soporte;

import Database.DataBase;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP-PC
 */
public class CerrarMantenimiento extends HttpServlet {
@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
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
        
        
        String reporteExistente = request.getParameter("ReporteExistente");
        
        
        //String idLevanta = request.getParameter("idLevanta"); Traer id de quien inicia sesion en sesion

        DataBase db = new DataBase();     
        
        
        try{
            db.connect();   
            db.insert("Update reporteMant set fecha_conclusion= current_date() where idreporteMant='"+reporteExistente+"';");
            System.out.println("Reporte levantado");
        } catch (SQLException ex) {
            System.out.println("Error en la base :c");
        }
        
         RequestDispatcher rd = request.getRequestDispatcher("jsp/SOPORTE/MANTENIMIENTO/Inicio.jsp");
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


