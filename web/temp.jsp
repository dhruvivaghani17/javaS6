<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css" integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eHz" crossorigin="anonymous"></script>
    <title>Select Owner Data</title>
</head>
<body>
    <table align="center" class="table table-bordered w-50 mt-4 text-center">
        <tr>
            <th colspan="7">User Details</th>
        </tr>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Date</th>
            <th>Delete</th>
        </tr>
        <%
            try {
                ownerData md = new ownerData();

                Configuration con = new Configuration().configure().addAnnotatedClass(ownerData.class);

                SessionFactory sf = con.buildSessionFactory();
                Session s = sf.openSession();

                Transaction t = s.beginTransaction();
                Query qry = s.createQuery("from ownerData");
                List<ownerData> l = qry.list();
                for (ownerData object : l) {
        %>
        <tr>
            <td><%=object.getId()%></td>
            <td><%=object.getoName()%></td>
            <td><%=object.getDate()%></td>
            <td>
                <a href="ownerDelete.jsp?id=<%=object.getId()%>" style="text-decoration: none;">
                <i class="fas fa-trash text-danger"></i> 
                </a> 
            </td>
        </tr>
        <%
                }

                t.commit();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
</body>
</html>