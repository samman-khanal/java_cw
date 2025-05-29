package controller;

import dao.UserDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.UserModel;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@WebServlet(name = "ListUserServlet", value = "/ListUserServlet")
public class ListUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<UserModel> allUsers = UserDAO.listUsers();

            Map<Integer, Map<String, Objects>> userInfo = new HashMap<>();

            request.setAttribute("allUsers", allUsers);
            request.setAttribute("userInfo", userInfo);

            request.getRequestDispatcher("/views/admin/list-users.jsp").forward(request, response);
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