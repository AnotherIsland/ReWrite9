/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Database.DataBase;
import java.io.IOException;
import java.sql.CallableStatement;
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
import security.AdminSello;


/**
 *
 * @author ACIE-PC
 */
public class GuardarObra extends HttpServlet {

    String _texto = null;
    String _bloque = null;
    String _sello = null;
    AdminSello asello = null;

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
        
        response.setContentType("text/html;charset=UTF-8");

        DataBase db = new DataBase();
        ResultSet rs = null;
        HttpSession sesi = request.getSession();
        String usuario = sesi.getAttribute("Email").toString();
        String idUs = sesi.getAttribute("idUsuario").toString();

        //Variables que dependen del tipo de texto
        String tipo = request.getParameter("tipo");
        String titulo = request.getParameter("titulo");
        String sello = request.getParameter("sello");
        String intro = "";
        String desa = "";
        String conclu = "";
        String refe = "";
        String contenido = "";
        String claves = "";
        int idObra = 0;
        String regreso = "";

        //Obtiene parámetros según tipo de Obra
        if (tipo.equals("lienzo")) {
            contenido = request.getParameter("contenido");

        } else if (tipo.equals("ensayo")) {
            intro = request.getParameter("intro");
            desa = request.getParameter("desarrollo");
            conclu = request.getParameter("conclusion");
            refe = request.getParameter("referencias");
            regreso = "jsp/CREAR/Ensayo.jsp";

            try {//Da de alta ensayo 
                db.connect();
                CallableStatement call = db.procedure("{call alta_ensayo (?,?,?,?)}");
                call.setString(1, titulo);
                call.setString(2, intro);
                call.setString(3, desa);
                call.setString(4, conclu + "\n Referencias: " + refe);
                call.execute();
                call.close();

                db.closeConnection();
            } catch (SQLException error) {
                System.out.println(error.toString());
            }
        } else if (tipo.equals("resumen")) {

            refe = request.getParameter("referencias");
            contenido = request.getParameter("contenido");
            claves = request.getParameter("claves");
            regreso = "jsp/CREAR/Resumen.jsp";

            try {//Da de alta la resumen 
                db.connect();
                CallableStatement call = db.procedure("{call alta_resumen (?,?,?)}");
                call.setString(1, titulo);
                call.setString(2, contenido);
                call.setString(3, claves);
                call.execute();
                call.close();

                db.closeConnection();
            } catch (SQLException error) {
                System.out.println(error.toString());
            }

        } else if (tipo.equals("lirico")) {

        } else if (tipo.equals("narrativo")) {

        } else if (tipo.equals("dramatico")) {

        } else if (tipo.equals("articulo")) {

        }
        //Da de alta obra en relacion a usuario en tabla relobrausu
        try {
            db.connect();
            rs = db.query("Select idObra from obra where titulo ='"+titulo+"';");
            if(rs.next()){
                idObra = rs.getInt("idObra");
                db.insert("Insert into relobrausu(idObra,idUsuario) values("+idObra+","+idUs+");");
            }                      
            db.closeConnection();
        } catch (SQLException error) {
            System.out.println(error.toString());
        }

        sello = creaSello(usuario);

        request.setAttribute("sello", sello);

        
        RequestDispatcher rd = request.getRequestDispatcher(regreso);
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
        
        asello = new AdminSello();

        //generaLlaves();
        try {
            _sello = asello.cifra(bloque);
            System.out.println(_sello);
        } catch (Exception ex) {
            Logger.getLogger(GuardarObra.class.getName()).log(Level.SEVERE, null, ex);
        }
        return _sello;
    }

 

}
