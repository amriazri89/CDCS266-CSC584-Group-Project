/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.dao.SessionFact;
import com.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Lenovo
 */
public class Test extends HttpServlet {
  private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Session session = SessionFact.getSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();

            User user = new User();
            user.setUsername("testuser");
            user.setPassword("password");
            session.save(user);

            tx.commit();
            response.getWriter().println("User saved successfully");
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            log("Error saving user", e);
            response.getWriter().println("Error: " + e.getMessage());
        } finally {
            session.close();
        }
    }
}
