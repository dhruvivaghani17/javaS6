<%-- 
    Document   : addDrawing
    Created on : Jan 16, 2025, 5:10:09 PM
    Author     : dkvag
--%>

<%@page import="mydata.*"%>
<%--<%@page import="mydata.drowingData"%>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    String message = null;
    String alertType = "info";
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Drawing</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

        <style>
            body {
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
                    <div class="form-group formmain mb-3">
                        <input type="text" class="form-control textbox" id="name"name="dnm" placeholder="" required>
                        <label class="form-labeline" >Enter Name</label>
                    </div>
                    <div class="form-group mb-3">
                        <input type="date" class="form-control" name="ddt" id="date" required>
                    </div>
                    <div class="form-group formmain mb-3">
                        <input type="number" class="form-control textbox" id="id" name="damt" placeholder="" required>
                        <label class="form-labeline">Enter Amount</label>
                    </div>
                    <div class="form-group formmain mb-3">
                        <input type="number" class="form-control textbox" name="uid" placeholder="" required>
                        <label class="form-labeline">Enter User Id</label>
                    </div>
                    <div class="mybtn">
                        <button type="submit" class="btn btn-primary" name="ins">Add</button>
                    </div>
                </form>
            </div>
        </div>

        <%    try {

                if (request.getParameter("ins") != null) {
                    String oname = request.getParameter("dnm");
                    String date = request.getParameter("ddt");
                    float amt = Float.parseFloat(request.getParameter("damt"));
                    int id = Integer.parseInt(session.getAttribute("abc").toString());

                    drowingData dd = new drowingData();
                    dd.setOname(oname);
                    dd.setDate(date);
                    dd.setAmt(amt);
                    dd.setUserid(id);

                    DrawingDAO dao = new DrawingDAO();
                    dao.create(dd);
                    message = "Drawing Added Successfully.";
                    alertType = "Success";
                }
            } catch (Exception e) {
                e.printStackTrace();
                message = "Error: " + e.getMessage();
                alertType = "Danger";
            }
        %>
        <!-- Bootstrap Modal -->
        <div class="modal fade" id="alertModal" tabindex="-1" aria-labelledby="alertModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">

                        <%
                            if (alertType == "danger") {
                        %>
                        <!--<img  src="CSS/Images/tryag.png" height="70px" width="70px"/>-->

                        <%
                        } else {
                        %>
                        <!--<img  src="CSS/Images/succes.png" height="70px" width="70px"/>-->
                        <%
                            }
                        %>
                        <p class="mt-2 mb-0 fw-bold fs-5"><%= message != null ? message : "No message available."%></p>
                    </div>
                    <div class="modal-footer d-flex justify-content-center">
                        <%
                            if (alertType == "danger") {
                        %>
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal" id="okButton" >Okay</button>

                        <%
                        } else {
                        %>
                        <button type="button" class="btn btn-success" data-bs-dismiss="modal" id="okButton" >Okay</button>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
        <script>
            <% if (message != null) { %>
            document.addEventListener("DOMContentLoaded", function () {
                const alertModal = new bootstrap.Modal(document.getElementById("alertModal"));
                alertModal.show();
                const okButton = document.getElementById("okButton");
                if (okButton) {
                    okButton.addEventListener("click", function () {
                        console.log("btn click.");
                        // Remove query parameters from the URL
                        const baseUrl = window.location.origin + window.location.pathname;
                        window.location.replace(baseUrl); // Replaces current URL and refreshes
            <%  message = null; %>
                    });
                }
            });
            <% }%>
        </script>
    </body>
</html>