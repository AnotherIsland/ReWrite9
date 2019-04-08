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
import java.time.LocalDate;
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
        String fInicio = "0-0-0";       
        String fResol = "0-0-0";       
        String fTermino = "0-0-0";
        String etiqueta = "";
        String folio = "";
        String update = "";
        int idLevanta = 0;
        int idAsigna = 0;
        int idCierra = 0;
        Usuario user = new Usuario();
        
        response.setContentType("text/html;charset=UTF-8");
        
        ConsultaUsuario cu = new ConsultaUsuario();
        
        //Trayendo usuario en la sesion
        HttpSession sesi = request.getSession();
        user = (Usuario)sesi.getAttribute("usuario");
        
        //Asignando ruta de regreso
        String ruta = "";
        if(user.getIdTipoUsuario() == 3){//GerenteS
            ruta = "jsp/SOPORTE/EVENTOS/GerenteDetalleReporte.jsp";
        }else if(user.getIdTipoUsuario() == 4){//Ingeniero
            ruta = "jsp/SOPORTE/EVENTOS/IngDetalleReporte.jsp";
        }

        
        if(request.getParameter("folio")!=null){
            especifica = request.getParameter("especifica");
            levanta = request.getParameter("levanta");  
            fInicio = request.getParameter("fInicio");
            etiqueta = request.getParameter("etiqueta");
            folio = request.getParameter("folio");
            idLevanta = cu.consultaUsID(levanta);
            
            update = "UPDATE reporte set etiqueta = '"+etiqueta+"', fecha_inicio = '"+fInicio+
                    "', contenido = '"+especifica+"', idUsuarioLevanta = "+idLevanta+" where idReporte = "+folio+";";
            
            if(request.getParameter("etiqueta").equals("Cerrado")){
                fTermino = request.getParameter("fTermino");
                cierra = request.getParameter("cierra"); 
                fResol = request.getParameter("fResol"); 
                asigna = request.getParameter("asigna"); 
                
                if(cierra == null){
                    cierra = user.getUsuario();
                    //fResol = LocalDate.now().toString();
                    fTermino = LocalDate.now().toString();
                }
                
                idCierra = cu.consultaUsID(cierra);
                idAsigna = cu.consultaUsID(asigna);
                
                update = "UPDATE reporte set etiqueta = '"+etiqueta+"', fecha_inicio = '"+fInicio+"',"
                    + "fecha_resolucion = '"+fResol+"',fecha_conclusion = '"+fTermino+"',"
                    + "contenido = '"+especifica+"', idUsuarioLevanta = "+idLevanta+", "
                    + " idUsuarioAsigna = "+idAsigna+", idUsuarioCierra = "+idCierra
                    + " where idReporte = "+folio+";";
                
                
            } else if(request.getParameter("etiqueta").equals("Resuelto")){
                asigna = request.getParameter("asigna"); 
                fResol = request.getParameter("fResol"); 
                idAsigna = cu.consultaUsID(asigna);
                etiqueta = "Resuelto";
                
                if(fResol == null){
                    fResol = LocalDate.now().toString();
                }
                update = "UPDATE reporte set etiqueta = '"+etiqueta+"', fecha_inicio = '"+fInicio+
                        "', fecha_resolucion = '"+fResol+"',"
                    + "contenido = '"+especifica+"', idUsuarioLevanta = "+idLevanta+", "
                    + " idUsuarioAsigna = "+idAsigna+ " where idReporte = "+folio+";";
            } else if(request.getParameter("etiqueta").equals("Pendiente")||request.getParameter("asigna")!=null){
                asigna = request.getParameter("asigna"); 
                idAsigna = cu.consultaUsID(asigna);
                etiqueta = "Pendiente";
                update = "UPDATE reporte set etiqueta = '"+etiqueta+"', fecha_inicio = '"+fInicio+"',"
                    + "contenido = '"+especifica+"', idUsuarioLevanta = "+idLevanta+", "
                    + " idUsuarioAsigna = "+idAsigna+ " where idReporte = "+folio+";";
            } 
        }
        
        cr = new ConsultaReporte();                     
        db = new DataBase();

        try{
            db.connect();
            db.update(update);
                System.out.println("Reporte actualizado");
            db.closeConnection();
        }
        catch(SQLException error){
            System.out.println(error.toString());
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
