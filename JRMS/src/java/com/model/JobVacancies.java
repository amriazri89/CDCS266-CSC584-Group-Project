package com.model;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "job_vacancies")
public class JobVacancies {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String title;
    private String description;
    private String salary;
    private String status;

    @OneToMany(mappedBy = "jobVacancies", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<JobApplication> jobApplications;

    @ManyToOne
    @JoinColumn(name = "recruitment_company_id")
    private RecruitmentCompany recruitmentCompany;

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSalary() {
        return salary;
    }

    public void setSalary(String salary) {
        this.salary = salary;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<JobApplication> getJobApplications() {
        return jobApplications;
    }

    public void setJobApplications(List<JobApplication> jobApplications) {
        this.jobApplications = jobApplications;
    }

    public RecruitmentCompany getRecruitmentCompany() {
        return recruitmentCompany;
    }

    public void setRecruitmentCompany(RecruitmentCompany recruitmentCompany) {
        this.recruitmentCompany = recruitmentCompany;
    }
}
