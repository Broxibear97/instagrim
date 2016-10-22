<%-- 
    Document   : upload
    Created on : Sep 22, 2014, 6:31:50 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="Styles.css" />
    </head>
    <body>
        <div>
            <p>INSTAGRIM</p>
            <a href="/Instagrim">Home</a>
            <a href="/Instagrim/Logout">Logout</a>
        </div>   
        <article>
            <% if(request.getAttribute("success") != null)
            {
                %>
                <p> SUCCESS! </p>
                <%
            }
            %>
            <h3>File Upload</h3>
            <form method="POST" enctype="multipart/form-data" action="Image">
                File to upload: <input type="file" name="upfile"><br/>

                <br/>
                <input type="submit" value="Press"> to upload the file!
            </form>

        </article>
        <footer>
            <p>&COPY; Josh H & Andy C</p>
        </footer>
    </body>
</html>
