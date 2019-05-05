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
public class ActualizarObra extends HttpServlet {
    
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
        RequestDispatcher rd = request.getRequestDispatcher("jsp/MISOBRAS/MisObras.jsp");
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
        request.setCharacterEncoding("UTF-8");
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
        String expo = "";
        String dese = "";
        String clim = "";
        int idObra = 0;
        int idObraTipo = 0;
        String regreso = "";
        AdminObras ao = new AdminObras();
        
        idObra = Integer.parseInt(request.getParameter("idObra"));

        //Obtiene parámetros según tipo de Obra
        if (tipo.equals("lienzo")) {
            contenido = request.getParameter("contenido");
            regreso = "jsp/MISOBRAS/Lienzo.jsp";
            
            idObraTipo = ao.buscaObraPorTipo("lienzo", "idObra7", idObra, 5);

            try {//Actualiza lienzo 
                db.connect();
                db.update("UPDATE lienzo SET contenido = '"+contenido+"'"
                        + "  WHERE idlienzo = "+idObraTipo);
                db.closeConnection();
                System.out.println("Obra actualizada");
            } catch (SQLException error) {
                System.out.println(error.toString());
            }

        } else if (tipo.equals("ensayo")) {
            intro = request.getParameter("intro");
            desa = request.getParameter("desarrollo");
            conclu = request.getParameter("conclusion");
            refe = manejaRef(request);
            regreso = "jsp/MISOBRAS/Ensayo.jsp";
            
            idObraTipo = ao.buscaObraPorTipo("ensayo", "idObra2", idObra, 1);

            try {//Actualiza ensayo 
                db.connect();
                db.update("UPDATE ensayo SET intro = '"+intro+"',"
                        + " desarrollo= '"+desa+"', conclusion= '"+conclu+"',"
                        + " referencias= '"+refe+"' WHERE idensayo = "+idObraTipo);
                db.closeConnection();
                System.out.println("Obra actualizada");
            } catch (SQLException error) {
                System.out.println(error.toString());
            }
        } else if (tipo.equals("resumen")) {

            refe = manejaRef(request);
            contenido = request.getParameter("contenido");
            claves =  manejaClaves(request);
            regreso = "jsp/MISOBRAS/Resumen.jsp";
            
            idObraTipo = ao.buscaObraPorTipo("resumen", "idObra1", idObra, 2);

            try {//Actualiza  la resumen 
                db.connect();
                db.update("UPDATE resumen SET contenido = '"+contenido+"',"
                        + " claves= '"+claves+"', referencias= '"+refe+"'"
                                + " WHERE idresumen = "+idObraTipo);
                System.out.println("Obra actualizada");
                db.closeConnection();
            } catch (SQLException error) {
                System.out.println(error.toString());
            }

        } else if (tipo.equals("lirica")) {
            
            contenido = request.getParameter("contenido");
            regreso = "jsp/MISOBRAS/Lirica.jsp";
            
            idObraTipo = ao.buscaObraPorTipo("lirico", "idObra5", idObra, 4);

            try {//Actualiza  lirico 
                db.connect();
                db.update("UPDATE lirico SET contenido = '"+contenido+"'"
                        + "  WHERE idlirico = "+idObraTipo);
                System.out.println("Obra actualizada");
                db.closeConnection();
            } catch (SQLException error) {
                System.out.println(error.toString());
            }

        } else if (tipo.equals("narrativo")) {
            
            intro = request.getParameter("exposicion");
            desa = request.getParameter("desarrollo");
            dese = request.getParameter("desenlace");
            clim = request.getParameter("climax");
            regreso = "jsp/MISOBRAS/Narrativo.jsp";
            
            idObraTipo = ao.buscaObraPorTipo("narrativo", "idObra4", idObra, 4);

            try {//Actualiza  Narrativo 
                db.connect();
                db.update("UPDATE narrativo SET exposicion = '"+intro+"',"
                        + " desarrollo= '"+desa+"', climax= '"+clim+"',"
                        + " descenlace= '"+dese+"' WHERE idnarrativo = "+idObraTipo);
                db.closeConnection();
                System.out.println("Obra actualizada");
            } catch (SQLException error) {
                System.out.println(error.toString());
            }


        } else if (tipo.equals("dramatico")) {
            
        } else if (tipo.equals("articulo")) {
            
        }
        
        try {//Actualiza titulo de Obra
                db.connect();
                db.update("UPDATE obra SET titulo = '"+titulo+"' WHERE idObra = "+idObra);
                db.closeConnection();
                System.out.println("Obra actualizada");
            } catch (SQLException error) {
                System.out.println(error.toString());
            }
            

        sello = creaSello(usuario);

        request.setAttribute("sello", sello);
        request.setAttribute("idObra", idObra);
        
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
    
    private String manejaRef(HttpServletRequest request){
        
        boolean sigue = false;
        int cuenta = 1;
        String refes = "";
        String param = "";
        
        
        if(request.getParameter("vRef1")!= null){
            sigue = true;
        }
        
        while(sigue){
            param = "vRef" + cuenta;
            if(request.getParameter(param)!=null){
                refes = refes + request.getParameter("vRef"+cuenta) + "&" ;
                cuenta++;
                System.out.println("Referencias: "+refes);
            }else {
                sigue = false;
            }   
        }
        return refes;
    }
    
    private String manejaClaves(HttpServletRequest request){
        
        boolean sigue = false;
        int cuenta = 1;
        String refes = "";
        String param = "";
        
        
        if(request.getParameter("pClaveI1")!= null){
            sigue = true;
        }
        
        while(sigue){
            param = "pClaveI" + cuenta;
            if(request.getParameter(param)!=null){
                refes = refes + request.getParameter("pClaveI"+cuenta) + "&" ;
                cuenta++;
                System.out.println("Claves: "+refes);
            }else {
                sigue = false;
            }   
        }
        return refes;
    }

}
