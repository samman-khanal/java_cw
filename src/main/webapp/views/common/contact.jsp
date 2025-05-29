<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Contact Us</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/styles/contact.css">

</head>
<body>
<!--Header Section-->
<jsp:include page="/views/layout/header.jsp" />

<div class="doom-container">
    <div class="contact-form-container">
        <h1>Contact Us</h1>
        <p>We'd love to hear from you. Please fill out the form below.</p>

        <form action="${pageContext.request.contextPath}/ContactServlet" method="post">
            <div class="form-group">
                <label for="fullName">Full Name</label>
                <input type="text" id="fullName" name="fullName" placeholder="Enter your full name" required>
            </div>

            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" placeholder="example@domain.com" required>
            </div>

            <div class="form-group">
                <label for="phone">Phone Number</label>
                <input type="tel" id="phone" name="phone" placeholder="+977 987-654-3210    ">
            </div>

            <div class="form-group">
                <label for="address">Address</label>
                <input type="text" id="address" name="address" placeholder="Street, City, State, ZIP">
            </div>

            <div class="form-group">
                <label for="message">Message</label>
                <textarea id="message" name="message" placeholder="Write your message here..." required></textarea>
            </div>

            <button type="submit">
                Send Message
            </button>
        </form>
    </div>
</div>

<!--Footer Section-->
<jsp:include page="/views/layout/footer.jsp" />
</body>
</html>