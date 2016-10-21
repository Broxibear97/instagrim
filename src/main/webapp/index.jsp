<%-- 
    Document   : index
    Created on : Sep 28, 2014, 7:01:44 PM
    Author     : Administrator
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
                <p> INSTAGRIM </p>
                <%
                        
                    LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                    if (lg == null) 
                    {
                            
                %>

                <a href="/Instagrim/Register">Register</a>
                <a href="/Instagrim/Login">Login</a>
                <%
                    } 
                    else
                    {
                        %>
                        <a href="/Instagrim/Profile/<%=lg.getUsername()%>">Profile</a>
                        <a href="/Instagrim/Upload">Upload</a>
                        <a href="/Instagrim/Images/<%=lg.getUsername()%>">Images</a>
                        <a href="/Instagrim/Logout">Logout</a>
                        <%
                    }
                %>
        </div>
        <footer>
            <p>&COPY; Josh H & Andy C</p>
        </footer>
    </body>
</html>