package com.model;

import javax.persistence.*;
import java.util.List;

@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "class", discriminatorType = DiscriminatorType.STRING)
@Table(name = "user")
public class User {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    //@Column(nullable = false)
    private String username;
    private String password;
    private String email;
    private String phone;
    private String fullname;
    private String noIc;
    private String status = "Active";
    private String address;
    
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<JobApplication> jobApplications;
    
    public String getRole() {
        if (this instanceof CompanyUser) {
            return "Company";
        } else if (this instanceof CandidateUser) {
            return "Candidate";
        } else if (this instanceof AdminUser) {
            return "Admin";
        } else {
            return "Unknown";
        }
    }
    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getNoIc() {
        return noIc;
    }

    public void setNoIc(String noIc) {
        this.noIc = noIc;
    }
    public String getAddress(){
        return address;
    }
    public void setAddress(String address){
        this.address=address;
    }

    public List<JobApplication> getJobApplications() {
        return jobApplications;
    }

    public void setJobApplications(List<JobApplication> jobApplications) {
        this.jobApplications = jobApplications;
    }
}
