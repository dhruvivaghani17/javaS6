<%-- 
    Document   : deleteDrawing
    Created on : Jan 17, 2025, 6:27:07 PM
    Author     : dkvag
--%>

<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.service.ServiceRegistryBuilder"%>
<%@page import="org.hibernate.service.ServiceRegistry"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="mydata.DrawingDAO"%>
<%@page import="mydata.drowingData"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Page</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
    </body>
</html>
<%
    String userId = request.getParameter("id");
    if (userId != null) {
        try {
            Configuration con = new Configuration().configure().addAnnotatedClass(drowingData.class);
            ServiceRegistry reg = new ServiceRegistryBuilder().applySettings(con.getProperties()).build();
            SessionFactory sf = con.buildSessionFactory(reg);
            Session sess = sf.openSession();
            sess.beginTransaction();
            Object user = sess.get(drowingData.class, Integer.parseInt(userId));
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
    response.sendRedirect("viewDrawings.jsp");
%>