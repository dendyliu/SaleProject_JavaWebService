<%-- 
    Document   : test
    Created on : Nov 8, 2016, 3:48:44 AM
    Author     : Asus X550ZE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "register.RegisterBean"%>
<%@page import = "register.RegisterDAO"%>
<%@page import = "db.ConnectionManager"%>
<!DOCTYPE html>
<% 
    RegisterBean user = new RegisterBean();
    user.setFullname("good");
    user.setUsername("zxc");
    user.setEmail("asd@yahoo.com");
    user.setPassword("123");
    user.setAddress("1asdasd");
    user.setPostal("123");
    user.setPhone("012830192");
    user = RegisterDAO.register(user);
    int id = RegisterDAO.getUserID(user);
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%= id %>
    </body>
</html>
