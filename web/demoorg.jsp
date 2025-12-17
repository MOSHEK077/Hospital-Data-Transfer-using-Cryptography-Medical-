<%-- 
    Document   : Newentry
    Created on : 2 Dec, 2025, 1:31:49 PM
    Author     : jones
--%>

<%@ page import="java.util.*,java.security.SecureRandom" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NewEntry</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

    <style>
        body {
            font-family: system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial;
            -webkit-font-smoothing:antialiased;
            -moz-osx-font-smoothing:grayscale;
            min-height: 100vh;
            color: #ffffff;
            background-color: #051428;
            opacity: 0;
            animation: pageFadeIn 0.8s ease-out forwards;
        }
        
        /* Page fade in */
        @keyframes pageFadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

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
            100% { transform: scale(1.02); }
        }

        .get-in-touch {
            max-width: 800px;
            margin: 50px auto;
            position: relative;
            animation: formSlideUp 0.7s ease-out 0.3s both;
        }
        
        /* Form slide up animation */
        @keyframes formSlideUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .get-in-touch .title {
            text-align: center;
            text-transform: uppercase;
            letter-spacing: 3px;
            font-size: 3.2em;
            line-height: 48px;
            padding-bottom: 48px;
            color: #ffffff;
            background: #ffffff7d;
            background-color: rgb(255, 255, 255);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            animation: titleBounce 0.8s cubic-bezier(0.175, 0.885, 0.32, 1.275) 0.5s both;
        }
        
        /* Title bounce animation */
        @keyframes titleBounce {
            from {
                opacity: 0;
                transform: translateY(-40px) scale(0.9);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        .contact-form .form-field {
            position: relative;
            margin: 32px 0;
            animation: fieldFadeIn 0.6s ease-out forwards;
            opacity: 0;
            transform: translateY(10px);
        }
        
        /* Staggered form field animations */
        .contact-form .form-field:nth-child(1) { animation-delay: 0.6s; }
        .contact-form .form-field:nth-child(2) { animation-delay: 0.65s; }
        .contact-form .form-field:nth-child(3) { animation-delay: 0.7s; }
        .contact-form .form-field:nth-child(4) { animation-delay: 0.75s; }
        .contact-form .form-field:nth-child(5) { animation-delay: 0.8s; }
        .contact-form .form-field:nth-child(6) { animation-delay: 0.85s; }
        .contact-form .form-field:nth-child(7) { animation-delay: 0.9s; }
        .contact-form .form-field:nth-child(8) { animation-delay: 0.95s; }
        .contact-form .form-field:nth-child(9) { animation-delay: 1.0s; }
        .contact-form .form-field:nth-child(10) { animation-delay: 1.05s; }
        .contact-form .form-field:nth-child(11) { animation-delay: 1.1s; }
        .contact-form .form-field:nth-child(12) { animation-delay: 1.15s; }
        .contact-form .form-field:nth-child(13) { animation-delay: 1.2s; }
        .contact-form .form-field:nth-child(14) { animation-delay: 1.25s; }
        .contact-form .form-field:nth-child(15) { animation-delay: 1.3s; }
        .contact-form .form-field:nth-child(16) { animation-delay: 1.35s; }
        .contact-form .form-field:nth-child(17) { animation-delay: 1.4s; }
        .contact-form .form-field:nth-child(18) { animation-delay: 1.45s; }
        .contact-form .form-field:nth-child(19) { animation-delay: 1.5s; }
        .contact-form .form-field:nth-child(20) { animation-delay: 1.55s; }
        .contact-form .form-field:nth-child(21) { animation-delay: 1.6s; }
        .contact-form .form-field:nth-child(22) { animation-delay: 1.65s; }
        
        @keyframes fieldFadeIn {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .contact-form .input-text {
            display: block;
            width: 100%;
            height: 36px;
            border-width: 0 0 2px 0;
            border-color: #ffffff;
            font-size: 18px;
            line-height: 26px;
            color: white;
            font-weight: 400;
            background-color: #10325f53;
            border-right: 4px solid rgb(255, 255, 255);
            border-radius: 5px;
            transition: all 0.3s ease;
        }
        
        .contact-form .input-text:focus {
            outline: none;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 255, 255, 0.1);
            border-color: #94e10fe9;
            border-right-color: #94e10fe9;
        }
        
        .contact-form .input-text:focus + .label,
        .contact-form .input-text.not-empty + .label {
            -webkit-transform: translateY(-24px);
            transform: translateY(-24px);
            color: #94e10fe9;
        }
        
        .contact-form .label {
            position: absolute;
            left: 20px;
            bottom: 11px;
            font-size: 18px;
            line-height: 26px;
            font-weight: 400;
            color: #ffffff;
            cursor: text;
            transition: transform 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275), color 0.3s ease;
        }
        
        /* Special animation for the unique ID field */
        #id {
            margin-bottom: -40px;
            background-color: rgba(20, 120, 210, 0.2);
            animation: idPulse 2s ease-in-out infinite;
        }
        
        @keyframes idPulse {
            0%, 100% { 
                box-shadow: 0 0 0 0 rgba(148, 225, 15, 0.7); 
            }
            50% { 
                box-shadow: 0 0 0 5px rgba(148, 225, 15, 0); 
            }
        }
        
        .contact-form .submit-btn {
            display: inline-block;
            background-color: #94e10fe9;
            color: #fff;
            text-transform: uppercase;
            letter-spacing: 2px;
            font-size: 16px;
            padding: 8px 16px;
            border: none;
            width: 200px;
            cursor: pointer;
            transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            animation: buttonSlideIn 0.6s ease-out 1.7s both;
        }
        
        @keyframes buttonSlideIn {
            from {
                opacity: 0;
                transform: translateX(20px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }
        
        .button-group {
            gap: 15px;
        }
        
        .btn-clear {
            background-color: #a85e0f;
            color: #fff;
            border: none;
            padding: 8px 16px;
            text-transform: uppercase;
            letter-spacing: 2px;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            animation: buttonSlideInLeft 0.6s ease-out 1.7s both;
        }
        
        @keyframes buttonSlideInLeft {
            from {
                opacity: 0;
                transform: translateX(-20px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }
        
        .btn-clear:hover {
            background-color: hsl(0, 21%, 68%);
            transform: translateY(-2px) scale(1.05);
            box-shadow: 0 5px 15px rgba(168, 94, 15, 0.3);
        }
        
        .l2 {
            margin-left: -20px;
            margin-bottom: 30px;
        }
        
        .btn:hover {
            background-color: rgba(84, 114, 189, 0.559);
        }
        
        .submit-btn:hover {
            background-color: rgba(84, 114, 189, 0.559);
            transform: translateY(-2px) scale(1.05);
            box-shadow: 0 8px 20px rgba(148, 225, 15, 0.3);
        }
        
        /* Ripple effect for buttons */
        .btn-clear, .submit-btn {
            position: relative;
            overflow: hidden;
        }
        
        .btn-clear:after, .submit-btn:after {
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
        
        .btn-clear:focus:not(:active):after,
        .submit-btn:focus:not(:active):after {
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
        
        /* Form validation animations */
        .contact-form .input-text:invalid {
            animation: shake 0.5s cubic-bezier(.36,.07,.19,.97) both;
        }
        
        @keyframes shake {
            10%, 90% { transform: translateX(-1px); }
            20%, 80% { transform: translateX(2px); }
            30%, 50%, 70% { transform: translateX(-2px); }
            40%, 60% { transform: translateX(2px); }
        }
        
        /* Success animation for successful submission */
        @keyframes successPulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }
        
        /* Responsive adjustments */
        @media (max-width: 768px) {
            .get-in-touch {
                margin: 20px auto;
                padding: 0 15px;
            }
            
            .get-in-touch .title {
                font-size: 2.2em;
                line-height: 36px;
                padding-bottom: 36px;
            }
            
            .contact-form .form-field {
                margin: 24px 0;
            }
            
            .button-group {
                flex-direction: column;
                align-items: stretch;
            }
            
            .btn-clear, .submit-btn {
                width: 100%;
                margin-bottom: 10px;
            }
        }
        
        @media (max-width: 480px) {
            .get-in-touch .title {
                font-size: 1.8em;
                letter-spacing: 2px;
            }
        }
    </style>
</head>
<body>
<%
    // 12-digit unique ID generator (NO REPEAT inside server session)
    final long MIN = 100_000_000_000L;
    final long RANGE = 900_000_000_000L;

    SecureRandom rnd = (SecureRandom) application.getAttribute("secureRandom");
    if (rnd == null) {
        rnd = new SecureRandom();
        application.setAttribute("secureRandom", rnd);
    }

    @SuppressWarnings("unchecked")
    Set<String> generated = (Set<String>) application.getAttribute("generatedNumbers");
    if (generated == null) {
        generated = Collections.synchronizedSet(new HashSet<String>());
        application.setAttribute("generatedNumbers", generated);
    }

    String unique12 = null;
    int tries = 0;

    synchronized (generated) {
        while (tries < 1000) {
            long positive = rnd.nextLong() & Long.MAX_VALUE;
            long num = (positive % RANGE) + MIN;
            String s = Long.toString(num);
            if (!generated.contains(s)) {
                generated.add(s);
                unique12 = s;
                break;
            }
            tries++;
        }
    }
%>

<img class="bg-img" src="./p3.webp" alt="Background image">
<div class="bg-tint"></div>

<section class="get-in-touch">
    <h1 class="title" id="tit">NEW ENTRY</h1>
    <form class="contact-form row" method="post" action="newentry" >
        <div class="form-field col-lg-6">
            <input id="id" class="input-text js-input" name="t1" value="<%=unique12%>" type="text" readonly>
            <label class="label" for="name">UNIQUE-ID-NUMBER</label>
        </div>
        <div class="form-field col-lg-6 ">
            <input id="name" class="input-text js-input" name="t2" type="text" required>
            <label class="label" for="name">Name of the Person</label>
        </div>
        <div class="form-field col-lg-6 ">
            <input id="fname" class="input-text js-input" name="t3" type="text" required>
            <label class="label" for="fname">Father/Husband Name</label>
        </div>
        <div class="form-field col-lg-6 ">
            <input id="mstatus" class="input-text js-input" name="t4" type="text" required>
            <label class="label" for="mstatus">Marital Status</label>
        </div>
        
        <div class="form-field col-lg-6 ">
            <input id="address" class="input-text js-input" name="t5" type="text" required>
            <label class="label" for="address">Address for Communication</label>
        </div>
        <div class="form-field col-lg-6 ">
            <input id="field" class="input-text js-input" name="t6" type="text" required>
            <label class="label" for="field">Field 1</label>
        </div>
        
        <div class="form-field col-lg-6 ">
            <input id="field" class="input-text js-input" name="t7" type="text" required>
            <label class="label" for="field">Field 2</label>
        </div>
        
        <div class="form-field col-lg-6 ">
            <input id="field" class="input-text js-input" name="t8" type="text" required>
            <label class="label" for="field">Field 3</label>
        </div>
        <div class="form-field col-lg-6 ">
            <input id="age" class="input-text js-input" name="t9" type="number" required>
            <label class="label" for="age">Age</label>
        </div>
        
        <div class="form-field col-lg-6 ">
            <input id="date" class="input-text js-input" name="t10" type="text" required>
            <label class="label" for="date">Date Of Birth</label>
        </div>
        
        <div class="form-field col-lg-6 ">
            <input id="Gender" class="input-text js-input" name="t11" type="text" required>
            <label class="label" for="Gender">Gender</label>
        </div>

        <div class="form-field col-lg-6 ">
            <input id="email" class="input-text js-input" name="t12" type="email" required>
            <label class="label" for="email">Mail-Id</label>
        </div>
        <div class="form-field col-lg-6 ">
            <input id="state" class="input-text js-input" name="t13" type="text" required>
            <label class="label" for="state">State</label>
        </div>
        <div class="form-field col-lg-6 ">
            <input id="nationality" class="input-text js-input" name="t14" type="text" required>
            <label class="label" for="nationality">Nationality</label>
        </div>
        <div class="form-field col-lg-6 ">
            <input id="Contact" class="input-text js-input" name="t15" type="text" required>
            <label class="label" for="Contact">Contact No.</label>
        </div>
        <div class="form-field col-lg-6 ">
            <input id="alternative" class="input-text js-input" name="t16" type="text" required>
            <label class="label" for="alternative">Alternative Contact No.</label>
        </div>
        <div class="form-field col-lg-6 ">
            <input id="i1" class="input-text js-input" type="text" name="t17" required>
            <label class="label" for="i1">Identification Mark - 1</label>
        </div>
        <div class="form-field col-lg-6 ">
            <input id="i2" class="input-text js-input" type="text" name="t18" required>
            <label class="label" for="i2">Identification Mark - 2</label>
        </div>
        <div class="form-field col-lg-6 ">
            <input id="i3" class="input-text js-input" type="text" name="t19" required>
            <label class="label" for="i3">Identification Mark - 3</label>
        </div>
        <div class="form-field col-lg-6 ">
            <input id="i4" class="input-text js-input" type="text" name="t20" required>
            <label class="label" for="i4">Identification Mark - 4</label>
        </div>
        <div class="form-field col-lg-6 ">
            <input id="Pincode" class="input-text js-input" type="text" name="t21" required>
            <label class="label" for="Pincode">Pincode</label>
        </div>

        <div class="d-flex justify-content-between align-items-center col-lg-12 mt-4">
            <!-- PhotoCopy Upload -->
            <div class="form-field w-50 mr-3">
                <input id="photo" name="t22" class="input-text js-input" type="text" required>
                <label class="label l2" for="photo">Upload Photo Copy</label>
            </div>

            <!-- Buttons -->
            <div class="button-group d-flex">
                <button type="reset" class="btn btn-clear">Clear</button>
                <button type="submit" class="submit-btn rounded">Submit</button>
            </div>
        </div>
    </form>
</section>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Auto-add not-empty class to fields with content
        const inputs = document.querySelectorAll('.input-text');
        
        inputs.forEach(input => {
            // Check on load
            if (input.value.trim() !== '') {
                input.classList.add('not-empty');
            }
            
            // Check on input
            input.addEventListener('input', function() {
                if (this.value.trim() !== '') {
                    this.classList.add('not-empty');
                } else {
                    this.classList.remove('not-empty');
                }
            });
            
            // Add focus animation
            input.addEventListener('focus', function() {
                this.style.transform = 'translateY(-2px)';
                this.parentElement.style.transform = 'translateY(-2px)';
            });
            
            input.addEventListener('blur', function() {
                this.style.transform = 'translateY(0)';
                this.parentElement.style.transform = 'translateY(0)';
            });
            
            // Add typing animation
            input.addEventListener('keypress', function() {
                this.style.transform = 'scale(1.01)';
                setTimeout(() => {
                    this.style.transform = '';
                }, 150);
            });
        });
        
        // Form submission animation
        const form = document.querySelector('form');
        form.addEventListener('submit', function(e) {
            // Check form validity
            const requiredInputs = this.querySelectorAll('input[required]');
            let isValid = true;
            
            requiredInputs.forEach(input => {
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
                // Add loading animation to submit button
                const submitBtn = this.querySelector('.submit-btn');
                const originalText = submitBtn.textContent;
                submitBtn.textContent = 'SUBMITTING...';
                submitBtn.style.opacity = '0.8';
                submitBtn.disabled = true;
                
                // Animate form submission
                document.body.style.opacity = '0.9';
                document.body.style.transition = 'opacity 0.3s ease';
                
                // Success animation for unique ID field
                const uniqueIdField = document.getElementById('id');
                if (uniqueIdField) {
                    uniqueIdField.style.animation = 'successPulse 1s ease-in-out, idPulse 2s ease-in-out infinite';
                }
            } else {
                e.preventDefault();
            }
        });
        
        // Clear button animation
        const clearBtn = document.querySelector('.btn-clear');
        clearBtn.addEventListener('click', function() {
            // Add ripple effect
            this.style.transform = 'scale(0.95)';
            setTimeout(() => {
                this.style.transform = '';
            }, 200);
            
            // Clear all inputs and remove not-empty class
            inputs.forEach(input => {
                input.value = '';
                input.classList.remove('not-empty');
            });
            
            // Keep the unique ID
            const uniqueIdField = document.getElementById('id');
            if (uniqueIdField) {
                // We don't clear this field as it's readonly and auto-generated
            }
        });
        
        // Unique ID field animation on page load
        const uniqueIdField = document.getElementById('id');
        if (uniqueIdField) {
            setTimeout(() => {
                uniqueIdField.style.transform = 'scale(1.05)';
                setTimeout(() => {
                    uniqueIdField.style.transform = 'scale(1)';
                }, 300);
            }, 1000);
        }
        
        // Add page transition for navigation
        document.querySelectorAll('a').forEach(link => {
            link.addEventListener('click', function(e) {
                const href = this.getAttribute('href');
                if (href && !href.startsWith('#')) {
                    e.preventDefault();
                    document.body.style.opacity = '0.7';
                    document.body.style.transition = 'opacity 0.3s ease';
                    setTimeout(() => {
                        window.location.href = href;
                    }, 300);
                }
            });
        });
    });
</script>
</body>
</html>