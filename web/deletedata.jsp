<%-- 
    Document   : deletedata
    Created on : Jan 6, 2025, 12:20:16 PM
    Author     : dkvag
--%>

<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="mydata.ownerData"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Data</title>
    </head>
    <body>
        <%
            try {
                ownerData md = new ownerData();
                
                Configuration con = new Configuration().configure().addAnnotatedClass(ownerData.class);
                
                SessionFactory sf = con.buildSessionFactory();
                Session s = sf.openSession();
                
                Transaction t = s.beginTransaction();
                s.delete(md);
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </body>
</html>
