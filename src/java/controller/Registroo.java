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
 * @author Axolotech
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
        DataBase db = new DataBase();
        ResultSet rs;
        String password = "";
        String emai = "";
        String usuario = "";
        String query = "";
        //String cv = request.getParameter("cv");
        String clave = "";
        //System.out.println(cv);

        /*if (cv != null) {
            query = "Select * from usuarioNR where clave = '" +cv+"';";
            
            try {
                db.connect();
                rs = db.query(query);
                while (rs.next()) {
                    password = rs.getString("pass");
                    System.out.println("Password: "+password);
                    emai = rs.getString("correo");
                    System.out.println("Correo: "+emai);
                }
                db.closeConnection();
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        
         */
        password = request.getParameter("password");
        emai = request.getParameter("email");

        for (int i = 0; i < emai.length(); i++) {
            if (!Character.toString(emai.charAt(i)).equals("@")) {
                usuario += Character.toString(emai.charAt(i));
            } else {
                i = emai.length();
            }
        }

        try {
            db.connect();
            CallableStatement call = db.procedure("{call alta_usuario (?, ?, ?)}");
            call.setString(1, usuario);
            call.setString(2, emai);
            call.setString(3, password);
            call.execute();
            call.close();

            db.closeConnection();
        } catch (SQLException error) {
            System.out.println(error.toString());
        }

        //}
        RequestDispatcher rd = request.getRequestDispatcher("./jsp/Login.jsp");
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
        DataBase db = new DataBase();
        ResultSet rs;
        String password = "";
        String emai = "";
        String usuario = "";
        String query = "";
        //String cv = request.getParameter("cv");
        String clave = "";
        //System.out.println(cv);

        /*if (cv != null) {
            query = "Select * from usuarioNR where clave = '" +cv+"';";
            
            try {
                db.connect();
                rs = db.query(query);
                while (rs.next()) {
                    password = rs.getString("pass");
                    System.out.println("Password: "+password);
                    emai = rs.getString("correo");
                    System.out.println("Correo: "+emai);
                }
                db.closeConnection();
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        
         */
        if (request.getParameter("password") != null && request.getParameter("email") != null) {
            password = request.getParameter("password");
            emai = request.getParameter("email");
        }
        
        for (int i = 0; i < emai.length(); i++) {
            if (!Character.toString(emai.charAt(i)).equals("@")) {
                usuario += Character.toString(emai.charAt(i));
            } else {
                i = emai.length();
            }
        }

        try {
            db.connect();
            CallableStatement call = db.procedure("{call alta_usuario (?, ?, ?)}");
            call.setString(1, usuario);
            call.setString(2, emai);
            call.setString(3, password);
            call.execute();
            call.close();

            db.closeConnection();
        } catch (SQLException error) {
            System.out.println(error.toString());
        }

        //}
        RequestDispatcher rd = request.getRequestDispatcher("./jsp/Login.jsp");
        rd.forward(request, response);

    }

    // basec(emai, usuario, password);
    /**
     * Returns a short description of the servlet.
     *
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>


}
