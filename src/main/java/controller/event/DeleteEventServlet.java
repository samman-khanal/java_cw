package controller.event;

import dao.EventDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.EventModel;

import java.io.IOException;

@WebServlet(name = "DeleteEventServlet", value = "/DeleteEventServlet")
public class DeleteEventServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        HttpSession session = request.getSession();

        // Validate event ID parameter.
        if (idParam == null || idParam.trim().isEmpty()) {
            request.setAttribute("error", "Please provide a valid event ID.");
            response.sendRedirect(request.getContextPath() + "/ListEventServlet");
            return;
        }
        try {
            int eventId = Integer.parseInt(idParam);

            // Check if event exists before deletion
            EventModel event = EventDAO.getEventById(eventId);
            if (event == null) {
                session.setAttribute("errorMessage", "Event not found or may have been already deleted.");
                response.sendRedirect(request.getContextPath() + "/ListEventServlet");
                return;
            }

            // Store event name for success message
            String eventName = event.getName();

            // Attempt to delete the event
            boolean isDeleted = EventDAO.deleteEvent(eventId);

            if (isDeleted) {
                session.setAttribute("successMessage",
                        "Event '" + eventName + "' has been successfully deleted.");
                System.out.println("Event '" + eventName + "' has been successfully deleted.");
            } else {
                session.setAttribute("errorMessage", "Failed to delete the event. Please try again.");
                System.out.println("Failed to delete the event.");
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
        response.sendRedirect(request.getContextPath() + "/ListEventServlet");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
