<%@page import = "java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
        animation: gradientShift 15s ease infinite alternate;
    }

    @keyframes gradientShift {
        0% {
            background: linear-gradient(135deg, #4e73df, #1cc88a);
        }
        100% {
            background: linear-gradient(135deg, #3a5fc9, #18b574);
        }
    }

    .login-container {
        background: #00010798;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        width: 100%;
        max-width: 350px;
        animation: fadeInUp 0.6s ease-out;
        transform-origin: center;
    }

    @keyframes fadeInUp {
        from {
            opacity: 0;
            transform: translateY(20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .login-container h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #fff8f8;
        animation: fadeIn 0.8s ease-out 0.2s both;
    }

    @keyframes fadeIn {
        from {
            opacity: 0;
        }
        to {
            opacity: 1;
        }
    }

    /* START: floating label styles */
    .form-group {
        position: relative;
        margin-bottom: 20px;
        /* center contents horizontally */
        text-align: center;
        animation: slideIn 0.6s ease-out 0.3s both;
    }

    @keyframes slideIn {
        from {
            opacity: 0;
            transform: translateX(-10px);
        }
        to {
            opacity: 1;
            transform: translateX(0);
        }
    }

    .form-group input {
        width: 100%;
        padding: 14px 10px 10px 10px; /* extra top padding to make room for label */
        border: 1px solid #ccc;
        border-radius: 5px;
        outline: none;
        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        font-size: 15px;
        background: transparent;
    }

    .form-group input:focus {
        border-color:  #fffdfda7;
        box-shadow: 0 0 0 3px rgba(78,115,223,0.15);
        border-top: #fffdfdab;
        transform: translateY(-2px);
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
        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
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
        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        font-size: 15px;
        background: transparent;
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance: none;
        color: white;
        cursor: pointer;
        animation: fadeInSelect 0.8s ease-out 0.4s both;
    }

    @keyframes fadeInSelect {
        from {
            opacity: 0;
            transform: scale(0.98);
        }
        to {
            opacity: 1;
            transform: scale(1);
        }
    }

    .form-group select:hover {
        border-color: #fffdfda7;
        transform: translateY(-2px);
    }

    .form-group select:focus {
        border-color: #fffdfda7;
        box-shadow: 0 0 0 3px rgba(78,115,223,0.2);
        transform: translateY(-2px) scale(1.01);
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
        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        animation: fadeIn 0.8s ease-out 0.5s both;
        position: relative;
        overflow: hidden;
    }

    .login-btn:hover {
        background: #5a669992;
        transform: translateY(-2px);
        box-shadow: 0 6px 12px rgba(0,0,0,0.15);
    }

    .login-btn:active {
        transform: translateY(0);
        transition: transform 0.1s;
    }

    /* Button ripple effect */
    .login-btn::after {
        content: '';
        position: absolute;
        top: 50%;
        left: 50%;
        width: 5px;
        height: 5px;
        background: rgba(255, 255, 255, 0.5);
        opacity: 0;
        border-radius: 100%;
        transform: scale(1, 1) translate(-50%);
        transform-origin: 50% 50%;
    }

    .login-btn:focus:not(:active)::after {
        animation: ripple 1s ease-out;
    }

    @keyframes ripple {
        0% {
            transform: scale(0, 0);
            opacity: 0.5;
        }
        100% {
            transform: scale(40, 40);
            opacity: 0;
        }
    }

    .extra-links {
        text-align: center;
        margin-top: 15px;
        animation: fadeIn 0.8s ease-out 0.6s both;
    }

    .extra-links a {
        color: #4e73df;
        text-decoration: none;
        font-size: 14px;
        transition: color 0.3s;
    }

    .extra-links a:hover {
        text-decoration: underline;
        color: #1cc88a;
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
        filter: brightness(0.6);
        animation: smoothZoom 30s ease infinite alternate;
    }

    @keyframes smoothZoom {
        0% {
            transform: scale(1);
        }
        100% {
            transform: scale(1.03);
        }
    }

    /* Overlay for better text readability */
    .bg-tint {
        position: fixed;
        inset: 0;
        background: linear-gradient(135deg, 
            rgba(78, 115, 223, 0.3), 
            rgba(28, 200, 138, 0.3)
        );
        z-index: -1;
        pointer-events: none;
        animation: tintFade 8s ease infinite alternate;
    }

    @keyframes tintFade {
        0% {
            opacity: 0.5;
        }
        100% {
            opacity: 0.7;
        }
    }

    /* Subtty container hover effect */
    .login-container:hover {
        box-shadow: 0 8px 25px rgba(0,0,0,0.25);
        transition: box-shadow 0.4s ease;
    }

    /* Selection animation for dropdown options */
    option {
        background: rgba(0, 0, 0, 0.9);
        padding: 8px;
        transition: background-color 0.2s;
    }

    option:hover,
    option:focus {
        background: rgba(78, 115, 223, 0.7);
    }

    /* Loading placeholder animation */
    @keyframes pulse {
        0%, 100% {
            opacity: 1;
        }
        50% {
            opacity: 0.5;
        }
    }

    /* Add smooth scroll behavior */
    html {
        scroll-behavior: smooth;
    }

    /* Focus outline for accessibility */
    *:focus {
        outline: 2px solid rgba(78, 115, 223, 0.5);
        outline-offset: 2px;
    }

    /* Remove focus outline for mouse users */
    .login-btn:focus:not(:focus-visible) {
        outline: none;
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
    
    
    
    
    
    <img class='bg-img' src='img5.png' alt='Background image'>
<div class='bg-tint'></div><div class='login-container'>
<h2> SELECT ID</h2><form method='get' action='viewdecrypt'>
<div class='form-group' >
    
    
    
    
    <select id='username' name='e1' required style='background-color:rgba(0, 0, 0, 0.832); color:white;  border-top: none;'>
        
       <option value='' disabled>--SELECT OPTION BELOW--</option>

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