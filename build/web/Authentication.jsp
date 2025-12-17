<%-- 
    Document   : Authentication
    Created on : 1 Dec, 2025, 7:26:08 PM
    Author     : jones
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Authentication</title>
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
            animation: bgSubtleZoom 25s ease-in-out infinite alternate;
        }
        
        /* Subtle background zoom animation */
        @keyframes bgSubtleZoom {
            0% { transform: scale(1); }
            100% { transform: scale(1.02); }
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
            animation: loginSlideUp 0.7s ease-out 0.3s both;
        }
        
        /* Login box slide up animation */
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
                transform: translateY(-10px);
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
        
        /* Staggered animation for inputs */
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
            box-shadow: 0 1px 0 0 rgba(3, 233, 244, 0.2);
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
            transition: all 0.3s ease;
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
            transition: all 0.3s ease;
        }
        
        .btn-success:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 255, 0, 0.2);
        }
        
        .btn-danger:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 0, 0, 0.2);
        }
        
        /* Form glow effect on focus */
        .login-box:focus-within {
            box-shadow: 0 15px 30px rgba(3, 233, 244, 0.15), 0 15px 25px rgba(0,0,0,.6);
        }
        
        /* Pulsing effect for security text */
        .display-1 {
            animation: pulse 3s ease-in-out infinite, fadeInDown 0.8s ease-out 0.2s both;
        }
        
        @keyframes pulse {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.9; }
        }
        
        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        /* Responsive adjustments */
        @media (max-width: 576px) {
            .login-box {
                width: 90%;
                padding: 30px 20px;
            }
        }
    </style>
</head>

<body>
    <img class="bg-img" src="authen.jpg" alt="Background image">
    
    <div class="display-1 text-center m-4">AUTHENTICATION</div>
    
    <div class="login-box">
        <h2>SECURITY CHECKING</h2>
        <form method="post" action="admincheck">
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
                // Add ripple effect on focus
                input.addEventListener('focus', function() {
                    this.parentElement.style.transform = 'translateY(-2px)';
                    this.style.transform = 'scale(1.02)';
                });
                
                input.addEventListener('blur', function() {
                    this.parentElement.style.transform = 'translateY(0)';
                    this.style.transform = 'scale(1)';
                });
                
                // Add typing animation effect
                input.addEventListener('input', function() {
                    if (this.value.length > 0) {
                        this.style.borderBottomWidth = '2px';
                    } else {
                        this.style.borderBottomWidth = '1px';
                    }
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
                        background: rgba(255, 255, 255, 0.7);
                        transform: scale(0);
                        animation: ripple 0.6s linear;
                        width: ${size}px;
                        height: ${size}px;
                        top: ${y}px;
                        left: ${x}px;
                        pointer-events: none;
                    `;
                    
                    this.appendChild(ripple);
                    
                    // Remove ripple after animation
                    setTimeout(() => {
                        ripple.remove();
                    }, 600);
                });
            });
            
            // Add CSS for ripple animation
            const style = document.createElement('style');
            style.textContent = `
                @keyframes ripple {
                    to {
                        transform: scale(4);
                        opacity: 0;
                    }
                }
                .btn {
                    position: relative;
                    overflow: hidden;
                }
            `;
            document.head.appendChild(style);
            
            // Form submission animation
            const form = document.querySelector('form');
            form.addEventListener('submit', function(e) {
                // Only add animation if form is valid
                const inputs = this.querySelectorAll('input[required]');
                let isValid = true;
                
                inputs.forEach(input => {
                    if (!input.value.trim()) {
                        isValid = false;
                        // Add shake animation for invalid fields
                        input.style.animation = 'shake 0.5s ease-in-out';
                        setTimeout(() => {
                            input.style.animation = '';
                        }, 500);
                    }
                });
                
                if (isValid) {
                    // Add loading animation to submit button
                    const submitBtn = this.querySelector('input[type="submit"]');
                    const originalText = submitBtn.value;
                    submitBtn.value = 'AUTHENTICATING...';
                    submitBtn.style.opacity = '0.8';
                    
                    // Simulate authentication delay
                    setTimeout(() => {
                        submitBtn.value = originalText;
                        submitBtn.style.opacity = '1';
                    }, 1500);
                }
            });
            
            // Add shake animation CSS
            const shakeStyle = document.createElement('style');
            shakeStyle.textContent = `
                @keyframes shake {
                    0%, 100% { transform: translateX(0); }
                    25% { transform: translateX(-5px); }
                    75% { transform: translateX(5px); }
                }
            `;
            document.head.appendChild(shakeStyle);
        });
    </script>
</body>
</html>