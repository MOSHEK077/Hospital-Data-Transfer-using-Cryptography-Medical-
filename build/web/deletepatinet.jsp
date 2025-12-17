<%-- 
    Document   : deletepatinet
    Created on : 7 Dec, 2025, 2:40:11 PM
    Author     : jones   
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Delete Registered Patient</title>
<style>
    /* Reset */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    /* Simple fade in */
    @keyframes fadeIn {
        from { opacity: 0; }
        to { opacity: 1; }
    }

    /* Simple slide up */
    @keyframes slideUp {
        from {
            transform: translateY(20px);
            opacity: 0;
        }
        to {
            transform: translateY(0);
            opacity: 1;
        }
    }

    body {
        font-family: Arial, sans-serif;
        background-color: #051428;
        color: white;
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        animation: fadeIn 0.5s ease-out;
        padding: 20px;
    }

    /* Background image */
    .bg-img {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        object-fit: cover;
        z-index: -1;
        filter: brightness(0.3);
    }

    .login-container {
        background: rgba(2, 21, 166, 0.9);
        padding: 30px;
        border-radius: 10px;
        width: 100%;
        max-width: 350px;
        animation: slideUp 0.5s ease-out 0.2s both;
    }

    .login-container h2 {
        text-align: center;
        margin-bottom: 25px;
        color: #fff8f8;
        font-size: 24px;
    }

    /* Form group */
    .form-group {
        position: relative;
        margin-bottom: 25px;
    }

    .form-group input {
        width: 100%;
        padding: 14px 10px 10px 10px;
        border: 1px solid rgba(255, 255, 255, 0.3);
        border-radius: 5px;
        outline: none;
        font-size: 16px;
        background: rgba(255, 255, 255, 0.1);
        color: white;
        transition: border-color 0.3s, transform 0.3s;
    }

    .form-group input:focus {
        border-color: rgba(255, 253, 253, 0.8);
        transform: scale(1.02);
    }

    .form-group label {
        position: absolute;
        left: 12px;
        top: 12px;
        color: rgba(255, 248, 248, 0.8);
        pointer-events: none;
        transition: all 0.3s;
        font-size: 16px;
    }

    .form-group input:focus + label,
    .form-group input:not(:placeholder-shown) + label {
        transform: translateY(-22px) scale(0.85);
        color: #fff8f8;
        top: 10px;
        font-size: 14px;
    }

    /* Button */
    .login-btn {
        width: 100%;
        padding: 12px;
        background: #00040d;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
        transition: background 0.3s, transform 0.3s;
    }

    .login-btn:hover {
        background: #5a6699;
        transform: translateY(-2px);
    }

    .login-btn:active {
        transform: translateY(0);
    }

    /* Simple shake for invalid input */
    @keyframes shake {
        0%, 100% { transform: translateX(0); }
        25% { transform: translateX(-5px); }
        75% { transform: translateX(5px); }
    }

    .shake {
        animation: shake 0.5s ease-in-out;
    }

    /* Simple pulse for delete warning */
    @keyframes pulse {
        0% { box-shadow: 0 0 0 0 rgba(220, 53, 69, 0.4); }
        100% { box-shadow: 0 0 0 10px rgba(220, 53, 69, 0); }
    }

    .pulse {
        animation: pulse 1.5s infinite;
    }
</style>
</head>
<body>
    <img class="bg-img" src="image23.jpg" alt="Background image">
    
    <div class="login-container">
        <h2>DELETE REGISTRATION</h2>
        <form method="post" action="deletepatient" id="deleteForm">
            <div class="form-group">
                <input type="text" id="enrolInput" name="t1" placeholder=" " required>
                <label for="enrolInput">Enrollment ID</label>
            </div>

            <button type="submit" class="login-btn pulse" id="deleteBtn">
                DELETE RECORD
            </button>
        </form>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.getElementById('deleteForm');
            const deleteBtn = document.getElementById('deleteBtn');
            const input = document.getElementById('enrolInput');
            
            // Auto focus input
            input.focus();
            
            // Simple validation on submit
            form.addEventListener('submit', function(e) {
                const enrollmentId = input.value.trim();
                
                if (!enrollmentId) {
                    e.preventDefault();
                    input.classList.add('shake');
                    setTimeout(() => {
                        input.classList.remove('shake');
                    }, 500);
                    input.focus();
                    return;
                }
                
                // Confirm delete
                if (!confirm('Delete patient record ' + enrollmentId + '?')) {
                    e.preventDefault();
                    return;
                }
                
                // Simple loading state
                deleteBtn.disabled = true;
                deleteBtn.textContent = 'Deleting...';
            });
            
            // Remove placeholder-space on blur if empty
            input.addEventListener('blur', function() {
                if (!this.value.trim()) {
                    this.value = '';
                }
            });
        });
    </script>
</body>
</html>