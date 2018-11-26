
package controller;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import ws.Exception_Exception;
import ws.NoSuchAlgorithmException_Exception;




/**
 *
 * @author ACIE-PC
 */
public class VerificarSello extends HttpServlet {


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
        System.out.println("Entra a verifica sello");
        String texto = "";
        String sello = request.getParameter("sello");
        HttpSession sesi = request.getSession();
        
        try {
            texto = descifra(sello);
            request.setAttribute("sello",texto);
        } catch (NoSuchAlgorithmException_Exception ex) {
            Logger.getLogger(VerificarSello.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception_Exception ex) {
            Logger.getLogger(VerificarSello.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        RequestDispatcher rd = request.getRequestDispatcher("jsp/VerificaSello.jsp");
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

    private static String descifra(java.lang.String encryptedMsg) throws Exception_Exception, NoSuchAlgorithmException_Exception {
        ws.SelloRW_Service service = new ws.SelloRW_Service();
        ws.SelloRW port = service.getSelloRWPort();
        return port.descifra(encryptedMsg);
    }

}
