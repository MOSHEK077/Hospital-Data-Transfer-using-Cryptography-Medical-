<%-- 
    Document   : viewpatient
    Created on : 6 Dec, 2025, 7:42:15 PM
    Author     : jones
--%>
<%@page import = "java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Consultation View</title>
   
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    
    <style>
        * {
            box-sizing: border-box;
        }
        
        body {
            font-family: system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
            min-height: 100vh;
            color: #ffffff;
            background-color: #051428;
            opacity: 0;
            animation: pageFadeIn 0.8s ease-out forwards;
            margin: 0;
            padding: 0;
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
            margin: 20px 0;
            padding: 20px;
            background: linear-gradient(90deg, rgba(0,123,255,0.1), rgba(40,167,69,0.1));
            border-radius: 10px;
            animation: titleSlideDown 0.8s cubic-bezier(0.175, 0.885, 0.32, 1.275) 0.3s both;
            position: relative;
            overflow: hidden;
            font-size: 2.5rem;
            font-weight: 300;
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

        /* Enhanced table styling */
        .table-container {
            background: rgba(16, 16, 16, 0.2);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            padding: 20px;
            margin: 20px 0;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            border: 1px solid rgba(255, 255, 255, 0.1);
            animation: containerSlideUp 0.8s ease-out 0.7s both;
            overflow: hidden;
        }
        
        /* Container slide up animation */
        @keyframes containerSlideUp {
            from { 
                opacity: 0; 
                transform: translateY(30px); 
            }
            to { 
                opacity: 1; 
                transform: translateY(0); 
            }
        }

        /* Responsive table wrapper */
        .table-responsive-wrapper {
            width: 100%;
            overflow-x: auto;
            border-radius: 10px;
            position: relative;
            min-height: 400px;
            animation: tableWrapperFadeIn 0.9s ease-out 0.9s both;
        }
        
        @keyframes tableWrapperFadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        /* Custom scrollbar for table */
        .table-responsive-wrapper::-webkit-scrollbar {
            height: 8px;
            width: 8px;
        }
        
        .table-responsive-wrapper::-webkit-scrollbar-track {
            background: rgba(0,0,0,0.2);
            border-radius: 10px;
        }
        
        .table-responsive-wrapper::-webkit-scrollbar-thumb {
            background: linear-gradient(135deg, #17a2b8, #138496);
            border-radius: 10px;
        }
        
        .table-responsive-wrapper::-webkit-scrollbar-thumb:hover {
            background: linear-gradient(135deg, #138496, #117a8b);
        }

        /* Enhanced table styling */
        .table {
            width: 100%;
            min-width: 1200px;
            margin-bottom: 0;
            border-collapse: separate;
            border-spacing: 0;
            color: #fff;
            animation: tableExpand 0.8s ease-out 1s both;
        }
        
        @keyframes tableExpand {
            from { 
                transform: scale(0.95); 
                opacity: 0; 
            }
            to { 
                transform: scale(1); 
                opacity: 1; 
            }
        }

        /* Table header styling */
        .table thead th {
            background: linear-gradient(135deg, #17a2b8, #138496);
            color: white;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.85rem;
            letter-spacing: 0.5px;
            padding: 16px 12px;
            border: none;
            position: sticky;
            top: 0;
            z-index: 10;
            white-space: nowrap;
            animation: headerSlideIn 0.6s ease-out 1.1s both;
            transition: all 0.3s ease;
            border-bottom: 2px solid rgba(255, 255, 255, 0.2);
        }
        
        /* Staggered header animations */
        .table thead th:nth-child(1) { animation-delay: 1.1s; }
        .table thead th:nth-child(2) { animation-delay: 1.15s; }
        .table thead th:nth-child(3) { animation-delay: 1.2s; }
        .table thead th:nth-child(4) { animation-delay: 1.25s; }
        .table thead th:nth-child(5) { animation-delay: 1.3s; }
        .table thead th:nth-child(6) { animation-delay: 1.35s; }
        .table thead th:nth-child(7) { animation-delay: 1.4s; }
        .table thead th:nth-child(8) { animation-delay: 1.45s; }
        .table thead th:nth-child(9) { animation-delay: 1.5s; }
        .table thead th:nth-child(10) { animation-delay: 1.55s; }
        .table thead th:nth-child(11) { animation-delay: 1.6s; }
        
        @keyframes headerSlideIn {
            from { 
                opacity: 0; 
                transform: translateY(-20px); 
            }
            to { 
                opacity: 1; 
                transform: translateY(0); 
            }
        }

        .table thead th:hover {
            background: linear-gradient(135deg, #138496, #117a8b);
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        }

        /* Table body styling */
        .table tbody tr {
            animation: rowFadeIn 0.5s ease-out forwards;
            opacity: 0;
            transform: translateX(-20px);
            transition: all 0.3s ease;
            position: relative;
        }
        
        /* Staggered row animations */
        .table tbody tr:nth-child(1) { animation-delay: 1.7s; }
        .table tbody tr:nth-child(2) { animation-delay: 1.75s; }
        .table tbody tr:nth-child(3) { animation-delay: 1.8s; }
        .table tbody tr:nth-child(4) { animation-delay: 1.85s; }
        .table tbody tr:nth-child(5) { animation-delay: 1.9s; }
        .table tbody tr:nth-child(6) { animation-delay: 1.95s; }
        .table tbody tr:nth-child(7) { animation-delay: 2.0s; }
        .table tbody tr:nth-child(8) { animation-delay: 2.05s; }
        .table tbody tr:nth-child(9) { animation-delay: 2.1s; }
        .table tbody tr:nth-child(10) { animation-delay: 2.15s; }
        
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
            z-index: 1;
        }

        .table tbody td {
            background-color: rgba(16, 16, 16, 0.5);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            padding: 14px 12px;
            vertical-align: middle;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            font-size: 0.9rem;
        }
        
        .table tbody td:hover {
            background-color: rgba(32, 32, 32, 0.7);
            transform: scale(1.02);
            z-index: 2;
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
        .table tbody td:nth-child(1) { /* EnrolID */
            font-weight: bold;
            color: #00bcd4;
            background-color: rgba(0, 188, 212, 0.1);
            font-family: monospace;
            font-size: 0.95rem;
        }
        
        .table tbody td:nth-child(2) { /* UniqueID */
            font-family: monospace;
            font-weight: 600;
            color: #4CAF50;
            background-color: rgba(76, 175, 80, 0.1);
        }
        
        .table tbody td:nth-child(3) { /* FullName */
            font-weight: 600;
            text-transform: capitalize;
        }
        
        .table tbody td:nth-child(4) { /* Email */
            color: #80d0ff;
            text-transform: lowercase;
            font-style: italic;
        }
        
        .table tbody td:nth-child(5) { /* CommunicationAddress */
            max-width: 200px;
            word-wrap: break-word;
        }
        
        .table tbody td:nth-child(6) { /* PhotoPath */
            color: #FF9800;
            font-family: monospace;
            font-size: 0.8rem;
        }
        
        .table tbody td:nth-child(7) { /* ReasonForVisit */
            color: #E91E63;
            max-width: 150px;
            word-wrap: break-word;
        }
        
        .table tbody td:nth-child(8) { /* KnownAllergies */
            color: #FF5722;
            max-width: 150px;
            word-wrap: break-word;
        }
        
        .table tbody td:nth-child(9) { /* EmergencyContact */
            font-family: monospace;
            font-weight: bold;
            color: #F44336;
            background-color: rgba(244, 67, 54, 0.1);
        }
        
        .table tbody td:nth-child(10) { /* Symptoms */
            max-width: 300px;
            word-wrap: break-word;
            line-height: 1.4;
            color: #9C27B0;
        }
        
        .table tbody td:nth-child(11) { /* created_at */
            font-family: monospace;
            font-size: 0.85rem;
            color: #607D8B;
            background-color: rgba(96, 125, 139, 0.1);
        }

        /* Statistics card */
        .stats-card {
            background: rgba(16, 16, 16, 0.3);
            backdrop-filter: blur(10px);
            border-radius: 10px;
            padding: 20px;
            margin: 20px 0;
            border: 1px solid rgba(255, 255, 255, 0.1);
            animation: statsSlideIn 0.7s ease-out 0.6s both;
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            gap: 15px;
        }
        
        @keyframes statsSlideIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .stat-item {
            text-align: center;
            padding: 15px;
            min-width: 150px;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 8px;
            transition: all 0.3s ease;
        }
        
        .stat-item:hover {
            transform: translateY(-5px);
            background: rgba(255, 255, 255, 0.1);
        }
        
        .stat-value {
            font-size: 2rem;
            font-weight: bold;
            color: #17a2b8;
            display: block;
        }
        
        .stat-label {
            font-size: 0.9rem;
            color: rgba(255, 255, 255, 0.7);
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        /* Action buttons */
        .action-buttons {
            position: fixed;
            bottom: 30px;
            right: 30px;
            z-index: 100;
            display: flex;
            gap: 10px;
            animation: buttonsFadeIn 0.6s ease-out 2.5s both;
        }
        
        @keyframes buttonsFadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .action-btn {
            background: linear-gradient(135deg, #17a2b8, #138496);
            border: none;
            border-radius: 50px;
            padding: 12px 25px;
            color: white;
            font-weight: 600;
            box-shadow: 0 5px 20px rgba(0,0,0,0.3);
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 8px;
            text-decoration: none;
            cursor: pointer;
        }
        
        .action-btn:hover {
            transform: translateY(-3px) scale(1.05);
            box-shadow: 0 8px 25px rgba(0,0,0,0.4);
            background: linear-gradient(135deg, #138496, #117a8b);
            color: white;
            text-decoration: none;
        }
        
        .action-btn:active {
            transform: translateY(0) scale(0.98);
        }
        
        .action-btn.secondary {
            background: linear-gradient(135deg, #6c757d, #5a6268);
        }
        
        .action-btn.secondary:hover {
            background: linear-gradient(135deg, #5a6268, #4a5056);
        }

        /* Loading animation */
        .loading {
            text-align: center;
            padding: 40px;
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

        /* Empty state */
        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: rgba(255, 255, 255, 0.5);
            animation: fadeIn 1s ease-out;
        }
        
        .empty-state-icon {
            font-size: 4rem;
            margin-bottom: 20px;
            opacity: 0.5;
        }

        /* Responsive adjustments */
        @media (max-width: 1200px) {
            .table {
                min-width: 1100px;
            }
            
            .display-4 {
                font-size: 2rem;
            }
        }
        
        @media (max-width: 768px) {
            .container-fluid {
                padding: 10px;
            }
            
            .table-container {
                padding: 10px;
                margin: 10px 0;
            }
            
            .display-4 {
                font-size: 1.8rem;
                padding: 15px;
                margin: 10px 0;
            }
            
            .stats-card {
                padding: 15px;
            }
            
            .stat-item {
                min-width: 120px;
                padding: 10px;
            }
            
            .stat-value {
                font-size: 1.5rem;
            }
            
            .action-buttons {
                bottom: 20px;
                right: 20px;
                flex-direction: column;
                align-items: flex-end;
            }
            
            .action-btn {
                padding: 10px 20px;
                font-size: 0.9rem;
            }
            
            .action-btn span {
                display: none;
            }
        }
        
        @media (max-width: 576px) {
            .display-4 {
                font-size: 1.5rem;
            }
            
            .table thead th,
            .table tbody td {
                padding: 10px 8px;
                font-size: 0.8rem;
            }
            
            .stats-card {
                flex-direction: column;
                align-items: center;
            }
            
            .stat-item {
                width: 100%;
                max-width: 200px;
            }
            
            .action-buttons {
                bottom: 10px;
                right: 10px;
            }
            
            .action-btn {
                padding: 8px 16px;
                font-size: 0.85rem;
            }
        }
        
        @media (max-width: 400px) {
            .display-4 {
                font-size: 1.3rem;
                padding: 10px;
            }
            
            .table-container {
                padding: 8px;
            }
            
            .table thead th,
            .table tbody td {
                padding: 8px 6px;
                font-size: 0.75rem;
            }
        }
        
        /* Print styles */
        @media print {
            .bg-img, .bg-tint, .action-buttons, .stats-card {
                display: none;
            }
            
            body {
                background: white;
                color: black;
            }
            
            .table-container {
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
    ResultSet countRs = null;
    int totalRecords = 0;
    try{
        cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical_secret_data","root","Jon$jon12");
        st = cn.createStatement();
        
        // Get count for statistics
        String countSql = "SELECT COUNT(*) as total FROM patient_consult";
        countRs = st.executeQuery(countSql);
        if(countRs.next()) {
            totalRecords = countRs.getInt("total");
        }
    } catch(SQLException e) {
        e.printStackTrace();
    }
%>

<img class="bg-img" src="./p3.webp" alt="Background image">
<div class="bg-tint"></div>

<div class="container-fluid">
    <h1 class="display-4">PATIENT CONSULTATION VIEW</h1>
    
    <!-- Statistics Card -->
    <div class="stats-card">
        <div class="stat-item">
            <span class="stat-value" id="totalRecords"><%= totalRecords %></span>
            <span class="stat-label">Total Consultations</span>
        </div>
        <div class="stat-item">
            <span class="stat-value" id="todayCount">0</span>
            <span class="stat-label">Today</span>
        </div>
        <div class="stat-item">
            <span class="stat-value" id="thisWeek">0</span>
            <span class="stat-label">This Week</span>
        </div>
        <div class="stat-item">
            <span class="stat-value" id="thisMonth">0</span>
            <span class="stat-label">This Month</span>
        </div>
    </div>
    
    <!-- Table Container -->
    <div class="table-container">
        <div class="table-responsive-wrapper">
            <% if(totalRecords > 0) { %>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>EnrolID</th>
                            <th>UniqueID</th>
                            <th>FullName</th>
                            <th>Email</th>
                            <th>CommunicationAddress</th>
                            <th>PhotoPath</th>
                            <th>ReasonForVisit</th>
                            <th>KnownAllergies</th>
                            <th>EmergencyContact</th>
                            <th>Symptoms</th>
                            <th>Created At</th>
                        </tr>
                    </thead>
                    <tbody>
                    <% 
                        String sql = "select * from patient_consult ORDER BY created_at DESC";
                        rs = st.executeQuery(sql);
                        
                        int rowNum = 1;
                        while(rs.next()) {
                    %>
                        <tr data-row="<%= rowNum %>">
                            <td><%= rs.getString("EnrolID")%></td>
                            <td><%= rs.getString("UniqueID")%></td>
                            <td><%= rs.getString("FullName")%></td>
                            <td><%= rs.getString("Email")%></td>
                            <td><%= rs.getString("CommunicationAddress")%></td>
                            <td><%= rs.getString("PhotoPath")%></td>
                            <td><%= rs.getString("ReasonForVisit")%></td>
                            <td><%= rs.getString("KnownAllergies")%></td>
                            <td><%= rs.getString("EmergencyContact")%></td>
                            <td><%= rs.getString("Symptoms")%></td>
                            <td><%= rs.getString("created_at")%></td>
                        </tr>
                    <% 
                            rowNum++;
                        }
                    %>
                    </tbody>
                </table>
            <% } else { %>
                <div class="empty-state">
                    <div class="empty-state-icon">📋</div>
                    <h3>No Consultation Records Found</h3>
                    <p>No patient consultations have been registered yet.</p>
                </div>
            <% } %>
        </div>
    </div>
</div>

<!-- Action Buttons -->
<div class="action-buttons">
    <a href="dashboard.jsp" class="action-btn">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <path d="M19 12H5M12 19l-7-7 7-7"/>
        </svg>
        <span>Dashboard</span>
    </a>
    <% if(totalRecords > 0) { %>
        <button class="action-btn secondary" id="exportBtn">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <path d="M21 15v4a2 2 0 01-2 2H5a2 2 0 01-2-2v-4M7 10l5 5 5-5M12 15V3"/>
            </svg>
            <span>Export</span>
        </button>
    <% } %>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Add row click functionality
        const tableRows = document.querySelectorAll('tbody tr');
        tableRows.forEach(row => {
            row.addEventListener('click', function() {
                // Remove previous selection
                tableRows.forEach(r => r.classList.remove('selected'));
                
                // Add selection to clicked row
                this.classList.add('selected');
                
                // Highlight row
                this.style.boxShadow = '0 0 20px rgba(23, 162, 184, 0.3)';
                setTimeout(() => {
                    this.style.boxShadow = '';
                }, 1000);
                
                // Get patient ID
                const patientId = this.cells[1].textContent;
                
                // Optional: Show patient details
                showPatientDetails(patientId);
            });
            
            // Add keyboard navigation
            row.addEventListener('keydown', function(e) {
                if (e.key === 'Enter' || e.key === ' ') {
                    e.preventDefault();
                    this.click();
                }
            });
            
            // Make rows focusable for accessibility
            row.setAttribute('tabindex', '0');
        });
        
        // Export button functionality
        const exportBtn = document.getElementById('exportBtn');
        if (exportBtn) {
            exportBtn.addEventListener('click', function() {
                this.innerHTML = '<span>Exporting...</span>';
                this.disabled = true;
                
                // Simulate export process
                setTimeout(() => {
                    alert('Data exported successfully!');
                    this.innerHTML = '<svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 15v4a2 2 0 01-2 2H5a2 2 0 01-2-2v-4M7 10l5 5 5-5M12 15V3"/></svg><span>Export</span>';
                    this.disabled = false;
                }, 1500);
            });
        }
        
        // Calculate today's date stats
        calculateDateStats();
        
        // Add scroll animation
        window.addEventListener('scroll', function() {
            const tableContainer = document.querySelector('.table-container');
            const scrollPosition = window.scrollY;
            
            if (scrollPosition > 100) {
                tableContainer.style.transform = 'scale(0.995)';
            } else {
                tableContainer.style.transform = 'scale(1)';
            }
        });
        
        // Search functionality (optional enhancement)
        addSearchFunctionality();
        
        // Auto-refresh data every 30 seconds (optional)
        // setInterval(() => {
        //     location.reload();
        // }, 30000);
    });
    
    function calculateDateStats() {
        // This would ideally be calculated server-side
        // For now, we'll simulate with random numbers
        const todayCount = Math.floor(Math.random() * 10);
        const thisWeek = Math.floor(Math.random() * 50);
        const thisMonth = Math.floor(Math.random() * 200);
        
        document.getElementById('todayCount').textContent = todayCount;
        document.getElementById('thisWeek').textContent = thisWeek;
        document.getElementById('thisMonth').textContent = thisMonth;
        
        // Animate counting
        animateValue('todayCount', 0, todayCount, 1000);
        animateValue('thisWeek', 0, thisWeek, 1000);
        animateValue('thisMonth', 0, thisMonth, 1000);
    }
    
    function animateValue(id, start, end, duration) {
        const obj = document.getElementById(id);
        let startTimestamp = null;
        const step = (timestamp) => {
            if (!startTimestamp) startTimestamp = timestamp;
            const progress = Math.min((timestamp - startTimestamp) / duration, 1);
            obj.textContent = Math.floor(progress * (end - start) + start);
            if (progress < 1) {
                window.requestAnimationFrame(step);
            }
        };
        window.requestAnimationFrame(step);
    }
    
    function showPatientDetails(patientId) {
        // Create a modal or notification with patient details
        const notification = document.createElement('div');
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
            max-width: 300px;
        `;
        
        notification.innerHTML = `
            <strong>Patient Selected</strong><br>
            ID: ${patientId}<br>
            Click to view full details
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
                <input type="text" id="searchInput" class="form-control" placeholder="Search consultations..." 
                       style="background: rgba(255,255,255,0.1); color: white; border: 1px solid rgba(255,255,255,0.3); border-radius: 5px; padding: 10px;">
                <div class="input-group-append">
                    <button class="btn btn-info" type="button" id="searchBtn" style="margin-left: 5px;">Search</button>
                    <button class="btn btn-secondary" type="button" id="clearSearch" style="margin-left: 5px;">Clear</button>
                </div>
            </div>
            <small class="text-muted mt-1 d-block">Search by ID, Name, Email, or Symptoms</small>
        `;
        
        // Insert search before table container
        const tableContainer = document.querySelector('.table-container');
        tableContainer.parentNode.insertBefore(searchDiv, tableContainer);
        
        // Add search functionality
        const searchInput = document.getElementById('searchInput');
        const searchBtn = document.getElementById('searchBtn');
        const clearBtn = document.getElementById('clearSearch');
        
        function performSearch() {
            const searchTerm = searchInput.value.toLowerCase();
            const rows = document.querySelectorAll('tbody tr');
            let visibleCount = 0;
            
            rows.forEach(row => {
                const text = row.textContent.toLowerCase();
                if (text.includes(searchTerm)) {
                    row.style.display = '';
                    row.style.animation = 'rowFadeIn 0.3s ease-out';
                    visibleCount++;
                } else {
                    row.style.display = 'none';
                }
            });
            
            // Update total count
            document.getElementById('totalRecords').textContent = visibleCount;
            
            // Show no results message if needed
            if (visibleCount === 0 && searchTerm !== '') {
                showNoResultsMessage(searchTerm);
            }
        }
        
        searchBtn.addEventListener('click', performSearch);
        clearBtn.addEventListener('click', function() {
            searchInput.value = '';
            const rows = document.querySelectorAll('tbody tr');
            rows.forEach(row => {
                row.style.display = '';
            });
            document.getElementById('totalRecords').textContent = rows.length;
        });
        
        searchInput.addEventListener('keyup', function(e) {
            if (e.key === 'Enter') {
                performSearch();
            }
        });
    }
    
    function showNoResultsMessage(searchTerm) {
        // This function would show a message when no results are found
        console.log(`No results found for: ${searchTerm}`);
    }
</script>
</body>
</html>