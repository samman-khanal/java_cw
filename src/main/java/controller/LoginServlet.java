package controller;

import dao.UserDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.UserModel;

import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Redirect to the login page.
        request.getRequestDispatcher("/views/auth/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Getting form parameters.
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Validating the input.
        if (email == null || email.trim().isEmpty() ||
                username == null || username.trim().isEmpty() ||
                password == null || password.trim().isEmpty()) {
            request.setAttribute("error", "Please fill all the fields");
            request.getRequestDispatcher("/views/auth/login.jsp");
            return;
        }

        try {
            // Authenticating the user.
            UserModel user = UserDAO.validateUser(email, username, password);

            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                session.setAttribute("email", email);
                session.setAttribute("role", user.getRole());

                // Role based authentication
                String role = user.getRole();
                if (role.equals("admin")) {
                    // If user is admin.
                    response.sendRedirect(request.getContextPath() + "/views/admin/dashboard.jsp");
                }
                else if (role.equals("user")) {
                    // If user is normal user.
                    response.sendRedirect(request.getContextPath() + "/views/user/dashboard.jsp");
                }
                else {
                    request.setAttribute("error", "Invalid username or password");
                    response.sendRedirect(request.getContextPath() + "/views/auth/login.jsp");
                }
            }
        }
        catch (Exception e) {
            request.setAttribute("error", "An error encountered." + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/views/auth/login.jsp");
        }

    }
}
