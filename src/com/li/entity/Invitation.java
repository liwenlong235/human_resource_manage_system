package com.li.entity;

import java.util.Date;

/**
 * Created by 99234 on 2018/10/13.
 */
public class Invitation {
    private int iId;
    private int cId;
    private Date inviteTime;
    private String manager;
    private String address;
    private int confirmed;
    private int pass;

    public Invitation() {
    }

    public Invitation(int iId) {
        this.iId = iId;
    }

    public Invitation(int iId, int cId, Date inviteTime, String manager, String address, int confirmed, int pass) {
        this.iId = iId;
        this.cId = cId;
        this.inviteTime = inviteTime;
        this.manager = manager;
        this.address = address;
        this.confirmed = confirmed;
        this.pass = pass;
    }

    public int getiId() {
        return iId;
    }

    public void setiId(int iId) {
        this.iId = iId;
    }

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public Date getInviteTime() {
        return inviteTime;
    }

    public void setInviteTime(Date inviteTime) {
        this.inviteTime = inviteTime;
    }

    public String getManager() {
        return manager;
    }

    public void setManager(String manager) {
        this.manager = manager;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getConfirmed() {
        return confirmed;
    }

    public void setConfirmed(int confirmed) {
        this.confirmed = confirmed;
    }

    public int getPass() {
        return pass;
    }

    public void setPass(int pass) {
        this.pass = pass;
    }

    @Override
    public String toString() {
        return "Invitation{" +
                "iId=" + iId +
                ", cId=" + cId +
                ", inviteTime=" + inviteTime +
                ", manager='" + manager + '\'' +
                ", address='" + address + '\'' +
                ", confirmed=" + confirmed +
                ", pass=" + pass +
                '}';
    }
}
