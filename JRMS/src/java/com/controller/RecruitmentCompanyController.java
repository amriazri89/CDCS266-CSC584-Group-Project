package com.controller;

import com.dao.SessionFact;
import com.model.CompanyUser;
import com.model.RecruitmentCompany; // Assuming RecruitmentCompany is your entity class
import com.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 * Servlet implementation class RecruitmentCompanyController
 */
public class RecruitmentCompanyController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private SessionFactory factory;

    /**
     * Default constructor.
     */
    public RecruitmentCompanyController() {
        super();
    }


    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String action = request.getParameter("action");

            if ("create".equalsIgnoreCase(action)) {
                String companyName = request.getParameter("companyName");
                String companyDetails = request.getParameter("companyDetails");
                String companyPhone = request.getParameter("companyPhone");
                String companyEmail = request.getParameter("companyEmail");
                String companyAddress = request.getParameter("companyAddress");
                String userEmail = request.getParameter("userEmail");
                String userPassword = request.getParameter("userPassword");
                
                // Create a new User object
                CompanyUser user = new CompanyUser();
                user.setEmail(userEmail);
                user.setPassword(userPassword);
                
                // Create a new RecruitmentCompany object
                RecruitmentCompany recruitmentCompany = new RecruitmentCompany();
                recruitmentCompany.setName(companyName);
                recruitmentCompany.setDescription(companyDetails);
                recruitmentCompany.setPhone(companyPhone);
                recruitmentCompany.setEmail(companyEmail);
                recruitmentCompany.setAddress(companyAddress);
                recruitmentCompany.setUser(user); // Associate user with the company

                // Save the User and RecruitmentCompany objects to the database using Hibernate
                Session session =  SessionFact.getSessionFactory().openSession();
                Transaction tx = null;

                try {
                    tx = session.beginTransaction();
                    session.save(user);
                    session.save(recruitmentCompany);
                    tx.commit();
                    response.getWriter().println("User saved successfully");
                    out.println("<p>Recruitment Company created successfully!</p>");
                } catch (Exception e) {
                    if (tx != null) {
                        tx.rollback();
                    }
                    out.println("<p>Error creating Recruitment Company: " + e.getMessage() + "</p>");
                } finally {
                    session.close();
                }

                response.sendRedirect(request.getContextPath() + "/reg_company.jsp");

            } else if ("update".equalsIgnoreCase(action)) {
                // Process company update
                int companyId = Integer.parseInt(request.getParameter("companyId")); // Example: Assuming companyId is passed

                // Fetch existing company data from database
                // Company existingCompany = recruitmentCompanyService.getCompanyById(companyId);
                // Update company data
                // existingCompany.setCompanyName(request.getParameter("companyName"));
                // existingCompany.setLocation(request.getParameter("location"));
                // Example: Update company in database
                // recruitmentCompanyService.updateCompany(existingCompany);
                // Redirect to success page or display a message
                response.sendRedirect(request.getContextPath() + "/success.jsp");

            } else if ("delete".equalsIgnoreCase(action)) {
                // Process company deletion
                int companyId = Integer.parseInt(request.getParameter("companyId")); // Example: Assuming companyId is passed

                // Example: Delete company from database
                // recruitmentCompanyService.deleteCompany(companyId);
                // Redirect to success page or display a message
                response.sendRedirect(request.getContextPath() + "/success.jsp");

            } else {
                // Default action: display some page
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Recruitment Company Controller</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Welcome to Recruitment Company Controller</h1>");
                out.println("<p>This servlet handles CRUD operations for recruitment companies.</p>");
                out.println("</body>");
                out.println("</html>");
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "RecruitmentCompanyController Servlet";
    }
}
