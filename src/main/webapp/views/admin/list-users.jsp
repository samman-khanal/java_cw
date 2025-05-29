
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CEMS - Admin Dashboard</title>
    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/styles/admin/dashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
</head>
<body>
<div class="main-container">
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="logo">
            <i class="fas fa-graduation-cap"></i>
            <span>College Admin</span>
        </div>
        <ul class="nav-links">
            <li class="active">
                <a href="<%= request.getContextPath()%>">
                    <i class="fas fa-chart-line"></i>
                    <span>Dashboard</span>
                </a>
            </li>
            <li>
                <a href="<%= request.getContextPath()%>">
                    <i class="fas fa-calendar-alt"></i>
                    <span>Events</span>
                </a>
            </li>
            <li>
                <a href="<%= request.getContextPath()%>">
                    <i class="fas fa-clipboard-list"></i>
                    <span>Registrations</span>
                </a>
            </li>
            <li>
                <a href="<%= request.getContextPath()%>">
                    <i class="fas fa-user-friends"></i>
                    <span>Users</span>
                </a>
            </li>
            <li>
                <a href="<%= request.getContextPath()%>">
                    <i class="fas fa-cog"></i>
                    <span>Settings</span>
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
</div>
</body>
</html>
