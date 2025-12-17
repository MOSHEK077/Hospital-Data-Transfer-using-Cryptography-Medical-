<%@page import = "java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>unique</title>
<style>
    /* Reset default browser styles */
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
        opacity: 0;
        animation: pageFadeIn 0.8s ease-out forwards;
    }
    
    /* Page fade in animation */
    @keyframes pageFadeIn {
        from { opacity: 0; }
        to { opacity: 1; }
    }

    .login-container {
        background: #0215a690;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        width: 100%;
        max-width: 350px;
        animation: formSlideUp 0.7s cubic-bezier(0.175, 0.885, 0.32, 1.275) 0.3s both;
    }
    
    /* Form slide up animation */
    @keyframes formSlideUp {
        from {
            opacity: 0;
            transform: translateY(40px);
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
        animation: titleFadeIn 0.8s ease-out 0.5s both;
    }
    
    /* Title fade in animation */
    @keyframes titleFadeIn {
        from {
            opacity: 0;
            transform: translateY(-15px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    /* START: floating label styles */
    .form-group {
        position: relative;
        margin-bottom: 20px;
        animation: selectFadeIn 0.6s ease-out 0.7s both;
    }
    
    /* Select fade in animation */
    @keyframes selectFadeIn {
        from {
            opacity: 0;
            transform: translateY(10px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .form-group input, .form-group select {
        width: 100%;
        padding: 14px 10px 10px 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        outline: none;
        transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        font-size: 15px;
        background: transparent;
    }

    .form-group input:focus, .form-group select:focus {
        border-color: #fffdfda7;
        box-shadow: 0 0 0 3px rgba(78,115,223,0.08), 0 5px 15px rgba(255, 255, 255, 0.1);
        border-top: #fffdfdab;
        transform: translateY(-2px);
    }
    
    .form-group select:valid {
        border-color: rgba(255, 253, 253, 0.7);
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
        transition: transform 0.18s ease, top 0.18s ease, font-size 0.18s ease, color 0.18s ease;
        font-size: 15px;
    }

    /* When the input is focused OR has content, move the label up */
    .form-group input:focus + label,
    .form-group input:not(:placeholder-shown) + label,
    .form-group select:focus + label,
    .form-group select:valid + label {
        transform: translateY(-22px) scale(0.88);
        color: #fff8f8;
        top: 10px;
        font-size: 14px;
    }
    /* END: floating label styles */

    .login-btn {
        width: 100%;
        padding: 10px;
        background: #00040d;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
        transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        animation: buttonFadeIn 0.6s ease-out 0.9s both;
        position: relative;
        overflow: hidden;
    }
    
    /* Button fade in animation */
    @keyframes buttonFadeIn {
        from {
            opacity: 0;
            transform: translateY(10px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .login-btn:hover {
        background: #5a669992;
        transform: translateY(-2px) scale(1.02);
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
    }
    
    .login-btn:active {
        transform: translateY(0) scale(0.98);
        transition: transform 0.1s ease;
    }
    
    /* Ripple effect for button */
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
        animation: ripple 0.6s ease-out;
    }
    
    @keyframes ripple {
        0% {
            transform: scale(0, 0);
            opacity: 0.5;
        }
        20% {
            transform: scale(25, 25);
            opacity: 0.3;
        }
        100% {
            transform: scale(40, 40);
            opacity: 0;
        }
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
        filter: brightness(.5) contrast(.95);
        animation: bgZoom 25s ease-in-out infinite alternate;
    }
    
    /* Background zoom animation */
    @keyframes bgZoom {
        0% { transform: scale(1); }
        100% { transform: scale(1.03); }
    }
    
    .bg-tint {
        position: fixed;
        inset: 0;
        z-index: -1;
        pointer-events: none;
        background: rgba(2, 8, 26, 0.4);
        animation: tintPulse 15s ease-in-out infinite alternate;
    }
    
    /* Background tint pulse */
    @keyframes tintPulse {
        0% { opacity: 0.4; }
        100% { opacity: 0.5; }
    }
    
    /* Form glow on focus */
    .login-container:focus-within {
        box-shadow: 0 4px 20px rgba(255, 255, 255, 0.1), 0 4px 15px rgba(0,0,0,0.2);
    }
    
    /* Shake animation for invalid input */
    @keyframes shake {
        0%, 100% { transform: translateX(0); }
        25% { transform: translateX(-5px); }
        75% { transform: translateX(5px); }
    }
    
    /* Dropdown option hover effect */
    select option {
        background-color: rgba(0, 0, 0, 0.9);
        color: white;
        padding: 10px;
        transition: all 0.2s ease;
    }
    
    select option:hover {
        background-color: rgba(78, 115, 223, 0.8);
        transform: translateX(5px);
    }
    
    /* Dropdown arrow animation */
    select {
        appearance: none;
        background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='white'%3e%3cpath d='M7 10l5 5 5-5z'/%3e%3c/svg%3e");
        background-repeat: no-repeat;
        background-position: right 10px center;
        background-size: 20px;
        padding-right: 30px;
    }
    
    /* Success animation for selection */
    @keyframes successPulse {
        0%, 100% { box-shadow: 0 0 0 0 rgba(255, 255, 255, 0.1); }
        50% { box-shadow: 0 0 0 5px rgba(255, 255, 255, 0); }
    }
    
    /* Responsive adjustments */
    @media (max-width: 480px) {
        .login-container {
            width: 90%;
            padding: 25px 20px;
        }
        
        .login-container h2 {
            font-size: 1.5rem;
        }
    }
    
    @media (max-width: 320px) {
        .login-container {
            width: 95%;
            padding: 20px 15px;
        }
    }
</style>
</head>
<body>
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
    try{
        cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical_secret_data","root","Jon$jon12");
        st = cn.createStatement();
    } catch(SQLException e) {
        e.printStackTrace();
    }
%>

<img class="bg-img" src="image23.jpg" alt="Background image">
<div class="bg-tint"></div>

<div class="login-container">
    <h2>ENTER ID</h2>
    <form method="get" action="patient2">
        <div class="form-group">
            <center>  
                <select id='username' name='e1' required style='background-color:rgba(0, 0, 0, 0.832); color:white; border-top: none; width: 100%; height:30px; border-radius: 5px;'>
                    <option value='' disabled selected>--SELECT OPTION BELOW--</option>
                    <% 
                        String sql = "select * from patient_details";
                        rs = st.executeQuery(sql);
                        
                        while(rs.next()) { 
                    %>
                    <option value="<%= rs.getString("unique_id") %>"><%= rs.getString("unique_id") %></option>
                    <% } %>
                </select>
            </center>      
        </div>

        <button type="submit" class="login-btn">ENTER</button>
    </form>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Add focus animation to select
        const select = document.getElementById('username');
        const form = document.querySelector('form');
        
        if (select) {
            // Add change effect
            select.addEventListener('change', function() {
                if (this.value !== '') {
                    this.style.borderColor = 'rgba(255, 253, 253, 0.8)';
                    this.style.animation = 'successPulse 2s ease-in-out';
                    setTimeout(() => {
                        this.style.animation = '';
                    }, 2000);
                } else {
                    this.style.borderColor = '#ccc';
                }
            });
            
            // Add focus effect
            select.addEventListener('focus', function() {
                this.parentElement.style.transform = 'translateY(-2px)';
                this.style.transform = 'translateY(-2px) scale(1.02)';
            });
            
            select.addEventListener('blur', function() {
                this.parentElement.style.transform = 'translateY(0)';
                this.style.transform = '';
            });
            
            // Add validation animation
            select.addEventListener('invalid', function(e) {
                e.preventDefault();
                this.style.animation = 'shake 0.5s ease-in-out';
                setTimeout(() => {
                    this.style.animation = '';
                }, 500);
            });
            
            // Add hover effect to options (simulated with CSS only)
            const options = select.querySelectorAll('option');
            options.forEach(option => {
                option.addEventListener('mouseenter', function() {
                    this.style.backgroundColor = 'rgba(78, 115, 223, 0.8)';
                });
                option.addEventListener('mouseleave', function() {
                    this.style.backgroundColor = 'rgba(0, 0, 0, 0.9)';
                });
            });
        }
        
        // Add click animation to button
        const button = document.querySelector('.login-btn');
        
        if (button) {
            button.addEventListener('click', function(e) {
                // Create ripple effect
                const ripple = document.createElement('span');
                const rect = this.getBoundingClientRect();
                const size = Math.max(rect.width, rect.height);
                const x = e.clientX - rect.left - size / 2;
                const y = e.clientY - rect.top - size / 2;
                
                ripple.style.cssText = `
                    position: absolute;
                    border-radius: 50%;
                    background: rgba(255, 255, 255, 0.6);
                    transform: scale(0);
                    animation: rippleEffect 0.6s linear;
                    width: ${size}px;
                    height: ${size}px;
                    top: ${y}px;
                    left: ${x}px;
                    pointer-events: none;
                    z-index: 1;
                `;
                
                this.appendChild(ripple);
                
                // Remove ripple after animation
                setTimeout(() => {
                    ripple.remove();
                }, 600);
                
                // Button press animation
                this.style.transform = 'translateY(0) scale(0.95)';
                setTimeout(() => {
                    this.style.transform = '';
                }, 150);
            });
        }
        
        // Form submission animation
        if (form) {
            form.addEventListener('submit', function(e) {
                const select = this.querySelector('select[required]');
                
                if (select && !select.value) {
                    e.preventDefault();
                    select.style.animation = 'shake 0.5s ease-in-out';
                    setTimeout(() => {
                        select.style.animation = '';
                    }, 500);
                } else {
                    // Add loading animation
                    const submitBtn = this.querySelector('.login-btn');
                    const originalText = submitBtn.textContent;
                    submitBtn.textContent = 'FETCHING...';
                    submitBtn.style.opacity = '0.8';
                    submitBtn.disabled = true;
                    
                    // Add page transition effect
                    document.body.style.opacity = '0.8';
                    document.body.style.transition = 'opacity 0.3s ease';
                    
                    // Simulate fetching delay
                    setTimeout(() => {
                        if (submitBtn.disabled) {
                            submitBtn.textContent = originalText;
                            submitBtn.style.opacity = '1';
                            submitBtn.disabled = false;
                        }
                    }, 1500);
                }
            });
        }
        
        // Add auto-open dropdown on page load (for better UX)
        setTimeout(() => {
            if (select) {
                // Highlight the first option
                select.focus();
                select.style.transform = 'translateY(-2px) scale(1.02)';
                setTimeout(() => {
                    select.style.transform = '';
                }, 500);
            }
        }, 1000);
        
        // Add CSS for ripple animation
        const style = document.createElement('style');
        style.textContent = `
            @keyframes rippleEffect {
                to {
                    transform: scale(4);
                    opacity: 0;
                }
            }
            
            @keyframes textPulse {
                0%, 100% { opacity: 1; }
                50% { opacity: 0.8; }
            }
            
            /* Dropdown open animation */
            @keyframes dropdownOpen {
                from {
                    opacity: 0;
                    transform: translateY(-10px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }
            
            /* Animate dropdown when it opens */
            select:focus {
                animation: dropdownOpen 0.3s ease-out;
            }
        `;
        document.head.appendChild(style);
        
        // Add keyboard navigation for dropdown
        if (select) {
            select.addEventListener('keydown', function(e) {
                if (e.key === 'ArrowDown' || e.key === 'ArrowUp') {
                    this.style.transform = 'scale(1.02)';
                    setTimeout(() => {
                        this.style.transform = '';
                    }, 200);
                }
                
                if (e.key === 'Enter' && this.value) {
                    // Trigger form submission
                    form.dispatchEvent(new Event('submit'));
                }
            });
        }
        
        // Add dynamic option counting
        if (select) {
            const optionCount = select.querySelectorAll('option').length - 1; // exclude the first option
            console.log(`Loaded ${optionCount} patient IDs`);
            
            // Optional: Add a subtle indicator of option count
            const title = document.querySelector('h2');
            if (title && optionCount > 0) {
                title.insertAdjacentHTML('afterend', `<p style="text-align: center; font-size: 12px; opacity: 0.7; animation: fadeIn 0.8s ease-out 1s both;">${optionCount} patient IDs available</p>`);
            }
        }
    });
</script>
</body>
</html>