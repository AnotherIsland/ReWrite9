/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package security;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.PrivateKey;
import java.security.PublicKey;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 *
 * @author ACIE-PC
 */
@WebService(serviceName = "SelloRW")
public class SelloRW {

    /**
     * Web service operation
     */
    @WebMethod(operationName = "sello")
    public String sello(@WebParam(name = "parameter") String parameter) {
        String stamp = null;
        return stamp;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "generaSello")
    public String generaSello() throws NoSuchAlgorithmException, Exception {
        
        Seguridad ac = new Seguridad();
        PrivateKey privateKey = ac.getPrivate("Ll4v3s/privateKey");
	PublicKey publicKey = ac.getPublic("Ll4v3s/publicKey");

        String msg = "Hola este es mi sello";
        String encrypted_msg = ac.encriptar(msg, privateKey);
        String decrypted_msg = ac.desencriptar(encrypted_msg, publicKey);
        System.out.println("Texto: " + msg + 
                "\nSello: " + encrypted_msg
                + "\nTexto: " + decrypted_msg);
        return null;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "generaLlaves")
    public String generaLlaves() {
        GeneraLlaves gk;
        try {
            gk = new GeneraLlaves(1024);
            gk.createKeys();
            gk.writeToFile("Ll4v3s/publicKey", gk.getPublicKey().getEncoded());
            gk.writeToFile("Ll4v3s/privateKey", gk.getPrivateKey().getEncoded());
        } catch (NoSuchAlgorithmException | NoSuchProviderException e) {
            System.err.println(e.getMessage());
        } catch (IOException e) {
            System.err.println(e.getMessage());
        }
        return null;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "traeLlavePublica")
    public String traeLlavePublica() throws NoSuchAlgorithmException, Exception {
        Seguridad ac = new Seguridad();
	PublicKey publicKey = ac.getPublic("Ll4v3s/publicKey");
        return publicKey.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "cifra")
    public String cifra(@WebParam(name = "msg") String msg) throws NoSuchAlgorithmException, Exception {
        Seguridad ac = new Seguridad();
        PrivateKey privateKey = ac.getPrivate("Ll4v3s/privateKey");
	PublicKey publicKey = ac.getPublic("Ll4v3s/publicKey");

        String encrypted_msg = ac.encriptar(msg, privateKey);
        
        return encrypted_msg;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "descifra")
    public String descifra(@WebParam(name = "encrypted_msg") String encrypted_msg) throws NoSuchAlgorithmException, Exception {
        Seguridad ac = new Seguridad();
	PublicKey publicKey = ac.getPublic("Ll4v3s/publicKey");
        String decrypted_msg = ac.desencriptar(encrypted_msg, publicKey);
        return decrypted_msg;
    }
    
}
