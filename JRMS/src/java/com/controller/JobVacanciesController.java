package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JobVacanciesController
 */
public class JobVacanciesController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    /**
     * Default constructor. 
     */
    public JobVacanciesController() {
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
                // Process job creation
                String jobTitle = request.getParameter("jobTitle");
                String jobDescription = request.getParameter("jobDescription");
                
                // Example: Save job data to database
                // jobVacancyService.createJobVacancy(jobTitle, jobDescription);
                
                // Redirect to success page or display a message
                response.sendRedirect(request.getContextPath() + "/success.jsp");
                
            } else if ("update".equalsIgnoreCase(action)) {
                // Process job update
                int jobId = Integer.parseInt(request.getParameter("jobId")); // Example: Assuming jobId is passed
                
                // Fetch existing job data from database
                // JobVacancy existingJob = jobVacancyService.getJobVacancyById(jobId);
                
                // Update job data
                // existingJob.setJobTitle(request.getParameter("jobTitle"));
                // existingJob.setJobDescription(request.getParameter("jobDescription"));
                
                // Example: Update job in database
                // jobVacancyService.updateJobVacancy(existingJob);
                
                // Redirect to success page or display a message
                response.sendRedirect(request.getContextPath() + "/success.jsp");
                
            } else if ("delete".equalsIgnoreCase(action)) {
                // Process job deletion
                int jobId = Integer.parseInt(request.getParameter("jobId")); // Example: Assuming jobId is passed
                
                // Example: Delete job from database
                // jobVacancyService.deleteJobVacancy(jobId);
                
                // Redirect to success page or display a message
                response.sendRedirect(request.getContextPath() + "/success.jsp");
                
            } else {
                // Default action: display some page
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Job Vacancies Controller</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Welcome to Job Vacancies Controller</h1>");
                out.println("<p>This servlet handles CRUD operations for job vacancies.</p>");
                out.println("</body>");
                out.println("</html>");
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "JobVacanciesController Servlet";
    }
}
