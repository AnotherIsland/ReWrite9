/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Database.DataBase;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Obra;

/**
 *
 * @author ACIE-PC
 */
public class MisObras extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        ResultSet rs = null;/*
        HttpSession sesi = request.getSession();
        String usuario = sesi.getAttribute("Email").toString();
        String idUs = sesi.getAttribute("idUsuario").toString();
        
        //Datos a obtener de la obra
        ArrayList <Obra> obras = new ArrayList();
        Obra obraX = null;
        int idObra = 0;
        String titulo = "";
        String fecha = "";
        String tipo = "";
                
        try {
            db.connect();
            rs = db.query("select * from obra inner join relobrausu on relobrausu.idObra = obra.idObra where idUsuario ="+idUs+";");
            while(rs.next()){
                idObra = rs.getInt("idObra");
                titulo = rs.getString("titulo");
                fecha = rs.getString("fecha");
                tipo = rs.getString("tipo");
                
                System.out.println("Obra: "+idObra+" titulo: "+titulo+" tipo: "+tipo+" fecha: "+fecha);
                
                obraX = new Obra(idObra, titulo, fecha);
                obras.add(obraX);
            }                      
            db.closeConnection();
        } catch (SQLException error) {
            System.out.println(error.toString());
        }
        
        request.setAttribute("obras", obras);
        request.setAttribute("tiene", "1");
        
         */
        creaPDF crea = null;
        String titulo = "";
        String path = "";
        String idObra = "";
        String squery = "";
        String tipo = "";
        //Dependen del tipo de texto
        String intro = "";
        String desa = "";
        String conclu = "";
        String refe = "";
        String contenido = "";
        String claves = "";
        //Crea el pdf de la obra
        if (request.getParameter("descargaPDF") != null) {
            titulo = request.getParameter("title");
            idObra = request.getParameter("idObra");
            tipo = request.getParameter("tipo");
            
            System.out.println("ObraPDF: " + idObra + " titulo: " + titulo + " tipo: " + tipo);

            if (tipo.equals("1")) {//Ensayo
                squery = "select * from obra inner join ensayo on idObra = idObra2 where idObra = " + idObra + ";";
            } else if (tipo.equals("2")) {//Resumen
                squery = "select * from obra inner join resumen on idObra = idObra1 where idObra =" + idObra + ";";
            }
            
            crea = new creaPDF();
            path = "G:/RW_ElBuenisimo/pdf/" + titulo + ".pdf";

            try {
                db.connect();
                rs = db.query(squery);
                while (rs.next()) {
                    if (tipo.equals("1")) {//Ensayo
                        intro = rs.getString("intro");
                        desa = rs.getString("desarrollo");
                        conclu = rs.getString("conclusion");
                        //refe = rs.getString("refe");
                        ByteArrayOutputStream output = new ByteArrayOutputStream();
                        output = crea.ensayoPDF(titulo,intro,desa,conclu,refe,path);                      
                        response.addHeader("Content-Type", "application/force-download"); 
                        response.addHeader("Content-Disposition", "attachment; filename="+titulo);
                        response.getOutputStream().write(output.toByteArray());
                    } else if (tipo.equals("2")) {//Resumen
                        contenido = rs.getString("contenido");
                        //refe = rs.getString("refe");
                        
                        ByteArrayOutputStream output = new ByteArrayOutputStream();
                        output = crea.resumenPDF(titulo,contenido,refe,path);                      
                        response.addHeader("Content-Type", "application/force-download"); 
                        response.addHeader("Content-Disposition", "attachment; filename="+titulo);
                        response.getOutputStream().write(output.toByteArray());
                    }
                }
                db.closeConnection();
            } catch (SQLException error) {
                System.out.println(error.toString());
            }
        }
        //RequestDispatcher rd = request.getRequestDispatcher("jsp/MISOBRAS/MisObras.jsp");
        //rd.forward(request, response);
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
