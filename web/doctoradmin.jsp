<%-- 
    Document   : doctoradmin
    Created on : 9 Dec, 2025, 5:55:35 AM
    Author     : jones
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        /* Animation Keyframes */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        
        @keyframes slideInDown {
            from {
                transform: translateY(-50px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }
        
        @keyframes slideInUp {
            from {
                transform: translateY(50px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }
        
        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }
        
        @keyframes pulse {
            0% { box-shadow: 0 0 0 0 rgba(3, 233, 244, 0.4); }
            70% { box-shadow: 0 0 0 10px rgba(3, 233, 244, 0); }
            100% { box-shadow: 0 0 0 0 rgba(3, 233, 244, 0); }
        }
        
        @keyframes glow {
            0%, 100% { border-color: #fff; }
            50% { border-color: #03e9f4; }
        }
        
        @keyframes ripple {
            to {
                transform: scale(4);
                opacity: 0;
            }
        }
        
        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            10%, 30%, 50%, 70%, 90% { transform: translateX(-5px); }
            20%, 40%, 60%, 80% { transform: translateX(5px); }
        }

        html, body { 
            height: 100%; 
            margin: 0; 
            overflow-x: hidden;
        }
        
        /* ---------- LAYOUT: center everything ---------- */
        body {
            font-family: system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
            min-height: 100vh;
            color: #ffffff;
            background-color: #1b2430;
            animation: fadeIn 0.8s ease-out;

            /* center header + form vertically & horizontally */
            display: flex;
            align-items: center;
            justify-content: center;
        }

        /* container that holds the title and login-box, centered */
        .center-wrap {
            width: 100%;
            max-width: 1100px;
            padding: 20px;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            gap: 28px;
            position: relative;
        }
        /* ---------- end layout changes ---------- */

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
            animation: fadeIn 1.2s ease-out;
        }

        .display-1 {
            text-align: center;
            margin: 0; /* remove large margins so centering works nicely */
            animation: slideInDown 0.8s ease-out, float 3s ease-in-out infinite;
            position: relative;
            padding-bottom: 15px;
        }
        
        .display-1::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 200px;
            height: 3px;
            background: linear-gradient(90deg, transparent, #03e9f4, transparent);
            animation: pulse 3s infinite;
        }

        /* Remove absolute positioning from login-box so it centers within .center-wrap */
        .login-box {
            position: relative;              /* changed from absolute */
            width: 400px;
            padding: 40px;
            transform: translateY(0);        /* removed translate(-50%, -50%) */
            background: rgba(8, 40, 88, 0.7);
            box-sizing: border-box;
            box-shadow: 0 15px 25px rgba(0,0,0,.6);
            border-radius: 10px;
            animation: slideInUp 0.6s ease-out 0.3s both;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            transition: all 0.3s ease;
        }
        
        .login-box:hover {
            transform: scale(1.02);
            box-shadow: 0 25px 50px rgba(0,0,0,.8);
        }

        .login-box h2 {
            margin: 0 0 30px;
            padding: 0;
            color: #fff;
            text-align: center;
            animation: fadeIn 0.8s ease-out 0.5s both;
            position: relative;
        }
        
        .login-box h2::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 60px;
            height: 2px;
            background: #03e9f4;
            animation: pulse 2s infinite;
        }

        .login-box .user-box {
            position: relative;
            margin-bottom: 30px;
            animation: fadeIn 0.6s ease-out;
        }
        
        .login-box .user-box:nth-child(1) {
            animation-delay: 0.6s;
        }
        
        .login-box .user-box:nth-child(2) {
            animation-delay: 0.8s;
        }

        .login-box .user-box input {
            width: 100%;
            padding: 10px 0;
            font-size: 16px;
            color: #fff;
            border: none;
            border-bottom: 1px solid #fff;
            outline: none;
            background: transparent;
            transition: all 0.3s ease;
            animation: glow 3s infinite;
        }
        
        .login-box .user-box input:focus {
            border-bottom: 2px solid #03e9f4;
            animation: none;
            transform: translateY(-2px);
        }
        
        .login-box .user-box input.error {
            animation: shake 0.5s ease-in-out;
            border-bottom-color: #ff3860;
        }
        
        .login-box .user-box input.success {
            border-bottom-color: #28a745;
        }

        .login-box .user-box label {
            position: absolute;
            top: 0;
            left: 0;
            padding: 10px 0;
            font-size: 16px;
            color: #fff;
            pointer-events: none;
            transition: 0.5s cubic-bezier(0.68, -0.55, 0.27, 1.55);
            background: transparent;
            border-radius: 5px;
            padding-left: 5px;
            padding-right: 5px;
        }

        .login-box .user-box input:focus ~ label,
        .login-box .user-box input:valid ~ label {
            top: -20px;
            left: 0;
            color: #03e9f4;
            font-size: 12px;
            background: rgba(8, 40, 88, 0.9);
            padding: 2px 10px;
            border-radius: 10px;
            transform: translateY(0) scale(0.9);
        }
        
        .login-box .container {
            animation: fadeIn 0.8s ease-out 1s both;
        }

        .btn {
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            border: none;
            font-weight: 600;
            letter-spacing: 1px;
        }
        
        .btn-danger {
            background: linear-gradient(45deg, #dc3545, #c82333);
            animation: slideInUp 0.6s ease-out 0.9s both;
        }
        
        .btn-success {
            background: linear-gradient(45deg, #28a745, #218838);
            animation: slideInUp 0.6s ease-out 1.1s both;
            animation: pulse 2s infinite;
        }
        
        .btn:hover {
            transform: translateY(-3px) scale(1.05);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
        }
        
        .btn:active {
            transform: translateY(-1px);
        }
        
        .btn::after {
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
        
        .btn:focus:not(:active)::after {
            animation: ripple 1s ease-out;
        }
        
        #bttn {
            background: linear-gradient(45deg, #0c5480, #03e9f4);
            transition: all 0.3s ease;
        }
        
        #bttn:hover {
            background: linear-gradient(45deg, #03e9f4, #0c5480);
            transform: translateY(-3px) scale(1.05);
        }
        
        /* Loading animation */
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
        
        .loading::after {
            content: '';
            display: inline-block;
            width: 16px;
            height: 16px;
            border: 2px solid rgba(255, 255, 255, 0.3);
            border-radius: 50%;
            border-top-color: white;
            animation: spin 1s linear infinite;
            margin-left: 10px;
            vertical-align: middle;
        }
        
        /* Security icon animation */
        .security-icon {
            position: absolute;
            top: -40px;
            left: 50%;
            transform: translateX(-50%);
            font-size: 40px;
            color: #03e9f4;
            animation: float 4s ease-in-out infinite;
        }

        /* form buttons centered */
        .form-actions {
            display: flex;
            gap: 12px;
            justify-content: center;
            align-items: center;
            margin-top: 6px;
        }
        
        /* Responsive adjustments */
        @media (max-width: 500px) {
            .login-box {
                width: 90%;
                padding: 30px 20px;
            }
            
            .display-1 {
                font-size: 2.5rem;
            }
        }
    </style>
</head>
<body>

    <img class="bg-img" src="img4.jpg" alt="Background image">
    <div class="bg-tint"></div>

    <!-- center-wrap holds both title and form so both are perfectly centered -->
    <div class="center-wrap">
        <div class="display-1 text-center">
            <i class="fas fa-user-md me-3"></i>DOCTOR SECRET LOGIN
        </div>
        
        <div class="login-box">
            <i class="fas fa-shield-alt security-icon" aria-hidden="true"></i>
            <h2>Doctor Verification</h2>
            <form method="post" action="admincheck4" id="loginForm" autocomplete="off">
                <div class="user-box">
                    <input type="password" name="t1" id="doctorKey" required="">
                    <label for="doctorKey">Doctor Key</label>
                </div>
                <div class="user-box">
                    <input type="password" name="t2" id="password" required="">
                    <label for="password">Password</label>
                </div>
                
                <div class="form-actions container">
                    <button type="reset" class="btn btn-danger" id="clearBtn" aria-label="Clear">
                        <i class="fas fa-eraser me-2" aria-hidden="true"></i>CLEAR
                    </button>
                    <button type="submit" class="btn btn-success" id="bttn" aria-label="Login">
                        <i class="fas fa-sign-in-alt me-2" aria-hidden="true"></i>LOGIN
                    </button>
                </div>
            </form>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.getElementById('loginForm');
            const doctorKeyInput = document.getElementById('doctorKey');
            const passwordInput = document.getElementById('password');
            const clearBtn = document.getElementById('clearBtn');
            const loginBtn = document.getElementById('bttn');
            
            // Auto focus first input
            setTimeout(() => {
                doctorKeyInput.focus();
            }, 500);
            
            // Input validation animations
            const inputs = [doctorKeyInput, passwordInput];
            inputs.forEach(input => {
                input.addEventListener('input', function() {
                    this.classList.remove('error');
                    if (this.value.length > 0) {
                        this.classList.add('success');
                        setTimeout(() => {
                            this.classList.remove('success');
                        }, 1000);
                    }
                });
                
                // Add visual feedback on focus
                input.addEventListener('focus', function() {
                    this.parentElement.style.transform = 'scale(1.02)';
                });
                
                input.addEventListener('blur', function() {
                    this.parentElement.style.transform = 'scale(1)';
                });
            });
            
            // Clear button animation
            clearBtn.addEventListener('click', function(e) {
                e.preventDefault();
                
                // Add ripple effect
                const ripple = document.createElement('span');
                const rect = this.getBoundingClientRect();
                const size = Math.max(rect.width, rect.height);
                const x = e.clientX - rect.left - size/2;
                const y = e.clientY - rect.top - size/2;
                
                ripple.style.cssText = `
                    position: absolute;
                    border-radius: 50%;
                    background: rgba(255, 255, 255, 0.3);
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
                
                // Clear all inputs
                inputs.forEach(input => {
                    input.value = '';
                    input.classList.remove('success', 'error');
                    const label = input.nextElementSibling;
                    label.style.top = '0';
                    label.style.color = '#fff';
                    label.style.fontSize = '16px';
                    label.style.background = 'transparent';
                });
                
                // Shake animation for feedback
                this.classList.add('shake');
                setTimeout(() => {
                    this.classList.remove('shake');
                }, 500);
                
                // Return focus to first input
                doctorKeyInput.focus();
            });
            
            // Form submission animation
            form.addEventListener('submit', function(e) {
                const doctorKey = doctorKeyInput.value.trim();
                const password = passwordInput.value.trim();
                
                let isValid = true;
                
                // Validation
                if (!doctorKey) {
                    doctorKeyInput.classList.add('error');
                    isValid = false;
                }
                
                if (!password) {
                    passwordInput.classList.add('error');
                    isValid = false;
                }
                
                if (!isValid) {
                    e.preventDefault();
                    
                    // Shake animation for empty fields
                    inputs.forEach(input => {
                        if (!input.value.trim()) {
                            input.classList.add('shake');
                            setTimeout(() => {
                                input.classList.remove('shake');
                            }, 500);
                        }
                    });
                    
                    return;
                }
                
                // Show loading state
                loginBtn.disabled = true;
                loginBtn.innerHTML = '<i class="fas fa-spinner me-2 loading"></i>VERIFYING...';
                loginBtn.classList.remove('pulse');
                loginBtn.style.background = 'linear-gradient(45deg, #03e9f4, #0c5480)';
                
                // Add security animation
                const securityIcon = document.querySelector('.security-icon');
                if (securityIcon) {
                    securityIcon.style.animation = 'spin 1s linear infinite';
                }
                
                // Animate form submission
                setTimeout(() => {
                    form.submit();
                }, 1500);
            });
            
            // Add keypress animation for inputs
            inputs.forEach(input => {
                input.addEventListener('keypress', function(e) {
                    // Create a small visual feedback for each keypress
                    const keyFeedback = document.createElement('div');
                    keyFeedback.style.cssText = `
                        position: absolute;
                        bottom: 0;
                        left: ${Math.random() * 100}%;
                        width: 2px;
                        height: 20px;
                        background: #03e9f4;
                        animation: fadeIn 0.5s ease-out;
                        pointer-events: none;
                    `;
                    
                    this.parentElement.appendChild(keyFeedback);
                    
                    setTimeout(() => {
                        keyFeedback.remove();
                    }, 500);
                });
            });
            
            // Add password visibility toggle (optional enhancement)
            passwordInput.addEventListener('keyup', function() {
                if (this.value.length > 0 && !this.parentElement.querySelector('.toggle-password')) {
                    const toggle = document.createElement('span');
                    toggle.innerHTML = '<i class="fas fa-eye"></i>';
                    toggle.style.cssText = `
                        position: absolute;
                        right: 0;
                        top: 10px;
                        cursor: pointer;
                        color: #03e9f4;
                        transition: color 0.3s;
                    `;
                    toggle.classList.add('toggle-password');
                    
                    toggle.addEventListener('click', function() {
                        const type = passwordInput.type === 'password' ? 'text' : 'password';
                        passwordInput.type = type;
                        this.innerHTML = type === 'password' ? '<i class="fas fa-eye"></i>' : '<i class="fas fa-eye-slash"></i>';
                    });
                    
                    this.parentElement.appendChild(toggle);
                } else if (this.value.length === 0 && this.parentElement.querySelector('.toggle-password')) {
                    this.parentElement.querySelector('.toggle-password').remove();
                }
            });
        });
    </script>
</body>
</html>
