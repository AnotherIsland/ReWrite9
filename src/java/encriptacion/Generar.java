/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package encriptacion;

/**
 *
 * @author ACIE-PC
 */
public class Generar {
    
    public String descifrar(String ticket) throws Exception{
        Cifrar c = new Cifrar();
        String descifrado = c.descifrar(ticket);
        return descifrado;
    }
    
    public String generar(String correo,String ID, String username,String hora) throws Exception{
        Asignar a = new Asignar();
        String id = a.GenerarSesion(correo, ID, username,hora);
        return id;
    }
    
}
