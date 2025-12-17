<%-- 
    Document   : uniqueidenter
    Created on : 4 Dec, 2025, 1:51:32 PM
    Author     : jones
--%>

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
    
    /* Page fade in */
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
    
    /* Form slide up with bounce */
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

    /* START: floating label styles */
    .form-group {
        position: relative;
        margin-bottom: 20px;
        animation: inputFadeIn 0.6s ease-out 0.7s both;
    }
    
    /* Input fade in */
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

    .form-group input {
        width: 100%;
        padding: 14px 10px 10px 10px; /* extra top padding to make room for label */
        border: 1px solid #ccc;
        border-radius: 5px;
        outline: none;
        transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        font-size: 15px;
        background: transparent;
    }

    .form-group input:focus {
        border-color:  #fffdfda7;
        box-shadow: 0 0 0 3px rgba(78,115,223,0.08), 0 5px 15px rgba(255, 255, 255, 0.1);
        border-top: #fffdfdab;
        transform: translateY(-2px);
    }
    
    .form-group input:valid {
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
    .form-group input:not(:placeholder-shown) + label {
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
    
    /* Success animation for valid input */
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
<img class="bg-img" src="image23.jpg" alt="Background image">
<div class="bg-tint"></div>

<div class="login-container">
    <h2>ENTER ID</h2>
    <form method="get" action="paitentdatas">
        <div class="form-group">
            <!-- placeholder must be present (use a single space) so :placeholder-shown works -->
            <input type="text" id="username" name="t1" placeholder=" " required>
            <label for="username">UNIQUE ID</label>
        </div>

        <button type="submit" class="login-btn">ENTER</button>
    </form>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Add focus animation to input
        const input = document.getElementById('username');
        const form = document.querySelector('form');
        
        if (input) {
            // Add typing effect
            input.addEventListener('input', function() {
                if (this.value.length > 0) {
                    this.style.borderColor = 'rgba(255, 253, 253, 0.8)';
                    this.style.animation = 'successPulse 2s ease-in-out infinite';
                } else {
                    this.style.borderColor = '#ccc';
                    this.style.animation = '';
                }
            });
            
            // Add focus effect
            input.addEventListener('focus', function() {
                this.parentElement.style.transform = 'translateY(-2px)';
                this.style.transform = 'translateY(-2px) scale(1.02)';
            });
            
            input.addEventListener('blur', function() {
                this.parentElement.style.transform = 'translateY(0)';
                this.style.transform = '';
            });
            
            // Add validation animation
            input.addEventListener('invalid', function(e) {
                e.preventDefault();
                this.style.animation = 'shake 0.5s ease-in-out';
                setTimeout(() => {
                    this.style.animation = '';
                }, 500);
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
                const input = this.querySelector('input[required]');
                
                if (input && !input.value.trim()) {
                    e.preventDefault();
                    input.style.animation = 'shake 0.5s ease-in-out';
                    setTimeout(() => {
                        input.style.animation = '';
                    }, 500);
                } else {
                    // Add loading animation
                    const submitBtn = this.querySelector('.login-btn');
                    const originalText = submitBtn.textContent;
                    submitBtn.textContent = 'PROCESSING...';
                    submitBtn.style.opacity = '0.8';
                    submitBtn.disabled = true;
                    
                    // Add page transition effect
                    document.body.style.opacity = '0.8';
                    document.body.style.transition = 'opacity 0.3s ease';
                    
                    // Simulate processing delay
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
        
        // Add auto-focus to input on page load
        setTimeout(() => {
            if (input) {
                input.focus();
                input.style.transform = 'translateY(-2px) scale(1.02)';
                setTimeout(() => {
                    input.style.transform = '';
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
        `;
        document.head.appendChild(style);
        
        // Add input validation feedback
        if (input) {
            input.addEventListener('keypress', function(e) {
                // Only allow numbers for ID input
                if (!/[0-9]/.test(e.key) && e.key !== 'Backspace' && e.key !== 'Delete' && e.key !== 'Tab') {
                    e.preventDefault();
                    this.style.animation = 'shake 0.3s ease-in-out';
                    setTimeout(() => {
                        this.style.animation = '';
                    }, 300);
                }
            });
        }
    });
</script>
</body>
</html>