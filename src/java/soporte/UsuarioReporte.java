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
 * @author ACIE-PC
 */
public class UsuarioReporte extends HttpServlet {

    

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
        
        String usuario = request.getParameter("usuario");
        String contenido = request.getParameter("contenido");
        String fecha = request.getParameter("fecha");
        //String idLevanta = request.getParameter("idLevanta"); Traer id de quien inicia sesion en sesion
        int idL = 3;
        int us = 0;
        DataBase db = new DataBase();
        ResultSet rs;
        
        try{
            db.connect();
            rs = db.query("select idUsuario,usuario from usuario where usuario = '"+usuario+"' or correo = '"+usuario+"'");
                
            if(rs.next()) {
                us = rs.getInt("idUsuario");
                System.out.println("El usuario es: "+us);
            }
            db.closeConnection();
        }
        catch(SQLException error){
            System.out.println(error.toString());
        }
        
        try{
            db.connect();   
            db.insert("INSERT INTO reporte(fecha_inicio,contenido,idUsuarioEscritor,idUsuarioLevanta) VALUES('"+fecha+"','"+contenido+"',"+us+","+idL+");");
            System.out.println("Reporte levantado");
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioReporte.class.getName()).log(Level.SEVERE, null, ex);
        }
        
         RequestDispatcher rd = request.getRequestDispatcher("jsp/SOPORTE/EVENTOS/LevantarReporte.jsp");
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
