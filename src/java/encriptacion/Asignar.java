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
    String _correo = "";
    String _ID = "";
    String _username = "";

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
    String _hora = "";
    public String GenerarSesion(String correo, String ID, String username, String hora) throws Exception{
        Cifrar c = new Cifrar();
       // String acomodado = c.acomodar(pass);

        String cifrado = c.cifrar(correo + " "+ ID+ " "+ username+ " "+ hora);
        System.out.println(cifrado);
        String descifrado = c.descifrar(cifrado);
        
       /* 
        System.out.println("Texto: "+pass);
        System.out.println("Reacomodado: "+acomodado);
        System.out.println("Texto cifrado: "+cifrado);
        System.out.println("Texto descifrado: "+descifrado);
        */
        return cifrado;
    }

    public String desci(String ticket) throws Exception{
        Cifrar c = new Cifrar();
        String descifrado = c.descifrar(ticket);
        System.out.println(descifrado);
        String guarda1 = "";
        String guarda2 = "";
        String guarda3 = "";
        String guarda4 = "";
        
        int bandera = 0;
        String guarda = "";
        for (int i = 0; i < descifrado.length(); i++) {
            
            if (descifrado.charAt(i)== ' '){
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
            guarda = guarda + descifrado.charAt(i);
        }
        _correo = guarda1;
        _ID = guarda2;
        _username = guarda3;
        _hora = guarda4;
        return descifrado;
    }
}
