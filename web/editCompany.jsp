<%-- 
    Document   : editCompany
    Created on : Jan 17, 2025, 7:25:55 PM
    Author     : dkvag
--%>

<%@page import="mydata.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <title>Edit Company</title>
        <style>
            body {
                /*background-color: #f8f9fa;*/
                background: linear-gradient(160deg,#89D8E3,#CD899E,#F9D3C0,#CFE0F8,#CD899E,#9B70A0,#101E42);
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
            <div class="container border border-light bg-transparent p-4"style="width:50%;border-radius: 15px;margin-top: 150px">
                <h2 class="text-center mb-4">Company Management</h2>
                <form method="post">
                    <div class="form-group formmain">
                        <input type="number" class="form-control textbox" id="id" name="id" placeholder="" required value="<%= request.getParameter("cid")%>">
                        <label class="form-labeline">Enter Id</label>
                    </div>
                    <div class="form-group formmain">
                        <input type="text" class="form-control textbox" id="name"name="nm" placeholder="" required value="<%= request.getParameter("Cname")%>">
                        <label class="form-labeline" >Enter Name</label>
                    </div>
                    <div class="form-group formmain">
                        <input type="text" class="form-control textbox" id="name"name="ad" placeholder="" required value="<%= request.getParameter("Add")%>">
                        <label class="form-labeline" >Enter  Address</label>
                    </div>
                    <div class="form-group formmain mb-3">
                        <input type="number" class="form-control textbox" name="uid" placeholder="" required value="<%= request.getParameter("uid")%>">
                        <label class="form-labeline">Enter User Id</label>
                    </div>
                    <!--<button type="submit" class="btn btn-primary btn-block" name="ins">Submit</button>-->
                    <div class="mybtn">
                        <button type="submit" class="btn btn-primary" name="upd">Edit</button>
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
        if (request.getParameter("upd") != null) {
            int id = Integer.parseInt(request.getParameter("id"));
            String cname = request.getParameter("nm");
            String cadd = request.getParameter("ad");
            int uid = Integer.parseInt(session.getAttribute("abc").toString());
            companyData cd = new companyData();

            cd.setId(id);
            cd.setCname(cname);
            cd.setAdd(cadd);
            cd.setUserid(uid);

            CompanyDAO dao = new CompanyDAO();
            dao.update(cd);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>