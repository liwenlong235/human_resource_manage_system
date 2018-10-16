package com.li.entity;

import java.util.Date;

/**
 * Created by 99234 on 2018/10/13.
 */
public class Job {
    private int jId;
    private Position position;
    private String company;
    private String address;
    private String salaryRange;
    private String duty;
    private String requirements;
    private Date pubdate;

    public Job() {
    }

    public Job(int jId, Position position, String company, String address, String salaryRange, String duty, String requirements, Date pubdate) {
        this.jId = jId;
        this.position = position;
        this.company = company;
        this.address = address;
        this.salaryRange = salaryRange;
        this.duty = duty;
        this.requirements = requirements;
        this.pubdate = pubdate;
    }

    public int getjId() {
        return jId;
    }

    public void setjId(int jId) {
        this.jId = jId;
    }

    public Position getPosition() {
        return position;
    }

    public void setPosition(Position position) {
        this.position = position;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getSalaryRange() {
        return salaryRange;
    }

    public void setSalaryRange(String salaryRange) {
        this.salaryRange = salaryRange;
    }

    public String getDuty() {
        return duty;
    }

    public void setDuty(String duty) {
        this.duty = duty;
    }

    public String getRequirements() {
        return requirements;
    }

    public void setRequirements(String requirements) {
        this.requirements = requirements;
    }

    public Date getPubdate() {
        return pubdate;
    }

    public void setPubdate(Date pubdate) {
        this.pubdate = pubdate;
    }

    @Override
    public String toString() {
        return "Job{" +
                "jId=" + jId +
                ", position=" + position +
                ", company='" + company + '\'' +
                ", address='" + address + '\'' +
                ", salaryRange='" + salaryRange + '\'' +
                ", duty='" + duty + '\'' +
                ", requirements='" + requirements + '\'' +
                ", pubdate=" + pubdate +
                '}';
    }
}
