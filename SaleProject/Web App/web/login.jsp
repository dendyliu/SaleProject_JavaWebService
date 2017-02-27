<%-- 
    Document   : login
    Created on : Nov 7, 2016, 12:31:08 PM
    Author     : Scarletta's
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.DataOutputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="java.net.URL"%>
<%
    // HTTP POST request
            String UsernameorEmail;
            String password;
            String errorMessage="";
            
            if(request.getParameter("login")!=null) {
                UsernameorEmail = request.getParameter("EmailorUsername");
                password = request.getParameter("password");
                String USER_AGENT = "Mozilla/5.0";
                String url = "http://localhost:8082/Identity_Service/login_servlet";
                URL connection = new URL(url);
                HttpURLConnection con = (HttpURLConnection) connection.openConnection();

                //add reuqest header
                con.setRequestMethod("POST");
                con.setRequestProperty("User-Agent", USER_AGENT);
                con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");

                String urlParameters = "EmailorUsername="+UsernameorEmail+
                                       "&password="+password;
                                       
                // Send post request
                con.setDoOutput(true);
                DataOutputStream wr = new DataOutputStream(con.getOutputStream());
                wr.writeBytes(urlParameters);
                wr.flush();
                wr.close();

                int responseCode = con.getResponseCode();

                
                BufferedReader in = new BufferedReader(
                        new InputStreamReader(con.getInputStream()));
                String inputLine;
                StringBuilder resp = new StringBuilder();
                while ((inputLine = in.readLine()) != null) {
                        resp.append(inputLine);
                }
                in.close();
                
                JSONParser parser = new JSONParser();
                JSONObject obj = (JSONObject) parser.parse(resp.toString());
                String status= (String) obj.get("status");
                String user_id = (String) obj.get("user_id");
                String token= (String) obj.get("access_token");
                String user_name = (String) obj.get("username");
                System.out.println(status);
                            
                if(status.equals("ok")){
                    //errorMessage="SUCCESSS " + token;
                    Cookie userId = new Cookie("user_id",user_id);
                    Cookie access_token = new Cookie("access_token", token);
                    Cookie userName = new Cookie("user_name", user_name);
                    access_token.setMaxAge(60 * 60 * 24);
                    userName.setMaxAge(60 * 60 * 24);
                    userId.setMaxAge(60 * 60 * 24);
                    response.addCookie(access_token);
                    response.addCookie(userName);
                    response.addCookie(userId);
                    response.sendRedirect("catalog.jsp");
                    System.out.println(status);
                }
                else{
                    errorMessage= "USERNAME OR EMAIL DOES NOT EXIST";
                }
                
            }
            
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
                <link rel="stylesheet" href="css/style.css">
		<link rel="stylesheet" href="css/login.css">
		<script src="js/login.js"></script>
		<title>
			Sale Project
		</title>
	</head>
	
	<body>
		<div class="container">
			<h1 class="webtitle"> <span id="sale">Sale</span><span id="project">Project</span></h1>
			<br/>
			<span id="PleaseLogin" >Please login</span>
			<hr></hr>
			<br/>
			<form id="formlogin" name="formlogin" method="post" onsubmit="return validateForm()">	
				<label for="EorU">Email or Username</label>
				<input type="text" id="EorU" name="EmailorUsername" onblur="return validateNameorEmail()">
				<span id="login1"></span>
				<br/>
				<br/>
				<label for="pass">Password</label>
				<input type="password" id="pass" name="password" onblur="return validatePassword()">
				<span id="login2"></span>
				<br/>
				<br/>
				<br/>
                                <%=errorMessage%>
				<input type="submit" id="login" name="login" value="LOGIN">
			</form>	
			<br>
			<br>
			<p id="dont">Don't have an account yet? Register <span id="here" style="text-decoration:none"><a href="register.jsp">here</a></span></p>
		</div>
</body>


</html>
