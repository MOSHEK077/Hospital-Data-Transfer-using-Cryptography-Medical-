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

    /* Animations */
    @keyframes fadeIn {
        from { opacity: 0; }
        to { opacity: 1; }
    }
    
    @keyframes slideUp {
        from { transform: translateY(30px); opacity: 0; }
        to { transform: translateY(0); opacity: 1; }
    }
    
    @keyframes float {
        0%, 100% { transform: translateY(0); }
        50% { transform: translateY(-5px); }
    }
    
    @keyframes pulse {
        0% { box-shadow: 0 0 0 0 rgba(0, 168, 255, 0.4); }
        70% { box-shadow: 0 0 0 10px rgba(0, 168, 255, 0); }
        100% { box-shadow: 0 0 0 0 rgba(0, 168, 255, 0); }
    }
    
    @keyframes bounceIn {
        0% { transform: scale(0.9); opacity: 0; }
        60% { transform: scale(1.05); opacity: 1; }
        100% { transform: scale(1); opacity: 1; }
    }
    
    @keyframes borderGlow {
        0%, 100% { border-color: #ccc; }
        50% { border-color: #4e73df; }
    }

    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(135deg, #4e73df, #1cc88a);
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        animation: fadeIn 0.8s ease-out;
        overflow: hidden;
    }

    .login-container {
        background: #2178e192;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        width: 100%;
        max-width: 450px;
        animation: slideUp 0.6s ease-out 0.3s both;
        backdrop-filter: blur(5px);
        border: 1px solid rgba(255, 255, 255, 0.1);
    }

    .login-container h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #fff8f8;
        animation: float 3s ease-in-out infinite, fadeIn 0.8s ease-out;
        position: relative;
        padding-bottom: 10px;
    }
    
    .login-container h2::after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 50%;
        transform: translateX(-50%);
        width: 60px;
        height: 2px;
        background: linear-gradient(90deg, transparent, #fff8f8, transparent);
        animation: borderGlow 2s infinite;
    }

    .form-group {
        position: relative;
        margin-bottom: 20px;
        text-align: center;
        animation: slideUp 0.6s ease-out 0.5s both;
    }

    .form-group input {
        width: 100%;
        padding: 14px 10px 10px 10px; 
        border: 1px solid #ccc;
        border-radius: 5px;
        outline: none;
        transition: all 0.3s ease;
        font-size: 15px;
        background: transparent;
        animation: borderGlow 3s infinite;
    }

    .form-group input:focus {
        border-color: #fffdfda7;
        box-shadow: 0 0 0 3px rgba(78,115,223,0.08), 0 5px 15px rgba(0,0,0,0.1);
        border-top: #fffdfdab;
        transform: translateY(-2px);
    }

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

    .form-group input:focus + label,
    .form-group input:not(:placeholder-shown) + label {
        transform: translateY(-22px) scale(0.88);
        color: #fff8f8;
        top: 10px;
        font-size: 14px;
        background: rgba(33, 120, 225, 0.9);
        padding: 2px 10px;
        border-radius: 4px;
        border: 1px solid rgba(255, 255, 255, 0.2);
    }

    .form-group select {
        width: 80%;
        max-width: 260px;
        display: inline-block;
        margin: 0 auto;
        padding: 14px 10px 10px 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        outline: none;
        transition: all 0.3s ease;
        font-size: 15px;
        background: rgba(0, 0, 0, 0.832);
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance: none;
        color: white;
        cursor: pointer;
        animation: borderGlow 3s infinite, bounceIn 0.6s ease-out 0.7s both;
    }
    
    .form-group select:hover {
        border-color: #4e73df;
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(0,0,0,0.2);
    }
    
    .form-group select:focus {
        border-color: #fffdfda7;
        box-shadow: 0 0 0 3px rgba(78,115,223,0.08);
        transform: translateY(-2px) scale(1.02);
    }

    .form-group label {
        left: 50%;
        transform: translateX(-50%);
        transform-origin: center top;
    }

    .form-group select:focus + label,
    .form-group select:valid + label {
        transform: translate(-50%, -22px) scale(0.88);
        top: 10px;
        font-size: 14px;
        color: #fff8f8;
        background: rgba(33, 120, 225, 0.9);
        padding: 2px 10px;
        border-radius: 4px;
        border: 1px solid rgba(255, 255, 255, 0.2);
    }

    .login-btn {
        width: 100%;
        padding: 10px;
        background: #00040d;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
        transition: all 0.3s ease;
        animation: pulse 2s infinite, slideUp 0.6s ease-out 0.9s both;
        position: relative;
        overflow: hidden;
    }

    .login-btn:hover {
        background: #5a669992;
        transform: translateY(-3px);
        box-shadow: 0 10px 20px rgba(0,0,0,0.2);
    }
    
    .login-btn:active {
        transform: translateY(-1px);
    }
    
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
            transform: scale(30, 30);
            opacity: 0;
        }
    }

    .extra-links {
        text-align: center;
        margin-top: 15px;
        animation: fadeIn 1s ease-out 1.1s both;
    }

    .extra-links a {
        color: #4e73df;
        text-decoration: none;
        font-size: 14px;
        transition: color 0.3s ease;
    }

    .extra-links a:hover {
        text-decoration: underline;
        color: #fff8f8;
    }
    
    body {
        font-family: system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
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
        filter: brightness(0.5) contrast(1.1);
        animation: fadeIn 1.2s ease-out;
    }
    
    /* Loading animation for options */
    @keyframes loading {
        0% { transform: rotate(0deg); }
        100% { transform: rotate(360deg); }
    }
    
    .loading::after {
        content: '';
        display: inline-block;
        width: 20px;
        height: 20px;
        border: 2px solid rgba(255, 255, 255, 0.3);
        border-radius: 50%;
        border-top-color: white;
        animation: loading 1s linear infinite;
        margin-left: 10px;
        vertical-align: middle;
    }
    
    /* Shake animation for empty selection */
    @keyframes shake {
        0%, 100% { transform: translateX(0); }
        10%, 30%, 50%, 70%, 90% { transform: translateX(-5px); }
        20%, 40%, 60%, 80% { transform: translateX(5px); }
    }
    
    .shake {
        animation: shake 0.5s ease-in-out;
    }
    
    /* Success animation */
    @keyframes success {
        0% { background-color: #00040d; }
        50% { background-color: #28a745; }
        100% { background-color: #00040d; }
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
    Connection cn = null;
    Statement st = null;
    ResultSet rs = null;
    try {
        cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical_secret_data","root","Jon$jon12");
        st = cn.createStatement();
    } catch(SQLException e) {
        e.printStackTrace();
    }
%>
    
<img class='bg-img' src='image7.jpg' alt='Background image'>
<div class='bg-tint'></div>
<div class='login-container'>
    <h2>SELECT PAYMENT ID</h2>
    <form method='get' action='payment' id='paymentForm'>
        <div class='form-group'>
            <select id='username' name='e1' required style='background-color: rgba(0, 0, 0, 0.832); color: white; border-top: none;'>
                <option value='' disabled selected>--SELECT OPTION BELOW--</option>
                <% 
                    String sql = "select * from patient_visits";
                    rs = st.executeQuery(sql);
                    while(rs.next()) { 
                %>
                <option><%= rs.getString("PayID") %></option>
                <% } %>
            </select>
            <label for='username'>PAYMENT ID</label>
        </div>
        <button type='submit' class='login-btn' id='submitBtn'>PROCEED TO PAYMENT</button>
    </form>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const form = document.getElementById('paymentForm');
        const select = document.getElementById('username');
        const submitBtn = document.getElementById('submitBtn');
        
        // Auto-focus select element
        setTimeout(() => {
            select.focus();
        }, 500);
        
        // Add hover effect to options
        select.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-2px) scale(1.02)';
        });
        
        select.addEventListener('mouseleave', function() {
            if (!this.matches(':focus')) {
                this.style.transform = 'translateY(0) scale(1)';
            }
        });
        
        // Form validation and submission animation
        form.addEventListener('submit', function(e) {
            if (select.value === '') {
                e.preventDefault();
                select.classList.add('shake');
                setTimeout(() => {
                    select.classList.remove('shake');
                }, 500);
                select.focus();
                return;
            }
            
            // Show loading state
            submitBtn.disabled = true;
            submitBtn.innerHTML = 'PROCESSING <span class="loading"></span>';
            submitBtn.style.animation = 'success 0.5s ease-in-out';
            
            // Allow form to submit after animation
            setTimeout(() => {
                form.submit();
            }, 800);
        });
        
        // Animate options on change
        select.addEventListener('change', function() {
            if (this.value !== '') {
                this.style.borderColor = '#1cc88a';
                this.style.boxShadow = '0 0 10px rgba(28, 200, 138, 0.5)';
                setTimeout(() => {
                    this.style.borderColor = '#ccc';
                    this.style.boxShadow = '';
                }, 1000);
            }
        });
        
        // Close database connections
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
</body>
</html>