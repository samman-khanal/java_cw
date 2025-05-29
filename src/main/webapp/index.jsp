<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Itahari International College</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/styles/home.css">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
<!-- Header Navigation -->
<jsp:include page="/views/layout/header.jsp" />

<!-- Hero Section -->
<section class="hero">
    <div class="hero-content">
        <h1>Welcome to Itahari International College</h1>
        <p>A transformative educational experience for students centered around innovation, diversity, collaboration, and academic excellence.</p>
        <a href="<%=request.getContextPath()%>/views/auth/register.jsp" class="cta-button">Register Now</a>
    </div>
</section>

<!-- Vision & Mission Section -->
<section class="vision-mission">
    <div class="container">
        <h2>Our Vision & Mission</h2>
        <p>At Itahari International College, we believe in education's power to bring change through academic excellence, innovation, engagement, and community. We're dedicated to nurturing individuals who contribute to society's wellbeing.</p>

        <div class="stats-container">
            <div class="stat-box">
                <i class="fas fa-calendar-alt"></i>
                <h3>SINCE 2017</h3>
                <p>Providing quality education for over 7 years.</p>
            </div>
            <div class="stat-box">
                <i class="fas fa-users"></i>
                <h3>15000+ STUDENTS</h3>
                <p>With an international community.</p>
            </div>
            <div class="students-image">
                <img src="<%= request.getContextPath()%>/assets/images/section.jpeg" alt="Diverse students at Itahari International College">
            </div>
        </div>
    </div>
</section>

<!-- Featured Events Section -->
<section class="featured-events">
    <div class="container">
        <h2>Featured Events</h2>

        <div class="events-container">

            <!-- Event 1 -->
            <div class="event-card">
                <img src="./assets/images/quest.jpeg" alt="IIC Quest 2025">
                <div class="event-details">
                    <span class="event-date"><i class="far fa-calendar"></i> March 15, 2025</span>
                    <h3>IIC Quest 2025</h3>
                    <p>Annual technology exhibition featuring student projects, industry experts, and innovative solutions.</p>
                    <a href="<%= request.getContextPath()%>/index.jsp" class="learn-more">Learn More...</a>
                </div>
            </div>

            <!-- Event 2 -->
            <div class="event-card">
                <img src="./assets/images/holi.jpeg" alt="IIC Holi 2025">
                <div class="event-details">
                    <span class="event-date"><i class="far fa-calendar"></i> April 10, 2025</span>
                    <h3>IIC Holi 2025</h3>
                    <p>Celebration of diversity through dance, music, art, and cultural performances from around the world.</p>
                    <a href="<%= request.getContextPath()%>/index.jsp" class="learn-more">Learn More...</a>
                </div>
            </div>

            <!-- Event 3 -->
            <div class="event-card">
                <img src="./assets/images/carnival.jpeg" alt="IIC Spring Carnival">
                <div class="event-details">
                    <span class="event-date"><i class="far fa-calendar"></i> May 5, 2025</span>
                    <h3>IIC Spring Carnival</h3>
                    <p>Annual athletics competition featuring track events, team sports, and individual competitions.</p>
                    <a href="<%= request.getContextPath()%>/index.jsp" class="learn-more">Learn More...</a>
                </div>
            </div>
        </div>
    </div>
</section>

<!--Footer Section-->
<jsp:include page="/views/layout/footer.jsp" />

</body>
</html>
