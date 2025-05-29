package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "LogoutServlet", value = "/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Getting the current session
        HttpSession session = request.getSession(false);

        // If the session already exists, invalidating the session.
        if (session != null) {
            System.out.println("Logging out the user with the email: " + session.getAttribute("email"));
            session.invalidate();
        }

        // Redirecting the user to the login page.
        System.out.println("Redirecting the user to the login page.");
        response.sendRedirect(request.getContextPath() + "/LoginServlet");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // For POST requests, calling the doGet method.
        doGet(request, response);
    }
}
// Works fine.