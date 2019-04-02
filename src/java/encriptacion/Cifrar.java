package encriptacion;

import java.security.Key;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import java.util.Base64;
import java.util.Random;

public class Cifrar {
  private static final String ALGO = "AES";
  private static final byte[] keyValue = new byte[]{'T', 'h', 'e', 'B', 'e', 's', 't', 'S', 'e', 'c', 'r', 'e', 't', 'K', 'e', 'y'};

    public static String cifrar(String data) throws Exception {
        Key key = generar();
        Cipher c = Cipher.getInstance(ALGO);
        c.init(Cipher.ENCRYPT_MODE, key);
        byte[] encVal = c.doFinal(data.getBytes());
        return Base64.getEncoder().encodeToString(encVal);
    }


    public static String descifrar(String encryptedData) throws Exception {
        Key key = generar();
        Cipher c = Cipher.getInstance(ALGO);
        c.init(Cipher.DECRYPT_MODE, key);
        byte[] decordedValue = Base64.getDecoder().decode(encryptedData);
        byte[] decValue = c.doFinal(decordedValue);
        return new String(decValue);
    }

    private static Key generar() throws Exception {
        return new SecretKeySpec(keyValue, ALGO);
    }
    
    public String acomodar(String s){

        Random random = new Random();
       String f;
      StringBuilder sb = new StringBuilder();
      char[] conect = new char [16];
        for (int i = 0; i < 16; i++) {
             int select = random.nextInt(s.length()); 
            conect[i] = s.charAt(select);
           sb.append(conect[i]);
        }
        f = sb.toString();
        return f;
    }

}