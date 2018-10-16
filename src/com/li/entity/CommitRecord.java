package com.li.entity;

import java.util.Date;

/**
 * Created by 99234 on 2018/10/13.
 */
public class CommitRecord {
    private int cId;
    private int jId;
    private int rId;
    private Date commitTime;
    private Boolean rStatus;
    private int iId;

    public CommitRecord() {
    }

    public CommitRecord(int cId, int jId, int rId, Date commitTime, Boolean rStatus, int iId) {
        this.cId = cId;
        this.jId = jId;
        this.rId = rId;
        this.commitTime = commitTime;
        this.rStatus = rStatus;
        this.iId = iId;
    }

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public int getrId() {
        return rId;
    }

    public void setrId(int rId) {
        this.rId = rId;
    }

    public Date getCommitTime() {
        return commitTime;
    }

    public void setCommitTime(Date commitTime) {
        this.commitTime = commitTime;
    }

    public Boolean getrStatus() {
        return rStatus;
    }

    public void setrStatus(Boolean rStatus) {
        this.rStatus = rStatus;
    }

    public int getiId() {
        return iId;
    }

    public void setiId(int iId) {
        this.iId = iId;
    }

    public int getjId() {
        return jId;
    }

    public void setjId(int jId) {
        this.jId = jId;
    }

    @Override
    public String toString() {
        return "CommitRecord{" +
                "cId=" + cId +
                ", jId=" + jId +
                ", rId=" + rId +
                ", commitTime=" + commitTime +
                ", rStatus=" + rStatus +
                ", iId=" + iId +
                '}';
    }
}
