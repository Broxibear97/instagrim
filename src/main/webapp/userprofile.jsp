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
                    <p>User being looked for: <%= s %> </p>
                    <%
                    LoggedIn logIn = (LoggedIn)session.getAttribute("LoggedIn");
                    String user;
                    if(logIn != null)
                    {
                        user = logIn.getUsername();
                        if(s.equals(user))
                        {
                            %>
                            <p> THIS IS YOU! </p>
                            <%
                        }
                    } 
                    java.util.ArrayList<String> details = (java.util.ArrayList<String>)request.getAttribute("details");
                    if(details == null || details.size() == 0)
                    {
                        %>
                        <p> No Details for this account. Maybe it doesnt exist </p>
                        <%
                    }
                    else
                    {
                        for(String det: details)
                        {
                            %>
                            <p> <%=det %> </p>   
                            <%
                        }
                    }
                }
                %>  
            </div>
        </div>
        <footer>
            <p>&COPY; Josh H & Andy C</p>
        </footer>
    </body>
</html>
