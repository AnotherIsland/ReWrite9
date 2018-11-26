/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Database.DataBase;
import generar.Exception_Exception;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
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
public class Login extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Login</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Login at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        processRequest(request, response);
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
        String usuario = request.getParameter("username");
        String contrasena = request.getParameter("password");
        String Usu = "";
        HttpSession sesi = request.getSession();
        try{
            db.connect();
            ResultSet rs = db.query("Select * from usuario where correo = '"+usuario+"' and contraseña = '"+contrasena+"';");
            response.setContentType("text/html;charset=UTF-8");
            if (rs.next()){
                try{
                     Login l = new Login();
                sesi.setAttribute("ID", l.generar(contrasena));
                sesi.setAttribute("Email", usuario);
                    System.out.println("id: " + sesi.getAttribute("ID").toString());
                }
                catch (Exception e){
                    System.out.println(e);
                }
                RequestDispatcher rd = request.getRequestDispatcher("./jsp/MISOBRAS/MisObras.jsp");
                rd.forward(request, response);
            }
            else{
                 RequestDispatcher rd = request.getRequestDispatcher("./jsp/Login.jsp");
                rd.forward(request, response);
        }
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        processRequest(request, response);
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

    private static String generar(java.lang.String name) throws Exception_Exception {
        generar.Generar_Service service = new generar.Generar_Service();
        generar.Generar port = service.getGenerarPort();
        return port.generar(name);
    }

   



}
