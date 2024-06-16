package com.controller;

import com.dao.SessionFact;
import com.model.AdminUser;
import com.model.CandidateUser;
import com.model.CompanyUser;
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

public class UserController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static SessionFactory factory;

    public UserController() {
        super();
        if (factory == null) {
            factory = SessionFact.getSessionFactory();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("authentication".equalsIgnoreCase(action)) {
            authenticateUser(request, response);
        } else if ("listUsers".equalsIgnoreCase(action)) {
            listUsers(request, response);
        } else if ("updateUser".equalsIgnoreCase(action)) { // New action for updating user
            updateUser(request, response);
        } else if ("deleteUser".equalsIgnoreCase(action)) {
            deleteUser(request, response);
        }else if ("createUser".equalsIgnoreCase(action)) {
            createUser(request, response);
        }
    }

    private void authenticateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        User authenticatedUser = getUserByEmailAndPassword(email, password, role);

        if (authenticatedUser != null) {
            HttpSession session = request.getSession(true);
            session.setAttribute("user", authenticatedUser);
            if ("AdminUser".equals(role)) {
                response.sendRedirect(request.getContextPath() + "/listofcompany.jsp");
            } else if ("CompanyUser".equals(role)) {
                response.sendRedirect(request.getContextPath() + "/hire_candidate.jsp");
            }else if ("CandidateUser".equals(role)) {
                response.sendRedirect(request.getContextPath() + "/jobs.jsp");
            }
        } else {
            request.setAttribute("errors", "Authentication failed. Invalid email or password.");
            RequestDispatcher view = request.getRequestDispatcher("/login.jsp");
            view.forward(request, response);
        }
    }

    private void listUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> users = list();
        request.setAttribute("userList", users);
        RequestDispatcher view = request.getRequestDispatcher("/user_list.jsp");
        view.forward(request, response);
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

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userIdStr = request.getParameter("userId");
        long userId = Long.parseLong(userIdStr); // Convert userId to long

        String userName = request.getParameter("userName");
        String userEmail = request.getParameter("userEmail");

        Session session = null;
        Transaction transaction = null;

        try {
            session = factory.openSession();
            transaction = session.beginTransaction();

            // Retrieve the user entity by ID
            User user = (User) session.get(User.class, userId);
            if (user != null) {
                // Update user details
                user.setFullname(userName);
                user.setEmail(userEmail);

                // Save or update the user entity
                session.update(user);
                transaction.commit();

                // Redirect back to the user list page after updating
                response.sendRedirect(request.getContextPath() + "/user?action=listUsers");
            } else {
                // Handle case where user ID is not found
                throw new ServletException("User ID not found: " + userId);
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

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userIdStr = request.getParameter("userId");
        long userId = Long.parseLong(userIdStr);

        Session session = null;
        Transaction transaction = null;

        try {
            session = factory.openSession();
            transaction = session.beginTransaction();

            // Retrieve the user entity by ID
            User user = (User) session.get(User.class, userId);
            if (user != null) {
                // Delete user
                session.delete(user);
                transaction.commit();

                // Redirect back to the user list page after deleting
                response.sendRedirect(request.getContextPath() + "/user?action=listUsers");
            } else {
                // Handle case where user ID is not found
                throw new ServletException("User ID not found: " + userId);
            }
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            throw new ServletException("Error deleting user", e);
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    private void createUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role"); // Corrected from "class" to "role"

        Session session = null;
        Transaction transaction = null;

        try {
            session = factory.openSession();
            transaction = session.beginTransaction();

            User newUser = null;

            // Determine user type based on role
            if ("Admin".equals(role)) {
                newUser = new AdminUser();
            } else if ("Company Admin".equals(role)) {
                newUser = new CompanyUser();
            } else if ("Candidate".equals(role)) {
                newUser = new CandidateUser();
            } else {
                throw new ServletException("Invalid user role: " + role);
            }

            // Set common attributes
            newUser.setEmail(email);
            newUser.setPassword(password);

            // Save the new user
            session.save(newUser);
            transaction.commit();

            // Redirect to the user list page after creating the user
            response.sendRedirect(request.getContextPath() + "/user?action=listUsers");
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            throw new ServletException("Error creating user", e);
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

}
