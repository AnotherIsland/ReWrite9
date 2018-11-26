/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

/**
 *
 * @author ACIE-PC
 */
public class SeparaTicket {
    String _correo = "";
    String _ID = "";
    String _username = "";
    String _hora = "";

    SeparaTicket() {
        
    }

    public String getCorreo() {
        return _correo;
    }

    public String getID() {
        return _ID;
    }

    public String getUsername() {
        return _username;
    }

    public String getHora() {
        return _hora;
    }
    

    public String desci(String ticket) throws Exception{
        
        String guarda1 = "";
        String guarda2 = "";
        String guarda3 = "";
        String guarda4 = "";
        
        int bandera = 0;
        String guarda = "";
        for (int i = 0; i < ticket.length(); i++) {
            
            if (ticket.charAt(i)== ' '){
                if(bandera == 0){
                    guarda1 = guarda;
                    bandera ++;
                    i++;
                    guarda = "";
                }else if(bandera == 1){
                    guarda2 = guarda;
                    bandera ++;
                    i++;
                    guarda = "";
                }else if(bandera == 2){
                    guarda3 = guarda;
                    bandera ++;
                    i++;
                    guarda = "";
                }else if(bandera == 3){
                    guarda4 = guarda;
                    bandera ++;
                    i++;
                    //guarda = "";
                }  
            }
            guarda = guarda + ticket.charAt(i);
        }
        _correo = guarda1;
        _ID = guarda2;
        _username = guarda3;
        _hora = guarda4;
        return ticket;
    }
}
