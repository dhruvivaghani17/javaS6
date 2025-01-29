<%-- 
    Document   : editDrawing
    Created on : Jan 17, 2025, 6:07:48 PM
    Author     : dkvag
--%>

<%@page import="mydata.DrawingDAO"%>
<%@page import="mydata.drowingData"%>
<%@page import="mydata.ownerData"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Page</title>
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
                <form  method="post">
                    <div class="form-group formmain">
                        <input type="number" class="form-control textbox" id="id" name="did" placeholder="" required value="<%= request.getParameter("id")%>">
                        <label class="form-labeline">Enter Id</label>
                    </div>
                    <div class="form-group formmain">
                        <input type="text" class="form-control textbox" id="name"name="dnm" placeholder="" required value="<%= request.getParameter("name")%>">
                        <label class="form-labeline" >Enter Name</label>
                    </div>
                    <div class="form-group">
                        <input type="date" class="form-control" name="ddt" id="date" required value="<%= request.getParameter("date")%>">
                    </div>
                    <div class="form-group formmain">
                        <input type="number" class="form-control textbox" id="id" name="damt" placeholder="" required value="<%= request.getParameter("amount")%>">
                        <label class="form-labeline">Enter Amount</label>
                    </div>
                    <div class="mybtn">
                        <button type="submit" class="btn btn-primary" name="upd">Edit</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>

<%
    try {
        if (request.getParameter("upd") != null) {
            int id = Integer.parseInt(request.getParameter("did"));
            String oname = request.getParameter("dnm");
            String date = request.getParameter("ddt");
            int amt = Integer.parseInt(request.getParameter("damt"));

            drowingData dd = new drowingData();

            dd.setId(id);
            dd.setOname(oname);
            dd.setDate(date);
            dd.setAmt(amt);

            DrawingDAO dao = new DrawingDAO();
            dao.update(dd);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    response.sendRedirect("addDrawing.jsp");
%>