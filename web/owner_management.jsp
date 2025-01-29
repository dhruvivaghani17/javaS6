<%-- 
    Document   : owner_management
    Created on : Dec 23, 2024, 5:24:05 PM
    Author     : dkvag
--%>

<%@page import="org.hibernate.service.ServiceRegistry"%>
<%@page import="org.hibernate.service.ServiceRegistryBuilder"%>
<%@page import="mydata.ownerData"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="java.util.Date"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

         Bootstrap CSS 
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>Owner Page</title>
        <link rel="styleseet" type="text/css" href="styles.css">
        <style>
            .con{
                background: linear-gradient(160deg,#89D8E3,#CD899E,#F9D3C0,#CFE0F8,#CD899E,#9B70A0,#101E42);
                /*    margin:auto;
                    padding: 20px;*/
            }
        </style>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
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
        <title>Boat/Owner Managements</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .maindes {
                /*background-color: #f8f9fa;*/
                background:linear-gradient(160deg,#89D8E3,#CD899E,#F9D3C0,#CFE0F8,#CD899E,#9B70A0,#101E42);
                background-size: cover;
                background-repeat: no-repeat;
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
                /*align-items: center;*/
                /*margin: 0 auto;*/ 
            }
        </style>
    </head>
    <body class="maindes">
        <div class=" overflow-hidden vh-100">
            <div class="container border border-light bg-transparent p-4"  style="width:50%;border-radius: 15px;margin-top: 150px">
                <h3 class="text-center mb-4">Boat/Owner Managements</h3>
                <form method="post">
                    <!--                    <div class="form-group formmain">
                                            <input type="number" class="form-control textbox" id="id" name="did" placeholder="" required>
                                            <label class="form-labeline">Enter Id</label>
                                        </div>-->
                    <div class="form-group formmain">
                        <input type="text" class="form-control textbox" id="name"name="onm" placeholder="" required>
                        <label class="form-labeline" >Enter Name</label>
                    </div>
                    <div class="form-group">
                        <input type="date" class="form-control text-secondary" id="date"name="dt" required>
                    </div>
                    <div class="mybtn">
                        <button type="submit" class="btn btn-primary" name="ins">Add</button>
                    </div>

                    <!-- Bootstrap JS and dependencies -->
                    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
                    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        SAVE
                    </button>

                    <!-- Modal -->
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    ...
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary">Save changes</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <%@include file="selectdata.jsp" %>
        </div>
    </body>
</html>
<%    try {

        if (request.getParameter("ins") != null) {
//             int id = Integer.parseInt(request.getParameter("did"));
            String oName = request.getParameter("onm");
            String date = request.getParameter("dt");

            ownerData od = new ownerData();
//  entity = session.get(YourEntity.class, id);
//            od = session.get(ownerData.class,id);
//            od.setId(id);
            od.setoName(oName);
            od.setDate(date);

            Configuration con = new Configuration().configure().addAnnotatedClass(ownerData.class);
            ServiceRegistry reg = new ServiceRegistryBuilder().applySettings(con.getProperties()).build();
            SessionFactory sf = con.buildSessionFactory(reg);
            Session s = sf.openSession();
            s.beginTransaction();

            s.save(od);
            s.getTransaction().commit();
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
%>