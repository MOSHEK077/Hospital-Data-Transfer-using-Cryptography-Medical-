<%-- 
    Document   : Authentication2
    Created on : 4 Dec, 2025, 11:00:09 AM
    Author     : jones
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>authentication for update</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">

    <style>
        html, body { 
            height: 100%; 
            margin: 0; 
            opacity: 0;
            animation: pageFadeIn 0.8s ease-out forwards;
        }
        
        /* Page fade in */
        @keyframes pageFadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
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
            animation: bgSubtleMove 30s ease-in-out infinite alternate;
        }
        
        /* Subtle background movement */
        @keyframes bgSubtleMove {
            0% { transform: scale(1) translate(0, 0); }
            100% { transform: scale(1.02) translate(10px, 10px); }
        }

        html {
            height: 100%;
        }

        .login-box {
            position: absolute;
            top: 50%;
            left: 50%;
            width: 400px;
            padding: 40px;
            transform: translate(-50%, -50%);
            background: rgba(0,0,0,.5);
            box-sizing: border-box;
            box-shadow: 0 15px 25px rgba(0,0,0,.6);
            border-radius: 10px;
            animation: loginSlideUp 0.7s cubic-bezier(0.175, 0.885, 0.32, 1.275) 0.3s both;
        }
        
        /* Login box slide up with bounce */
        @keyframes loginSlideUp {
            from {
                opacity: 0;
                transform: translate(-50%, -40%);
            }
            to {
                opacity: 1;
                transform: translate(-50%, -50%);
            }
        }

        .login-box h2 {
            margin: 0 0 30px;
            padding: 0;
            color: #fff;
            text-align: center;
            animation: titleFadeIn 0.8s ease-out 0.5s both;
        }
        
        /* Title fade in */
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

        .login-box .user-box {
            position: relative;
            animation: inputFadeIn 0.6s ease-out forwards;
            opacity: 0;
            transform: translateY(10px);
        }
        
        /* Staggered input animations */
        .login-box .user-box:nth-child(1) {
            animation-delay: 0.6s;
        }
        .login-box .user-box:nth-child(2) {
            animation-delay: 0.7s;
        }
        
        @keyframes inputFadeIn {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .login-box .user-box input {
            width: 100%;
            padding: 10px 0;
            font-size: 16px;
            color: #fff;
            margin-bottom: 30px;
            border: none;
            border-bottom: 1px solid #fff;
            outline: none;
            background: transparent;
            transition: all 0.3s ease;
        }
        
        .login-box .user-box input:focus {
            border-bottom-color: #03e9f4;
            border-bottom-width: 2px;
            box-shadow: 0 2px 0 0 rgba(3, 233, 244, 0.2);
            transform: translateY(-2px);
        }
        
        .login-box .user-box input:valid {
            border-bottom-color: rgba(3, 233, 244, 0.5);
        }

        .login-box .user-box label {
            position: absolute;
            top:0;
            left: 0;
            padding: 10px 0;
            font-size: 16px;
            color: #fff;
            pointer-events: none;
            transition: .5s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        }

        .login-box .user-box input:focus ~ label,
        .login-box .user-box input:valid ~ label {
            top: -20px;
            left: 0;
            color: #03e9f4;
            font-size: 12px;
            transform: scale(0.95);
        }

        .login-box form a {
            position: relative;
            display: inline-block;
            padding: 10px 20px;
            color: #03e9f4;
            font-size: 16px;
            text-decoration: none;
            text-transform: uppercase;
            overflow: hidden;
            transition: .5s;
            margin-top: 40px;
            letter-spacing: 4px
        }
        
        #bttn {
            background-color: rgb(12, 84, 128);
            display: flex;
            transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            animation: buttonFadeIn 0.6s ease-out 0.9s both;
        }
        
        /* Button fade in */
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
        
        /* Button hover effects */
        .btn {
            transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            position: relative;
            overflow: hidden;
        }
        
        .btn-success:hover {
            transform: translateY(-2px) scale(1.05);
            box-shadow: 0 8px 20px rgba(0, 255, 0, 0.2);
        }
        
        .btn-danger:hover {
            transform: translateY(-2px) scale(1.05);
            box-shadow: 0 8px 20px rgba(255, 0, 0, 0.2);
        }
        
        /* Ripple effect for buttons */
        .btn:after {
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
        
        .btn:focus:not(:active):after {
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
        
        p {
            text-transform: uppercase;
            font-size: 12px;
            background-color: rgba(14, 61, 205, 0.13);
            border-radius: 5px;
            padding: 10px;
            text-align: center;
            animation: warningPulse 3s ease-in-out infinite, fadeIn 0.8s ease-out 0.8s both;
        }
        
        /* Warning text pulse animation */
        @keyframes warningPulse {
            0%, 100% { 
                background-color: rgba(14, 61, 205, 0.13); 
            }
            50% { 
                background-color: rgba(14, 61, 205, 0.25); 
            }
        }
        
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(5px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .display-1 {
            background-color: rgba(201, 165, 165, 0.022);
            border-radius: 10px;
            animation: titleSlideDown 0.8s cubic-bezier(0.175, 0.885, 0.32, 1.275) 0.2s both;
        }
        
        /* Main title slide down */
        @keyframes titleSlideDown {
            from {
                opacity: 0;
                transform: translateY(-30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        /* Form glow on focus */
        .login-box:focus-within {
            box-shadow: 0 15px 30px rgba(3, 233, 244, 0.15), 0 15px 25px rgba(0,0,0,.6);
        }
        
        /* Shake animation for invalid input */
        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            75% { transform: translateX(5px); }
        }
        
        /* Responsive adjustments */
        @media (max-width: 576px) {
            .login-box {
                width: 90%;
                padding: 30px 20px;
            }
            
            .display-1 {
                font-size: 2.5rem;
            }
            
            .col[style*="margin-left: 120px"] {
                margin-left: auto !important;
            }
            
            .container .row {
                flex-direction: column;
                gap: 10px;
            }
            
            .container .col {
                width: 100%;
            }
        }
        
        @media (max-width: 400px) {
            .login-box {
                width: 95%;
                padding: 25px 15px;
            }
            
            .display-1 {
                font-size: 2rem;
                padding: 10px;
            }
        }
    </style>
</head>
<body>
    <img class="bg-img" src="authen.jpg" alt="Background image">
    <div class="bg-tint"></div>

    <div class="display-1 text-center m-4">AUTHENTICATION</div>
    
    <div class="login-box">
        <p class="text-center">* Every Updation requires Authentication</p>
        <form method="post" action="Authentication2">
            <div class="user-box">
                <input type="text" name="t1" required="">
                <label>Username</label>
            </div>
            <div class="user-box">
                <input type="password" name="t2" required="">
                <label>Password</label>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col">
                        <input type="reset" class="btn btn-danger" value="CLEAR">
                    </div>
                    <div class="col" style="margin-left: 120px;">
                        <input type="submit" class="btn btn-success" id="bttn" value="LOGIN">
                    </div>
                </div>
            </div>
        </form>
    </div>
    
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Add focus animation to inputs
            const inputs = document.querySelectorAll('.user-box input');
            
            inputs.forEach(input => {
                // Add typing effect
                input.addEventListener('input', function() {
                    if (this.value.length > 0) {
                        this.style.borderBottomWidth = '2px';
                    } else {
                        this.style.borderBottomWidth = '1px';
                    }
                });
                
                // Add focus effect
                input.addEventListener('focus', function() {
                    this.parentElement.style.transform = 'translateY(-2px)';
                });
                
                input.addEventListener('blur', function() {
                    this.parentElement.style.transform = 'translateY(0)';
                });
                
                // Add validation animation
                input.addEventListener('invalid', function(e) {
                    e.preventDefault();
                    this.style.animation = 'shake 0.5s ease-in-out';
                    setTimeout(() => {
                        this.style.animation = '';
                    }, 500);
                });
            });
            
            // Add click animation to buttons
            const buttons = document.querySelectorAll('.btn');
            
            buttons.forEach(button => {
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
                    
                    this.style.position = 'relative';
                    this.style.overflow = 'hidden';
                    this.appendChild(ripple);
                    
                    // Remove ripple after animation
                    setTimeout(() => {
                        ripple.remove();
                    }, 600);
                    
                    // Button press animation
                    this.style.transform = 'scale(0.95)';
                    setTimeout(() => {
                        this.style.transform = '';
                    }, 150);
                });
            });
            
            // Form submission animation
            const form = document.querySelector('form');
            form.addEventListener('submit', function(e) {
                // Check form validity
                const inputs = this.querySelectorAll('input[required]');
                let isValid = true;
                
                inputs.forEach(input => {
                    if (!input.value.trim()) {
                        isValid = false;
                        // Add shake animation
                        input.style.animation = 'shake 0.5s ease-in-out';
                        setTimeout(() => {
                            input.style.animation = '';
                        }, 500);
                    }
                });
                
                if (isValid) {
                    // Add loading animation
                    const submitBtn = this.querySelector('input[type="submit"]');
                    const originalText = submitBtn.value;
                    submitBtn.value = 'AUTHENTICATING...';
                    submitBtn.style.opacity = '0.8';
                    submitBtn.disabled = true;
                    
                    // Add page transition effect
                    document.body.style.opacity = '0.8';
                    document.body.style.transition = 'opacity 0.3s ease';
                    
                    // Success animation for warning text
                    const warningText = document.querySelector('p');
                    if (warningText) {
                        warningText.style.animation = 'warningPulse 0.5s ease-in-out 3, fadeIn 0.8s ease-out 0.8s both';
                    }
                    
                    // Simulate authentication delay
                    setTimeout(() => {
                        if (submitBtn.disabled) {
                            submitBtn.value = originalText;
                            submitBtn.style.opacity = '1';
                            submitBtn.disabled = false;
                        }
                    }, 2000);
                } else {
                    e.preventDefault();
                }
            });
            
            // Clear button functionality
            const clearBtn = document.querySelector('input[type="reset"]');
            clearBtn.addEventListener('click', function() {
                // Clear animation
                inputs.forEach(input => {
                    input.style.transform = 'translateY(-5px)';
                    input.style.opacity = '0.5';
                    setTimeout(() => {
                        input.style.transform = '';
                        input.style.opacity = '1';
                    }, 300);
                });
                
                // Reset labels
                inputs.forEach(input => {
                    if (input.value) {
                        input.classList.remove('not-empty');
                    }
                });
            });
            
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
                    50% { opacity: 0.7; }
                }
            `;
            document.head.appendChild(style);
            
            // Add auto-not-empty class to inputs
            inputs.forEach(input => {
                input.addEventListener('input', function() {
                    if (this.value.trim() !== '') {
                        this.classList.add('not-empty');
                    } else {
                        this.classList.remove('not-empty');
                    }
                });
            });
        });
    </script>
</body>
</html>