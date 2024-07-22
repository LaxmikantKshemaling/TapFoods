package com.tap.controller;
import java.io.IOException; // Importing IOException for handling input/output errors
import java.util.List; // Importing List interface for storing user data
import javax.servlet.RequestDispatcher; // Importing RequestDispatcher for forwarding requests
import javax.servlet.ServletException; // Importing ServletException for handling servlet exceptions
import javax.servlet.annotation.WebServlet; // Importing WebServlet annotation for servlet mapping
import javax.servlet.http.HttpServlet; // Importing HttpServlet for creating servlets
import javax.servlet.http.HttpServletRequest; // Importing HttpServletRequest for handling HTTP requests
import javax.servlet.http.HttpServletResponse; // Importing HttpServletResponse for handling HTTP responses
import com.tap.dao.UserDAO; // Importing UserDAO interface for user data access
import com.tap.daoimple.UserDAOImple; // Importing UserDAOImple class for implementing UserDAO
import com.tap.model.User; // Importing User class for representing user data

@WebServlet("/signup") // Servlet mapping for handling sign-up requests
public class SignUPServlet extends HttpServlet {
    private UserDAO userDAO; // Declaring UserDAO variable for user data access

    public void init() {
        userDAO = new UserDAOImple(); // Initializing UserDAO implementation
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieving user input from the request parameters
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String number = request.getParameter("number");
        String password = request.getParameter("password");

        // Creating a new User object with the retrieved user input
        User user = new User(username, email, number, password);

        // Adding the user to the database through the UserDAO
        userDAO.addUserSignup(user);

        // Redirecting the user to the login page after successful registration
        response.sendRedirect("Login.jsp");
    }
}
