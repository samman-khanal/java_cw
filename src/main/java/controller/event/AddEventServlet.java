package controller.event;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import dao.EventDAO;
import model.EventModel;

import java.io.IOException;

@WebServlet(name = "AddEventServlet", value = "/AddEventServlet")
public class AddEventServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Redirecting to the add event form.
        request.getRequestDispatcher("/views/admin/add-event.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Getting form parameters.
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String location = request.getParameter("location");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String category = request.getParameter("category");

        // Validating the input.
        if (name == null || name.trim().isEmpty() ||
                description == null || description.trim().isEmpty() ||
                location == null || location.trim().isEmpty() ||
                date == null || date .trim().isEmpty() ||
                time == null || time.trim().isEmpty() ||
                category == null || category.trim().isEmpty()) {
            request.setAttribute("error", "Please fill all the fields.");
            request.getRequestDispatcher("/views/admin/add-event.jsp").forward(request, response);
            return;
        }

        // Creating a new event object.
        EventModel event = new EventModel(name, description, location, date, time, category);
        System.out.println("Adding event with details: " + name + "\n" +
                description + "\n" + location + "\n" + date + "\n" +
                time + "\n" + category);

        // Adding event to the database.
        try {
            int eventId = EventDAO.addEvent(event);

            if (eventId > 0) {
                // Successful event creation
                request.setAttribute("success", "Event added successfully.");
                response.sendRedirect("/views/admin/list-events");
            }
            else {
                // Failed event creation.
                request.setAttribute("error", "Event could not be added.");
                request.getRequestDispatcher("/views/admin/add-event.jsp").forward(request, response);
            }
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
            request.setAttribute("error", "An error encountered." +e.getMessage());
            request.getRequestDispatcher("/views/admin/add-event.jsp").forward(request, response);
        }
    }
}
