package com.controller;

import com.dao.SessionFact;
import com.model.*;
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

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("listUsers".equalsIgnoreCase(action)) {
            listUsers(request, response);
        } else if ("getCandidate".equalsIgnoreCase(action)) {
            getCandidate(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action requested");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("authenticate".equalsIgnoreCase(action)) {
            authenticateUser(request, response);
        } else if ("updateUser".equalsIgnoreCase(action)) {
            updateUser(request, response);
        } else if ("deleteUser".equalsIgnoreCase(action)) {
            deleteUser(request, response);
        } else if ("createUser".equalsIgnoreCase(action)) {
            createUser(request, response);
        } else if ("updateCandidate".equalsIgnoreCase(action)) {
            updateCandidate(request, response);
        } else if ("registerCandidate".equalsIgnoreCase(action)) {
            registerCandidate(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action requested");
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
                response.sendRedirect(request.getContextPath() + "/recruitmentCompany?action=listofcompany&login=yes");
            } else if ("CompanyUser".equals(role)) {
                response.sendRedirect(request.getContextPath() + "/hire_candidate.jsp?login=yes");
            } else if ("CandidateUser".equals(role)) {
                response.sendRedirect(request.getContextPath() + "/jobVacancies?action=alljobVacancies&login=yes");
            }
        } else {
            request.setAttribute("errors", "Authentication failed. Invalid email or password.");
            RequestDispatcher view = request.getRequestDispatcher("/login.jsp");
            view.forward(request, response);
        }
    }

    private void listUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Session session = null;
        try {
            session = factory.openSession();
            Criteria criteria = session.createCriteria(User.class);
            List<User> users = criteria.list();
            session.close();

            request.setAttribute("userList", users);
            RequestDispatcher view = request.getRequestDispatcher("/user_list.jsp");
            view.forward(request, response);
        } catch (Exception e) {
            if (session != null && session.isOpen()) {
                session.close();
            }
            throw new ServletException("Error fetching user list", e);
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

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userIdStr = request.getParameter("userId");
        long userId = Long.parseLong(userIdStr);

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String name = request.getParameter("fullname");
        String noIc = request.getParameter("nric");
        String phone = request.getParameter("phone");
        String role = request.getParameter("role");

        Session session = null;
        Transaction transaction = null;

        try {
            session = factory.openSession();
            transaction = session.beginTransaction();

            User user = (User) session.get(User.class, userId);
            if (user != null) {
                user.setEmail(email);
                user.setPassword(password);
                user.setFullname(name);
                user.setNoIc(noIc);
                user.setPhone(phone);
                session.save(user);

                session.update(user);
                transaction.commit();

                response.sendRedirect(request.getContextPath() + "/user?action=listUsers");
            } else {
                throw new ServletException("User not found with ID: " + userId);
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

            User user = (User) session.get(User.class, userId);
            if (user != null) {
                session.delete(user);
                transaction.commit();

                response.sendRedirect(request.getContextPath() + "/user?action=listUsers");
            } else {
                throw new ServletException("User not found with ID: " + userId);
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
        String name = request.getParameter("name");
        String noIc = request.getParameter("noIc");
        String phone = request.getParameter("phone");
        String role = request.getParameter("role");

        Session session = null;
        Transaction transaction = null;

        try {
            session = factory.openSession();
            transaction = session.beginTransaction();

            User newUser = null;
            if ("Admin".equals(role)) {
                newUser = new AdminUser();
            } else if ("Company Admin".equals(role)) {
                newUser = new CompanyUser();
            } else if ("Candidate".equals(role)) {
                newUser = new CandidateUser();
            } else {
                throw new ServletException("Invalid role: " + role);
            }

            newUser.setEmail(email);
            newUser.setPassword(password);
            newUser.setFullname(name);
            newUser.setNoIc(noIc);
            newUser.setPhone(phone);
            session.save(newUser);
            transaction.commit();

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

    private void getCandidate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long candidateId = Long.parseLong(request.getParameter("candidateId"));

        Session session = null;
        try {
            session = factory.openSession();
            CandidateUser candidate = (CandidateUser) session.get(CandidateUser.class, candidateId);

            if (candidate != null) {
                request.setAttribute("candidate", candidate);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/updateprofile.jsp");
                dispatcher.forward(request, response);
            } else {
                throw new ServletException("Candidate not found with ID: " + candidateId);
            }
        } catch (Exception e) {
            throw new ServletException("Error fetching candidate", e);
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    private void updateCandidate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long candidateId = Long.parseLong(request.getParameter("candidateId"));

        String candidateName = request.getParameter("fullname");
        String candidateAddress = request.getParameter("address");
        String candidatePhone = request.getParameter("phone");
        String candidateIcNo = request.getParameter("ic_number");
        String userEmail = request.getParameter("email");
        String userPassword = request.getParameter("password");

        Session session = null;
        Transaction transaction = null;

        try {
            session = factory.openSession();
            transaction = session.beginTransaction();

            CandidateUser candidate = (CandidateUser) session.get(CandidateUser.class, candidateId);
            if (candidate != null) {
                candidate.setEmail(userEmail);
                candidate.setPassword(userPassword);
                candidate.setFullname(candidateName);
                candidate.setAddress(candidateAddress);
                candidate.setPhone(candidatePhone);
                candidate.setNoIc(candidateIcNo);

                session.update(candidate);
                transaction.commit();

                response.sendRedirect(request.getContextPath() + "/updateprofile.jsp");
            } else {
                throw new ServletException("Candidate not found with ID: " + candidateId);
            }
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            throw new ServletException("Error updating candidate", e);
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    private void registerCandidate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Implementation for registering a new candidate
            String candidateName = request.getParameter("fullname");
            String candidateAddress = request.getParameter("address");
            String candidatePhone = request.getParameter("phone");
            String candidateIcNo = request.getParameter("ic_number");
            String userEmail = request.getParameter("email");
            String userPassword = request.getParameter("password");

            CandidateUser candidate = new CandidateUser();
            candidate.setEmail(userEmail);
            candidate.setPassword(userPassword);
            candidate.setFullname(candidateName);
            candidate.setAddress(candidateAddress);
            candidate.setPhone(candidatePhone);
            candidate.setNoIc(candidateIcNo);

            Session session = factory.openSession();
            Transaction tx = session.beginTransaction();
            session.save(candidate);
            tx.commit();
            session.close();
            response.sendRedirect(request.getContextPath() + "/login.jsp?msg=Sucessfuly register candidate.");
        } catch (Exception e) {
            throw new ServletException("Error registering candidate", e);
        }
    }
}
