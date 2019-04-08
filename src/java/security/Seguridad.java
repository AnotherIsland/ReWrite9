/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package security;


import java.io.File;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import java.util.Base64;

/**
 *
 * @author ACIE-PC
 */
public class Seguridad {
    private Cipher cipher;
    
    private String _texto = null;
    private String _bloque = null;
    String _sello = null;

    public Seguridad(String texto) {
        
        this._texto = texto;
    }
       public Seguridad() throws NoSuchAlgorithmException, NoSuchPaddingException {
            this.cipher = Cipher.getInstance("RSA");
    }

    public String cortaTexto(){
        for (int i = 0; i < 72; i++) {
            this._bloque = _texto +_texto.charAt(i) ;
        }
        return _bloque;
    }
    
    public PrivateKey getPrivate(String filename) throws Exception {
        byte[] keyBytes = Files.readAllBytes(new File(filename).toPath());
        PKCS8EncodedKeySpec spec = new PKCS8EncodedKeySpec(keyBytes);
        KeyFactory kf = KeyFactory.getInstance("RSA");
        return kf.generatePrivate(spec);
    }


    public PublicKey getPublic(String filename) throws Exception {
        byte[] keyBytes = Files.readAllBytes(new File(filename).toPath());
        X509EncodedKeySpec spec = new X509EncodedKeySpec(keyBytes);
        KeyFactory kf = KeyFactory.getInstance("RSA");
        return kf.generatePublic(spec);
    }

 


    public String encriptar(String msg, PrivateKey key) 
                    throws NoSuchAlgorithmException, NoSuchPaddingException,
                    UnsupportedEncodingException, IllegalBlockSizeException, 
                    BadPaddingException, InvalidKeyException {
            this.cipher.init(Cipher.ENCRYPT_MODE, key);
            return Base64.getEncoder().encodeToString(cipher.doFinal(msg.getBytes("UTF-8")));
    }

    public String desencriptar(String msg, PublicKey key)
                    throws InvalidKeyException, UnsupportedEncodingException, 
                    IllegalBlockSizeException, BadPaddingException {
            this.cipher.init(Cipher.DECRYPT_MODE, key);
            return new String(cipher.doFinal(Base64.getDecoder().decode(msg)), "UTF-8");
    }

}

