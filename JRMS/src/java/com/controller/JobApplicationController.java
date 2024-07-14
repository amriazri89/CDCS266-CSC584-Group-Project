package com.controller;

import com.dao.SessionFact;
import com.model.JobApplication;
import com.model.JobVacancies;
import com.model.User;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class JobApplicationController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static SessionFactory factory;

    @Override
    public void init() throws ServletException {
        // Initialize Hibernate session factory
        factory = new Configuration().configure().buildSessionFactory();
    }

    @Override
    public void destroy() {
        if (factory != null) {
            factory.close();
        }
    }

    public JobApplicationController() {
        super();
        if (factory == null) {
            factory = SessionFact.getSessionFactory();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("applyJob".equalsIgnoreCase(action)) {
            applyJob(request, response);

        }
    }

    private void applyJob(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String coverLetter = request.getParameter("coverLetter");
        String offerStatus = request.getParameter("offerStatus");
        String offerDetails = request.getParameter("offerDetails");
 
        long jobId = Long.parseLong(request.getParameter("jobId"));
        long userId = Long.parseLong(request.getParameter("userId"));
        System.out.println("userId : " + userId);
        

        Session session = null;
        Transaction transaction = null;

        try {
            session = factory.openSession();
            transaction = session.beginTransaction();

            // Retrieve the job vacancy associated with the given jobId
            JobVacancies jobVacancy = (JobVacancies) session.get(JobVacancies.class, jobId);
            if (jobVacancy == null) {
                throw new ServletException("Job vacancy not found for id: " + jobId);
            }

            // Retrieve the user associated with the given userId
            User user = (User) session.get(User.class, userId);
            if (user == null) {
                System.out.println("User not found for id: " + userId);
                throw new ServletException("User not found for id: " + userId);
            }
            System.out.println("user : " + user);

            // Create a new job application instance
            JobApplication jobApplication = new JobApplication();
            jobApplication.setCoverLetter(coverLetter);
            jobApplication.setJobVacancies(jobVacancy);
            jobApplication.setUser(user);

            // Save the job application and update the job vacancy
            session.save(jobApplication);

            transaction.commit();
            response.sendRedirect(request.getContextPath() + "/jobVacancies?action=alljobVacancies&msg=Sucessfully Applied Job");
        } catch (NumberFormatException | HibernateException e) {
            if (transaction != null) {
                transaction.rollback();
            }
            throw new ServletException("Error applying for job vacancy", e);
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

}
