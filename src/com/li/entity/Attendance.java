package com.li.entity;

import java.sql.Time;
import java.sql.Date;

/**
 * Created by 99234 on 2018/10/16.
 */
public class Attendance {
    private int aId;
    private int eId;
    private int month;
    private Date day;
    private Time morning;
    private Time night;
    private double lateTime;
    private double absenteeism;

    public Attendance() {
    }

    public Attendance(int aId, int eId, int month, Date day, Time morning, Time night, double lateTime, double absenteeism) {
        this.aId = aId;
        this.eId = eId;
        this.month = month;
        this.day = day;
        this.morning = morning;
        this.night = night;
        this.lateTime = lateTime;
        this.absenteeism = absenteeism;
    }

    public int getaId() {
        return aId;
    }

    public void setaId(int aId) {
        this.aId = aId;
    }

    public int geteId() {
        return eId;
    }

    public void seteId(int eId) {
        this.eId = eId;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public Date getDay() {
        return day;
    }

    public void setDay(Date day) {
        this.day = day;
    }

    public Time getMorning() {
        return morning;
    }

    public void setMorning(Time morning) {
        this.morning = morning;
    }

    public Time getNight() {
        return night;
    }

    public void setNight(Time night) {
        this.night = night;
    }

    public double getLateTime() {
        return lateTime;
    }

    public void setLateTime(double lateTime) {
        this.lateTime = lateTime;
    }

    public double getAbsenteeism() {
        return absenteeism;
    }

    public void setAbsenteeism(double absenteeism) {
        this.absenteeism = absenteeism;
    }

    @Override
    public String toString() {
        return "Attendance{" +
                "aId=" + aId +
                ", eId=" + eId +
                ", month=" + month +
                ", day=" + day +
                ", morning=" + morning +
                ", night=" + night +
                ", lateTime=" + lateTime +
                ", absenteeism=" + absenteeism +
                '}';
    }
}
