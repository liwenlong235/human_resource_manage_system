package com.li.entity;

import java.util.Date;

/**
 * Created by 99234 on 2018/10/16.
 */
public class Train {
    private int tId;
    private String title;
    private int eId;
    private Date startTime;
    private Date endTime;
    private double result;

    public Train() {
    }

    public Train(int tId, String title, int eId, Date startTime, Date endTime, double result) {
        this.tId = tId;
        this.title = title;
        this.eId = eId;
        this.startTime = startTime;
        this.endTime = endTime;
        this.result = result;
    }

    public int gettId() {
        return tId;
    }

    public void settId(int tId) {
        this.tId = tId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int geteId() {
        return eId;
    }

    public void seteId(int eId) {
        this.eId = eId;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public double getResult() {
        return result;
    }

    public void setResult(double result) {
        this.result = result;
    }

    @Override
    public String toString() {
        return "Train{" +
                "tId=" + tId +
                ", title='" + title + '\'' +
                ", eId=" + eId +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                ", result=" + result +
                '}';
    }
}
