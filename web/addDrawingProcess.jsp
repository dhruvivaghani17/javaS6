<%-- 
    Document   : addDrawingProcess
    Created on : Jan 16, 2025, 5:13:11 PM
    Author     : dkvag
--%>

<%@page import="mydata.DrawingDAO"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.service.ServiceRegistryBuilder"%>
<%@page import="org.hibernate.service.ServiceRegistry"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="mydata.drowingData"%>
<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<!--<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>-->

<%
    try {

        if (request.getParameter("ins") != null) {
            int id = Integer.parseInt(request.getParameter("did"));
            String oname = request.getParameter("dnm");
            String date = request.getParameter("ddt");
            float amt = Float.parseFloat(request.getParameter("damt"));

            drowingData dd = new drowingData();

            dd.setId(id);
            dd.setOname(oname);
            dd.setDate(date);
            dd.setAmt(amt);

            DrawingDAO dao = new DrawingDAO();
            dao.create(dd);

            response.sendRedirect("viewDrawings.jsp");
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
%>