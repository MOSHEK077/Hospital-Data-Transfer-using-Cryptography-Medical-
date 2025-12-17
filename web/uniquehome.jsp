<%-- 
    Document   : uniquehome
    Created on : 1 Dec, 2025, 12:13:49 PM
    Author     : jones
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Unique</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bitcount+Grid+Double:wght@100..900&family=Prosto+One&family=Titillium+Web:ital,wght@0,200;0,300;0,400;0,600;0,700;0,900;1,200;1,300;1,400;1,600;1,700&display=swap" rel="stylesheet">
</head>

<style>
    html, body { 
        height: 100%; 
        margin: 0; 
        opacity: 0;
        animation: pageFadeIn 0.7s ease-out forwards;
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
        animation: bgSlowZoom 30s ease-in-out infinite alternate;
    }
    
    /* Slow background zoom */
    @keyframes bgSlowZoom {
        0% { transform: scale(1); }
        100% { transform: scale(1.03); }
    }

    .row{
        place-content: center;
        animation: rowFadeIn 0.6s ease-out forwards;
        opacity: 0;
        transform: translateY(15px);
    }
    
    /* Staggered row animations */
    .row:nth-child(1) {
        animation-delay: 0.3s;
    }
    .row:nth-child(2) {
        animation-delay: 0.5s;
    }
    .row:nth-child(3) {
        animation-delay: 0.7s;
    }
    .row:nth-child(4) {
        animation-delay: 0.9s;
    }
    
    @keyframes rowFadeIn {
        from {
            opacity: 0;
            transform: translateY(15px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .col{
        color: white;
    }

    .container-fluid{
        place-content: center;
        height: 600px;
        width: 500px;
        animation: containerSlideUp 0.8s ease-out 0.2s both;
    }
    
    /* Container slide up */
    @keyframes containerSlideUp {
        from {
            opacity: 0;
            transform: translateY(20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .display-3{
        font-family: "Prosto One", sans-serif;
        font-weight: 300;
        font-style: normal;
        font-size: 50px;
        background-color: rgba(238, 238, 246, 0.262);
        animation: titleSlideDown 0.8s cubic-bezier(0.175, 0.885, 0.32, 1.275) both;
    }
    
    /* Title slide down with bounce */
    @keyframes titleSlideDown {
        from {
            opacity: 0;
            transform: translateY(-40px) scale(0.9);
        }
        to {
            opacity: 1;
            transform: translateY(0) scale(1);
        }
    }

    .btn{
        width: 100%;
        background-color: #001effdf; 
        color: white;
        transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        position: relative;
        overflow: hidden;
        border: none;
        animation: btnScaleIn 0.5s ease-out forwards;
        opacity: 0;
        transform: scale(0.95);
    }
    
    /* Staggered button scale animations */
    .row:nth-child(1) .btn {
        animation-delay: 0.4s;
    }
    .row:nth-child(2) .btn {
        animation-delay: 0.6s;
    }
    .row:nth-child(3) .btn {
        animation-delay: 0.8s;
    }
    .row:nth-child(4) .btn {
        animation-delay: 1.0s;
    }
    
    @keyframes btnScaleIn {
        from {
            opacity: 0;
            transform: scale(0.95);
        }
        to {
            opacity: 1;
            transform: scale(1);
        }
    }
    
    .btn:hover{
        background-color: rgba(0, 24, 157, 0.593);
        transform: translateY(-3px) scale(1.02);
        box-shadow: 0 8px 20px rgba(0, 30, 255, 0.25);
    }
    
    .btn:active {
        transform: translateY(-1px) scale(0.98);
        transition: transform 0.1s ease;
    }
    
    /* Button ripple effect */
    .btn::after {
        content: '';
        position: absolute;
        top: 50%;
        left: 50%;
        width: 5px;
        height: 5px;
        background: rgba(255, 255, 255, 0.3);
        opacity: 0;
        border-radius: 100%;
        transform: scale(1, 1) translate(-50%);
        transform-origin: 50% 50%;
    }
    
    .btn:focus:not(:active)::after {
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
    
    /* Button text animation on hover */
    .btn:hover span {
        display: inline-block;
        animation: textPulse 0.3s ease;
    }
    
    @keyframes textPulse {
        0%, 100% { transform: scale(1); }
        50% { transform: scale(1.05); }
    }
    
    /* Responsive adjustments */
    @media (max-width: 768px) {
        .display-3 {
            font-size: 35px;
            animation: titleSlideDownMobile 0.8s cubic-bezier(0.175, 0.885, 0.32, 1.275) both;
        }
        
        @keyframes titleSlideDownMobile {
            from {
                opacity: 0;
                transform: translateY(-20px) scale(0.95);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }
        
        .container-fluid {
            width: 90%;
            height: auto;
            padding: 20px 0;
        }
        
        .row {
            margin-bottom: 15px;
        }
    }
    
    @media (max-width: 480px) {
        .display-3 {
            font-size: 28px;
            padding: 15px;
        }
        
        .container-fluid {
            width: 95%;
        }
    }
</style>
<body>
   <p class="display-3 text-center m-4 rounded">UNIQUE ID GENERATION FOR EVERY PATIENTS</p>
    <img class="bg-img" src="./p3.webp" alt="Background image">
    <div class="bg-tint"></div>         

    <div class="container-fluid d-grid gap-2">
        <div class="row">
            <div class="col text-center"><a href="Authentication.jsp" class="btn">NEW ENTRY</a></div>
        </div>
        <div class="row">
            <div class="col text-center"><a href="Authentication2.jsp" class="btn">ID UPDATE</a></div>
        </div>
        <div class="row">
            <div class="col text-center"><a href="viewdata1.jsp" class="btn">VIEW DETAILS</a></div>
        </div>
        <div class="row">
            <div class="col text-center"><a href="dashboard.jsp" class="btn">BACK</a></div>
        </div>
    </div>
    
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Add click animation to buttons
            const buttons = document.querySelectorAll('.btn');
            
            buttons.forEach(button => {
                button.addEventListener('click', function(e) {
                    // Prevent default if href is empty or #
                    if (!this.getAttribute('href') || this.getAttribute('href') === '#') {
                        e.preventDefault();
                    }
                    
                    // Add click animation
                    this.style.transform = 'translateY(-1px) scale(0.98)';
                    
                    // Create ripple effect
                    const ripple = document.createElement('span');
                    const rect = this.getBoundingClientRect();
                    const size = Math.max(rect.width, rect.height);
                    const x = e.clientX - rect.left - size / 2;
                    const y = e.clientY - rect.top - size / 2;
                    
                    ripple.style.cssText = `
                        position: absolute;
                        border-radius: 50%;
                        background: rgba(255, 255, 255, 0.5);
                        transform: scale(0);
                        animation: buttonRipple 0.6s linear;
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
                        this.style.transform = '';
                    }, 600);
                });
                
                // Add hover sound effect (optional, silent)
                button.addEventListener('mouseenter', function() {
                    this.style.transition = 'all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275)';
                });
                
                button.addEventListener('mouseleave', function() {
                    this.style.transform = 'translateY(0) scale(1)';
                });
            });
            
            // Add CSS for ripple animation
            const style = document.createElement('style');
            style.textContent = `
                @keyframes buttonRipple {
                    to {
                        transform: scale(4);
                        opacity: 0;
                    }
                }
            `;
            document.head.appendChild(style);
            
            // Add page transition when navigating
            document.querySelectorAll('a[href]').forEach(link => {
                link.addEventListener('click', function(e) {
                    const href = this.getAttribute('href');
                    
                    // Don't apply to external links or anchors
                    if (href && !href.startsWith('#') && !href.startsWith('http')) {
                        // Only apply if not already navigating
                        if (e.metaKey || e.ctrlKey) return;
                        
                        e.preventDefault();
                        
                        // Add fade out animation
                        document.body.style.opacity = '0.7';
                        document.body.style.transition = 'opacity 0.3s ease';
                        
                        // Navigate after animation
                        setTimeout(() => {
                            window.location.href = href;
                        }, 300);
                    }
                });
            });
            
            // Add typing effect to title (optional)
            const title = document.querySelector('.display-3');
            if (title) {
                const originalText = title.textContent;
                title.textContent = '';
                
                let i = 0;
                function typeWriter() {
                    if (i < originalText.length) {
                        title.textContent += originalText.charAt(i);
                        i++;
                        setTimeout(typeWriter, 30); // Adjust typing speed
                    }
                }
                
                // Uncomment to enable typing effect
                // setTimeout(typeWriter, 500);
            }
            
            // Add pulse animation to title on hover
            title.addEventListener('mouseenter', function() {
                this.style.animation = 'titleSlideDown 0.5s ease, textPulse 2s ease-in-out infinite';
            });
            
            title.addEventListener('mouseleave', function() {
                this.style.animation = '';
            });
        });
    </script>
</body>
</html>