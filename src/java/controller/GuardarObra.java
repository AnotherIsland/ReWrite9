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
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        DataBase db = new DataBase();
        ResultSet rs = null;
        ResultSet res = null;
        HttpSession sesi = request.getSession();
        String usuario = sesi.getAttribute("Email").toString();
        String idUs = sesi.getAttribute("idUsuario").toString();
        AdminObras aos = new AdminObras();

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
        String regreso = "";
        
        //Verifica si existe obra con mismo nombre
        idObra = aos.buscaObraporTitulo(titulo, Integer.parseInt(idUs));
        
        if(idObra!=0){
            //Si existe una obra con el mismo título, pide otro título
            request.setAttribute("existe", 1);
        }
            
        //Obtiene parámetros según tipo de Obra
        if (tipo.equals("lienzo")) {
            contenido = request.getParameter("contenido");
            regreso = "jsp/MISOBRAS/Lienzo.jsp";

            try {//Da de alta lirico 
                db.connect();
                CallableStatement call = db.procedure("{call alta_lienzo (?,?,?)}");
                call.setString(1, titulo);
                call.setString(2, contenido);
                call.setString(3, idUs);
                call.execute();                
                call.close();

                db.closeConnection();
            } catch (SQLException error) {
                System.out.println(error.toString());
            }

        } else if (tipo.equals("ensayo")) {
            intro = request.getParameter("intro");
            desa = request.getParameter("desarrollo");
            conclu = request.getParameter("conclusion");
            refe = manejaRef(request);
            regreso = "jsp/MISOBRAS/Ensayo.jsp";

            try {//Da de alta ensayo 
                db.connect();
                CallableStatement call = db.procedure("{call alta_ensayo (?,?,?,?,?,?)}");
                call.setString(1, titulo);
                call.setString(2, intro);
                call.setString(3, desa);
                call.setString(4, conclu);
                call.setString(5, refe);
                call.setString(6, idUs);
                call.execute();
                call.close();

                db.closeConnection();
            } catch (SQLException error) {
                System.out.println(error.toString());
            }
        } else if (tipo.equals("resumen")) {

            refe = manejaRef(request);
            contenido = request.getParameter("contenido");
            claves =  manejaClaves(request);
            regreso = "jsp/MISOBRAS/Resumen.jsp";

            try {//Da de alta la resumen 
                db.connect();
                CallableStatement call = db.procedure("{call alta_resumen (?,?,?,?,?)}");
                call.setString(1, titulo);
                call.setString(2, contenido);
                call.setString(3, claves);
                call.setString(4, refe);
                call.setString(5, idUs);
                call.execute();
                call.close();

                db.closeConnection();
            } catch (SQLException error) {
                System.out.println(error.toString());
            }

        } else if (tipo.equals("lirica")) {

            contenido = request.getParameter("contenido");
            regreso = "jsp/MISOBRAS/Lirica.jsp";

            try {//Da de alta lirico 
                db.connect();
                CallableStatement call = db.procedure("{call alta_lirico (?,?,?)}");
                call.setString(1, titulo);
                call.setString(2, contenido);
                call.setString(3, idUs);
                call.execute();
                call.close();

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

            try {//Da de alta Narrativo 
                db.connect();
                CallableStatement call = db.procedure("{call alta_narrativo (?,?,?,?,?,?)}");
                call.setString(1, titulo);
                call.setString(2, intro);
                call.setString(3, desa);
                call.setString(4, clim);
                call.setString(5, dese);
                call.setString(6, idUs);
                call.execute();
                call.close();

                db.closeConnection();
            } catch (SQLException error) {
                System.out.println(error.toString());
            }
        } else if (tipo.equals("dramatico")) {

        } else if (tipo.equals("articulo")) {

        }

        idObra = aos.buscaObraporTitulo(titulo, Integer.parseInt(idUs));

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

        //asello.generaLlaves();
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
