<%-- 
    Document   : dasboard
    Created on : 1 Dec, 2025, 10:22:14 AM
    Author     : jones
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Dashboard</title>

  <style>
    :root{
      --nav-bg: rgba(0,0,0,0.55);
      --menu-bg: rgba(58,137,255,0.79);
      --accent: rgba(13,113,201,0.855);
      --panel-bg: rgba(255,255,255,0.06);
      --glass-border: rgba(255,255,255,0.08);
    }

    html, body { 
      height: 100%; 
      margin: 0; 
      opacity: 0;
      animation: pageFadeIn 0.6s ease-out forwards;
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
      animation: bgZoom 20s ease-in-out infinite alternate;
    }
    
    /* Subtle background zoom animation */
    @keyframes bgZoom {
      0% { transform: scale(1); }
      100% { transform: scale(1.05); }
    }

    .bg-tint {
      position: fixed;
      inset: 0;
      z-index: -1;
      pointer-events: none;
      background:
        radial-gradient(60% 40% at 20% 35%, rgba(10,90,140,0.18), transparent 20%),
        linear-gradient(180deg, rgba(4,8,20,0.45), rgba(3,6,12,0.55));
      animation: tintPulse 15s ease-in-out infinite alternate;
    }
    
    /* Subtle background tint pulse */
    @keyframes tintPulse {
      0% { opacity: 0.95; }
      100% { opacity: 1; }
    }

    @media (max-width: 768px){ .bg-img { object-position: top center; } }

    /* NAVBAR */
    .navbar-custom {
      background-color: var(--nav-bg);
      border-radius: 8px;
      padding: .35rem .5rem;
      margin: 10px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      position: relative;
      z-index: 3;
      animation: navbarSlideDown 0.5s ease-out 0.2s both;
    }
    
    /* Navbar slide down animation */
    @keyframes navbarSlideDown {
      from {
        transform: translateY(-20px);
        opacity: 0;
      }
      to {
        transform: translateY(0);
        opacity: 1;
      }
    }

    .navbar-brand {
      color: #fff;
      text-decoration: none;
      font-weight: 500;
      font-size: 1.25rem;
      padding: 0.25rem 0.5rem;
      transition: color 0.2s ease;
    }
    
    .navbar-brand:hover {
      color: rgba(255, 255, 255, 0.9);
    }

    .navbar-toggle {
      display: none;
      background: transparent;
      border: none;
      color: #fff;
      font-size: 1.5rem;
      cursor: pointer;
      padding: 0.5rem;
      transition: transform 0.3s ease;
    }
    
    .navbar-toggle:hover {
      transform: scale(1.1);
    }

    .navbar-collapse {
      display: flex;
      align-items: center;
      gap: 0.5rem;
    }

    .navbar-nav {
      display: flex;
      list-style: none;
      margin: 0;
      padding: 0;
      align-items: center;
      gap: 0.25rem;
    }

    .nav-item { 
      position: relative; 
      animation: navItemFade 0.5s ease-out forwards;
      opacity: 0;
      transform: translateY(5px);
    }
    
    /* Staggered animation for nav items */
    .nav-item:nth-child(1) { animation-delay: 0.3s; }
    .nav-item:nth-child(2) { animation-delay: 0.35s; }
    .nav-item:nth-child(3) { animation-delay: 0.4s; }
    .nav-item:nth-child(4) { animation-delay: 0.45s; }
    .nav-item:nth-child(5) { animation-delay: 0.5s; }
    .nav-item:nth-child(6) { animation-delay: 0.55s; }
    .nav-item:nth-child(7) { animation-delay: 0.6s; }
    
    @keyframes navItemFade {
      from {
        opacity: 0;
        transform: translateY(5px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }
    
    .nav-link {
      color: #fff;
      text-decoration: none;
      padding: 0.25rem 0.6rem;
      display: block;
      border-radius: .35rem;
      transition: all 0.25s ease;
      position: relative;
    }

    .nav-link:hover { 
      background-color: var(--accent); 
      color: #fff; 
      transform: translateY(-1px);
    }
    .nav-link.active { 
      background-color: rgba(255,255,255,0.06); 
    }
    
    /* Active link indicator */
    .nav-link.active::after {
      content: '';
      position: absolute;
      bottom: -2px;
      left: 15%;
      width: 70%;
      height: 2px;
      background-color: rgba(255, 255, 255, 0.5);
      border-radius: 1px;
      animation: activePulse 2s ease-in-out infinite;
    }
    
    @keyframes activePulse {
      0%, 100% { opacity: 0.5; }
      50% { opacity: 1; }
    }

    /* Dropdown */
    .dropdown { position: relative; }
    .dropdown-toggle { 
      cursor: pointer; 
      display:flex; 
      align-items:center; 
      transition: all 0.2s ease;
    }
    .dropdown-toggle::after {
      content: "▼";
      font-size: 0.7rem;
      margin-left: 0.25rem;
      transition: transform 0.2s;
    }
    .dropdown.active .dropdown-toggle::after { transform: rotate(180deg); }

    .dropdown-menu {
      position: absolute;
      top: 100%;
      left: 0;
      background-color: var(--menu-bg);
      min-width: 180px;
      border-radius: 4px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.15);
      padding: 0.5rem 0;
      list-style: none;
      margin: 0;
      z-index: 1000;
      display: none;
      animation: dropdownFade 0.2s ease-out;
    }
    
    @keyframes dropdownFade {
      from {
        opacity: 0;
        transform: translateY(-5px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }
    
    .dropdown.active .dropdown-menu { display: block; }
    .dropdown-item {
      color: #fff;
      text-decoration: none;
      padding: 0.5rem 1rem;
      display: block;
      transition: all 0.18s ease;
    }
    .dropdown-item:hover { 
      background-color: var(--accent); 
      color: #fff;
      padding-left: 1.25rem;
    }
    .dropdown-divider { 
      height: 1px; 
      background-color: rgba(255,255,255,0.2); 
      margin: 0.5rem 0; 
      border: none; 
    }

    /* MOBILE */
    @media (max-width: 992px) {
      .navbar-toggle { display: block; }
      .navbar-collapse {
        position: absolute;
        top: 100%;
        left: 0;
        right: 0;
        background-color: var(--nav-bg);
        border-radius: 8px;
        margin: 0 10px;
        padding: 1rem;
        display: none;
        flex-direction: column;
        align-items: flex-start;
        animation: mobileMenuSlide 0.3s ease-out;
      }
      
      @keyframes mobileMenuSlide {
        from {
          opacity: 0;
          transform: translateY(-10px);
        }
        to {
          opacity: 1;
          transform: translateY(0);
        }
      }
      
      .navbar-collapse.active { display: flex; }
      .navbar-nav { flex-direction: column; width: 100%; align-items: flex-start; }
      .nav-item { width: 100%; margin: 0.25rem 0; }
      .nav-link { width: 100%; padding: 0.5rem 0.75rem; }
      .dropdown-menu {
        position: static;
        background-color: rgba(0,0,0,0.3);
        box-shadow: none;
        width: 100%;
        margin-top: 0.25rem;
        display: none;
        animation: none;
      }
      .dropdown.active .dropdown-menu { display:block; }
    }

    .main-container { 
      position: relative; 
      z-index: 3; 
      margin-top: 8px; 
      padding-left: 12px; 
      padding-right: 12px; 
      animation: contentFadeIn 0.7s ease-out 0.4s both;
    }
    
    @keyframes contentFadeIn {
      from {
        opacity: 0;
      }
      to {
        opacity: 1;
      }
    }
    
    .main-grid {
      max-width: 1200px;
      margin: 0 auto;
      display: grid;
      grid-template-columns: auto 1fr; /* left auto-width, right flexible */
      gap: 1rem;
      align-items: start;
    }

    /* summary column (left) - we want the box to size to content */
    .summary-col {
      display: flex;
      align-items: center;
      justify-content: flex-start;
      animation: panelSlideIn 0.6s ease-out 0.5s both;
    }
    
    @keyframes panelSlideIn {
      from {
        opacity: 0;
        transform: translateX(-20px);
      }
      to {
        opacity: 1;
        transform: translateX(0);
      }
    }

    /* Left summary panel (glass + shrink-to-fit) */
    .summary-panel {
      display: inline-block;   /* shrink to content width */
      background: linear-gradient(180deg, rgba(255,255,255,0.03), rgba(255,255,255,0.02));
      border-radius: 12px;
      padding: 1.0rem 1.25rem;
      color: #f8fafc;
      box-shadow: 0 10px 30px rgba(2,6,23,0.6);
      border: 1px solid var(--glass-border);
      min-height: 0;
      line-height: 1.5;
      backdrop-filter: blur(8px) saturate(1.05);
      transition: transform .22s cubic-bezier(.2,.9,.2,1), box-shadow .3s ease;
      overflow: visible;
      text-align: justify;
      max-width: 90vw;
      position: relative;
    }

    .summary-panel::before{
      content: "";
      position: absolute;
      z-index: -1;
      left: -20%;
      top: -30%;
      width: 220%;
      height: 200%;
      background: radial-gradient(600px 300px at 12% 35%, rgba(20,120,210,0.08), transparent 16%),
                  radial-gradient(300px 160px at 40% 70%, rgba(120,90,220,0.03), transparent 10%);
      filter: blur(20px);
      pointer-events: none;
      border-radius: inherit;
      animation: glowMove 8s ease-in-out infinite alternate;
    }
    
    @keyframes glowMove {
      0% {
        transform: translate(0, 0);
      }
      100% {
        transform: translate(10px, 10px);
      }
    }

    .summary-panel p { 
      margin: 0; 
      font-size: 1rem; 
      color: #e6eef8; 
      max-width: 22rem;
      animation: textReveal 0.8s ease-out 0.7s both;
    }
    
    @keyframes textReveal {
      from {
        opacity: 0;
        transform: translateY(10px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    .summary-panel:hover { 
      transform: translateY(-6px) scale(1.01);
      box-shadow: 0 15px 40px rgba(2,6,23,0.7);
    }

    /* sticky behaviour: only on wider screens keep sticky and vertically centered */
    @media (min-width: 768px){
      .summary-sticky { position: sticky; top: calc(50vh - 110px); align-self: start; }
    }

    /* SMALL SCREENS: stack, center the box and make width depend on content */
    @media (max-width: 767px){
      .main-grid { grid-template-columns: 1fr; }
      .summary-col { 
        justify-content: center; 
        margin-top: 1.5rem;
        animation: panelSlideUp 0.6s ease-out 0.5s both;
      }
      
      @keyframes panelSlideUp {
        from {
          opacity: 0;
          transform: translateY(20px);
        }
        to {
          opacity: 1;
          transform: translateY(0);
        }
      }
      
      .summary-panel { margin: 0 auto; display: inline-block; }
      /* keep the dropdown behavior intact on mobile */
    }

    /* ensure dropdown items take full width on mobile */
    .dropdown-menu .dropdown-item { display: block; width: 100%; }
  </style>
</head>
<body>

  <img class="bg-img" src="./p3.webp" alt="Background image">
  <div class="bg-tint"></div>

  <!-- NAVBAR -->
  <nav class="navbar-custom main-container" aria-label="Main navigation">
    <a class="navbar-brand" href="index.html">Dashboard</a>

    <button class="navbar-toggle" id="mobileToggle" aria-label="Toggle navigation">☰</button>

    <div class="navbar-collapse" id="navbarMenu">
      <ul class="navbar-nav">
        <!-- keep dropdown minimal: only Home & Requirements -->
        <li class="nav-item dropdown" id="mainMenuDropdown">
          
        </li>

        <!-- App-level links, outside dropdown (single row, no duplicates) -->
        <li class="nav-item"><a class="nav-link" href="uniquehome.jsp">Unique ID</a></li>
        <li class="nav-item"><a class="nav-link" href="Authentication3.jsp">Register</a></li>
        <li class="nav-item"><a class="nav-link" href="Authentication4.jsp">Doctor Consult</a></li>
        <li class="nav-item"><a class="nav-link" href="paymentid.jsp">Payments</a></li>
        <li class="nav-item"><a class="nav-link" href="reportview.jsp">Reports View</a></li>
        <li class="nav-item"><a class="nav-link" href="doctoradmin.jsp">Secret</a></li>
 
      </ul>
    </div>
  </nav>

  <!-- MAIN: left summary box (shrink-to-content) + main content -->
  <main class="container main-container py-4">
    <div class="main-grid">
      <!-- LEFT: narrow auto-width summary column -->
      <aside class="summary-col summary-sticky" style="position:relative;">
        <div class="summary-panel">
          <p>
            Welcome to the dashboard — your central place to register patients, search records, manage insurance,
            and process payments. Use the Main Menu above to navigate; the main area on the right will display tools
            and details as you work. This panel is intentionally minimal to keep focus on action and clarity.
          </p>
        </div>
      </aside>

      <!-- RIGHT: main content area (flexible) -->
      <section class="main-content" role="main">
        <!-- intentionally empty — fill with your tools/pages -->
      </section>
    </div>
  </main>

  <script>
    document.addEventListener('DOMContentLoaded', function () {
      const mobileToggle = document.getElementById('mobileToggle');
      const navbarMenu = document.getElementById('navbarMenu');
      const dropdown = document.getElementById('mainMenuDropdown');
      const dropdownToggle = document.querySelector('#menuDropdown');

      // Current page detection
      const currentPage = window.location.pathname.split('/').pop() || 'index.html';

      // mark active states (dropdown items and external links)
      document.querySelectorAll('.dropdown-item').forEach(item => {
        const href = item.getAttribute('href');
        if (href === currentPage) item.classList.add('active');
        else item.classList.remove('active');
      });
      document.querySelectorAll('.nav-item:not(.dropdown) .nav-link').forEach(item => {
        const href = item.getAttribute('href');
        if (href === currentPage) item.classList.add('active');
        else item.classList.remove('active');
      });

      // Mobile menu toggle
      mobileToggle.addEventListener('click', function(e) {
        e.stopPropagation();
        navbarMenu.classList.toggle('active');
        mobileToggle.textContent = navbarMenu.classList.contains('active') ? '✕' : '☰';
        // Add subtle animation to toggle button
        mobileToggle.style.transform = 'scale(0.95)';
        setTimeout(() => {
          mobileToggle.style.transform = '';
        }, 150);
      });

      // Dropdown toggle
      if (dropdownToggle) {
        dropdownToggle.addEventListener('click', function(e) {
          e.preventDefault();
          e.stopPropagation();
          dropdown.classList.toggle('active');
        });
      }

      // Close dropdown/menu when clicking outside
      document.addEventListener('click', function(e) {
        if (dropdown && !dropdown.contains(e.target)) {
          dropdown.classList.remove('active');
        }
        if (window.innerWidth <= 992 && !navbarMenu.contains(e.target) && !mobileToggle.contains(e.target)) {
          navbarMenu.classList.remove('active');
          mobileToggle.textContent = '☰';
        }
      });

      // handle clicks for dropdown items (navigate and set active)
      document.querySelectorAll('.dropdown-item').forEach(function(item) {
        item.addEventListener('click', function(e) {
          const href = this.getAttribute('href');
          if (href && href !== '#') {
            document.querySelectorAll('.dropdown-item').forEach(i => i.classList.remove('active'));
            this.classList.add('active');
            if (window.innerWidth <= 992) {
              navbarMenu.classList.remove('active');
              mobileToggle.textContent = '☰';
            }
            dropdown.classList.remove('active');
            // Add page transition effect
            document.body.style.opacity = '0.7';
            document.body.style.transition = 'opacity 0.2s ease';
            setTimeout(() => {
              window.location.href = href;
            }, 150);
          }
        });
      });

      // handle clicks for the top-row nav links (outside dropdown)
      document.querySelectorAll('.nav-item:not(.dropdown) .nav-link').forEach(function(item) {
        item.addEventListener('click', function(e) {
          const href = this.getAttribute('href');
          if (href && href !== '#') {
            document.querySelectorAll('.nav-item:not(.dropdown) .nav-link').forEach(i => i.classList.remove('active'));
            this.classList.add('active');
            document.querySelectorAll('.dropdown-item').forEach(i => i.classList.remove('active'));
            if (window.innerWidth <= 992) {
              navbarMenu.classList.remove('active');
              mobileToggle.textContent = '☰';
            }
            // Add page transition effect
            document.body.style.opacity = '0.7';
            document.body.style.transition = 'opacity 0.2s ease';
            setTimeout(() => {
              window.location.href = href;
            }, 150);
          }
        });
      });

      // Close dropdown on Escape
      document.addEventListener('keydown', function(e) {
        if (e.key === 'Escape') {
          if (dropdown) dropdown.classList.remove('active');
          if (window.innerWidth <= 992) {
            navbarMenu.classList.remove('active');
            mobileToggle.textContent = '☰';
          }
        }
      });
      
      // Add hover effect to navbar items
      document.querySelectorAll('.nav-link').forEach(link => {
        link.addEventListener('mouseenter', function() {
          this.style.transform = 'translateY(-1px)';
        });
        link.addEventListener('mouseleave', function() {
          if (!this.classList.contains('active')) {
            this.style.transform = 'translateY(0)';
          }
        });
      });
    });
  </script>
</body>
</html>