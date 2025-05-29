<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Event</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/styles/admin/add-event.css">

</head>
<body>

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

</body>
</html>
