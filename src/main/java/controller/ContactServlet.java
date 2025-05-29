package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import dao.ContactDAO;
import model.ContactModel;

import java.io.IOException;

@WebServlet(name = "ContactServlet", value = "/ContactServlet")
public class ContactServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Getting the contact form page.
        request.getRequestDispatcher("/views/common/contact.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Getting thr parameters from the form.
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String message = request.getParameter("message");

        // Validating the user input.
        if (fullName == null ||
                email == null ||
                phone == null ||
                address == null ||
                message == null) {
            request.setAttribute("error", "Please fill all the fields");
            request.getRequestDispatcher("/views/common/contact.jsp").forward(request, response);
            return;
        }

        // Creating a new contact object.
        ContactModel contactModel = new ContactModel(fullName, email, phone, address, message);

        // Adding contact to the database.
        try {
            int contactID = ContactDAO.addContact(contactModel);

            if (contactID > 0) {
                // Successful contact  creation.
                request.setAttribute("success", "Contact added");
            }
            else {
                // Failed contact creation.
                request.setAttribute("error", "Contact not added");
            }
        }
        catch (Exception e) {
            throw new RuntimeException(e);
        }
        // Redirecting to the home page.
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
// Works fine.