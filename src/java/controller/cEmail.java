
package controller;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class cEmail {
    String _error = "";
    String _para = "";
    String _cuerpoMsj = "";
    String _de = "axolotech1@gmail.com";
    String _titulo = "";
    
    public cEmail(){
        
    }
    public boolean mandaMAil(String Para, String Titulo, String Msj)
    {
        boolean envio = false;
        this._titulo = Titulo;
        this._para  = Para;
        this._cuerpoMsj = Msj;
        
        try
        {
            
            // Configuracion de la cuenta de envio de mail
            Properties confMail = new Properties();
            confMail.setProperty("mail.smtp.host", "smtp.gmail.com");
            confMail.setProperty("mail.smtp.starttls.enable", "true");
            confMail.setProperty("mail.smtp.port", "587");
            confMail.setProperty("mail.smtp.user", "axolotech1@gmail.com");
            confMail.setProperty("mail.smtp.auth", "true");
            // Sesion
            Session session = Session.getDefaultInstance(confMail);
            // Creamos el MAil
            MimeMessage correo = new MimeMessage(session);
            correo.setFrom(new InternetAddress(this._de));
            correo.addRecipient(Message.RecipientType.TO, new InternetAddress(this._para));
            correo.setSubject(this._titulo);
            correo.setText(this._cuerpoMsj);

            // Enviamos MAil .
            Transport t = session.getTransport("smtp");
            t.connect("axolotech1@gmail.com", "ajolotius1");
            t.sendMessage(correo, correo.getAllRecipients());

            // Cerramos conexion.
            t.close();
            envio = true;
            System.out.println("Envio exitoso.");
        }
        catch (Exception e)
        {
            
            this._error = e.getMessage();
            System.out.println(this._error);
        }
        return envio;
    }
    
}