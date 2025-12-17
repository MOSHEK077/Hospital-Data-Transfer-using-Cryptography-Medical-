package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class viewpatient_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write('\n');
      out.write('\n');
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <title>ViewAllPaitentDatas</title>\n");
      out.write("   \n");
      out.write("   \n");
      out.write("      <link href=\"//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css\" rel=\"stylesheet\" id=\"bootstrap-css\">\n");
      out.write("<script src=\"//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js\"></script>\n");
      out.write("<script src=\"//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js\"></script> <style>\n");
      out.write("  \n");
      out.write("    th{\n");
      out.write("        text-align: center;\n");
      out.write("      \n");
      out.write("    }\n");
      out.write("\n");
      out.write("     body {\n");
      out.write("      font-family: system-ui, -apple-system, \"Segoe UI\", Roboto, \"Helvetica Neue\", Arial;\n");
      out.write("      -webkit-font-smoothing:antialiased;\n");
      out.write("      -moz-osx-font-smoothing:grayscale;\n");
      out.write("      min-height: 100vh;\n");
      out.write("      color: #ffffff;\n");
      out.write("      background-color: #051428;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("      .bg-img {\n");
      out.write("      position: fixed;\n");
      out.write("      inset: 0;\n");
      out.write("      width: 100%;\n");
      out.write("      height: 100%;\n");
      out.write("      object-fit: cover;\n");
      out.write("      object-position: center center;\n");
      out.write("      z-index: -2;\n");
      out.write("      pointer-events: none;\n");
      out.write("      filter: brightness(.5) contrast(.95);\n");
      out.write("    }\n");
      out.write("\n");
      out.write("  </style>\n");
      out.write("</head>\n");
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
      out.write("     <img class=\"bg-img\" src=\"./p3.webp\" alt=\"Background image\">\n");
      out.write("  <div class=\"bg-tint\"></div>\n");
      out.write("\n");
      out.write("\n");
      out.write("    <div class=\"container-fluid\">\n");
      out.write("<div class=\"display-4 text-center \">PATIENT VIEW</div>\n");
      out.write("    \n");
      out.write("    <table class=\"table table-bordered\">\n");
      out.write("    <tr><th class=\"bg-info text-white\">EnrolID</th><th class=\"bg-info text-white\">UniqueID</th><th class=\"bg-info text-white\">FullName</th>\n");
      out.write("        <th class=\"bg-info text-white\">Email</th><th class=\"bg-info text-white\">CommunicationAddress</th>\n");
      out.write("        <th class=\"bg-info text-white\">PhotoPath</th><th class=\"bg-info text-white\">ReasonForVisit</th>\n");
      out.write("   \n");
      out.write("        <th class=\"bg-info text-white\">KnownAllergies</th><th class=\"bg-info text-white\">EmergencyContact</th><th class=\"bg-info text-white\">Symptoms</th>\n");
      out.write("        <th class=\"bg-info text-white\">created_at</th> </tr>\n");
      out.write("        \n");
      out.write("    ");
 
       
       String sql = "select * from patient_consult";
       rs = st.executeQuery(sql);
       
      while(rs.next()){
      
    
      out.write("\n");
      out.write("   \n");
      out.write("    <!--\n");
      out.write("    EnrolID, UniqueID, FullName, Email, CommunicationAddress, MaritalStatus,\n");
      out.write("    PhotoPath, ReasonForVisit, KnownAllergies, EmergencyContact, Symptoms, created_at\n");
      out.write("     <tr><th class=\"bg-info text-white\">unique_id</th>\n");
      out.write("    <th class=\"bg-info text-white\">Name</th><th class=\"bg-info text-white\">Father or Husband</th>\n");
      out.write("    <th class=\"bg-info text-white\">MaritalStatus</th><th class=\"bg-info text-white\">CommunicationAddress</th>\n");
      out.write("    <th class=\"bg-info text-white\">Age</th><th class=\"bg-info text-white\">DateOfBirth</th><th class=\"bg-info text-white\">\n");
      out.write("    Gender</th>\n");
      out.write("   \n");
      out.write("        <th class=\"bg-info text-white\">Mail-Id</th>\n");
      out.write("    <th class=\"bg-info text-white\">Nationality</th>\n");
      out.write("    <th class=\"bg-info text-white\">Contact-Number</th>\n");
      out.write("    <th class=\"bg-info text-white\">Identification-Mark-1</th> \n");
      out.write("    </tr>\n");
      out.write("        \n");
      out.write("    \n");
      out.write("    EnrolID, UniqueID, FullName, Email, \n");
      out.write("    CommunicationAddress, MaritalStatus, PhotoPath,\n");
      out.write("    ReasonForVisit, KnownAllergies, EmergencyContact, Symptoms, created_at-->\n");
      out.write("      <tr>\n");
      out.write("          <td style=\"background-color: #101010;text-align: center;\">");
      out.print( rs.getString("EnrolID"));
      out.write("</td>\n");
      out.write("          <td style=\"background-color:  #101010;text-align: center;\">");
      out.print( rs.getString("UniqueID"));
      out.write("</td>\n");
      out.write("          <td style=\"background-color: #101010;text-align: center;\">");
      out.print( rs.getString("FullName"));
      out.write("</td>\n");
      out.write("          <td style=\"background-color:  #101010;text-align: center;\">");
      out.print( rs.getString("Email"));
      out.write("</td>\n");
      out.write("          <td style=\"background-color: #101010;text-align: center;\">");
      out.print( rs.getString("CommunicationAddress"));
      out.write("</td>\n");
      out.write("\n");
      out.write("          <td style=\"background-color:  #101010;text-align: center;\">");
      out.print( rs.getString("PhotoPath"));
      out.write("</td>\n");
      out.write("          <td style=\"background-color: #101010;text-align: center;\">");
      out.print( rs.getString("ReasonForVisit"));
      out.write("</td>\n");
      out.write("          <td style=\"background-color:  #101010;text-align: center;\">");
      out.print( rs.getString("KnownAllergies"));
      out.write("</td>\n");
      out.write("          <td style=\"background-color:  #101010;text-align: center;\">");
      out.print( rs.getString("EmergencyContact"));
      out.write("</td>\n");
      out.write("          <td style=\"background-color:  #101010;text-align: center;\">");
      out.print( rs.getString("Symptoms"));
      out.write("</td>\n");
      out.write("          <td style=\"background-color:  #101010;text-align: center;\">");
      out.print( rs.getString("created_at"));
      out.write("</td>\n");
      out.write("      \n");
      out.write("      </tr>\n");
      out.write("   ");
  }

       
      out.write("\n");
      out.write("    </table>\n");
      out.write("    </div>\n");
      out.write("</body>\n");
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
