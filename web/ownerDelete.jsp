<!-- 
    Document   : ownerDelete
    Created on : Jan 6, 2025, 9:45:23 AM
    Author     : dkvag-->


<%@page import="org.hibernate.Transaction"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.service.ServiceRegistryBuilder"%>
<%@page import="org.hibernate.service.ServiceRegistry"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="mydata.ownerData"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Owner's Drawings Managements</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
    </body>
</head>
</html>
<%
    String userId = request.getParameter("id");
    if (userId != null) {
        try {
            Configuration con = new Configuration().configure().addAnnotatedClass(ownerData.class);
            ServiceRegistry reg = new ServiceRegistryBuilder().applySettings(con.getProperties()).build();
            SessionFactory sf = con.buildSessionFactory(reg);
            Session sess = sf.openSession();
            sess.beginTransaction();
            Object user = sess.get(ownerData.class, Integer.parseInt(userId));
            if (user != null) {
                sess.delete(user);
                sess.getTransaction().commit();
//                out.print("User  deleted successfully.");
            } else {
                out.print("User  not found.");
            }
        } catch (Exception e) {
//            if (transaction != null) {
//                transaction.rollback();
//            }
            out.print("Error: " + e.getMessage());
        }
    }
    response.sendRedirect("owner_management.jsp");
%>
