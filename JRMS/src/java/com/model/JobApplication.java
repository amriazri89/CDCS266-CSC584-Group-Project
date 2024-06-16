package com.model;

import java.util.Date;
import javax.persistence.*;

@Entity
@Table(name = "job_application")
public class JobApplication {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String number;
    private String offerStatus;
    private String offerDetails;
    private Date interviewDate;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "job_vacancies_id")
    private JobVacancies jobVacancies;

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getOfferStatus() {
        return offerStatus;
    }

    public void setOfferStatus(String offerStatus) {
        this.offerStatus = offerStatus;
    }

    public String getOfferDetails() {
        return offerDetails;
    }

    public void setOfferDetails(String offerDetails) {
        this.offerDetails = offerDetails;
    }

    public Date getInterviewDate() {
        return interviewDate;
    }

    public void setInterviewDate(Date interviewDate) {
        this.interviewDate = interviewDate;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public JobVacancies getJobVacancies() {
        return jobVacancies;
    }

    public void setJobVacancies(JobVacancies jobVacancies) {
        this.jobVacancies = jobVacancies;
    }
}
