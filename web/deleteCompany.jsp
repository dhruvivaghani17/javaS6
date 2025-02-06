<%-- 
    Document   : deleteCompany
    Created on : Jan 17, 2025, 7:38:50 PM
    Author     : dkvag
--%>

<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.service.ServiceRegistryBuilder"%>
<%@page import="org.hibernate.service.ServiceRegistry"%>
<%@page import="mydata.companyData"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Company</title>
    </head>
    <body>
    </body>
</html>
<%
    String userId = request.getParameter("id");
    if (userId != null) {
        try {
            Configuration con = new Configuration().configure().addAnnotatedClass(companyData.class);
            ServiceRegistry reg = new ServiceRegistryBuilder().applySettings(con.getProperties()).build();
            SessionFactory sf = con.buildSessionFactory(reg);
            Session sess = sf.openSession();
            sess.beginTransaction();
            Object user = sess.get(companyData.class, Integer.parseInt(userId));
            if (user != null) {
                sess.delete(user);
                sess.getTransaction().commit();
            } else {
                out.print("User  not found.");
            }
        } catch (Exception e) {
            out.print("Error: " + e.getMessage());
        }
    }
    response.sendRedirect("viewCompanies.jsp");
%>
