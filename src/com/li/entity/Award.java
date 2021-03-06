package com.li.entity;

import java.util.Date;

/**
 * Created by 99234 on 2018/10/16.
 */
public class Award {
    private int aId;
    private int eId;
    private double money;
    private String reason;
    private Date createTime;

    public Award() {
    }

    public Award(int aId, int eId, double money, String reason, Date createTime) {
        this.aId = aId;
        this.eId = eId;
        this.money = money;
        this.reason = reason;
        this.createTime = createTime;
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

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Award{" +
                "aId=" + aId +
                ", eId=" + eId +
                ", money=" + money +
                ", reason='" + reason + '\'' +
                ", createTime=" + createTime +
                '}';
    }
}
