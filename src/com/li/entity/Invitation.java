package com.li.entity;

import java.util.Date;

/**
 * Created by 99234 on 2018/10/13.
 */
public class Invitation {
    private int iId;
    private int rId;
    private Date inviteTime;
    private String manager;
    private String address;
    private boolean confirmed;
    private boolean pass;

    public Invitation() {
    }

    public Invitation(int iId) {
        this.iId = iId;
    }

    public Invitation(int iId, int rId, Date inviteTime, String manager, String address, boolean confirmed, boolean pass) {
        this.iId = iId;
        this.rId = rId;
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

    public int getrId() {
        return rId;
    }

    public void setrId(int rId) {
        this.rId = rId;
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

    public boolean isConfirmed() {
        return confirmed;
    }

    public void setConfirmed(boolean confirmed) {
        this.confirmed = confirmed;
    }

    public boolean isPass() {
        return pass;
    }

    public void setPass(boolean pass) {
        this.pass = pass;
    }

    @Override
    public String toString() {
        return "Invitation{" +
                "iId=" + iId +
                ", rId=" + rId +
                ", inviteTime=" + inviteTime +
                ", manager='" + manager + '\'' +
                ", address='" + address + '\'' +
                ", confirmed=" + confirmed +
                ", pass=" + pass +
                '}';
    }
}
