/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soporte;

import Database.DataBase;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ACIE-PC
 */
public class ActualizaReporte extends HttpServlet {

    private DataBase db;
    private ConsultaReporte cr;

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
        
        String especifica = "";
        String levanta = "";  
        String asigna = "";  
        String cierra = ""; 
        String fInicio = "";       
        String fResol = "";       
        String fTermino = "";
        String etiqueta = "";
        String folio = "";
        int idLevanta = 0;
        int idAsigna = 0;
        int idCierra = 0;
        
        response.setContentType("text/html;charset=UTF-8");

        
        if(request.getParameter("folio")!=null){
            especifica = request.getParameter("especifica");
            levanta = request.getParameter("levanta");  
            asigna = request.getParameter("asigna");  
            cierra = request.getParameter("cierra"); 
            fInicio = request.getParameter("fInicio");       
            fResol = request.getParameter("fResol");       
            fTermino = request.getParameter("fTermino");
            etiqueta = request.getParameter("etiqueta");
            folio = request.getParameter("folio");
        }
        
        cr = new ConsultaReporte();
        
        idLevanta = cr.consultaUsID(levanta);System.out.println(idLevanta);
        idAsigna = cr.consultaUsID(asigna);System.out.println(idAsigna);
        idCierra = cr.consultaUsID(cierra);System.out.println(idCierra);
                     
        db = new DataBase();

        try{
            db.connect();
            db.update("UPDATE reporte set etiqueta = '"+etiqueta+"', fecha_inicio = '"+fInicio+"',"
                    + "fecha_resolucion = '"+fResol+"',fecha_conclusion = '"+fTermino+"',"
                    + "contenido = '"+especifica+"', idUsuarioLevanta = "+idLevanta+", "
                    + " idUsuarioAsigna = "+idAsigna+", idUsuarioCierra = "+idCierra
                    + " where idReporte = "+folio+";");
                System.out.println("Reporte actualizado");
            db.closeConnection();
        }
        catch(SQLException error){
            System.out.println(error.toString());
        }
        
        RequestDispatcher rd = request.getRequestDispatcher("jsp/SOPORTE/EVENTOS/DetalleReporte.jsp");
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
