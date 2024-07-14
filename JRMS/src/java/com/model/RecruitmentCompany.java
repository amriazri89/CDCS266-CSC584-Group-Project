package com.model;

import java.util.List;
import javax.persistence.*;

@Entity
@Table(name = "recruitment_company")
public class RecruitmentCompany {
    public static final String[] INDUSTRY = {
        "Accounting",
        "Agriculture, Forestry & Fishing",
        "Automotive",
        "Construction",
        "Consulting",
        "Education",
        "Entertainment",
        "Finance",
        "Food & Beverage",
        "Healthcare",
        "Information Technology",
        "Manufacturing",
        "Marketing & Advertising",
        "Retail",
        "Telecommunications"
    };


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String email;
    private String description;
    private String phone;
    private String address;
    private String industry;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @OneToMany(mappedBy = "recruitmentCompany", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<JobVacancies> jobVacancies;

    public List<JobVacancies> getJobVacancies() {
        return jobVacancies;
    }

    public void setJobVacancies(List<JobVacancies> jobVacancies) {
        this.jobVacancies = jobVacancies;
    }

    public String getIndustry() {
        return industry;
    }

    public void setIndustry(String industry) {
        this.industry = industry;
    }

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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}
