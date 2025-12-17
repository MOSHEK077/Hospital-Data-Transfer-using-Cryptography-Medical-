<%-- 
    Document   : PatientDashboard
    Created on : 6 Dec, 2025, 6:56:44 PM
    Author     : jones
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>REGISTERDASHBOARD </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bitcount+Grid+Double:wght@100..900&family=Prosto+One&family=Titillium+Web:ital,wght@0,200;0,300;0,400;0,600;0,700;0,900;1,200;1,300;1,400;1,600;1,700&display=swap" rel="stylesheet">
</head>

<style>
    html, body { 
        height: 100%; 
        margin: 0; 
        overflow-x: hidden;
    }
    
    body {
        font-family: system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        min-height: 100vh;
        color: #ffffff;
        background-color: #051428;
        opacity: 0;
        animation: fadeIn 0.8s ease-out forwards;
    }

    @keyframes fadeIn {
        from { opacity: 0; }
        to { opacity: 1; }
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
        animation: subtleZoom 30s ease-in-out infinite alternate;
    }

    @keyframes subtleZoom {
        0% { transform: scale(1); }
        100% { transform: scale(1.05); }
    }

    .row {
        place-content: center;
        transform: translateY(20px);
        opacity: 0;
        animation: slideUpFade 0.6s ease-out forwards;
    }

    /* Stagger the row animations */
    .row:nth-child(1) { animation-delay: 0.2s; }
    .row:nth-child(2) { animation-delay: 0.4s; }
    .row:nth-child(3) { animation-delay: 0.6s; }
    .row:nth-child(4) { animation-delay: 0.8s; }

    @keyframes slideUpFade {
        from {
            transform: translateY(20px);
            opacity: 0;
        }
        to {
            transform: translateY(0);
            opacity: 1;
        }
    }

    .col {
        color: white;
    }

    .container-fluid {
        place-content: center;
        height: 600px;
        width: 500px;
    }

    .display-3 {
        font-family: "Prosto One", sans-serif;
        font-weight: 300;
        font-style: normal;
        font-size: 50px;
        background-color: rgba(238, 238, 246, 0.262);
        transform: translateY(-20px);
        opacity: 0;
        animation: titleSlideDown 0.8s ease-out 0.1s forwards;
    }

    @keyframes titleSlideDown {
        from {
            transform: translateY(-20px);
            opacity: 0;
        }
        to {
            transform: translateY(0);
            opacity: 1;
        }
    }

    .btn {
        width: 100%;
        background-color: #001effdf; 
        color: white;
        border: none;
        padding: 14px 20px;
        font-size: 16px;
        border-radius: 8px;
        transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
        position: relative;
        overflow: hidden;
        transform: scale(1);
    }

    .btn:hover {
        background-color: rgba(0, 24, 157, 0.8);        
        transform: scale(1.02);
        box-shadow: 0 5px 15px rgba(0, 30, 255, 0.3);
    }

    .btn:active {
        transform: scale(0.98);
        transition: transform 0.1s;
    }

    /* Subtle pulse animation for attention */
    @keyframes subtlePulse {
        0% { box-shadow: 0 0 0 0 rgba(0, 30, 255, 0.2); }
        70% { box-shadow: 0 0 0 10px rgba(0, 30, 255, 0); }
        100% { box-shadow: 0 0 0 0 rgba(0, 30, 255, 0); }
    }

    /* Add a subtle pulse to the first button (new registration) */
    .row:nth-child(1) .btn {
        animation: subtlePulse 2s infinite 1.5s;
    }

    /* Add a smooth transition for background color changes */
    * {
        transition: background-color 0.3s ease;
    }
</style>

<body>
    <h1 class="display-3 text-center m-4 rounded">Registered Patient Details</h1>
    <img class="bg-img" src="register1.jpg" alt="Background image">
    <div class="bg-tint"></div>

    <div class="container-fluid d-grid gap-2">
        <div class="row">
            <div class="col text-center">
                <a href="uniid.jsp" class="btn">NEW REGISTRATION</a>
            </div>
        </div>
        <div class="row">
            <div class="col text-center">
                <a href="viewpatient.jsp" class="btn">VIEW REGISTERED PATIENT</a>
            </div>
        </div>
        <div class="row">
            <div class="col text-center">
                <a href="deletepatinet.jsp" class="btn">DELETE PATIENT</a>
            </div>
        </div>
        <div class="row">
            <div class="col text-center">
                <a href="dashboard.jsp" class="btn">BACK</a>
            </div>
        </div>
    </div>

    <!-- Optional: Add a simple script for interactive feedback -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Add click feedback to all buttons
            const buttons = document.querySelectorAll('.btn');
            buttons.forEach(button => {
                button.addEventListener('click', function(e) {
                    // Add a small ripple effect on click
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
                        animation: ripple-animation 0.6s linear;
                        width: ${size}px;
                        height: ${size}px;
                        top: ${y}px;
                        left: ${x}px;
                        pointer-events: none;
                    `;
                    
                    this.appendChild(ripple);
                    
                    // Remove ripple after animation completes
                    setTimeout(() => {
                        ripple.remove();
                    }, 600);
                });
            });
        });
        
        // Add the ripple animation to style
        const style = document.createElement('style');
        style.textContent = `
            @keyframes ripple-animation {
                to {
                    transform: scale(4);
                    opacity: 0;
                }
            }
        `;
        document.head.appendChild(style);
    </script>
</body>
</html>