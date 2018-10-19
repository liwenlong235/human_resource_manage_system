package com.li.entity;

import java.util.Date;

/**
 * Created by 99234 on 2018/10/12.
 */
public class Position {
    private int pId;
    private String  pName;
    private int dId;
    private Date createTime;

    public Position() {
    }

    public Position(int pId, String pName, int dId) {
        this.pId = pId;
        this.pName = pName;
        this.dId = dId;
    }

    public Position(int pId, String pName, int dId, Date createTime) {
        this.pId = pId;
        this.pName = pName;
        this.dId = dId;
        this.createTime = createTime;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public int getdId() {
        return dId;
    }

    public void setdId(int dId) {
        this.dId = dId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Position{" +
                "pId=" + pId +
                ", pName='" + pName + '\'' +
                ", dId=" + dId +
                ", createTime=" + createTime +
                '}';
    }
}
