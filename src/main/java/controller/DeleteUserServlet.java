package controller;

import dao.EventDAO;
import dao.UserDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.EventModel;
import model.UserModel;

import java.io.IOException;

@WebServlet(name = "DeleteUserServlet", value = "/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        HttpSession session = request.getSession();

        // Validate event ID parameter.
        if (idParam == null || idParam.trim().isEmpty()) {
            request.setAttribute("error", "Please provide a valid user ID.");
            response.sendRedirect(request.getContextPath() + "/ListUserServlet");
            return;
        }
        try {
            int userId = Integer.parseInt(idParam);

            // Check if user exists before deletion
            UserModel user = UserDAO.getUserById(userId);
            if (user == null) {
                session.setAttribute("errorMessage", "User not found or may have been already deleted.");
                response.sendRedirect(request.getContextPath() + "/ListUserServlet");
                return;
            }

            // Store username for success message
            String userName = user.getUsername();

            // Attempt to delete the user.
            boolean isDeleted = UserDAO.deleteUser(userId);

            if (isDeleted) {
                session.setAttribute("successMessage",
                        "User '" + userName + "' has been successfully deleted.");
                System.out.println("User '" + userName + "' has been successfully deleted.");
            } else {
                session.setAttribute("errorMessage", "Failed to delete the user. Please try again.");
                System.out.println("Failed to delete the user.");
            }

        }
        catch (NumberFormatException e) {
            session.setAttribute("errorMessage", "Invalid event ID format.");
        }
        catch (Exception e) {
            session.setAttribute("errorMessage", "An error occurred while deleting the event: " + e.getMessage());
            e.printStackTrace(); // Log the error for debugging
        }
        // Redirect
        response.sendRedirect(request.getContextPath() + "/ListUserServlet");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}