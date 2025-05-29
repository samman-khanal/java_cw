<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Event</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/styles/admin/add-event.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
</head>
<body>
<div class="container">
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
        <li class="active">
            <a href="<%= request.getContextPath()%>/views/admin/add-event.jsp">
                <i class="fas fa-clipboard-list"></i>
                <span>Add Event</span>
            </a>
        </li>
        <li>
            <a href="<%= request.getContextPath()%>/views/admin/list-events.jsp">
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
            <a href="<%= request.getContextPath()%>/views/admin/list-users.jsp">
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

<div class="doom-container">
    <div class="contact-form-container">
        <h1>Add a New Event</h1>
        <p>Enter the details below to create a new event.</p>


        <form action="${pageContext.request.contextPath}/AddEventServlet" method="post">
            <div class="form-group">
                <label for="name">Event Name :</label>
                <input type="text" id="name" name="name" placeholder="Enter the event name" required>
            </div>

            <div class="form-group">
                <label for="email">Event Location :</label>
                <input type="text" id="location" name="location" placeholder="Enter the event location" required>
            </div>

            <div class="form-group">
                <label for="phone">Event Time :</label>
                <input type="time" id="time" name="time" placeholder="02:00 PM">
            </div>

            <div class="form-group">
                <label for="address">Event Date :</label>
                <input type="date" id="date" name="date" placeholder="YYYY-MM-DD">
            </div>

            <div class="form-group">
                <label for="address">Event Category :</label>
                <input type="text" id="category" name="category" placeholder="Enter the event category">
            </div>

            <div class="form-group">
                <label for="description">Description :</label>
                <textarea id="description" name="description" placeholder="Enter the event description" required></textarea>
            </div>

            <button type="submit">
                Add Event
            </button>
        </form>
    </div>
</div>
</div>
</body>
</html>
