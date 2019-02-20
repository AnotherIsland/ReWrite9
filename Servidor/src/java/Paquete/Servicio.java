/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Paquete;


import Database.*;

import java.util.Base64;
import java.math.BigInteger;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 *
 * @author Alumno
 */
@WebService(serviceName = "Servicio")
public class Servicio {


    /**
     * Web service operation
     */
    @WebMethod(operationName = "Cifrado")
    public String Cifrado(@WebParam(name = "contra") String contra) {

        //String bits= Base64.getEncoder().encodeToString(contra.getBytes());
        
        //String bytes=new BigInteger(contra.getBytes()).toString(2);
        String binary = new BigInteger(contra.getBytes()).toString(2);

        /*
        
        String cifrcontra = cifra;
        */
        String text2 = new String(new BigInteger(binary, 2).toByteArray());
       
        
        String cifra="";
        
        for (int i = 0; i < binary.length(); i++) {
            cifra=cifra+xor(Character.toString(binary.charAt(i)),i);
        }
        
        
        String textcif = new String(new BigInteger(cifra, 2).toByteArray());
        
        String decifra="";
        for (int i = 0; i < cifra.length(); i++) {
            decifra=decifra+xor(Character.toString(cifra.charAt(i)),i);
        }
        String text3 = new String(new BigInteger(decifra, 2).toByteArray());
        
        return /*binary+" "+text2+" "+cifra+ */textcif/*+ decifra+" "+ text3 */;
    }
    
    //clave= 01010101010101010101010101010
    
    public String xor(String alga, int c){
        
        String resu="";
        if(alga.equals("0")&& c%2==0){
            
            resu="0";          
            
        }
        if(alga.equals("1")&& c%2==0){
            
            resu="1";          
            
        }
        if(alga.equals("0")&& c%2!=0){
            
            resu="1";          
            
        }
        if(alga.equals("1")&& c%2!=0){
            
            resu="0";          
            
        }
        return resu;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "Basec")
    public String Basec(@WebParam(name = "Correo") String Correo, @WebParam(name = "Usuario") String Usuario, @WebParam(name = "Contrase\u00f1a") String Contraseña) {
        //TODO write your implementation code here:
        
        DataBase db = new DataBase();
        ResultSet rs;
        String password = Contraseña;
        String emai = Correo;
        String usuario =Usuario;
        
        
        
        try{
            db.connect();
            CallableStatement call = db.procedure("{call alta_usuario(?, ?, ?, ?)}");
            call.setString(1, usuario);
            call.setString(2, emai);
            call.setString(3, Cifrado(password));
            call.setString(4, "");
            call.execute();
            call.close();
            
            db.closeConnection();
        }
        catch(SQLException error){
            System.out.println(error.toString());
        }
        
        
        return null;
    }


   
    
}
