package com.tag;


import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;

public class NavBarTag extends SimpleTagSupport {
    @Override
    public void doTag() throws JspException, IOException {
        JspWriter out = getJspContext().getOut();
        out.println("<nav>");
        out.println("<div class=\"container\">");
        out.println("<img src=\"image/job.png\" alt=\"Background Image\" style=\"margin-left:-150px;width:100px;height:68px;\">");
        out.println("<h1 style=\"margin-left:-580px;;\">Job Recruitment <span style=\"color:blue;font-size:12px;\">by vintech</span> </h1>");
        out.println("<ul>");
        out.println("<li><a href=\"index.jsp\">Home</a></li>");
        out.println("<li><a href=\"jobs.jsp\">Jobs</a></li>");
        out.println("<li><a href=\"login.jsp\">Login/Signup</a></li>");
        out.println("<li><a href=\"aboutus.jsp\">About Us</a></li>");
        out.println("</ul>");
        out.println("</div>");
        out.println("</nav>");
    }
}