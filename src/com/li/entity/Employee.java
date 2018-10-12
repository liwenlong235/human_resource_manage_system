package com.li.entity;

import java.sql.Date;

/**
 * Created by 99234 on 2018/10/12.
 */
public class Employee {
    private int eId;
    private String eName;
    private String gender;
    private long tel;
    private String email;
    private Department department;
    private Position position;
    private Date enrtyTime;
    private Date dimissionTime;
    private String education;
    private double salary;

    public Employee() {
    }

    public Employee(int eId, String eName, String gender, long tel, String email, Department department, Position position, Date enrtyTime, Date dimissionTime, String education, double salary) {
        this.eId = eId;
        this.eName = eName;
        this.gender = gender;
        this.tel = tel;
        this.email = email;
        this.department = department;
        this.position = position;
        this.enrtyTime = enrtyTime;
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

    public Date getEnrtyTime() {
        return enrtyTime;
    }

    public void setEnrtyTime(Date enrtyTime) {
        this.enrtyTime = enrtyTime;
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

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "eId=" + eId +
                ", eName='" + eName + '\'' +
                ", gender='" + gender + '\'' +
                ", tel=" + tel +
                ", email='" + email + '\'' +
                ", department=" + department +
                ", position=" + position +
                ", enrtyTime=" + enrtyTime +
                ", dimissionTime=" + dimissionTime +
                ", education='" + education + '\'' +
                ", salary=" + salary +
                '}';
    }
}
