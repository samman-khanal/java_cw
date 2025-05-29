<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ page import="java.util.List" %>--%>
<%--<%@ page import="model.EventModel" %>--%>

<%--<html>--%>
<%--<head>--%>
<%--    <title>Event List</title>--%>
<%--&lt;%&ndash;    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/styles/admin/list-events.css">&ndash;%&gt;--%>
<%--    <style>--%>
<%--        body {--%>
<%--            font-family: Arial, sans-serif;--%>
<%--            margin: 20px;--%>
<%--        }--%>
<%--        .container {--%>
<%--            max-width: 1200px;--%>
<%--            margin: 0 auto;--%>
<%--        }--%>
<%--        table {--%>
<%--            width: 100%;--%>
<%--            border-collapse: collapse;--%>
<%--            margin-top: 20px;--%>
<%--        }--%>
<%--        table, th, td {--%>
<%--            border: 1px solid #ddd;--%>
<%--        }--%>
<%--        th, td {--%>
<%--            padding: 10px;--%>
<%--            text-align: left;--%>
<%--        }--%>
<%--        th {--%>
<%--            background-color: #f4f4f4;--%>
<%--        }--%>
<%--        tr:nth-child(even) {--%>
<%--            background-color: #f9f9f9;--%>
<%--        }--%>
<%--        .no-events {--%>
<%--            text-align: center;--%>
<%--            color: #b3b3b3;--%>
<%--            font-size: 18px;--%>
<%--            margin-top: 20px;--%>
<%--        }--%>
<%--        .actions a {--%>
<%--            color: #007BFF;--%>
<%--            text-decoration: none;--%>
<%--            margin-right: 10px;--%>
<%--        }--%>
<%--        .actions a:hover {--%>
<%--            text-decoration: underline;--%>
<%--        }--%>
<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="container">--%>
<%--    <h1>Event List</h1>--%>

<%--    <table>--%>
<%--        <thead>--%>
<%--        <tr>--%>
<%--            <th>Event ID</th>--%>
<%--            <th>Name</th>--%>
<%--            <th>Description</th>--%>
<%--            <th>Location</th>--%>
<%--            <th>Date</th>--%>
<%--            <th>Time</th>--%>
<%--            <th>Category</th>--%>
<%--            <th>Actions</th>--%>
<%--        </tr>--%>
<%--        </thead>--%>
<%--        <tbody>--%>
<%--        <%--%>
<%--            List<EventModel> events = (List<EventModel>) request.getAttribute("allEvents");--%>
<%--            if (events != null && !events.isEmpty()) {--%>
<%--                for (EventModel event : events) {--%>
<%--        %>--%>
<%--        <tr>--%>
<%--            <td><%= event.getId() %></td>--%>
<%--            <td><%= event.getName() %></td>--%>
<%--            <td><%= event.getDescription() %></td>--%>
<%--            <td><%= event.getLocation() %></td>--%>
<%--            <td><%= event.getDate() %></td>--%>
<%--            <td><%= event.getTime() %></td>--%>
<%--            <td><%= event.getCategory() %></td>--%>
<%--            <td class="actions">--%>
<%--                <a href="${pageContext.request.contextPath}/EditEventServlet?id=<%= event.getId() %>">Edit</a>--%>
<%--                <a href="${pageContext.request.contextPath}/DeleteEventServlet?id=<%= event.getId() %>" --%>
<%--                   onclick="return confirm('Are you sure you want to delete this event?')">Delete</a>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        <%--%>
<%--                }--%>
<%--            } else {--%>
<%--        %>--%>
<%--        <tr>--%>
<%--            <td colspan="8" class="no-events">No events found.</td>--%>
<%--        </tr>--%>
<%--        <%--%>
<%--            }--%>
<%--        %>--%>
<%--        </tbody>--%>
<%--    </table>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>


<!--new code-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.EventModel" %>

