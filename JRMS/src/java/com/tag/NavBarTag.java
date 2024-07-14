package com.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;

public class NavBarTag extends SimpleTagSupport {

    private String session; // Attribute to check session validity
    private String role;    // Attribute to specify user role (admin, company, user)
    private static final String ADMIN = "admin";
    private static final String COMPANY = "company";
    private static final String CANDIDATE = "candidate";
    private String userId;

    public void setRole(String role) {
        this.role = role;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public void setSession(String session) {
        this.session = session;
    }

    @Override
    public void doTag() throws JspException, IOException {
        JspWriter out = getJspContext().getOut();
        out.println("<nav>");
        out.println("<div class=\"container\">");
        out.println("<img src=\"image/job.png\" alt=\"Background Image\" style=\"margin-left:-150px;width:100px;height:68px;\">");

        if (ADMIN.equalsIgnoreCase(role)) {
            out.println("<h1 style=\"margin-left:-480px;\">Job Recruitment <span style=\"color:blue;font-size:12px;\">by fanta</span> </h1>");
            out.println("<ul>");
            out.println("<li><a href=\"index.jsp\">Home</a></li>");
            out.println("<li><a href=\"dashboard.jsp\">Dashboard</a></li>");
            out.println("<li><a href=\"recruitmentCompany?action=listofcompany\">Company List</a></li>");
            out.println("<li><a href=\"user?action=listUsers\">User List</a></li>");
            if ("true".equals(session)) { // Check if session is valid
                out.println("<li><a href=\"logout\">Logout</a></li>");
            }
        } else if (COMPANY.equalsIgnoreCase(role)) {
            out.println("<h1 style=\"margin-left:-400px;\">Job Recruitment <span style=\"color:blue;font-size:12px;\">by fanta</span> </h1>");
            out.println("<ul>");
            out.println("<li><a href=\"index.jsp\">Home</a></li>");
            out.println("<li><a href=\"hire_candidate.jsp\">Job Application</a></li>");
            out.println("<li><a href=\"jobVacancies?action=listJobs&userId=" + userId + "\">Job Vacancies</a></li>");
            out.println("<li><a href=\"company_profile.jsp\">Company Profile</a></li>");
            if ("true".equals(session)) { // Check if session is valid
                out.println("<li><a href=\"logout\">Logout</a></li>");
            }
        } else if (CANDIDATE.equalsIgnoreCase(role)) {
            out.println("<h1 style=\"margin-left:-580px;\">Job Recruitment <span style=\"color:blue;font-size:12px;\">by fanta</span> </h1>");
            out.println("<ul>");
            out.println("<li><a href=\"index.jsp\">Home</a></li>");
            out.println("<li><a href=\"jobVacancies?action=alljobVacancies\">Jobs</a></li>");
            out.println("<li><a href=\"updateprofile.jsp\">Update Profile</a></li>");
            out.println("<li><a href=\"aboutus.jsp\">About Us</a></li>");
            if ("true".equals(session)) { // Check if session is valid
                out.println("<li><a href=\"logout\">Logout</a></li>");
            } else {
                out.println("<li><a href=\"login.jsp\">Login/Signup</a></li>");

            }

        } else {
            out.println("<h1 style=\"margin-left:-580px;\">Job Recruitment <span style=\"color:blue;font-size:12px;\">by fanta</span> </h1>");
            out.println("<ul>");
            out.println("<li><a href=\"index.jsp\">Home</a></li>");
            out.println("<li><a href=\"jobVacancies?action=alljobVacancies\">Jobs</a></li>");
            out.println("<li><a href=\"login.jsp\">Login/Signup</a></li>");
            out.println("<li><a href=\"aboutus.jsp\">About Us</a></li>");
            if ("true".equals(session)) { // Check if session is valid
                out.println("<li><a href=\"logout\">Logout</a></li>");
            }
        }

        out.println("</ul>");
        out.println("</div>");
        out.println("</nav>");
    }
}
