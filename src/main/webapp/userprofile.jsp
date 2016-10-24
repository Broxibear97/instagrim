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
                        <a href="/Instagrim/Upload">Upload</a>
                        <a href="/Instagrim/Images/<%=lg.getUsername()%>">Images</a>
                        <a href="/Instagrim/Logout">Logout</a>
                     
                        <%
                    }
                %>
        </div>
        
        
                <% String s = (String)request.getAttribute("user");
                if(s != null)
                {
                    %>
                    <p>User being looked for: <%= s %> </p>
                    <%
                    session.setAttribute("lookingFor", s);
                    LoggedIn logIn = (LoggedIn)session.getAttribute("LoggedIn");
                    String user = "";
                    if(logIn != null)
                        user = logIn.getUsername();
                    
                    java.util.ArrayList<String> details = (java.util.ArrayList<String>)request.getAttribute("details");
                    if(details == null)
                    {
                        %>
                        <p> No Details for this account. Maybe it doesn't exist </p>
                        <%
                    }
                    else
                    {
                        %>
                        <p> Username: <%=details.get(0) %> </p> 
                        <p> First Name: <%=details.get(1) %> </p>                       
                        <p> Last Name <%=details.get(2) %> </p>  
                        <%
                        if(user != null && user.equals((String)session.getAttribute("lookingFor")))
                        {
                        
                            %>
                            <form action="/Instagrim/Profile" method="POST"> 
                                <p>New First Name</p>
                                <input type="text" id="FirstName" value="" /><br>
                                <p>New Last Name</p>
                                <input type="text" id="LastName" value=""/><br>
                                <input type="submit" value="Edit" />
                            </form>
                            <%
                       }
                    }
                }
                %>  
            </div>
        <footer>
            <p>&COPY; Josh H & Andy C</p>
        </footer>
    </body>
</html>
