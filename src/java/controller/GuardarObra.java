/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Database.DataBase;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.WebServiceRef;
import ws.Exception_Exception;
import ws.NoSuchAlgorithmException_Exception;

/**
 *
 * @author ACIE-PC
 */
public class GuardarObra extends HttpServlet {
    
    
    
    String _texto = null;
    String _bloque = null;
    String _sello = null;
    

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
        String titulo = request.getParameter("titulo");
        String intro = request.getParameter("intro");
        String desarrollo = request.getParameter("desarrollo");
        String conclusion = request.getParameter("conclusion");
        //String referencias = request.getParameter("referencias");
        ResultSet rs = null;
        String usuario = sesi.getAttribute("Email").toString();
        //String idUs = "1";
        int us = 0;
        
        try{
            db.connect();
            rs = db.query("select idUsuario,usuario from usuario where usuario = '"+usuario+"' or correo = '"+usuario+"'");
                
            if(rs.next()) {
                us = rs.getInt("idUsuario");
                System.out.println("El usuario es: "+us);
                usuario = rs.getNString("usuario");
            }
            db.closeConnection();
        }
        catch(SQLException error){
            System.out.println(error.toString());
        }
        
        String sello = creaSello(usuario);
        
        try{
            db.connect();
            db.insert("insert into ensayo(idUsuario,titulo,intro,desarrollo,conclusion,sello)"
                    + " values("+us+",'"+titulo+"','"+intro+"','"+desarrollo+"','"+conclusion+"','"+sello+"')");
     
            db.closeConnection();
        }
        catch(SQLException error){
            System.out.println(error.toString());
        }
        RequestDispatcher rd = request.getRequestDispatcher("jsp/CREAR/Ensayo.jsp");
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

    private String creaSello(String bloque){
        _texto = "";
        _bloque = "";
        
        //generaLlaves();
        try {
            _sello = cifra(bloque);
            System.out.println(_sello);
        } catch (Exception_Exception ex) {
            Logger.getLogger(GuardarObra.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchAlgorithmException_Exception ex) {
            Logger.getLogger(GuardarObra.class.getName()).log(Level.SEVERE, null, ex);
        } 
      return _sello;  
    }
    

    private static String generaLlaves() {
        ws.SelloRW_Service service = new ws.SelloRW_Service();
        ws.SelloRW port = service.getSelloRWPort();
        return port.generaLlaves();
    }

    private static String cifra(java.lang.String msg) throws NoSuchAlgorithmException_Exception, Exception_Exception {
        ws.SelloRW_Service service = new ws.SelloRW_Service();
        ws.SelloRW port = service.getSelloRWPort();
        return port.cifra(msg);
    }

    
    
}