/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Database.DataBase;
import Paquete.Servicio;
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
 * @author Axolotech
 */
public class Ajustes extends HttpServlet {

    private String usuario1 = "";
    private String pass = "";
    private String correo = "";
    private int us = 0;
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
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        DataBase db = new DataBase();
        HttpSession sesi = request.getSession();
        ResultSet rs = null;
        usuario1 = sesi.getAttribute("Email").toString();
        Servicio serv = new Servicio();
        
        consultaUsu(usuario1);
        
        try{
            db.connect();
            rs = db.query("select * from usuario where usuario = '"+usuario1+"' or correo = '"+usuario1+"'");
                
            if(rs.next()) {
                us = rs.getInt("idUsuario");
                System.out.println("El usuario es: "+us);
                usuario1 = rs.getNString("usuario");
                correo = rs.getNString("correo");
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
            System.out.println(serv.actUsuario(usuario, id));
            sesi.removeAttribute("username");
            sesi.setAttribute("username", usuario);
        }
        if(emai!=null){  
            System.out.println(serv.actCorreo(emai, id));
            sesi.removeAttribute("Email");
            sesi.setAttribute("Email", emai);
        }
        if(Cnueva!=null){
            System.out.println(serv.actContra(Cnueva,Cvieja, id));
            sesi.removeAttribute("pass");
            sesi.setAttribute("pass", Cnueva);
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
    
    private void consultaUsu(String usuCorreo){
        DataBase db = new DataBase();
        ResultSet rs = null;
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
    }
}
