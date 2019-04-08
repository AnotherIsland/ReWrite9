/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soporte;

import Database.DataBase;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP-PC
 */
public class AltaMantenimiento extends HttpServlet {
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
        
        String persona = request.getParameter("Persona");
        String reporteExistente = request.getParameter("ReporteExistente");
        
        System.out.println(persona);
        System.out.println(reporteExistente);
        //String idLevanta = request.getParameter("idLevanta"); Traer id de quien inicia sesion en sesion

        DataBase db = new DataBase();     
        
        
        try{
            db.connect();   
            db.insert("INSERT INTO reporteMant(contenido,fecha_inicio,idUsuario1Levanta,idUsuario1Asigna) VALUES('"+reporteExistente+"', current_date() ,"+4+","+persona+");");
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
