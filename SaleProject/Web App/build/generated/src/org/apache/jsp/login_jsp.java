package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import org.json.simple.parser.JSONParser;
import org.json.simple.JSONObject;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import javax.servlet.http.HttpSession;
import java.net.URL;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

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
            

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("\t<head>\n");
      out.write("\t\t<meta charset=\"UTF-8\">\n");
      out.write("                <link rel=\"stylesheet\" href=\"css/style.css\">\n");
      out.write("\t\t<link rel=\"stylesheet\" href=\"css/login.css\">\n");
      out.write("\t\t<script src=\"js/login.js\"></script>\n");
      out.write("\t\t<title>\n");
      out.write("\t\t\tSale Project\n");
      out.write("\t\t</title>\n");
      out.write("\t</head>\n");
      out.write("\t\n");
      out.write("\t<body>\n");
      out.write("\t\t<div class=\"container\">\n");
      out.write("\t\t\t<h1 class=\"webtitle\"> <span id=\"sale\">Sale</span><span id=\"project\">Project</span></h1>\n");
      out.write("\t\t\t<br/>\n");
      out.write("\t\t\t<span id=\"PleaseLogin\" >Please login</span>\n");
      out.write("\t\t\t<hr></hr>\n");
      out.write("\t\t\t<br/>\n");
      out.write("\t\t\t<form id=\"formlogin\" name=\"formlogin\" method=\"post\" onsubmit=\"return validateForm()\">\t\n");
      out.write("\t\t\t\t<label for=\"EorU\">Email or Username</label>\n");
      out.write("\t\t\t\t<input type=\"text\" id=\"EorU\" name=\"EmailorUsername\" onblur=\"return validateNameorEmail()\">\n");
      out.write("\t\t\t\t<span id=\"login1\"></span>\n");
      out.write("\t\t\t\t<br/>\n");
      out.write("\t\t\t\t<br/>\n");
      out.write("\t\t\t\t<label for=\"pass\">Password</label>\n");
      out.write("\t\t\t\t<input type=\"password\" id=\"pass\" name=\"password\" onblur=\"return validatePassword()\">\n");
      out.write("\t\t\t\t<span id=\"login2\"></span>\n");
      out.write("\t\t\t\t<br/>\n");
      out.write("\t\t\t\t<br/>\n");
      out.write("\t\t\t\t<br/>\n");
      out.write("                                ");
      out.print(errorMessage);
      out.write("\n");
      out.write("\t\t\t\t<input type=\"submit\" id=\"login\" name=\"login\" value=\"LOGIN\">\n");
      out.write("\t\t\t</form>\t\n");
      out.write("\t\t\t<br>\n");
      out.write("\t\t\t<br>\n");
      out.write("\t\t\t<p id=\"dont\">Don't have an account yet? Register <span id=\"here\" style=\"text-decoration:none\"><a href=\"register.jsp\">here</a></span></p>\n");
      out.write("\t\t</div>\n");
      out.write("</body>\n");
      out.write("\n");
      out.write("\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
