<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="mydata.drowingData"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css" integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eHz" crossorigin="anonymous"></script>
        <title>View Drawing</title>
        <style>
            .maindes {
                background:linear-gradient(160deg,#89D8E3,#CD899E,#F9D3C0,#CFE0F8,#CD899E,#9B70A0,#101E42);
                background-size: cover;
                background-repeat: no-repeat;
            }
        </style>
    </head>
    <body class="maindes">
        <div class=" overflow-hidden vh-100">
            <div class="container"  style="margin-top: 150px">
                <div class="container-fluid">
                    <form>
                        <h3 class="text-center mt-3 ">View Drawing Details</h3>
                        <table class="table table-bordered  mt-3 table-sm table-striped border-dark table-hover">
                            <tr class="text-center table-dark text-white">
                                <th>ID</th>
                                <th>Name</th>
                                <th>Date</th>
                                <th>Amount</th>
                                <th>Update</th>
                                <th>Delete</th>
                            </tr>
                            <%
                                try {
                                    drowingData dd = new drowingData();
                                    Configuration con = new Configuration().configure().addAnnotatedClass(drowingData.class);
                                    SessionFactory sf = con.buildSessionFactory();
                                    Session s = sf.openSession();
                                    Transaction t = s.beginTransaction();
                                    int id = Integer.parseInt(session.getAttribute("abc").toString());
                                    Query qry = s.createQuery("from drowingData where UserId=" + id);
                                    List<drowingData> l = qry.list();
                                    for (drowingData object : l) {
                            %>
                            <tr class="text-center">
                                <td><%=object.getId()%></td>
                                <td><%=object.getOname()%></td>
                                <td><%=object.getDate()%></td>
                                <td><%=object.getAmt()%></td>
                                <td>
                                    <a href="editDrawing.jsp?id=<%=object.getId()%>&name=<%=object.getOname()%>&date=<%=object.getDate()%>&amount=<%=object.getAmt()%>" style="text-decoration: none;">
                                        <i class="fas fa-pencil-alt text-primary"></i>
                                    </a>
                                </td>
                                <td>
                                    <a href="deleteDrawing.jsp?id=<%=object.getId()%>" style="text-decoration: none;">
                                        <i class="fas fa-trash text-danger"></i> 
                                    </a> 
                                </td>
                            </tr>
                            <%   }
                                    t.commit();
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>
                        </table>
                </div>
                </form>
            </div>
        </div>
    </body>
</html>


