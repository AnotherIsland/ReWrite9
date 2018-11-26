/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import generar.Exception_Exception;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ACIE-PC
 */
public class PruebaDescifraTicket extends HttpServlet {

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
            throws ServletException, IOException, Exception_Exception, Exception {
        response.setContentType("text/html;charset=UTF-8");
        
        //HttpSession sesi = request.getSession();
        //sesi.getAttribute("ID");sesi.getAttribute("ID").toString(
        
        String descifrado = descifrar("LWCwvMHqWnGdlqxX8voR4J28L3v86JGduWHPuPVjXTj3lclFDkN0g+hGOn8etd3E");
        
        SeparaTicket st = new SeparaTicket();
        st.desci(descifrado);
        
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PruebaDescifraTicket</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>correo " + st.getCorreo()+ "</h1>");
            out.println("<h1>id " + st.getID()+ "</h1>");
            out.println("<h1>usuario " + st.getUsername()+ "</h1>");
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
        //processRequest(request, response);
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
        //processRequest(request, response);
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

    private static String descifrar(java.lang.String ticket) throws Exception_Exception {
        generar.Generar_Service service = new generar.Generar_Service();
        generar.Generar port = service.getGenerarPort();
        return port.descifrar(ticket);
    }

   
    
    

}
