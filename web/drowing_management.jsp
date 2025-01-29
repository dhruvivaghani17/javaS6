<%-- 
    Document   : drowing_management
    Created on : Dec 26, 2024, 1:36:25 PM
    Author     : dkvag
--%>

<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.service.ServiceRegistryBuilder"%>
<%@page import="org.hibernate.service.ServiceRegistry"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="mydata.drowingData"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
    </body>
</html>-->
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Owner's Drawings Managements</title>
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
            .mybtn{
                display: flex;
                justify-content: center; 
                text-align: center;
            }

        </style>
    </head>
    <body>
        <div class="vh-100 overflow-hidden">
            <div class="container border border-light bg-transparent p-4" style="width:50%;border-radius: 15px;margin-top: 150px">
                <h3 class="text-center mb-4">Owner's Drawings Managements</h3>
                <form method="post">
                    <div class="form-group formmain">
                        <input type="number" class="form-control textbox" id="id" name="did" placeholder="" required>
                        <label class="form-labeline">Enter Id</label>
                    </div>
                    <div class="form-group formmain">
                        <input type="text" class="form-control textbox" id="name"name="dnm" placeholder="" required>
                        <label class="form-labeline" >Enter Name</label>
                    </div>
                    <div class="form-group">
                        <input type="date" class="form-control" name="ddt" id="date" required>
                    </div>
                    <div class="form-group formmain">
                        <input type="number" class="form-control textbox" id="id" name="damt" placeholder="" required>
                        <label class="form-labeline">Enter Amount</label>
                    </div>
                    <!--<button type="submit" class="btn btn-primary btn-block" name="ins">Submit</button>-->
                    <div class="mybtn">
                        <button type="submit" class="btn btn-primary" name="ins">Add</button>
                    </div>
                </form>
            </div>
        </div>
        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>

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

            Configuration con = new Configuration().configure().addAnnotatedClass(drowingData.class);
            ServiceRegistry reg = new ServiceRegistryBuilder().applySettings(con.getProperties()).build();
            SessionFactory sf = con.buildSessionFactory(reg);
            Session s = sf.openSession();

            s.beginTransaction();
            s.save(dd);
            s.getTransaction().commit();
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
%>