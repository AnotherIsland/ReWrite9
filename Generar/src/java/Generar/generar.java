/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Generar;

import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import encriptacion.Asignar;


@WebService(serviceName = "generar")
public class generar {

    /**
     * This is a sample web service operation
     */
    @WebMethod(operationName = "generar")
    public String hello(@WebParam(name = "name") String txt) throws Exception {
        Asignar a = new Asignar();
        String id = a.GenerarSesion(txt);
        return id;
    }
}
