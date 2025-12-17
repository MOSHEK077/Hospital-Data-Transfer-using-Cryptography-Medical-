<%-- 
    Document   : reportview
    Created on : 8 Dec, 2025, 7:27:38 PM
    Author     : jones
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   :  Connection cn;
    Statement st;
    ResultSet rs;
    String eid;
    public void init(ServletConfig config) throws ServletException{
        
      super.init(config);
      
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            cn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/medical_secret_data",
                    "root",
                    "Jon$jon12"
            );
            st = cn.createStatement();
            System.out.println("Connected");
        } catch (Exception e) {
            System.out.println("Disconnected");
        }
    }
    
    Created on : 7 Dec, 2025, 4:32:16 PM
    Author     : jones
--%>
<%@page import = "java.sql.*" %>

<!DOCTYPE html><html lang='en'><head><meta charset='UTF-8'>
<meta name='viewport' content='width=device-width, initial-scale=1.0'><title>unique</title>
<style>
    /*
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
*/
/* 
    Created on : 7 Dec, 2025, 4:21:58 PM
    Author     : jones
*/

  * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        color: white;
    }

    
    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(135deg, #4e73df, #1cc88a);
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        animation: bgPulse 10s infinite alternate ease-in-out;
    }

    @keyframes bgPulse {
        0% {
            background: linear-gradient(135deg, #4e73df, #1cc88a);
        }
        100% {
            background: linear-gradient(135deg, #3a5fca, #17a673);
        }
    }

    .login-container {
        background: #0215a690;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        width: 100%;
        max-width: 350px;
        animation: slideIn 0.8s ease-out, containerFloat 4s infinite ease-in-out;
        transform-origin: center;
    }

    @keyframes slideIn {
        0% {
            opacity: 0;
            transform: translateY(-30px) scale(0.9);
        }
        100% {
            opacity: 1;
            transform: translateY(0) scale(1);
        }
    }

    @keyframes containerFloat {
        0%, 100% {
            transform: translateY(0);
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        }
        50% {
            transform: translateY(-8px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.3);
        }
    }

    .login-container h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #fff8f8;
        animation: textGlow 3s infinite alternate;
    }

    @keyframes textGlow {
        0% {
            text-shadow: 0 0 5px rgba(255, 255, 255, 0.3);
        }
        100% {
            text-shadow: 0 0 15px rgba(255, 255, 255, 0.7);
        }
    }

    /* START: floating label styles */
    .form-group {
        position: relative;
        margin-bottom: 20px;
        /* center contents horizontally */
        text-align: center;
        animation: fadeInUp 0.8s ease-out backwards;
    }

    .form-group:nth-child(1) {
        animation-delay: 0.2s;
    }

    @keyframes fadeInUp {
        0% {
            opacity: 0;
            transform: translateY(20px);
        }
        100% {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .form-group input {
        width: 100%;
        padding: 14px 10px 10px 10px; /* extra top padding to make room for label */
        border: 1px solid #ccc;
        border-radius: 5px;
        outline: none;
        transition: border-color 0.3s, box-shadow 0.3s, transform 0.2s;
        font-size: 15px;
        background: transparent;
    }

    .form-group input:focus {
        border-color:  #fffdfda7;
        box-shadow: 0 0 0 3px rgba(78,115,223,0.08);
        border-top: #fffdfdab;
        transform: scale(1.02);
        animation: inputPulse 1.5s infinite;
    }

    @keyframes inputPulse {
        0%, 100% {
            box-shadow: 0 0 0 3px rgba(78,115,223,0.08);
        }
        50% {
            box-shadow: 0 0 0 3px rgba(78,115,223,0.15);
        }
    }

    /* Place label after input in DOM and position it over the input */
    .form-group label {
        position: absolute;
        left: 12px;
        top: 12px;
        font-weight: 600;
        color: #fff8f8;
        pointer-events: none;
        background: rgba(255, 255, 255, 0);
        padding: 0 6px;
        transform-origin: left top;
        transition: transform 0.3s ease, top 0.3s ease, font-size 0.3s ease, color 0.3s ease;
        font-size: 15px;
    }

    /* When the input is focused OR has content, move the label up */
    .form-group input:focus + label,
    .form-group input:not(:placeholder-shown) + label {
        transform: translateY(-22px) scale(0.88);
        color: #fff8f8;
        top: 10px;
        font-size: 14px;
    }
    /* END: floating label styles */

    /* --------- ADDED: styles for centering the SELECT and floating label --------- */
    .form-group select {
        /* make the select narrower than full width and centered */
        width: 80%;
        max-width: 260px;
        display: inline-block;
        margin: 0 auto;
        padding: 14px 10px 10px 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        outline: none;
        transition: border-color 0.3s, box-shadow 0.3s, transform 0.2s;
        font-size: 15px;
        background: transparent;
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance: none;
        color: #00040d;
        cursor: pointer;
        animation: selectAppear 0.6s ease-out;
    }

    @keyframes selectAppear {
        0% {
            opacity: 0;
            transform: scale(0.95);
        }
        100% {
            opacity: 1;
            transform: scale(1);
        }
    }

    .form-group select:hover {
        transform: scale(1.02);
        border-color: #fffdfda7;
    }

    .form-group select:focus {
        border-color: #fffdfda7;
        box-shadow: 0 0 0 3px rgba(78,115,223,0.15);
        transform: scale(1.02);
        animation: selectGlow 2s infinite;
    }

    @keyframes selectGlow {
        0%, 100% {
            box-shadow: 0 0 0 3px rgba(78,115,223,0.15);
        }
        50% {
            box-shadow: 0 0 0 3px rgba(78,115,223,0.25);
        }
    }

    /* center the floating label horizontally above the select */
    .form-group label {
        left: 50%;
        transform: translateX(-50%);
        transform-origin: center top; /* better for centered transform */
    }

    /* float label when select is focused or has a valid value (required + blank option) */
    .form-group select:focus + label,
    .form-group select:valid + label {
        transform: translate(-50%, -22px) scale(0.88);
        top: 10px;
        font-size: 14px;
        color: #fff8f8;
    }
    /* ----------------------------------------------------------------------------- */

    .login-btn {
        width: 100%;
        padding: 10px;
        background: #00040d;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
        transition: background 0.3s, transform 0.3s, box-shadow 0.3s;
        animation: buttonPulse 2s infinite ease-in-out;
    }

    @keyframes buttonPulse {
        0%, 100% {
            transform: scale(1);
            box-shadow: 0 4px 8px rgba(0, 4, 13, 0.2);
        }
        50% {
            transform: scale(1.02);
            box-shadow: 0 6px 12px rgba(0, 4, 13, 0.3);
        }
    }

    .login-btn:hover {
        background: #5a669992;
        transform: scale(1.05);
        box-shadow: 0 8px 16px rgba(0, 4, 13, 0.4);
        animation-play-state: paused;
    }

    .login-btn:active {
        transform: scale(0.98);
        transition: transform 0.1s;
    }

    .extra-links {
        text-align: center;
        margin-top: 15px;
        animation: fadeIn 1s ease-out 0.5s backwards;
    }

    @keyframes fadeIn {
        0% {
            opacity: 0;
        }
        100% {
            opacity: 1;
        }
    }

    .extra-links a {
        color: #4e73df;
        text-decoration: none;
        font-size: 14px;
        transition: color 0.3s, transform 0.3s;
    }

    .extra-links a:hover {
        text-decoration: underline;
        color: #1cc88a;
        transform: translateY(-2px);
    }

    body {
      font-family: system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial;
      -webkit-font-smoothing:antialiased;
      -moz-osx-font-smoothing:grayscale;
      min-height: 100vh;
      color: #ffffff;
      background-color: #051428;
    }

    /* Background image */
    .bg-img {
      position: fixed;
      inset: 0;
      width: 100%;
      height: 100%;
      object-fit: cover;
      object-position: center center;
      z-index: -2;
      pointer-events: none;
      filter: brightness(0.7);
      animation: backgroundZoom 20s infinite alternate ease-in-out;
    }

    @keyframes backgroundZoom {
        0% {
            transform: scale(1);
            filter: brightness(0.7) contrast(1);
        }
        100% {
            transform: scale(1.05);
            filter: brightness(0.8) contrast(1.1);
        }
    }

    /* Add a new overlay for extra effect */
    .bg-tint {
        position: fixed;
        inset: 0;
        background: linear-gradient(135deg, rgba(78, 115, 223, 0.3), rgba(28, 200, 138, 0.3));
        z-index: -1;
        animation: tintPulse 8s infinite alternate;
    }

    @keyframes tintPulse {
        0% {
            opacity: 0.4;
        }
        100% {
            opacity: 0.6;
        }
    }
</style>
    
    </head>
    
<body>
    
     <%
       
    %>
<%
    try {
           Class.forName("com.mysql.cj.jdbc.Driver");
           
        } catch (Exception e) {
            e.printStackTrace();
        }
%>

<%
    Connection cn =  null;
    Statement st = null;
    ResultSet rs = null;
    try{
        cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical_secret_data","root","Jon$jon12");
        st = cn.createStatement();
    }catch(SQLException e){e.printStackTrace();}
    
%>
    
    
    
    
    
    <img class='bg-img' src='image23.jpg' alt='Background image'>
<div class='bg-tint'></div><div class='login-container'>
<h2> SELECT ID</h2><form method='get' action='viewpatient'>
<div class='form-group' >
    
    
    
    
    <select id='username' name='e1' required style='background-color: rgba(4, 12, 235, 0.753); border-top: none;'>
        
       
<option value=''></option>
 <% 
       
       String sql = "select * from patient_consult";
       rs = st.executeQuery(sql);
       
      while(rs.next()){ %>
      

<option ><%= rs.getString("EnrolID")%></option>
  <%  }

       %>  
    </select>
    
    
    
    
<label for='username'>ENROLL ID</label></div>
<button type='submit' class='login-btn'>ENTER</button></form></div></body></html>