package com.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Logout", urlPatterns = {"/logout"})
public class Logout extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            // Invalidate the session if exists
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            
            // Redirect to the login page
            request.setAttribute("message", "Sucessfully Logout");
            RequestDispatcher view = request.getRequestDispatcher("/login.jsp");
            view.forward(request, response);
            //response.sendRedirect(request.getContextPath() + "/login.jsp?message=Sucessfully Logout");
        } catch (IOException e) {
            // Handle exception properly
            throw new ServletException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Logout Servlet";
    }

}

