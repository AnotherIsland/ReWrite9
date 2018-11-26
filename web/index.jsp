<%-- 
    Document   : index
    Created on : 17/11/2018, 07:05:46 AM
    Author     : Student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%
    HttpSession sesi = request.getSession();
  //sesi.invalidate();
  response.sendRedirect("jsp/Registro.jsp");
  
%>