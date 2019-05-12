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
        String expo, clim, dese = "";
        String claves = "";
        //Crea el pdf de la obra
        if (request.getParameter("descargaPDF") != null || request.getParameter("elimina") != null) {
            titulo = request.getParameter("title");
            idObra = request.getParameter("idObra");
            tipo = request.getParameter("tipo");
            
            System.out.println("ObraPDF: " + idObra + " titulo: " + titulo + " tipo: " + tipo);

            if (tipo.equals("1")) {//Ensayo
                squery = "select * from obra inner join ensayo on idObra = idObra2 where idObra = " + idObra + ";";
            } else if (tipo.equals("2")) {//Resumen
                squery = "select * from obra inner join resumen on idObra = idObra1 where idObra =" + idObra + ";";
            } else if (tipo.equals("3")) {//Narrativo
                squery = "select * from obra inner join narrativo on idObra = idObra4 where idObra =" + idObra + ";";
            }else if (tipo.equals("4")) {//Lirica
                squery = "select * from obra inner join lirico on idObra = idObra5 where idObra =" + idObra + ";";
            }else if (tipo.equals("5")) {//Lienzo
                squery = "select * from obra inner join lienzo on idObra = idObra7 where idObra =" + idObra + ";";
            }
            
            if(request.getParameter("elimina") != null) {
                try {
                    db.connect();
                    db.update("UPDATE obra set tipo = 10 WHERE idObra = "+idObra);
                    System.out.println("Obra eliminada");
                    db.closeConnection();
                } catch (SQLException error) {
                    System.out.println(error.toString());
                }
                
                RequestDispatcher rd = request.getRequestDispatcher("jsp/MISOBRAS/MisObras.jsp");
                rd.forward(request, response);
            } else if(request.getParameter("descargaPDF") != null ){
                crea = new creaPDF();
                path = "D:/ACIE/respaldo-usb/6° semestre/PA/RW_9/ReWrite_SinWS/ReWrite8/" + titulo + ".pdf";

                try {
                    db.connect();
                    rs = db.query(squery);
                    ByteArrayOutputStream output = new ByteArrayOutputStream();
                    while (rs.next()) {
                        if (tipo.equals("1")) {//Ensayo
                            intro = rs.getString("intro");
                            desa = rs.getString("desarrollo");
                            conclu = rs.getString("conclusion");
                            refe = rs.getString("referencias");
                            contenido = intro + "\n" +desa+ "\n"+ conclu;
                            output = crea.resumenPDF(titulo,contenido,refe,path);                      

                        } else if (tipo.equals("2")) {//Resumen
                            contenido = rs.getString("contenido");
                            refe = rs.getString("referencias");
                            //claves = rs.getString("claves");

                            output = crea.resumenPDF(titulo,contenido,refe,path);                      

                        } else if (tipo.equals("3")) {//Narrativo
                            expo = rs.getString("exposicion");
                            desa = rs.getString("desarrollo");
                            clim = rs.getString("climax");
                            dese = rs.getString("descenlace");
                            contenido = expo + "\n" + desa + "\n" + clim + "\n" + dese;

                            output = crea.resumenPDF(titulo,contenido,refe,path);                      

                        } else if (tipo.equals("4")) {//Lirica
                            contenido = rs.getString("contenido");
                            output = crea.liricoPDF(titulo,contenido,path);      
                        }else if (tipo.equals("5")) {//Lienzo
                            contenido = rs.getString("contenido");
                            output = crea.liricoPDF(titulo,contenido,path);
                        }
                        response.addHeader("Content-Type", "application/force-download"); 
                        response.addHeader("Content-Disposition", "attachment; filename="+titulo);
                        response.getOutputStream().write(output.toByteArray());
                    }
                    db.closeConnection();
                } catch (SQLException error) {
                    System.out.println(error.toString());
                }
            }
            
            
        }
        
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
