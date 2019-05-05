/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Obra;

/**
 *
 * @author ACIE
 */
public class Compartir extends HttpServlet {

    //Solo direcciona al jsp que corresponde según el tipo de texto :)

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
        RequestDispatcher rd = request.getRequestDispatcher("./jsp/Login.jsp");
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
        
        String idObra = request.getAttribute("cp").toString();
        
        Obra obraX = null;
        AdminObras ao = new AdminObras();
        String titulo = "";
        String tipoo = "";
        String ruta = "";
        int type = 0;
        
        obraX = ao.buscaObraporID(Integer.parseInt(idObra));
        type = Integer.parseInt(obraX.getTipo());
        
        if(type == 1){
            tipoo = "Ensayo";
        }else if(type == 2){
            tipoo = "Resumen";
        }else if(type == 3){
            tipoo = "Narrativo";
        }else if(type == 4){
            tipoo = "Lirica";
        }else if(type == 5){
            tipoo = "Lienzo";
        }
        
        ruta = "./jsp/COMPARTIR/"+tipoo+".jsp";
        request.setAttribute("idObra", idObra);
        
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
