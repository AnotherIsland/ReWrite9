/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Database.DataBase;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author victor
 */
public class Ajustes extends HttpServlet {

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
        
        DataBase db = new DataBase();
        HttpSession sesi = request.getSession();
        ResultSet rs = null;
        String usuario1 = sesi.getAttribute("Email").toString();

        int us = 0;
        
        try{
            db.connect();
            rs = db.query("select idUsuario,usuario from usuario where usuario = '"+usuario1+"' or correo = '"+usuario1+"'");
                
            if(rs.next()) {
                us = rs.getInt("idUsuario");
                System.out.println("El usuario es: "+us);
                usuario1 = rs.getNString("usuario");
            }
            db.closeConnection();
        }
        catch(SQLException error){
            System.out.println(error.toString());
        }
        
        
        String id = "";
        id = Integer.toString(us);
                 
        
        String emai = request.getParameter("correo");
        String usuario=request.getParameter("usuario");
        String Cvieja=request.getParameter("contraVieja");
        String Cnueva=request.getParameter("contraNueva");
        String CContra=request.getParameter("confirmacionContraseña");
        
        if(usuario!=null){
            System.out.println(actUsuario(usuario, id));
        }
        if(emai!=null){        
        
        System.out.println(actCorreo(emai, id));
        }
        if(Cnueva!=null){
        
        System.out.println(actContraseña(cifrado(Cnueva),cifrado(Cvieja), id));
        }
        
           RequestDispatcher rd = request.getRequestDispatcher("jsp/AJUSTES/Ajustes.jsp");
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

    private static String basec(java.lang.String correo, java.lang.String usuario, java.lang.String contraseña) {
        paquete.Servicio_Service service = new paquete.Servicio_Service();
        paquete.Servicio port = service.getServicioPort();
        return port.basec(correo, usuario, contraseña);
    }

    

    private static String actContraseña(java.lang.String nuevaContra, java.lang.String viejaContra, java.lang.String id) {
        paquete.Servicio_Service service = new paquete.Servicio_Service();
        paquete.Servicio port = service.getServicioPort();
        return port.actContraseña(nuevaContra, viejaContra, id);
    }

    private static String cifrado(java.lang.String contra) {
        paquete.Servicio_Service service = new paquete.Servicio_Service();
        paquete.Servicio port = service.getServicioPort();
        return port.cifrado(contra);
    }



    private static String actUsuario(java.lang.String nuevoUsuario, java.lang.String id) {
        paquete.Servicio_Service service = new paquete.Servicio_Service();
        paquete.Servicio port = service.getServicioPort();
        return port.actUsuario(nuevoUsuario, id);
    }

    private static String actCorreo(java.lang.String nuevoCorreo, java.lang.String id) {
        paquete.Servicio_Service service = new paquete.Servicio_Service();
        paquete.Servicio port = service.getServicioPort();
        return port.actCorreo(nuevoCorreo, id);
    }
    

}
