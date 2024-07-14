/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

/**
 *
 * @author Lenovo
 */
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.OneToOne;

@Entity
@DiscriminatorValue("CompanyUser")
public class CompanyUser extends User {
    @OneToOne(mappedBy = "user")
    private RecruitmentCompany recruitmentCompany;

    public RecruitmentCompany getRecruitmentCompany() {
        return recruitmentCompany;
    }

    public void setRecruitmentCompany(RecruitmentCompany recruitmentCompany) {
        this.recruitmentCompany = recruitmentCompany;
    }
}
