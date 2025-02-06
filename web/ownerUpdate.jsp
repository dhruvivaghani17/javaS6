<%-- 
    Document   : ownerUpdate
    Created on : Jan 6, 2025, 9:10:53 AM
    Author     : dkvag
--%>

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
        <title>Update Owner</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                /*background-color: #f8f9fa;*/
                background:linear-gradient(160deg,#89D8E3,#CD899E,#F9D3C0,#CFE0F8,#CD899E,#9B70A0,#101E42);
            }
            .formmain{
                position: relative;
            }

            .form-control:focus {
                box-shadow: none; 
                outline: none;
            }

            .form-labeline{
                position: absolute;
                top: 0.6rem;
                left: 1.4rem;
                cursor: text;
                color:grey;
                transition: top 200ms ease-in,left 200ms ease-in,font-size 200ms ease-in;
            }
            .textbox:focus{
                background: white;
            }
            .textbox:focus ~.form-labeline,
            .textbox:not(:placeholder-shown).textbox:not(:focus)~.form-labeline{
                top: -0.5rem;
                left:1.3rem;
                font-size: 12px;
                background:linear-gradient(to top,white,#CFE0F8);
                font-family: sans-serif;
            }

        </style>
    </head>
    <body>
        <div class="vh-100 overflow-hidden">
            <div class="container border border-light bg-transparent p-4"  style="width:50%;border-radius: 15px;margin-top: 150px">
                <h3 class="text-center mb-4">Boat/Owner Management Update</h3>
                <form method="post">
                    <div class="form-group formmain">
                        <input type="number" class="form-control textbox" id="id1" name="oid" placeholder="" value="<%= request.getParameter("id")%>">
                        <label class="form-labeline">Enter Id</label>
                    </div>
                    <div class="form-group formmain">
                        <input type="text" class="form-control textbox" id="name1"name="onm" placeholder=""  value="<%= request.getParameter("name")%>" required>
                        <label class="form-labeline" >Enter Name</label>
                    </div>
                    <div class="form-group">
                        <input type="date" class="form-control text-secondary" id="date1"name="dt" required value="<%= request.getParameter("date")%>">
                    </div>
                    <button type="submit" class="btn btn-primary btn-block" name="upd">Edit</button>
                </form>
            </div>
        </div>
    </body>
</html>
<%
    try {
        if (request.getParameter("upd") != null) {
            int id = Integer.parseInt(request.getParameter("oid"));
            String oName = request.getParameter("onm");
            String date = request.getParameter("dt");

            ownerData od = new ownerData();

            od.setId(id);
            od.setoName(oName);
            od.setDate(date);

            Configuration con = new Configuration().configure().addAnnotatedClass(ownerData.class);
            ServiceRegistry reg = new ServiceRegistryBuilder().applySettings(con.getProperties()).build();
            SessionFactory sf = con.buildSessionFactory(reg);
            Session s = sf.openSession();
            s.beginTransaction();
            s.update(od);
            s.getTransaction().commit();
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>