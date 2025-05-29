package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import dao.UserDAO;
import model.UserModel;

import java.io.IOException;

@WebServlet(name = "RegisterServlet", value = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Redirect to the registration page.
        request.getRequestDispatcher("/views/auth/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Getting form parameters
        String fullName = request.getParameter("fullName");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Checking if the password and confirm password matches or not.
        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match");
            request.getRequestDispatcher("/views/auth/register.jsp").forward(request, response);
            return;
        }

        // Validating the inputs.
        if (fullName == null ||
                fullName.trim().isEmpty() ||
                username == null || username.trim().isEmpty() ||
                email == null || email.trim().isEmpty()) {
            request.setAttribute("error", "Please fill all the fields");
            request.getRequestDispatcher("/views/auth/register.jsp").forward(request, response);
            return;
        }

        // Creating a new user object.
        UserModel user = new UserModel(fullName, username, email, password, "user");
        System.out.println("Registering user with email: " + email);

        // Adding the user to the database.
        try {
            int userID = UserDAO.addUser(user);

            if (userID > 0) {
                // Successful Registration
                request.getSession().setAttribute("registrationSuccessful", "Registration successful. Please login.");
                // .sendRedirect(.getContextPath() + "/views/auth/login.jsp"); response, request
                request.getRequestDispatcher("/LoginServlet").forward(request, response);
            }
            else {
                // Failed Registration
                request.getSession().setAttribute("registrationFailed", "Registration failed. Please try again.");
                request.getRequestDispatcher("/views/auth/register.jsp").forward(request, response);
            }
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
            request.setAttribute("error", "An error encountered." + e.getMessage());
            request.getRequestDispatcher("/views/auth/register.jsp").forward(request, response);
        }
    }
}
// Works fine.