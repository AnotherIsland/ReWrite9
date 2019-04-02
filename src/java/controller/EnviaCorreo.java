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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.WebServiceRef;
import security.AdminSello;

/**
 *
 * @author ACIE-PC
 */
@WebServlet(name = "EnviaCorreo", urlPatterns = {"/EnviaCorreo"})
public class EnviaCorreo extends HttpServlet {    

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
        AdminSello asello = new AdminSello();
        
        String password = request.getParameter("password");
        String emai = request.getParameter("email");
        String clave = "";
        
        try {
            asello.generaLlaves();//Comentar después de iniciar sistema
            clave = asello.cifra(emai);
            //clave = generar(password, emai, "registro", "VALIDADO");
        } catch (Exception ex) {
            Logger.getLogger(EnviaCorreo.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(clave);
        
        try{
            db.connect();
            db.update("insert into usuarioNR(pass,correo,clave) values ('"+password+"','"+emai+"','"+clave+"');");
        }catch(Exception e){ 
            System.out.println(e.getMessage());
        }
        
        cEmail cmail = new cEmail();
        cmail.mandaMAil(emai, "VERIFICA TU CUENTA EN REWRITE "+emai+". ", "Te enviamos este mensaje para que confirmes tu registro en ReWrite,\n"
                            + "para hacerlo, ingresa al siguiente link e inicia sesión. ¡Bienvenido! \n\n"
                            + "http://localhost:8080/ReWrite8/Registroo?cv="+clave);
        
        RequestDispatcher rd = request.getRequestDispatcher("./jsp/RegistroPendiente.jsp");
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
