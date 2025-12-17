<%-- 
    Document   : viewdata1
    Created on : 4 Dec, 2025, 7:47:40 AM
    Author     : jones
--%>
<%@page import = "java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ViewAllPaitentDatas</title>
   
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
            overflow-x: hidden;
        }
        
        /* Page fade in animation */
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
            animation: bgZoom 30s ease-in-out infinite alternate;
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
            background: rgba(2, 8, 26, 0.5);
            animation: tintPulse 15s ease-in-out infinite alternate;
        }
        
        /* Tint pulse animation */
        @keyframes tintPulse {
            0% { opacity: 0.5; }
            100% { opacity: 0.6; }
        }

        .display-4 {
            text-align: center;
            margin: 30px 0;
            padding: 20px;
            background: linear-gradient(90deg, rgba(0,123,255,0.1), rgba(40,167,69,0.1));
            border-radius: 10px;
            animation: titleSlideDown 0.8s cubic-bezier(0.175, 0.885, 0.32, 1.275) 0.3s both;
            position: relative;
            overflow: hidden;
        }
        
        /* Title slide down animation */
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
        
        .display-4::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.1), transparent);
            animation: shimmer 3s infinite;
        }
        
        @keyframes shimmer {
            0% { left: -100%; }
            100% { left: 100%; }
        }

        .container-fluid {
            padding: 20px;
            animation: contentFadeIn 0.7s ease-out 0.5s both;
        }
        
        /* Content fade in animation */
        @keyframes contentFadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        /* Table styling with animations */
        .table-responsive {
            margin: 20px 0;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            animation: tableSlideUp 0.8s ease-out 0.7s both;
            background: rgba(16, 16, 16, 0.2);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        /* Table slide up animation */
        @keyframes tableSlideUp {
            from { 
                opacity: 0; 
                transform: translateY(30px); 
            }
            to { 
                opacity: 1; 
                transform: translateY(0); 
            }
        }

        .table {
            margin-bottom: 0;
            color: #fff;
            border-collapse: separate;
            border-spacing: 0;
        }
        
        .table thead th {
            background: linear-gradient(135deg, #17a2b8, #138496);
            border: none;
            padding: 15px 10px;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.85rem;
            letter-spacing: 0.5px;
            position: sticky;
            top: 0;
            z-index: 10;
            animation: headerFadeIn 0.6s ease-out 0.9s both;
            transition: all 0.3s ease;
        }
        
        /* Table header fade in */
        @keyframes headerFadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .table thead th:hover {
            background: linear-gradient(135deg, #138496, #117a8b);
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        }

        .table tbody tr {
            animation: rowFadeIn 0.5s ease-out forwards;
            opacity: 0;
            transform: translateX(-20px);
            transition: all 0.3s ease;
        }
        
        /* Staggered row animations */
        .table tbody tr:nth-child(1) { animation-delay: 1.0s; }
        .table tbody tr:nth-child(2) { animation-delay: 1.05s; }
        .table tbody tr:nth-child(3) { animation-delay: 1.1s; }
        .table tbody tr:nth-child(4) { animation-delay: 1.15s; }
        .table tbody tr:nth-child(5) { animation-delay: 1.2s; }
        .table tbody tr:nth-child(6) { animation-delay: 1.25s; }
        .table tbody tr:nth-child(7) { animation-delay: 1.3s; }
        .table tbody tr:nth-child(8) { animation-delay: 1.35s; }
        .table tbody tr:nth-child(9) { animation-delay: 1.4s; }
        .table tbody tr:nth-child(10) { animation-delay: 1.45s; }
        
        @keyframes rowFadeIn {
            from { 
                opacity: 0; 
                transform: translateX(-20px); 
            }
            to { 
                opacity: 1; 
                transform: translateX(0); 
            }
        }

        .table tbody tr:hover {
            background: rgba(255, 255, 255, 0.1) !important;
            transform: translateX(5px);
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        }

        .table tbody td {
            background-color: rgba(16, 16, 16, 0.5);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            padding: 12px 10px;
            vertical-align: middle;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }
        
        .table tbody td:hover {
            background-color: rgba(32, 32, 32, 0.7);
            transform: scale(1.02);
            z-index: 1;
        }
        
        .table tbody td::after {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.1), transparent);
            transition: left 0.5s;
        }
        
        .table tbody td:hover::after {
            left: 100%;
        }

        /* Column-specific styling */
        .table tbody td:nth-child(1) {
            font-weight: bold;
            color: #00bcd4;
            background-color: rgba(0, 188, 212, 0.1);
        }
        
        .table tbody td:nth-child(2) {
            font-weight: 600;
        }
        
        .table tbody td:nth-child(4) {
            text-transform: capitalize;
        }
        
        .table tbody td:nth-child(7) {
            font-style: italic;
        }
        
        .table tbody td:nth-child(9) {
            text-transform: lowercase;
            color: #80d0ff;
        }
        
        .table tbody td:nth-child(11) {
            font-family: monospace;
            font-size: 1.1em;
        }

        /* Scrollbar styling */
        .table-responsive::-webkit-scrollbar {
            width: 8px;
            height: 8px;
        }
        
        .table-responsive::-webkit-scrollbar-track {
            background: rgba(0,0,0,0.2);
            border-radius: 10px;
        }
        
        .table-responsive::-webkit-scrollbar-thumb {
            background: linear-gradient(135deg, #17a2b8, #138496);
            border-radius: 10px;
        }
        
        .table-responsive::-webkit-scrollbar-thumb:hover {
            background: linear-gradient(135deg, #138496, #117a8b);
        }

        /* Loading animation */
        .loading-container {
            display: none;
            text-align: center;
            padding: 50px;
            animation: pulse 2s infinite;
        }
        
        @keyframes pulse {
            0%, 100% { opacity: 0.6; }
            50% { opacity: 1; }
        }
        
        .loading-spinner {
            width: 50px;
            height: 50px;
            border: 5px solid rgba(255,255,255,0.3);
            border-top: 5px solid #17a2b8;
            border-radius: 50%;
            animation: spin 1s linear infinite;
            margin: 0 auto 20px;
        }
        
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        /* Back button styling */
        .back-btn {
            position: fixed;
            bottom: 30px;
            right: 30px;
            z-index: 100;
            background: linear-gradient(135deg, #17a2b8, #138496);
            border: none;
            border-radius: 50px;
            padding: 12px 25px;
            color: white;
            font-weight: 600;
            box-shadow: 0 5px 20px rgba(0,0,0,0.3);
            transition: all 0.3s ease;
            animation: buttonFadeIn 0.6s ease-out 1.5s both;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        
        @keyframes buttonFadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .back-btn:hover {
            transform: translateY(-3px) scale(1.05);
            box-shadow: 0 8px 25px rgba(0,0,0,0.4);
            background: linear-gradient(135deg, #138496, #117a8b);
        }
        
        .back-btn:active {
            transform: translateY(0) scale(0.98);
        }

        /* Responsive design */
        @media (max-width: 1200px) {
            .table-responsive {
                font-size: 0.9rem;
            }
            
            .table thead th,
            .table tbody td {
                padding: 10px 8px;
            }
        }
        
        @media (max-width: 992px) {
            .table-responsive {
                font-size: 0.85rem;
            }
            
            .display-4 {
                font-size: 2rem;
                padding: 15px;
            }
            
            .back-btn {
                bottom: 20px;
                right: 20px;
                padding: 10px 20px;
                font-size: 0.9rem;
            }
        }
        
        @media (max-width: 768px) {
            .container-fluid {
                padding: 10px;
            }
            
            .table-responsive {
                font-size: 0.8rem;
                border-radius: 8px;
            }
            
            .table thead th,
            .table tbody td {
                padding: 8px 6px;
            }
            
            .display-4 {
                font-size: 1.8rem;
                margin: 20px 0;
            }
            
            .back-btn {
                bottom: 15px;
                right: 15px;
                padding: 8px 16px;
                font-size: 0.85rem;
            }
        }
        
        @media (max-width: 576px) {
            .table-responsive {
                font-size: 0.75rem;
            }
            
            .table thead th {
                font-size: 0.7rem;
                padding: 6px 4px;
            }
            
            .table tbody td {
                padding: 6px 4px;
            }
            
            .display-4 {
                font-size: 1.5rem;
                padding: 10px;
            }
            
            .back-btn {
                bottom: 10px;
                right: 10px;
                padding: 6px 12px;
                font-size: 0.8rem;
            }
            
            .back-btn span {
                display: none;
            }
        }
        
        /* Print styles */
        @media print {
            .bg-img, .bg-tint, .back-btn {
                display: none;
            }
            
            body {
                background: white;
                color: black;
            }
            
            .table-responsive {
                box-shadow: none;
                border: 1px solid #ddd;
            }
            
            .table thead th {
                background: #f8f9fa !important;
                color: black !important;
                border: 1px solid #ddd;
            }
            
            .table tbody td {
                border: 1px solid #ddd;
                color: black !important;
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

<img class="bg-img" src="./p3.webp" alt="Background image">
<div class="bg-tint"></div>

<div class="container-fluid">
    <h1 class="display-4">UNIQUE VIEW - PATIENT DATABASE</h1>
    
    <!-- Loading animation -->
    <div class="loading-container" id="loading">
        <div class="loading-spinner"></div>
        <p>Loading patient data...</p>
    </div>
    
    <div class="table-responsive">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Father/Husband</th>
                    <th>Marital Status</th>
                    <th>Address</th>
                    <th>Age</th>
                    <th>DOB</th>
                    <th>Gender</th>
                    <th>Email</th>
                    <th>Nationality</th>
                    <th>Contact</th>
                    <th>ID Mark 1</th>
                </tr>
            </thead>
            <tbody>
            <% 
                String sql = "select * from patient_details";
                rs = st.executeQuery(sql);
                int rowCount = 0;
                
                while(rs.next()) { 
                    rowCount++;
            %>
                <tr>
                    <td><%= rs.getString("unique_id")%></td>
                    <td><%= rs.getString("name")%></td>
                    <td><%= rs.getString("father_or_husband_name")%></td>
                    <td><%= rs.getString("marital_status")%></td>
                    <td><%= rs.getString("communication_address")%></td>
                    <td><%= rs.getString("age")%></td>
                    <td><%= rs.getString("date_of_birth")%></td>
                    <td><%= rs.getString("gender")%></td>
                    <td><%= rs.getString("mail_id")%></td>
                    <td><%= rs.getString("nationality")%></td>
                    <td><%= rs.getString("contact_no")%></td>
                    <td><%= rs.getString("identification_mark_1")%></td>
                </tr>
            <% } 
                
                // Close resources
                if (rs != null) rs.close();
                if (st != null) st.close();
                if (cn != null) cn.close();
            %>
            </tbody>
        </table>
    </div>
    
    <!-- Row count display -->
    <div class="row-count text-center mt-3" style="animation: fadeIn 1s ease-out 1.8s both;">
        <p class="text-muted">Total Records: <span class="badge badge-info"><%= rowCount %></span></p>
    </div>
</div>

<!-- Back button -->
<button class="back-btn" onclick="goBack()">
    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
        <path d="M19 12H5M12 19l-7-7 7-7"/>
    </svg>
    <span>Back to Dashboard</span>
</button>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Show loading animation
        const loading = document.getElementById('loading');
        loading.style.display = 'block';
        
        // Hide loading after content loads
        setTimeout(() => {
            loading.style.display = 'none';
            
            // Add click animation to table rows
            const tableRows = document.querySelectorAll('tbody tr');
            tableRows.forEach(row => {
                row.addEventListener('click', function() {
                    // Remove previous selection
                    tableRows.forEach(r => r.classList.remove('selected'));
                    
                    // Add selection to clicked row
                    this.classList.add('selected');
                    
                    // Get the ID from first cell
                    const patientId = this.cells[0].textContent;
                    
                    // Create a temporary selection effect
                    this.style.backgroundColor = 'rgba(0, 188, 212, 0.2)';
                    setTimeout(() => {
                        this.style.backgroundColor = '';
                    }, 1000);
                    
                    // Optional: Copy ID to clipboard
                    navigator.clipboard.writeText(patientId).then(() => {
                        // Show copied notification
                        showNotification(`Copied ID: ${patientId}`);
                    });
                });
                
                // Add keyboard navigation
                row.addEventListener('keydown', function(e) {
                    if (e.key === 'Enter') {
                        this.click();
                    }
                });
                
                // Make rows focusable for accessibility
                row.setAttribute('tabindex', '0');
            });
            
            // Add search functionality (optional)
            addSearchFunctionality();
            
            // Add table sorting
            addTableSorting();
        }, 1000);
        
        // Add scroll animation
        window.addEventListener('scroll', function() {
            const table = document.querySelector('.table-responsive');
            const scrollPosition = window.scrollY;
            
            if (scrollPosition > 100) {
                table.style.transform = 'scale(0.995)';
            } else {
                table.style.transform = 'scale(1)';
            }
        });
    });
    
    function goBack() {
        // Add page transition animation
        document.body.style.opacity = '0.8';
        document.body.style.transition = 'opacity 0.3s ease';
        
        setTimeout(() => {
            window.location.href = 'dashboard.jsp';
        }, 300);
    }
    
    function showNotification(message) {
        // Create notification element
        const notification = document.createElement('div');
        notification.textContent = message;
        notification.style.cssText = `
            position: fixed;
            top: 20px;
            right: 20px;
            background: linear-gradient(135deg, #17a2b8, #138496);
            color: white;
            padding: 15px 25px;
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
            z-index: 1000;
            animation: slideInRight 0.3s ease-out, fadeOut 0.3s ease-out 2s forwards;
            font-weight: 600;
        `;
        
        // Add CSS for notification animations
        const style = document.createElement('style');
        style.textContent = `
            @keyframes slideInRight {
                from { transform: translateX(100%); opacity: 0; }
                to { transform: translateX(0); opacity: 1; }
            }
            @keyframes fadeOut {
                from { opacity: 1; }
                to { opacity: 0; transform: translateX(100%); }
            }
        `;
        document.head.appendChild(style);
        
        document.body.appendChild(notification);
        
        // Remove notification after animation
        setTimeout(() => {
            notification.remove();
            style.remove();
        }, 2300);
    }
    
    function addSearchFunctionality() {
        // Create search input
        const searchDiv = document.createElement('div');
        searchDiv.className = 'mb-3';
        searchDiv.innerHTML = `
            <div class="input-group">
                <input type="text" id="searchInput" class="form-control" placeholder="Search patients..." 
                       style="background: rgba(255,255,255,0.1); color: white; border: 1px solid rgba(255,255,255,0.3);">
                <div class="input-group-append">
                    <button class="btn btn-info" type="button" id="searchBtn">Search</button>
                    <button class="btn btn-secondary" type="button" id="clearSearch">Clear</button>
                </div>
            </div>
            <small class="text-muted mt-1 d-block">Search by ID, Name, Email, or Contact</small>
        `;
        
        // Insert search before table
        const tableContainer = document.querySelector('.table-responsive');
        tableContainer.parentNode.insertBefore(searchDiv, tableContainer);
        
        // Add search functionality
        const searchInput = document.getElementById('searchInput');
        const searchBtn = document.getElementById('searchBtn');
        const clearBtn = document.getElementById('clearSearch');
        
        function performSearch() {
            const searchTerm = searchInput.value.toLowerCase();
            const rows = document.querySelectorAll('tbody tr');
            
            rows.forEach(row => {
                const text = row.textContent.toLowerCase();
                if (text.includes(searchTerm)) {
                    row.style.display = '';
                    row.style.animation = 'rowFadeIn 0.3s ease-out';
                } else {
                    row.style.display = 'none';
                }
            });
            
            // Update row count
            updateRowCount();
        }
        
        searchBtn.addEventListener('click', performSearch);
        clearBtn.addEventListener('click', function() {
            searchInput.value = '';
            const rows = document.querySelectorAll('tbody tr');
            rows.forEach(row => {
                row.style.display = '';
            });
            updateRowCount();
        });
        
        searchInput.addEventListener('keyup', function(e) {
            if (e.key === 'Enter') {
                performSearch();
            }
        });
    }
    
    function addTableSorting() {
        const headers = document.querySelectorAll('thead th');
        headers.forEach((header, index) => {
            header.style.cursor = 'pointer';
            header.title = 'Click to sort';
            
            header.addEventListener('click', function() {
                sortTable(index);
            });
        });
    }
    
    function sortTable(column) {
        const table = document.querySelector('tbody');
        const rows = Array.from(table.querySelectorAll('tr'));
        const isAscending = table.getAttribute('data-sort-dir') !== 'asc';
        
        rows.sort((a, b) => {
            const aVal = a.children[column].textContent.trim();
            const bVal = b.children[column].textContent.trim();
            
            // Try to compare as numbers if possible
            if (!isNaN(aVal) && !isNaN(bVal)) {
                return isAscending ? aVal - bVal : bVal - aVal;
            }
            
            // Otherwise compare as strings
            return isAscending 
                ? aVal.localeCompare(bVal)
                : bVal.localeCompare(aVal);
        });
        
        // Remove existing rows
        rows.forEach(row => table.removeChild(row));
        
        // Add sorted rows with animation
        rows.forEach((row, index) => {
            row.style.animationDelay = `${index * 0.05}s`;
            table.appendChild(row);
        });
        
        // Toggle sort direction
        table.setAttribute('data-sort-dir', isAscending ? 'asc' : 'desc');
        
        // Update sort indicator
        updateSortIndicator(column, isAscending);
    }
    
    function updateSortIndicator(column, isAscending) {
        const headers = document.querySelectorAll('thead th');
        headers.forEach(header => {
            header.innerHTML = header.innerHTML.replace(' ↑', '').replace(' ↓', '');
        });
        
        const currentHeader = headers[column];
        currentHeader.innerHTML += isAscending ? ' ↑' : ' ↓';
    }
    
    function updateRowCount() {
        const visibleRows = document.querySelectorAll('tbody tr:not([style*="display: none"])').length;
        const totalRows = document.querySelectorAll('tbody tr').length;
        const countElement = document.querySelector('.row-count .badge');
        
        if (countElement) {
            if (visibleRows === totalRows) {
                countElement.textContent = totalRows;
            } else {
                countElement.textContent = `${visibleRows} / ${totalRows}`;
                countElement.className = 'badge badge-warning';
            }
        }
    }
</script>
</body>
</html>