<%-- 
    Document   : profile
    Created on : 20-Oct-2016, 21:00:01
    Author     : joshuahogarth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="Styles.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <div>
            <div>
                <p> INSTAGRIM </p>
                <% String s = (String)request.getAttribute("user");
                if(s != null)
                {
                    %>
                    <p>Username looked for: <%= s %> </p>
                    <%
                }
                %>  
            </div>
        </div>
        <footer>
            <p>&COPY; Josh H & Andy C</p>
        </footer>
    </body>
</html>
