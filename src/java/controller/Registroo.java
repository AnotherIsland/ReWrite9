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

/**
 *
 * @author victor
 */
public class Registroo extends HttpServlet {


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
        ResultSet rs;
        String password = request.getParameter("password");
        String emai = request.getParameter("email");
        String usuario = "";
        
        
        
        for (int i = 0; i < emai.length(); i++) {
            if(!Character.toString(emai.charAt(i)).equals("@")){
              usuario+=Character.toString(emai.charAt(i));  
            }
            else
                i=emai.length();
        }
        
        cEmail cmail = new cEmail();
        cmail.mandaMAil(emai, "VERIFICA TU CUENTA EN REWRITE "+usuario+". ", "Te enviamos este mensaje para que confirmes tu registro en Litteram,\n"
                            + "para hacerlo, ingresa al siguiente link. \n\n"
                            + "http://localhost:8084/ReWrite8/jsp/MISOBRAS/MisObras.jsp");

        try{
            db.connect();
            CallableStatement call = db.procedure("{call alta_usuario(?, ?, ?)}");
            call.setString(1, usuario);
            call.setString(2, emai);
            call.setString(3, password);
            call.execute();
            call.close();
            
            db.closeConnection();
        }
        catch(SQLException error){
            System.out.println(error.toString());
        }
            RequestDispatcher rd = request.getRequestDispatcher("./jsp/Login.jsp");
            rd.forward(request, response);
    }
        
        
        
     /*
        basec(emai, usuario, password);
        
           RequestDispatcher rd = request.getRequestDispatcher("jsp/Login.jsp");
                rd.forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private static String basec(java.lang.String correo, java.lang.String usuario, java.lang.String contraseña) {
        paquete.Servicio_Service service = new paquete.Servicio_Service();
        paquete.Servicio port = service.getServicioPort();
        return port.basec(correo, usuario, contraseña);
    }

    */

  
}

