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

    /* Simple animations */
    @keyframes fadeIn {
        from { opacity: 0; }
        to { opacity: 1; }
    }
    
    @keyframes slideIn {
        from {
            transform: translateY(20px);
            opacity: 0;
        }
        to {
            transform: translateY(0);
            opacity: 1;
        }
    }
    
    @keyframes pulse {
        0% { transform: scale(1); }
        50% { transform: scale(1.02); }
        100% { transform: scale(1); }
    }
    
    @keyframes float {
        0% { transform: translateY(0px); }
        50% { transform: translateY(-5px); }
        100% { transform: translateY(0px); }
    }

    
    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(135deg, #4e73df, #1cc88a);
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        animation: fadeIn 0.6s ease-out;
    }

    .login-container {
        background: #0215a690;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        width: 100%;
        max-width: 350px;
        animation: slideIn 0.5s ease-out 0.2s both;
    }

    .login-container h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #fff8f8;
        animation: float 3s ease-in-out infinite;
    }

    /* START: floating label styles */
    .form-group {
        position: relative;
        margin-bottom: 20px;
        /* center contents horizontally */
        text-align: center;
    }

    .form-group input {
        width: 100%;
        padding: 14px 10px 10px 10px; /* extra top padding to make room for label */
        border: 1px solid #ccc;
        border-radius: 5px;
        outline: none;
        transition: border-color 0.3s, box-shadow 0.3s, transform 0.3s;
        font-size: 15px;
        background: transparent;
    }

    .form-group input:focus {
        border-color:  #fffdfda7;
        box-shadow: 0 0 0 3px rgba(78,115,223,0.08);
        border-top: #fffdfdab;
        transform: scale(1.02);
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
        transition: border-color 0.3s, box-shadow 0.3s, transform 0.3s;
        font-size: 15px;
        background: transparent;
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance: none;
        color: #00040d; /* keep the text color you used inline previously */
        cursor: pointer;
        animation: fadeIn 0.8s ease-out 0.5s both;
    }

    .form-group select:focus {
        border-color: #fffdfda7;
        box-shadow: 0 0 0 3px rgba(78,115,223,0.08);
        transform: scale(1.02);
    }

    /* center the floating label horizontally above the select */
    .form-group label {
        left: 50%;
        transform: translateX(-50%);
        transform-origin: center top; /* better for centered transform */
        transition: transform 0.3s ease, top 0.3s ease, font-size 0.3s ease, color 0.3s ease;
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
        transition: background 0.3s, transform 0.3s;
        animation: slideIn 0.5s ease-out 0.4s both;
    }

    .login-btn:hover {
        background: #5a669992;
        transform: translateY(-2px);
    }
    
    .login-btn:active {
        transform: translateY(0);
    }

    .extra-links {
        text-align: center;
        margin-top: 15px;
    }

    .extra-links a {
        color: #4e73df;
        text-decoration: none;
        font-size: 14px;
    }

    .extra-links a:hover {
        text-decoration: underline;
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
      filter: brightness(0.5);
      animation: fadeIn 1s ease-out;
    }
    
    /* Simple option animation */
    .form-group select option {
        background-color: rgba(4, 12, 235, 0.753);
        transition: background-color 0.2s;
    }
    
    .form-group select option:hover {
        background-color: rgba(4, 12, 235, 0.9);
    }
    
    /* Loading dots animation */
    @keyframes loadingDots {
        0%, 20% { content: ''; }
        40% { content: '.'; }
        60% { content: '..'; }
        80%, 100% { content: '...'; }
    }
    
    .loading::after {
        content: '';
        display: inline-block;
        width: 20px;
        animation: loadingDots 1.5s infinite;
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
<h2> SELECT ID</h2><form method='get' action='Enrol' id='selectForm'>
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
<button type='submit' class='login-btn' id='submitBtn'>ENTER</button></form></div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const form = document.getElementById('selectForm');
        const select = document.getElementById('username');
        const submitBtn = document.getElementById('submitBtn');
        
        // Focus the select element after page load
        setTimeout(() => {
            select.focus();
        }, 500);
        
        // Add animation to options when hovering
        select.addEventListener('mouseenter', function() {
            this.style.transform = 'scale(1.02)';
        });
        
        select.addEventListener('mouseleave', function() {
            if (!this.matches(':focus')) {
                this.style.transform = 'scale(1)';
            }
        });
        
        // Form submission animation
        form.addEventListener('submit', function(e) {
            if (select.value.trim() === '') {
                e.preventDefault();
                // Shake animation for empty selection
                select.style.animation = 'none';
                setTimeout(() => {
                    select.style.animation = 'pulse 0.5s';
                    select.focus();
                }, 10);
                return;
            }
            
            // Change button to loading state
            submitBtn.disabled = true;
            submitBtn.innerHTML = 'LOADING<span></span>';
            submitBtn.classList.add('loading');
            
            // Simulate short delay for loading
            setTimeout(() => {
                submitBtn.innerHTML = 'PROCESSING<span></span>';
            }, 500);
        });
        
        // Add a subtle pulse animation when page loads
        setTimeout(() => {
            select.style.animation = 'pulse 2s infinite';
        }, 1000);
        
        // Remove pulse when user interacts
        select.addEventListener('focus', function() {
            this.style.animation = 'none';
        });
        
        // Animate label when select changes
        select.addEventListener('change', function() {
            if (this.value !== '') {
                this.style.borderColor = '#1cc88a';
                setTimeout(() => {
                    if (this.value !== '') {
                        this.style.borderColor = '#ccc';
                    }
                }, 1000);
            }
        });
        
        // Close database connections in JSP
        <%
            try {
                if (rs != null) rs.close();
                if (st != null) st.close();
                if (cn != null) cn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        %>
    });
</script>

</body></html>