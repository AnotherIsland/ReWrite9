/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package encriptacion;


/**
 *
 * @author victor
 */
public class Asignar {
    public String GenerarSesion(String pass) throws Exception{
        Cifrar c = new Cifrar();
        String acomodado = c.acomodar(pass);
        String cifrado = c.cifrar(acomodado);
        String descifrado = c.descifrar(cifrado);
       /* 
        System.out.println("Texto: "+pass);
        System.out.println("Reacomodado: "+acomodado);
        System.out.println("Texto cifrado: "+cifrado);
        System.out.println("Texto descifrado: "+descifrado);
        */
        return cifrado;
    }
}
