package controller.event;

import dao.EventDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.EventModel;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ListEventServlet", value = "/ListEventServlet")
public class ListEventServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            List<EventModel> allEvents = EventDAO.listEvents();

            Map<Integer, Map<String, Object>> eventInfo = new HashMap<>();

            request.setAttribute("allEvents", allEvents);
            request.setAttribute("eventInfo", eventInfo);

            request.getRequestDispatcher("/views/admin/list-events.jsp").forward(request, response);
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
            request.setAttribute("error", "An error encountered." +e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}