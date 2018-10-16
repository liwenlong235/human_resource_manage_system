package com.li.entity;

import java.sql.Date;

/**
 * Created by 99234 on 2018/10/12.
 */
public class Resume {
    private int rId;
    private User user;
    private String rTitle;
    private String uName;
    private Date uBirth;
    private String uGender;
    private Date firstWorkTime;
    private String tel;
    private String email;
    private Department department;
    private Position position;
    private String workExperience;
    private String education;
    private double expectSalary;
    private String hobbies;

    public Resume() {
    }

    public Resume(int rId, User user, String rTitle, String uName, Date uBirth, String uGender, Date firstWorkTime, String tel, String email, Department department, Position position, String workExperience, String education, double expectSalary, String hobbies) {
        this.rId = rId;
        this.user = user;
        this.rTitle = rTitle;
        this.uName = uName;
        this.uBirth = uBirth;
        this.uGender = uGender;
        this.firstWorkTime = firstWorkTime;
        this.tel = tel;
        this.email = email;
        this.department = department;
        this.position = position;
        this.workExperience = workExperience;
        this.education = education;
        this.expectSalary = expectSalary;
        this.hobbies = hobbies;
    }

    public int getrId() {
        return rId;
    }

    public void setrId(int rId) {
        this.rId = rId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getrTitle() {
        return rTitle;
    }

    public void setrTitle(String rTitle) {
        this.rTitle = rTitle;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName;
    }

    public Date getuBirth() {
        return uBirth;
    }

    public void setuBirth(Date uBirth) {
        this.uBirth = uBirth;
    }

    public String getuGender() {
        return uGender;
    }

    public void setuGender(String uGender) {
        this.uGender = uGender;
    }

    public Date getFirstWorkTime() {
        return firstWorkTime;
    }

    public void setFirstWorktime(Date firstWorkTime) {
        this.firstWorkTime = firstWorkTime;
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

    public String getWorkExperience() {
        return workExperience;
    }

    public void setWorkExperience(String workExperience) {
        this.workExperience = workExperience;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public double getExpectSalary() {
        return expectSalary;
    }

    public void setExpectSalary(double expectSalary) {
        this.expectSalary = expectSalary;
    }

    public String getHobbies() {
        return hobbies;
    }

    public void setHobbies(String hobbies) {
        this.hobbies = hobbies;
    }

    @Override
    public String toString() {
        return "Resume{" +
                "rId=" + rId +
                ", user=" + user +
                ", rTitle='" + rTitle + '\'' +
                ", uName='" + uName + '\'' +
                ", uBirth=" + uBirth +
                ", uGender='" + uGender + '\'' +
                ", firstWorkTime=" + firstWorkTime +
                ", tel=" + tel +
                ", email='" + email + '\'' +
                ", department=" + department +
                ", position=" + position +
                ", workExperience='" + workExperience + '\'' +
                ", education='" + education + '\'' +
                ", expectSalary=" + expectSalary +
                ", hobbies='" + hobbies + '\'' +
                '}';
    }
}
