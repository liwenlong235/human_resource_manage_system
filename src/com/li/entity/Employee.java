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
    private long tel;
    private String email;
    private Department department;
    private Position position;
    private Date entryTime;
    private Date dimissionTime;
    private String education;
    private Salary salary;

    public Employee() {
    }

    public Employee(int eId, String eName, String ePassword,String gender, long tel, String email, Department department, Position position, Date entryTime, Date dimissionTime, String education, Salary salary) {
        this.eId = eId;
        this.eName = eName;
        this.ePassword = ePassword;
        this.gender = gender;
        this.tel = tel;
        this.email = email;
        this.department = department;
        this.position = position;
        this.entryTime = entryTime;
        this.dimissionTime = dimissionTime;
        this.education = education;
        this.salary = salary;
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

    public long getTel() {
        return tel;
    }

    public void setTel(long tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public Position getPosition() {
        return position;
    }

    public void setPosition(Position position) {
        this.position = position;
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

    public Salary getSalary() {
        return salary;
    }

    public void setSalary(Salary salary) {
        this.salary = salary;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "eId=" + eId +
                ", eName='" + eName + '\'' +
                ", ePassword='" + ePassword + '\'' +
                ", gender='" + gender + '\'' +
                ", tel=" + tel +
                ", email='" + email + '\'' +
                ", department=" + department.getName() +
                ", position=" + position.getpName() +
                ", entryTime=" + entryTime +
                ", dimissionTime=" + dimissionTime +
                ", education='" + education + '\'' +
                ", salary=" + salary +
                '}';
    }
}
