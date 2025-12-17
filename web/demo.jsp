<%-- 
    Document   : NewEntry_fixed
    Created on : 10 Dec, 2025
    Author     : jones (fixed)
--%>
<%@ page import="java.util.*,java.security.SecureRandom" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NewEntry</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

    <style>
        /* Styles kept mostly unchanged from original, cleaned up duplicates */
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
        @keyframes pageFadeIn { from { opacity: 0; } to { opacity: 1; } }

        .bg-img { position: fixed; inset: 0; width: 100%; height: 100%; object-fit: cover; object-position: center center; z-index: -2; pointer-events: none; filter: brightness(.5) contrast(.95); animation: bgZoom 25s ease-in-out infinite alternate; }
        @keyframes bgZoom { 0% { transform: scale(1); } 100% { transform: scale(1.02); } }

        .get-in-touch { max-width: 900px; margin: 50px auto; position: relative; animation: formSlideUp 0.7s ease-out 0.3s both; }
        @keyframes formSlideUp { from { opacity: 0; transform: translateY(30px); } to { opacity: 1; transform: translateY(0); } }

        .get-in-touch .title { text-align: center; text-transform: uppercase; letter-spacing: 3px; font-size: 3.2em; line-height: 48px; padding-bottom: 48px; color: #ffffff; background: #ffffff7d; background-color: rgb(255, 255, 255); -webkit-background-clip: text; -webkit-text-fill-color: transparent; animation: titleBounce 0.8s cubic-bezier(0.175, 0.885, 0.32, 1.275) 0.5s both; }
        @keyframes titleBounce { from { opacity: 0; transform: translateY(-40px) scale(0.9); } to { opacity: 1; transform: translateY(0) scale(1); } }

        .contact-form .form-field { position: relative; margin: 24px 0; animation: fieldFadeIn 0.6s ease-out forwards; opacity: 0; transform: translateY(10px); }
        @keyframes fieldFadeIn { from { opacity: 0; transform: translateY(10px); } to { opacity: 1; transform: translateY(0); } }

        .contact-form .input-text { display: block; width: 100%; height: 36px; border-width: 0 0 2px 0; border-color: #ffffff; font-size: 18px; line-height: 26px; color: white; font-weight: 400; background-color: #10325f53; border-right: 4px solid rgb(255, 255, 255); border-radius: 5px; transition: all 0.3s ease; }
        .contact-form .input-text:focus { outline: none; transform: translateY(-2px); box-shadow: 0 5px 15px rgba(255, 255, 255, 0.1); border-color: #94e10fe9; border-right-color: #94e10fe9; }

        .contact-form .input-text:focus + .label, .contact-form .input-text.not-empty + .label { -webkit-transform: translateY(-24px); transform: translateY(-24px); color: #94e10fe9; }
        .contact-form .label { position: absolute; left: 20px; bottom: 11px; font-size: 18px; line-height: 26px; font-weight: 400; color: #ffffff; cursor: text; transition: transform 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275), color 0.3s ease; }

        #uniqueId { margin-bottom: -40px; background-color: rgba(20, 120, 210, 0.05); }

        .contact-form .submit-btn { display: inline-block; background-color: #94e10fe9; color: #fff; text-transform: uppercase; letter-spacing: 2px; font-size: 16px; padding: 8px 16px; border: none; width: 200px; cursor: pointer; transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275); }
        .contact-form .submit-btn:hover { background-color: rgba(84, 114, 189, 0.559); transform: translateY(-2px) scale(1.05); box-shadow: 0 8px 20px rgba(148, 225, 15, 0.3); }

        .btn-clear { background-color: #a85e0f; color: #fff; border: none; padding: 8px 16px; text-transform: uppercase; letter-spacing: 2px; border-radius: 5px; cursor: pointer; }
        .btn-clear:hover { background-color: hsl(0, 21%, 68%); transform: translateY(-2px) scale(1.05); box-shadow: 0 5px 15px rgba(168, 94, 15, 0.3); }

        @media (max-width: 768px) { .get-in-touch { margin: 20px auto; padding: 0 15px; } .get-in-touch .title { font-size: 2.2em; line-height: 36px; padding-bottom: 36px; } .button-group { flex-direction: column; align-items: stretch; } .btn-clear, .submit-btn { width: 100%; margin-bottom: 10px; } }
        @media (max-width: 480px) { .get-in-touch .title { font-size: 1.8em; letter-spacing: 2px; } }
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
    <!-- NOTE: enctype added for file upload -->
    <form class="contact-form row" method="post" action="newentry" enctype="multipart/form-data">
        <div class="form-field col-lg-6">
            <input id="uniqueId" class="input-text js-input" name="t1" value="<%=unique12%>" type="text" readonly>
            <label class="label" for="uniqueId">UNIQUE-ID-NUMBER</label>
        </div>

        <div class="form-field col-lg-6">
            <input id="name" class="input-text js-input" name="t2" type="text" required>
            <label class="label" for="name">Name of the Person</label>
        </div>

        <div class="form-field col-lg-6">
            <input id="fname" class="input-text js-input" name="t3" type="text" required>
            <label class="label" for="fname">Father/Husband Name</label>
        </div>

        <div class="form-field col-lg-6">
            <input id="mstatus" class="input-text js-input" name="t4" type="text" required>
            <label class="label" for="mstatus">Marital Status</label>
        </div>

        <div class="form-field col-lg-6">
            <input id="address" class="input-text js-input" name="t5" type="text" required>
            <label class="label" for="address">Address for Communication</label>
        </div>

        <div class="form-field col-lg-6">
            <input id="field1" class="input-text js-input" name="t6" type="text" required>
            <label class="label" for="field1">Field 1</label>
        </div>

        <div class="form-field col-lg-6">
            <input id="field2" class="input-text js-input" name="t7" type="text" required>
            <label class="label" for="field2">Field 2</label>
        </div>

        <div class="form-field col-lg-6">
            <input id="field3" class="input-text js-input" name="t8" type="text" required>
            <label class="label" for="field3">Field 3</label>
        </div>

        <div class="form-field col-lg-6">
            <input id="age" class="input-text js-input" name="t9" type="number" required>
            <label class="label" for="age">Age</label>
        </div>

        <div class="form-field col-lg-6">
            <input id="dob" class="input-text js-input" name="t10" type="text" placeholder="dd-mm-yyyy" required>
            <label class="label" for="dob">Date Of Birth</label>
        </div>

        <div class="form-field col-lg-6">
            <input id="gender" class="input-text js-input" name="t11" type="text" required>
            <label class="label" for="gender">Gender</label>
        </div>

        <div class="form-field col-lg-6">
            <input id="email" class="input-text js-input" name="t12" type="email" required>
            <label class="label" for="email">Mail-Id</label>
        </div>

        <div class="form-field col-lg-6">
            <input id="state" class="input-text js-input" name="t13" type="text" required>
            <label class="label" for="state">State</label>
        </div>

        <div class="form-field col-lg-6">
            <input id="nationality" class="input-text js-input" name="t14" type="text" required>
            <label class="label" for="nationality">Nationality</label>
        </div>

        <div class="form-field col-lg-6">
            <input id="contact" class="input-text js-input" name="t15" type="text" required>
            <label class="label" for="contact">Contact No.</label>
        </div>

        <div class="form-field col-lg-6">
            <input id="alternative" class="input-text js-input" name="t16" type="text">
            <label class="label" for="alternative">Alternative Contact No.</label>
        </div>

        <div class="form-field col-lg-6">
            <input id="i1" class="input-text js-input" type="text" name="t17" required>
            <label class="label" for="i1">Identification Mark - 1</label>
        </div>

        <div class="form-field col-lg-6">
            <input id="i2" class="input-text js-input" type="text" name="t18" required>
            <label class="label" for="i2">Identification Mark - 2</label>
        </div>

        <div class="form-field col-lg-6">
            <input id="i3" class="input-text js-input" type="text" name="t19" required>
            <label class="label" for="i3">Identification Mark - 3</label>
        </div>

        <div class="form-field col-lg-6">
            <input id="i4" class="input-text js-input" type="text" name="t20" required>
            <label class="label" for="i4">Identification Mark - 4</label>
        </div>

        <div class="form-field col-lg-6">
            <input id="pincode" class="input-text js-input" type="text" name="t21" required>
            <label class="label" for="pincode">Pincode</label>
        </div>

        <div class="d-flex justify-content-between align-items-center col-lg-12 mt-4">
            <!-- PhotoCopy Upload -->
            <div class="form-field w-50 mr-3">
                <input id="photo" name="t22" class="input-text js-input" type="file">
                <label class="label l2" for="photo">Upload Photo Copy</label>
            </div>

            <!-- Buttons -->
            <div class="button-group d-flex">
                <button type="reset" id="clearBtn" class="btn btn-clear">Clear</button>
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
            // Skip styling for file inputs and readonly unique id
            if (input.type === 'file') return;

            // Check on load
            if (input.value && input.value.trim() !== '') {
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
                if (this.parentElement) this.parentElement.style.transform = 'translateY(-2px)';
            });

            input.addEventListener('blur', function() {
                this.style.transform = 'translateY(0)';
                if (this.parentElement) this.parentElement.style.transform = 'translateY(0)';
            });

            // Add typing animation
            input.addEventListener('keypress', function() {
                this.style.transform = 'scale(1.01)';
                setTimeout(() => { this.style.transform = ''; }, 150);
            });
        });

        // Form submission animation
        const form = document.querySelector('form');
        form.addEventListener('submit', function(e) {
            // Validate required inputs
            const requiredInputs = this.querySelectorAll('input[required]');
            let isValid = true;

            requiredInputs.forEach(input => {
                if (input.type === 'file') return; // optional validation for files
                if (!input.value || !input.value.trim()) {
                    isValid = false;
                    input.style.animation = 'shake 0.5s ease-in-out';
                    setTimeout(() => { input.style.animation = ''; }, 500);
                }
            });

            if (isValid) {
                const submitBtn = this.querySelector('.submit-btn');
                const originalText = submitBtn.textContent;
                submitBtn.textContent = 'SUBMITTING...';
                submitBtn.style.opacity = '0.8';
                submitBtn.disabled = true;

                document.body.style.opacity = '0.9';
                document.body.style.transition = 'opacity 0.3s ease';

                const uniqueIdField = document.getElementById('uniqueId');
                if (uniqueIdField) {
                    uniqueIdField.style.animation = 'successPulse 1s ease-in-out';
                }
            } else {
                e.preventDefault();
            }
        });

        // Clear button animation: keep unique id and file input intact
        const clearBtn = document.getElementById('clearBtn');
        clearBtn.addEventListener('click', function(e) {
            e.preventDefault();
            this.style.transform = 'scale(0.95)';
            setTimeout(() => { this.style.transform = ''; }, 200);

            const allInputs = document.querySelectorAll('.input-text');
            allInputs.forEach(input => {
                if (input.id === 'uniqueId') return; // keep generated ID
                if (input.type === 'file') {
                    input.value = null; // clear file selection
                    input.classList.remove('not-empty');
                    return;
                }
                input.value = '';
                input.classList.remove('not-empty');
            });
        });

        // Page navigation transition for real links
        document.querySelectorAll('a[href]').forEach(link => {
            link.addEventListener('click', function(e) {
                const href = this.getAttribute('href');
                if (href && !href.startsWith('#') && !href.startsWith('javascript:')) {
                    e.preventDefault();
                    document.body.style.opacity = '0.7';
                    document.body.style.transition = 'opacity 0.3s ease';
                    setTimeout(() => { window.location.href = href; }, 300);
                }
            });
        });

        // small entrance for unique id field
        const uniqueIdField = document.getElementById('uniqueId');
        if (uniqueIdField) {
            setTimeout(() => { uniqueIdField.style.transform = 'scale(1.05)'; setTimeout(() => { uniqueIdField.style.transform = 'scale(1)'; }, 300); }, 1000);
        }
    });
</script>
</body>
</html>
