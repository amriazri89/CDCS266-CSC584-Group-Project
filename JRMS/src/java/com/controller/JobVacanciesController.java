package com.controller;

import com.dao.SessionFact;
import com.model.AdminUser;
import com.model.CandidateUser;
import com.model.CompanyUser;
import com.model.JobVacancies;
import com.model.RecruitmentCompany;
import com.model.User;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.cfg.Configuration;

public class JobVacanciesController extends HttpServlet {

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

    public JobVacanciesController() {
        super();
        if (factory == null) {
            factory = SessionFact.getSessionFactory();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("listJobs".equalsIgnoreCase(action)) {
            listJobs(request, response);
        } else if ("allJobVacancies".equalsIgnoreCase(action)) {
            allJobVacanciesList(request, response);
        }
    }

    private void allJobVacanciesList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Session session = null;
        Transaction transaction = null;
        List<JobVacancies> jobVacancies = null;
        try {
            session = factory.openSession();
            transaction = session.beginTransaction();
            org.hibernate.Query query = session.createQuery("FROM JobVacancies");
            jobVacancies = query.list();
            transaction.commit();   
            request.setAttribute("jobVacancies", jobVacancies);
            System.out.println("jobVacanciesss : " + jobVacancies);
            RequestDispatcher view = request.getRequestDispatcher("/jobs.jsp");
            view.forward(request, response);
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
                System.err.println("Transaction rolled back.");
            }
            throw new ServletException("Error fetching user list", e);
        }finally {
            if (session != null) {
                session.close();
                System.out.println("Session closed.");
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("updateJob".equalsIgnoreCase(action)) {
            //System.out.println("updateJob");
            updateJob(request, response);
        } else if ("deleteJob".equalsIgnoreCase(action)) {
            deleteJob(request, response);
        } else if ("createJob".equalsIgnoreCase(action)) {
            createJob(request, response);
        } else if ("updateCandidate".equalsIgnoreCase(action)) {
            System.out.println("update candidate");
        } 

    }

    private void listJobs(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Assuming user object is already stored in session, retrieve it
        String userIdStr = request.getParameter("userId");
        long userId = Long.parseLong(userIdStr); // Convert userId to long
        System.out.println("userId: " + userIdStr);

        Session session = null;
        try {
            session = factory.openSession();
            session.beginTransaction();

            // Retrieve the user object using Hibernate
            CompanyUser user = (CompanyUser) session.get(CompanyUser.class, userId);
            if (user == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "User not found");
                return;
            }

            // Retrieve job vacancies associated with the user's recruitment company
            List<JobVacancies> jobVacancies = user.getRecruitmentCompany().getJobVacancies();

            // Set job vacancies list in request attribute
            request.setAttribute("jobList", jobVacancies);

            // Forward to JSP for rendering
            RequestDispatcher view = request.getRequestDispatcher("/listofjobvacancy.jsp");
            view.forward(request, response);

            session.getTransaction().commit();
        } catch (Exception e) {
            if (session != null && session.getTransaction().isActive()) {
                session.getTransaction().rollback();
            }
            e.printStackTrace();
            throw new ServletException("Error while listing job vacancies", e);
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    private User getUserByEmailAndPassword(String email, String password, String role) {
        Session session = null;
        try {
            session = factory.openSession();
            Criteria criteria = session.createCriteria(User.class);
            criteria.add(Restrictions.eq("email", email));
            criteria.add(Restrictions.eq("password", password));
            criteria.add(Restrictions.eq("class", role));
            List<User> users = criteria.list();
            if (!users.isEmpty()) {
                return users.get(0);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return null;
    }

    public static List<User> list() {
        Session session = null;
        Transaction transaction = null;
        List<User> users = null;

        try {
            session = factory.openSession();
            transaction = session.beginTransaction();
            org.hibernate.Query query = session.createQuery("FROM User");
            users = query.list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return users;
    }

    private void updateJob(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String jobIdStr = request.getParameter("jobId");
        long jobId = Long.parseLong(jobIdStr); // Convert userId to long
        String userId = request.getParameter("userId");

        String title = request.getParameter("title");
        String salary = request.getParameter("salary");
        String jobType = request.getParameter("jobType");
        String description = request.getParameter("description");

        Session session = null;
        Transaction transaction = null;

        try {
            session = factory.openSession();
            transaction = session.beginTransaction();

            // Retrieve the user entity by ID
            JobVacancies jv = (JobVacancies) session.get(JobVacancies.class, jobId);
            if (jv != null) {
                // Update user details
                jv.setTitle(title);
                jv.setSalary(salary);
                jv.setJobType(jobType);
                jv.setDescription(description);
                transaction.commit();
                // Redirect back to the user list page after updating
                response.sendRedirect(request.getContextPath() + "/jobVacancies?action=listJobs&userId=" + userId);
            } else {
                // Handle case where user ID is not found
                //throw new ServletException("User ID not found: " + userId);
            }
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            throw new ServletException("Error updating user", e);
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    private void deleteJob(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String jobIdStr = request.getParameter("jobId");
        String userId = request.getParameter("userId");

        long jobId;
        try {
            jobId = Long.parseLong(jobIdStr);
        } catch (NumberFormatException e) {
            throw new ServletException("Invalid job ID format: " + jobIdStr, e);
        }

        Session session = null;
        Transaction transaction = null;

        try {
            session = factory.openSession();
            transaction = session.beginTransaction();

            // Retrieve the job vacancy entity by ID
            JobVacancies jv = (JobVacancies) session.get(JobVacancies.class, jobId);
            if (jv != null) {
                // Remove associations
                jv.getRecruitmentCompany().getJobVacancies().remove(jv);

                session.delete(jv);
                transaction.commit();

                // Redirect back to the job list page after deleting
                response.sendRedirect(request.getContextPath() + "/jobVacancies?action=listJobs&userId=" + userId);
            } else {
                // Handle case where job ID is not found
                throw new ServletException("Job ID not found: " + jobId);
            }
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            throw new ServletException("Error deleting job vacancy", e);
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    private void createJob(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String jobTitle = request.getParameter("jobTitle");
        String jobDescription = request.getParameter("jobDescription");
        String salary = request.getParameter("salary");
        String jobType = request.getParameter("jobType");
        long companyId = Long.parseLong(request.getParameter("companyId"));
        String userId = request.getParameter("userId");

        Session session = null;
        Transaction transaction = null;

        try {
            session = factory.openSession();
            transaction = session.beginTransaction();

            // Retrieve the recruitment company associated with the given companyId
            Object company = session.get(RecruitmentCompany.class, companyId);
            if (company == null) {
                throw new ServletException("Recruitment company not found for id: " + companyId);
            }

            // Create a new job vacancy instance
            JobVacancies jobVacancy = new JobVacancies();
            jobVacancy.setTitle(jobTitle);
            jobVacancy.setDescription(jobDescription);
            jobVacancy.setSalary(salary);
            jobVacancy.setJobType(jobType);
            jobVacancy.setRecruitmentCompany((RecruitmentCompany) company);

            // Save the job vacancy
            session.save(jobVacancy);
            transaction.commit();

            // Redirect to the job vacancies list page after successful creation
            response.sendRedirect(request.getContextPath() + "/jobVacancies?action=listJobs&userId=" + userId);
        } catch (NumberFormatException | HibernateException e) {
            if (transaction != null) {
                transaction.rollback();
            }
            throw new ServletException("Error creating job vacancy", e);
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

}
