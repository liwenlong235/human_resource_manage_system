package com.li.entity;

import java.sql.Date;

/**
 * Created by 99234 on 2018/10/12.
 */
public class Employee {
    private int eId;
    private String eName;
    private String ePassword;
    private String gender;
    private String tel;
    private String email;
    private int dId;
    private int pId;
    private Date entryTime;
    private Date dimissionTime;
    private String education;

    public Employee() {
    }

    public Employee(int eId, String eName, String ePassword, String gender, String tel, String email, int dId, int pId, Date entryTime, Date dimissionTime, String education) {
        this.eId = eId;
        this.eName = eName;
        this.ePassword = ePassword;
        this.gender = gender;
        this.tel = tel;
        this.email = email;
        this.dId = dId;
        this.pId = pId;
        this.entryTime = entryTime;
        this.dimissionTime = dimissionTime;
        this.education = education;
    }

    public int geteId() {
        return eId;
    }

    public void seteId(int eId) {
        this.eId = eId;
    }

    public String geteName() {
        return eName;
    }

    public void seteName(String eName) {
        this.eName = eName;
    }

    public String getePassword() {
        return ePassword;
    }

    public void setePassword(String ePassword) {
        this.ePassword = ePassword;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getdId() {
        return dId;
    }

    public void setdId(int dId) {
        this.dId = dId;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public Date getEntryTime() {
        return entryTime;
    }

    public void setEntryTime(Date entryTime) {
        this.entryTime = entryTime;
    }

    public Date getDimissionTime() {
        return dimissionTime;
    }

    public void setDimissionTime(Date dimissionTime) {
        this.dimissionTime = dimissionTime;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }


    @Override
    public String toString() {
        return "Employee{" +
                "eId=" + eId +
                ", eName='" + eName + '\'' +
                ", ePassword='" + ePassword + '\'' +
                ", gender='" + gender + '\'' +
                ", tel='" + tel + '\'' +
                ", email='" + email + '\'' +
                ", dId=" + dId +
                ", pId=" + pId +
                ", entryTime=" + entryTime +
                ", dimissionTime=" + dimissionTime +
                ", education='" + education + '\'' +
                '}';
    }
}
