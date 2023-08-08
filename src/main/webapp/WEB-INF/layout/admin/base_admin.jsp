<%-- 
    Document   : base_admin
    Created on : 2 thg 8, 2023, 17:09:29
    Author     : vbmho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>
            <tiles:insertAttribute name="title" />
        </title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body> 
        <tiles:insertAttribute name="header" />
        <div class="container">
            <tiles:insertAttribute name="content" />
        </div>
        <tiles:insertAttribute name="footer" />
    </body>
</html>
