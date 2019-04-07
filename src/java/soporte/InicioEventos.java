/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soporte;

import Database.DataBase;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Usuario;

/**
 *
 * @author ACIE-PC
 */
public class InicioEventos extends HttpServlet {


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
        
        RequestDispatcher rd = request.getRequestDispatcher("jsp/SOPORTE/EVENTOS/InicioEventos.jsp");
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
        
        String usuario = request.getParameter("username");
        String contrasena = request.getParameter("password");
        HttpSession sesi = request.getSession();
        Usuario user = new Usuario();
        String tipoUs = "";
        String ruta = "";
        
        response.setContentType("text/html;charset=UTF-8");
        
        ConsultaUsuario cu = new ConsultaUsuario();
        user = cu.loginUsuario(usuario, contrasena);
        
        sesi.setAttribute("usuario", user);
        
        System.out.println("Usuario login: "+user.getTipoUsuario());
        
        tipoUs = user.getTipoUsuario();
        
        if(tipoUs.equals("operador")){
            ruta = "jsp/SOPORTE/EVENTOS/OperadorAltaReporte.jsp";
        }else if(tipoUs.equals("ingeniero")){
            ruta = "jsp/SOPORTE/EVENTOS/IngSoporte.jsp";
        }else if(tipoUs.equals("gerenteS")){
            ruta = "jsp/SOPORTE/EVENTOS/GerenteVerReportes.jsp";
        }else {
            ruta = "jsp/SOPORTE/EVENTOS/InicioEventos.jsp";
        }
        
        RequestDispatcher rd = request.getRequestDispatcher(ruta);
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
