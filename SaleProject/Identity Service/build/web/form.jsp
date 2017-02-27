<%-- 
    Document   : form
    Created on : Nov 8, 2016, 3:50:02 AM
    Author     : Asus X550ZE
--%>


<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.io.DataOutputStream"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.io.File"%>
<%@page import="java.net.URL"%>
<%@page import="javax.servlet.http.Part"%>
<%@page import="javax.servlet.annotation.MultipartConfig"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%!
  
    public  byte[] readFully(InputStream input) throws IOException
    {
        byte[] buffer = new byte[8192];
        int bytesRead;
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        while ((bytesRead = input.read(buffer)) != -1)
        {
            output.write(buffer, 0, bytesRead);
        }
        return output.toByteArray();
    }
%>
<%
    String img_path ="";
    String errorMsg = "sss";
    byte[] imgByte = ("wkaodawkodkawo").getBytes();
    
      if(request.getParameter("submit")!=null)
         {
                String unname = request.getParameter("unname");
                String USER_AGENT = "Mozilla/5.0";
                String url = "http://localhost:8082/Identity_Service/testAdd";
                URL connection = new URL(url);
                HttpURLConnection con = (HttpURLConnection) connection.openConnection();

                //add reuqest header
                con.setRequestMethod("POST");
                con.setRequestProperty("User-Agent", USER_AGENT);
                con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
                StringBuilder parameters = new StringBuilder();
                parameters.append("unname=");
                parameters.append(request.getParameter("unname"));
                parameters.append("&filename=");
                parameters.append(request.getParameter("filecover"));
                parameters.append("&filecover=");
                parameters.append(URLEncoder.encode(new String(imgByte),"UTF-8"));
                con.setRequestProperty("Content-Length",Integer.toString(parameters.toString().getBytes().length));
                // Send post request
                con.setDoOutput(true);
                DataOutputStream wr = new DataOutputStream(con.getOutputStream());
                wr.writeBytes(parameters.toString());
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
                String name= (String) obj.get("unname");
                img_path= (String) obj.get("img_path");
                errorMsg = (String)obj.get("errorMsg");
         }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
 
    <body>
        <form  action=""  enctype="multipart/form-data"> <br><br>
            <table>
                <tr>
                    <td>UserName:  </td>
                    <td width='10px'></td>
                    <td><input type="text" name="unname"/></td>
                </tr>

                <tr>
                    <td>Upload: </td>
                    <td width='10px'></td>
                    <td><input type="file" id="filecover" name="filecover" value="Upload"/></td>
                </tr>
                <tr>
                    <td><input type="submit" id="submit" name="submit" value="submit"></td>
                </tr>
            </table>
        </form>
        <img src='img/androidparty.jpg' alt="Smiley face" height="42" width="42">
        <%-- img_path --%>
        <%-- errorMsg --%>
    </body>
</html>
