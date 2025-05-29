
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

        /* Reset and Base Styles */
        :root {
            --primary-color: #3a36db;
            --primary-light: #f0f0ff;
            --secondary-color: #6c757d;
            --dark-bg: #1e1e2d;
            --sidebar-width: 240px;
            --light-gray: #f8f9fa;
            --border-color: #e9ecef;
            --text-color: #212529;
            --success-color: #28a745;
            --danger-color: #dc3545;
            --warning-color: #ffc107;
            --info-color: #17a2b8;

            /* Card Colors */
            --blue-bg: #e7f1ff;
            --blue-icon: #0d6efd;
            --green-bg: #e7fff1;
            --green-icon: #00b57d;
            --orange-bg: #fff7e7;
            --orange-icon: #ff9800;
            --purple-bg: #f7e7ff;
            --purple-icon: #6f42c1;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            min-height: 100vh;
            color: #333;
            overflow-x: hidden;
        }


        /* Sidebar Styles */
        .sidebar {
            width: var(--sidebar-width);
            background-color: var(--dark-bg);
            color: white;
            position: fixed;
            height: 100%;
            overflow-y: auto;
            transition: all 0.3s ease;
            z-index: 10;
        }

        .logo {
            display: flex;
            align-items: center;
            padding: 20px;
            height: 70px;
            background-color: rgba(0, 0, 0, 0.1);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .logo i {
            font-size: 20px;
            margin-right: 10px;
        }

        .logo span {
            font-size: 16px;
            font-weight: 600;
        }

        .nav-links {
            list-style: none;
            padding: 10px 0;
        }

        .nav-links li {
            margin-bottom: 5px;
        }

        .nav-links li a {
            display: flex;
            align-items: center;
            padding: 12px 20px;
            color: rgba(255, 255, 255, 0.7);
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .nav-links li a:hover,
        .nav-links li.active a {
            color: white;
            background-color: rgba(255, 255, 255, 0.1);
        }

        .nav-links li a i {
            font-size: 16px;
            margin-right: 10px;
            width: 20px;
            text-align: center;
        }

    </style>
</head>
<body>
<!-- Sidebar -->
<div class="sidebar">
    <div class="logo">
        <i class="fas fa-graduation-cap"></i>
        <span>College Admin</span>
    </div>
    <ul class="nav-links">
        <li>
            <a href="<%= request.getContextPath()%>/views/admin/dashboard.jsp">
                <i class="fas fa-chart-line"></i>
                <span>Dashboard</span>
            </a>
        </li>
        <li>
            <a href="<%= request.getContextPath()%>/views/admin/add-event.jsp">
                <i class="fas fa-clipboard-list"></i>
                <span>Add Event</span>
            </a>
        </li>
        <li>
            <a href="<%= request.getContextPath()%>/ListEventServlet">
                <i class="fas fa-calendar-alt"></i>
                <span>Total Events</span>
            </a>
        </li>
        <li class="active">
            <a href="<%= request.getContextPath()%>/views/admin/event-registrations.jsp">
                <i class="fas fa-clipboard-list"></i>
                <span>Registrations</span>
            </a>
        </li>
        <li>
            <a href="<%= request.getContextPath()%>/ListUserServlet">
                <i class="fas fa-user-friends"></i>
                <span>Users</span>
            </a>
        </li>
        <li>
            <a href="<%= request.getContextPath()%>/LogoutServlet">
                <i class="fas fa-sign-out-alt"></i>
                <span>Logout</span>
            </a>
        </li>
        <li>
    </ul>
</div>
</body>
</html>