<html>
<head>
    <title>Event Management Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            min-height: 100vh;
            color: #333;
            overflow-x: hidden;
        }

        .animated-bg {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            opacity: 0.1;
        }

        .floating-shapes {
            position: absolute;
            width: 100%;
            height: 100%;
        }

        .shape {
            position: absolute;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 50%;
            animation: float 6s ease-in-out infinite;
        }

        .shape:nth-child(1) {
            width: 80px;
            height: 80px;
            top: 20%;
            left: 10%;
            animation-delay: 0s;
        }

        .shape:nth-child(2) {
            width: 120px;
            height: 120px;
            top: 60%;
            right: 15%;
            animation-delay: 2s;
        }

        .shape:nth-child(3) {
            width: 60px;
            height: 60px;
            bottom: 20%;
            left: 20%;
            animation-delay: 4s;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-20px) rotate(180deg); }
        }

        .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 40px 20px;
            position: relative;
            z-index: 1;
        }

        .header {
            text-align: center;
            margin-bottom: 50px;
            position: relative;
        }

        .header h1 {
            font-size: 3.5rem;
            font-weight: 800;
            /*background: linear-gradient(45deg, #fff, #f0f0f0);*/
            -webkit-background-clip: text;
            /*-webkit-text-fill-color: transparent;*/
            /*background-clip: text;*/
            margin-bottom: 10px;
            text-shadow: 0 4px 20px rgba(0,0,0,0.3);
            animation: slideDown 1s ease-out;
        }

        .header p {
            color: rgba(255, 255, 255, 0.8);
            font-size: 1.2rem;
            font-weight: 300;
            animation: slideUp 1s ease-out 0.3s both;
        }

        @keyframes slideDown {
            from { opacity: 0; transform: translateY(-50px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes slideUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .stats-bar {
            display: flex;
            justify-content: center;
            gap: 30px;
            margin-bottom: 40px;
            animation: fadeIn 1s ease-out 0.6s both;
        }

        .stat-card {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 20px;
            padding: 20px 30px;
            text-align: center;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .stat-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
            transition: left 0.6s ease;
        }

        .stat-card:hover::before {
            left: 100%;
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 40px rgba(0,0,0,0.2);
        }

        .stat-number {
            font-size: 2rem;
            font-weight: 700;
            color: #fff;
            display: block;
        }

        .stat-label {
            color: rgba(255, 255, 255, 0.8);
            font-size: 0.9rem;
            margin-top: 5px;
        }

        .search-filter-bar {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 25px;
            padding: 20px 30px;
            margin-bottom: 30px;
            display: flex;
            gap: 20px;
            align-items: center;
            flex-wrap: wrap;
            animation: slideIn 1s ease-out 0.9s both;
        }

        @keyframes slideIn {
            from { opacity: 0; transform: translateX(-100px); }
            to { opacity: 1; transform: translateX(0); }
        }

        .search-box {
            flex: 1;
            min-width: 300px;
            position: relative;
        }

        .search-box input {
            width: 100%;
            padding: 15px 50px 15px 20px;
            border: none;
            border-radius: 15px;
            background: rgba(255, 255, 255, 0.9);
            font-size: 1rem;
            transition: all 0.3s ease;
            outline: none;
        }

        .search-box input:focus {
            box-shadow: 0 0 20px rgba(255,255,255,0.3);
            transform: scale(1.02);
        }

        .search-box i {
            position: absolute;
            right: 20px;
            top: 50%;
            transform: translateY(-50%);
            color: #666;
        }

        .filter-buttons {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }

        .filter-btn {
            padding: 10px 20px;
            border: 2px solid rgba(255, 255, 255, 0.3);
            background: transparent;
            color: rgba(255, 255, 255, 0.9);
            border-radius: 25px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-weight: 500;
        }

        .filter-btn:hover, .filter-btn.active {
            background: rgba(255, 255, 255, 0.2);
            border-color: rgba(255, 255, 255, 0.6);
            transform: translateY(-2px);
        }

        .events-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(380px, 1fr));
            gap: 25px;
            animation: fadeInUp 1s ease-out 1.2s both;
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(50px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .event-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 25px;
            padding: 30px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            position: relative;
            overflow: hidden;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .event-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(45deg, #667eea, #764ba2, #f093fb, #f5576c);
            background-size: 300% 300%;
            animation: gradientShift 3s ease infinite;
        }

        @keyframes gradientShift {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .event-card:hover {
            transform: translateY(-10px) scale(1.02);
            box-shadow: 0 25px 50px rgba(0,0,0,0.2);
        }

        .event-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 20px;
        }

        .event-id {
            background: linear-gradient(45deg, #667eea, #764ba2);
            color: white;
            padding: 8px 16px;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 600;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
        }

        .event-category {
            background: rgba(102, 126, 234, 0.1);
            color: #667eea;
            padding: 6px 14px;
            border-radius: 15px;
            font-size: 0.8rem;
            font-weight: 500;
            border: 1px solid rgba(102, 126, 234, 0.2);
        }

        .event-title {
            font-size: 1.4rem;
            font-weight: 700;
            color: #2d3748;
            margin-bottom: 12px;
            line-height: 1.3;
        }

        .event-description {
            color: #666;
            font-size: 0.95rem;
            line-height: 1.6;
            margin-bottom: 20px;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .event-details {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
            margin-bottom: 25px;
        }

        .detail-item {
            display: flex;
            align-items: center;
            gap: 10px;
            color: #555;
            font-size: 0.9rem;
        }

        .detail-item i {
            width: 20px;
            color: #667eea;
            font-size: 1.1rem;
        }

        .event-actions {
            display: flex;
            gap: 12px;
            justify-content: flex-end;
        }

        .action-btn {
            padding: 12px 24px;
            border: none;
            border-radius: 15px;
            font-weight: 600;
            font-size: 0.9rem;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            position: relative;
            overflow: hidden;
        }

        .edit-btn {
            background: linear-gradient(45deg, #4facfe, #00f2fe);
            color: white;
            box-shadow: 0 4px 15px rgba(79, 172, 254, 0.3);
        }

        .edit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(79, 172, 254, 0.4);
        }

        .delete-btn {
            background: linear-gradient(45deg, #ff6b6b, #ee5a24);
            color: white;
            box-shadow: 0 4px 15px rgba(255, 107, 107, 0.3);
        }

        .delete-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(255, 107, 107, 0.4);
        }

        .no-events {
            grid-column: 1 / -1;
            text-align: center;
            padding: 80px 20px;
            color: rgba(255, 255, 255, 0.8);
            font-size: 1.3rem;
        }

        .no-events i {
            font-size: 4rem;
            margin-bottom: 20px;
            opacity: 0.5;
        }

        .add-event-btn {
            position: fixed;
            bottom: 30px;
            right: 30px;
            width: 65px;
            height: 65px;
            background: linear-gradient(45deg, #667eea, #764ba2);
            border: none;
            border-radius: 50%;
            color: white;
            font-size: 1.5rem;
            cursor: pointer;
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.4);
            transition: all 0.3s ease;
            z-index: 1000;
        }

        .add-event-btn:hover {
            transform: scale(1.1) rotate(90deg);
            box-shadow: 0 12px 35px rgba(102, 126, 234, 0.6);
        }

        @media (max-width: 768px) {
            .container {
                padding: 20px 15px;
            }

            .header h1 {
                font-size: 2.5rem;
            }

            .events-grid {
                grid-template-columns: 1fr;
            }

            .search-filter-bar {
                flex-direction: column;
                align-items: stretch;
            }

            .stats-bar {
                flex-direction: column;
                gap: 15px;
            }

            .event-details {
                grid-template-columns: 1fr;
                gap: 10px;
            }
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .loading {
            display: none;
            text-align: center;
            padding: 40px;
            color: rgba(255, 255, 255, 0.8);
        }

        .loading.show {
            display: block;
        }

        .spinner {
            width: 40px;
            height: 40px;
            border: 4px solid rgba(255, 255, 255, 0.1);
            border-left: 4px solid rgba(255, 255, 255, 0.8);
            border-radius: 50%;
            animation: spin 1s linear infinite;
            margin: 0 auto 20px;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>
</head>
<body>
<div class="animated-bg">
    <div class="floating-shapes">
        <div class="shape"></div>
        <div class="shape"></div>
        <div class="shape"></div>
    </div>
</div>

<div class="container">
    <div class="header">
        <h1><i class="fas fa-calendar-alt"></i> Event Management Dashboard</h1>
        <p>Manage and organize your events with style</p>
    </div>

    <div class="stats-bar">
        <div class="stat-card">
            <span class="stat-number" id="totalEvents">0</span>
            <div class="stat-label">Total Events</div>
        </div>
        <div class="stat-card">
            <span class="stat-number" id="activeEvents">0</span>
            <div class="stat-label">Active Events</div>
        </div>
        <div class="stat-card">
            <span class="stat-number" id="categories">0</span>
            <div class="stat-label">Categories</div>
        </div>
    </div>

    <div class="search-filter-bar">
        <div class="search-box">
            <input type="text" id="searchInput" placeholder="Search events by name, location, or category..." />
            <i class="fas fa-search"></i>
        </div>
        <div class="filter-buttons">
            <button class="filter-btn active" onclick="filterEvents('all')">All</button>
            <button class="filter-btn" onclick="filterEvents('today')">Today</button>
            <button class="filter-btn" onclick="filterEvents('upcoming')">Upcoming</button>
            <button class="filter-btn" onclick="filterEvents('past')">Past</button>
        </div>
    </div>

    <div class="loading" id="loading">
        <div class="spinner"></div>
        <p>Loading events...</p>
    </div>

    <div class="events-grid" id="eventsGrid">
        <%
            List<EventModel> events = (List<EventModel>) request.getAttribute("allEvents");
            if (events != null && !events.isEmpty()) {
                for (EventModel event : events) {
        %>
        <div class="event-card" data-category="<%= event.getCategory() %>" data-date="<%= event.getDate() %>">
            <div class="event-header">
                <div class="event-id">#<%= event.getId() %></div>
                <div class="event-category"><%= event.getCategory() %></div>
            </div>

            <h3 class="event-title"><%= event.getName() %></h3>
            <p class="event-description"><%= event.getDescription() %></p>

            <div class="event-details">
                <div class="detail-item">
                    <i class="fas fa-map-marker-alt"></i>
                    <span><%= event.getLocation() %></span>
                </div>
                <div class="detail-item">
                    <i class="fas fa-calendar"></i>
                    <span><%= event.getDate() %></span>
                </div>
                <div class="detail-item">
                    <i class="fas fa-clock"></i>
                    <span><%= event.getTime() %></span>
                </div>
                <div class="detail-item">
                    <i class="fas fa-tag"></i>
                    <span><%= event.getCategory() %></span>
                </div>
            </div>

            <div class="event-actions">
                <a href="${pageContext.request.contextPath}/EditEventServlet?id=<%= event.getId() %>" class="action-btn edit-btn">
                    <i class="fas fa-edit"></i> Edit
                </a>
                <a href="${pageContext.request.contextPath}/DeleteEventServlet?id=<%= event.getId() %>"
                   class="action-btn delete-btn"
                   onclick="return confirmDelete('<%= event.getName() %>')">
                    <i class="fas fa-trash"></i> Delete
                </a>
            </div>
        </div>
        <%
            }
        } else {
        %>
        <div class="no-events">
            <i class="fas fa-calendar-times"></i>
            <h3>No events found</h3>
            <p>Start by creating your first event!</p>
        </div>
        <%
            }
        %>
    </div>
</div>

<button class="add-event-btn" onclick="addNewEvent()" title="Add New Event">
    <i class="fas fa-plus"></i>
</button>

<script>
    // Initialize dashboard
    document.addEventListener('DOMContentLoaded', function() {
        calculateStats();
        initializeSearch();
        animateCards();
    });

    function calculateStats() {
        const eventCards = document.querySelectorAll('.event-card');
        const totalEvents = eventCards.length;
        const categories = new Set();
        let activeEvents = 0;
        const today = new Date().toISOString().split('T')[0];

        eventCards.forEach(card => {
            const category = card.dataset.category;
            const eventDate = card.dataset.date;

            if (category) categories.add(category);
            if (eventDate >= today) activeEvents++;
        });

        // Animate counters
        animateCounter('totalEvents', totalEvents);
        animateCounter('activeEvents', activeEvents);
        animateCounter('categories', categories.size);
    }

    function animateCounter(id, target) {
        const element = document.getElementById(id);
        let current = 0;
        const increment = target / 30;
        const timer = setInterval(() => {
            current += increment;
            if (current >= target) {
                current = target;
                clearInterval(timer);
            }
            element.textContent = Math.floor(current);
        }, 50);
    }

    function initializeSearch() {
        const searchInput = document.getElementById('searchInput');
        searchInput.addEventListener('input', function() {
            const searchTerm = this.value.toLowerCase();
            filterEventsBySearch(searchTerm);
        });
    }

    function filterEventsBySearch(searchTerm) {
        const eventCards = document.querySelectorAll('.event-card');

        eventCards.forEach(card => {
            const title = card.querySelector('.event-title').textContent.toLowerCase();
            const description = card.querySelector('.event-description').textContent.toLowerCase();
            const location = card.querySelector('.detail-item span').textContent.toLowerCase();
            const category = card.dataset.category.toLowerCase();

            const matches = title.includes(searchTerm) ||
                description.includes(searchTerm) ||
                location.includes(searchTerm) ||
                category.includes(searchTerm);

            if (matches) {
                card.style.display = 'block';
                card.style.animation = 'fadeInUp 0.5s ease-out';
            } else {
                card.style.display = 'none';
            }
        });
    }

    function filterEvents(type) {
        // Update active button
        document.querySelectorAll('.filter-btn').forEach(btn => btn.classList.remove('active'));
        event.target.classList.add('active');

        const eventCards = document.querySelectorAll('.event-card');
        const today = new Date().toISOString().split('T')[0];

        eventCards.forEach(card => {
            const eventDate = card.dataset.date;
            let show = false;

            switch(type) {
                case 'all':
                    show = true;
                    break;
                case 'today':
                    show = eventDate === today;
                    break;
                case 'upcoming':
                    show = eventDate > today;
                    break;
                case 'past':
                    show = eventDate < today;
                    break;
            }

            if (show) {
                card.style.display = 'block';
                card.style.animation = 'fadeInUp 0.5s ease-out';
            } else {
                card.style.display = 'none';
            }
        });
    }

    function animateCards() {
        const cards = document.querySelectorAll('.event-card');
        cards.forEach((card, index) => {
            card.style.animationDelay = `${index * 0.1}s`;
        });
    }

    function confirmDelete(eventName) {
        return confirm(`Are you sure you want to delete "${eventName}"?\n\nThis action cannot be undone.`);
    }

    function addNewEvent() {
        // Add your navigation logic here
        alert('Navigate to Add Event page');
    }

    // Add smooth scrolling and performance optimizations
    document.addEventListener('scroll', function() {
        const scrolled = window.pageYOffset;
        const shapes = document.querySelectorAll('.shape');

        shapes.forEach((shape, index) => {
            const speed = (index + 1) * 0.5;
            shape.style.transform = `translateY(${scrolled * speed}px)`;
        });
    });

    // Add loading simulation (remove in production)
    window.addEventListener('load', function() {
        setTimeout(() => {
            document.getElementById('loading').classList.remove('show');
        }, 1000);
    });
</script>
</body>
</html>