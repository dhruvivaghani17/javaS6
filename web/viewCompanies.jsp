<%-- 
    Document   : viewCompanies
    Created on : Jan 16, 2025, 5:32:08 PM
    Author     : dkvag
--%>

<%@page import="mydata.companyData"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="mydata.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css" integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eHz" crossorigin="anonymous"></script>
        <title>Display Data</title>
        <style>
            .maindes {
                /*background-color: #f8f9fa;*/
                background:linear-gradient(160deg,#89D8E3,#CD899E,#F9D3C0,#CFE0F8,#CD899E,#9B70A0,#101E42);
                background-size: cover;
                background-repeat: no-repeat;
            }
        </style>
    </head>
    <body class="maindes">
        <div class=" overflow-hidden vh-100">
            <table border="1" align="center" class="table w-50 mt-4 text-center">
                <tr>
                    <th colspan="5">Company Details</th>
                </tr>
                <tr>
                    <th>ID</th>
                    <th>Company Name</th>
                    <th>Company Address</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
                <%
                    try {
                        companyData cd = new companyData();
                        Configuration con = new Configuration().configure().addAnnotatedClass(companyData.class);
                        SessionFactory sf = con.buildSessionFactory();
                        Session s = sf.openSession();
                        Transaction t = s.beginTransaction();
                        Query qry = s.createQuery("from companyData");
                        List<companyData> l = qry.list();
                        for (companyData object : l) {
                %>
                <tr>
                    <td>
                        <%=object.getId()%>
                    </td>
                    <td>
                        <%=object.getCname()%>
                    </td>
                    <td>
                        <%=object.getAdd()%>
                    </td>
                    <td>
                        <a href="editCompany.jsp?cid=<%=object.getId()%>&Cname=<%=object.getCname()%>&Add=<%=object.getAdd()%>" style="text-decoration: none;">
                            <i class="fas fa-pencil-alt text-primary"></i>
                        </a>
                    </td>
                    <td>
                        <a href="deleteCompany.jsp?id=<%=object.getId()%>" style="text-decoration: none;">
                            <i class="fas fa-trash text-danger"></i> 
                        </a> 
                    </td>
                </tr>
                <%                            }

                        t.commit();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </table>
        </div>
    </body>
</html>

