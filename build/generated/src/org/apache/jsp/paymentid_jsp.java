package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class paymentid_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
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
      out.write("<!DOCTYPE html><html lang='en'><head><meta charset='UTF-8'>\n");
      out.write("<meta name='viewport' content='width=device-width, initial-scale=1.0'><title>unique</title>\n");
      out.write("<style>\n");
      out.write("    /*\n");
      out.write("To change this license header, choose License Headers in Project Properties.\n");
      out.write("To change this template file, choose Tools | Templates\n");
      out.write("and open the template in the editor.\n");
      out.write("*/\n");
      out.write("/* \n");
      out.write("    Created on : 7 Dec, 2025, 4:21:58 PM\n");
      out.write("    Author     : jones\n");
      out.write("*/\n");
      out.write("\n");
      out.write("  * {\n");
      out.write("        margin: 0;\n");
      out.write("        padding: 0;\n");
      out.write("        box-sizing: border-box;\n");
      out.write("        color: white;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    \n");
      out.write("    body {\n");
      out.write("        font-family: Arial, sans-serif;\n");
      out.write("                background: linear-gradient(135deg, #4e73df, #1cc88a);\n");
      out.write("\n");
      out.write("        height: 100vh;\n");
      out.write("        display: flex;\n");
      out.write("        justify-content: center;\n");
      out.write("        align-items: center;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .login-container {\n");
      out.write("        background: #2178e192;\n");
      out.write("        padding: 30px;\n");
      out.write("        border-radius: 10px;\n");
      out.write("        box-shadow: 0 4px 15px rgba(0,0,0,0.2);\n");
      out.write("        width: 100%;\n");
      out.write("        max-width: 450px;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .login-container h2 {\n");
      out.write("        text-align: center;\n");
      out.write("        margin-bottom: 20px;\n");
      out.write("        color: #fff8f8;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .form-group {\n");
      out.write("        position: relative;\n");
      out.write("        margin-bottom: 20px;\n");
      out.write("        text-align: center;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .form-group input {\n");
      out.write("        width: 100%;\n");
      out.write("        padding: 14px 10px 10px 10px; \n");
      out.write("        border: 1px solid #ccc;\n");
      out.write("        border-radius: 5px;\n");
      out.write("        outline: none;\n");
      out.write("        transition: border-color 0.2s, box-shadow 0.2s;\n");
      out.write("        font-size: 15px;\n");
      out.write("        background: transparent;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .form-group input:focus {\n");
      out.write("        border-color:  #fffdfda7;\n");
      out.write("        box-shadow: 0 0 0 3px rgba(78,115,223,0.08);\n");
      out.write("        border-top: #fffdfdab;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .form-group label {\n");
      out.write("        position: absolute;\n");
      out.write("        left: 12px;\n");
      out.write("        top: 12px;\n");
      out.write("        font-weight: 600;\n");
      out.write("        color: #fff8f8;\n");
      out.write("        pointer-events: none;\n");
      out.write("                background: rgba(255, 255, 255, 0);\n");
      out.write("\n");
      out.write("        padding: 0 6px;\n");
      out.write("        transform-origin: left top;\n");
      out.write("        transition: transform 0.18s ease, top 0.18s ease, font-size 0.18s ease, color 0.18s ease;\n");
      out.write("        font-size: 15px;\n");
      out.write("    \n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .form-group input:focus + label,\n");
      out.write("    .form-group input:not(:placeholder-shown) + label {\n");
      out.write("        transform: translateY(-22px) scale(0.88);\n");
      out.write("        color: #fff8f8;\n");
      out.write("        top: 10px;\n");
      out.write("        font-size: 14px;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .form-group select {\n");
      out.write("        width: 80%;\n");
      out.write("        max-width: 260px;\n");
      out.write("        display: inline-block;\n");
      out.write("        margin: 0 auto;\n");
      out.write("        padding: 14px 10px 10px 10px;\n");
      out.write("        border: 1px solid #ccc;\n");
      out.write("        border-radius: 5px;\n");
      out.write("        outline: none;\n");
      out.write("        transition: border-color 0.2s, box-shadow 0.2s;\n");
      out.write("        font-size: 15px;\n");
      out.write("        background: transparent;\n");
      out.write("        -webkit-appearance: none;\n");
      out.write("        -moz-appearance: none;\n");
      out.write("        appearance: none;\n");
      out.write("        color: #00040d; /* keep the text color you used inline previously */\n");
      out.write("        cursor: pointer;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .form-group label {\n");
      out.write("        left: 50%;\n");
      out.write("        transform: translateX(-50%);\n");
      out.write("        transform-origin: center top; /* better for centered transform */\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    /* float label when select is focused or has a valid value (required + blank option) */\n");
      out.write("    .form-group select:focus + label,\n");
      out.write("    .form-group select:valid + label {\n");
      out.write("        transform: translate(-50%, -22px) scale(0.88);\n");
      out.write("        top: 10px;\n");
      out.write("        font-size: 14px;\n");
      out.write("        color: #fff8f8;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .login-btn {\n");
      out.write("        width: 100%;\n");
      out.write("        padding: 10px;\n");
      out.write("        background: #00040d;\n");
      out.write("        color: white;\n");
      out.write("        border: none;\n");
      out.write("        border-radius: 5px;\n");
      out.write("        font-size: 16px;\n");
      out.write("        cursor: pointer;\n");
      out.write("        transition: background 0.3s;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .login-btn:hover {\n");
      out.write("        background: #5a669992;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .extra-links {\n");
      out.write("        text-align: center;\n");
      out.write("        margin-top: 15px;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .extra-links a {\n");
      out.write("        color: #4e73df;\n");
      out.write("        text-decoration: none;\n");
      out.write("        font-size: 14px;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .extra-links a:hover {\n");
      out.write("        text-decoration: underline;\n");
      out.write("    }\n");
      out.write(" body {\n");
      out.write("      font-family: system-ui, -apple-system, \"Segoe UI\", Roboto, \"Helvetica Neue\", Arial;\n");
      out.write("      -webkit-font-smoothing:antialiased;\n");
      out.write("      -moz-osx-font-smoothing:grayscale;\n");
      out.write("      min-height: 100vh;\n");
      out.write("      color: #ffffff;\n");
      out.write("      background-color: #051428;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    /* Background image */\n");
      out.write("    .bg-img {\n");
      out.write("      position: fixed;\n");
      out.write("      inset: 0;\n");
      out.write("      width: 100%;\n");
      out.write("      height: 100%;\n");
      out.write("      object-fit: cover;\n");
      out.write("      object-position: center center;\n");
      out.write("      z-index: -2;\n");
      out.write("      pointer-events: none;\n");
      out.write("      filter: b}\n");
      out.write("    \n");
      out.write("  \n");
      out.write("</style>\n");
      out.write("    \n");
      out.write("    </head>\n");
      out.write("    \n");
      out.write("<body>\n");
      out.write("    \n");
      out.write("    ");

       
    
      out.write('\n');

    try {
           Class.forName("com.mysql.cj.jdbc.Driver");
           
        } catch (Exception e) {
            e.printStackTrace();
        }

      out.write('\n');
      out.write('\n');

    Connection cn =  null;
    Statement st = null;
    ResultSet rs = null;
    try{
        cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical_secret_data","root","Jon$jon12");
        st = cn.createStatement();
    }catch(SQLException e){e.printStackTrace();}
    

      out.write("\n");
      out.write("    \n");
      out.write("    \n");
      out.write("<img class='bg-img' src='image7.jpg' alt='Background image'>\n");
      out.write("<div class='bg-tint'></div><div class='login-container'>\n");
      out.write("<h2> SELECT ID</h2><form method='get' action='payment'>\n");
      out.write("<div class='form-group' >\n");
      out.write("    \n");
      out.write("    \n");
      out.write("    \n");
      out.write("    \n");
      out.write("<select id='username' name='e1' required style='background-color:rgba(0, 0, 0, 0.832); color:white;  border-top: none;'>\n");
      out.write("        \n");
      out.write("       <option value='' disabled>--SELECT OPTION BELOW--</option>\n");
      out.write("\n");
      out.write(" ");
 
       
       String sql = "select * from patient_visits";
       rs = st.executeQuery(sql);
       
      while(rs.next()){ 
      out.write("\n");
      out.write("      \n");
      out.write("\n");
      out.write("<option >");
      out.print( rs.getString("PayID"));
      out.write("</option>\n");
      out.write("  ");
  } 
      out.write("  \n");
      out.write("\n");
      out.write("</select>\n");
      out.write("    \n");
      out.write("    \n");
      out.write("    \n");
      out.write("    \n");
      out.write("<label for='username'>ENROLL ID</label></div>\n");
      out.write("<button type='submit' class='login-btn'>ENTER</button></form></div></body></html>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
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
