package com.controller;

import com.dao.SessionFact;
import com.model.CompanyUser;
import com.model.RecruitmentCompany; // Assuming RecruitmentCompany is your entity class
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class RecruitmentCompanyController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private SessionFactory factory;

    @Override
    public void init() throws ServletException {
        super.init();
        // Initialize Hibernate SessionFactory
        try {
            factory = new Configuration().configure().buildSessionFactory();
        } catch (HibernateException ex) {
            // Log the exception and re-throw it as ServletException
            System.err.println("Failed to create sessionFactory object." + ex);
            throw new ServletException("Failed to create sessionFactory object.", ex);
        }
    }

    @Override
    public void destroy() {
        super.destroy();
        // Close Hibernate SessionFactory on servlet shutdown
        if (factory != null) {
            factory.close();
        }
    }

    public RecruitmentCompanyController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("listofcompany".equalsIgnoreCase(action)) {
            allRecruitmentCompanyList(request, response);
        }
    }

    private void allRecruitmentCompanyList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Session session = null;
        Transaction transaction = null;
        try {
            session = factory.openSession();
            transaction = session.beginTransaction();
            List<RecruitmentCompany> recruitmentCompany = session.createQuery("FROM RecruitmentCompany").list();
            transaction.commit();

            request.setAttribute("recruitmentCompany", recruitmentCompany);
            RequestDispatcher view = request.getRequestDispatcher("/listofcompany.jsp");
            view.forward(request, response);
        } catch (HibernateException e) {
            if (transaction != null) {
                transaction.rollback();
            }
            throw new ServletException("Error fetching recruitment company list", e);
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("createCompany".equalsIgnoreCase(action)) {
            createCompany(request, response);
        }
    }

    private void createCompany(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String companyName = request.getParameter("companyName");
        String companyDetails = request.getParameter("companyDetails");
        String companyPhone = request.getParameter("companyPhone");
        String companyEmail = request.getParameter("companyEmail");
        String companyAddress = request.getParameter("companyAddress");
        String industry = request.getParameter("industry");

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
        recruitmentCompany.setIndustry(industry);
        recruitmentCompany.setUser(user); // Associate user with the company

        Session session = null;
        Transaction tx = null;
        try {
            session = SessionFact.getSessionFactory().openSession();
            tx = session.beginTransaction();
            session.save(user);
            session.save(recruitmentCompany);
            tx.commit();
            response.sendRedirect(request.getContextPath() + "/login.jsp?msg=Successfully registered company & user.");
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            response.getWriter().println("<p>Error creating Recruitment Company: " + e.getMessage() + "</p>");
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }
}
