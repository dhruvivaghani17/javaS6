<%-- 
    Document   : login
    Created on : Feb 3, 2025, 5:07:39 PM
    Author     : dkvag
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table>
            <form>
                <tr>
                    <td>
                        <input type="text" name="txt">
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="password" name="pws">
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" name="btn">
                    </td>
                </tr>
            </form>
        </table>
    </body>
</html>
<%
    if (request.getParameter("btn") != null) {
        session.setAttribute("abc", 101);
//             session.setAttribute("abc", 102);
//        session.setAttribute("abc", 103);
//        response.sendRedirect("owner_management.jsp");
//        response.sendRedirect("addDrawing.jsp");
//        response.sendRedirect("addCompany.jsp");
        response.sendRedirect("selectdata.jsp");
//             response.sendRedirect("viewDrawings.jsp");
//        response.sendRedirect("viewCompanies.jsp");

    }
%>