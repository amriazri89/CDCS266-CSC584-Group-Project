package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JobApplicationController
 */
public class JobApplicationController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    /**
     * Default constructor. 
     */
    public JobApplicationController() {
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String action = request.getParameter("action");
            
            if ("create".equalsIgnoreCase(action)) {
                // Process job application submission
                String applicantName = request.getParameter("applicantName");
                String jobTitle = request.getParameter("jobTitle");
                String resume = request.getParameter("resume"); // Example: Assuming resume upload
                
                // Example: Save job application to database
                // jobApplicationService.createJobApplication(applicantName, jobTitle, resume);
                
                // Redirect to success page or display a message
                response.sendRedirect(request.getContextPath() + "/success.jsp");
                
            } else if ("update".equalsIgnoreCase(action)) {
                // Process job application update (if needed)
                // Typically, job applications are not updated after submission in most systems.
                // This can be handled based on specific business requirements.
                
                // Redirect to success page or display a message
                response.sendRedirect(request.getContextPath() + "/success.jsp");
                
            } else if ("delete".equalsIgnoreCase(action)) {
                // Process job application deletion (if needed)
                // Deleting job applications might not be a common practice in many systems.
                // This can be handled based on specific business requirements.
                
                // Redirect to success page or display a message
                response.sendRedirect(request.getContextPath() + "/success.jsp");
                
            } else {
                // Default action: display some page
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Job Application Controller</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Welcome to Job Application Controller</h1>");
                out.println("<p>This servlet handles CRUD operations for job applications.</p>");
                out.println("</body>");
                out.println("</html>");
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "JobApplicationController Servlet";
    }
}
