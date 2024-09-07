package com.tap.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;

import com.tap.dao.UserDAO;
import com.tap.daoimple.UserDAOImple;
import com.tap.model.User;

@WebServlet("/login")
public class SigninServlet extends HttpServlet {

    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAOImple();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Encrypt the entered password for validation (You may add encryption logic here)

        // Validate the user credentials
        User user = userDAO.getUserByUsernameAndPassword(username, password);

        if (user != null) {
            // If the username and password are correct, set user object attribute in session and redirect to Home page
            HttpSession session = request.getSession();
            session.setAttribute("loggedInUser", user); // Set the user object directly
            response.sendRedirect("home");
        } else {
            // If the username or password is invalid, set an error message attribute and forward to login.jsp
            request.setAttribute("errorMessage", "Invalid username or password");
            RequestDispatcher dispatcher = request.getRequestDispatcher("Signin.jsp");
            dispatcher.forward(request, response);
        }
    }
}