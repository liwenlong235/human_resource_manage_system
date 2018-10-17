package com.li.entity;

/**
 * Created by 99234 on 2018/10/16.
 */
public class Manager {
    private int mId;
    private String mName;
    private String mPassword;
    private int type;
    private String dName;
    private String pName;

    public Manager() {
    }

    public Manager(int mId, String mName, String mPassword, int type, String dName, String pName) {
        this.mId = mId;
        this.mName = mName;
        this.mPassword = mPassword;
        this.type = type;
        this.dName = dName;
        this.pName = pName;
    }

    public int getmId() {
        return mId;
    }

    public void setmId(int mId) {
        this.mId = mId;
    }

    public String getmName() {
        return mName;
    }

    public void setmName(String mName) {
        this.mName = mName;
    }

    public String getmPassword() {
        return mPassword;
    }

    public void setmPassword(String mPassword) {
        this.mPassword = mPassword;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getdName() {
        return dName;
    }

    public void setdName(String dName) {
        this.dName = dName;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    @Override
    public String toString() {
        return "Manager{" +
                "mId=" + mId +
                ", mName='" + mName + '\'' +
                ", mPassword='" + mPassword + '\'' +
                ", type=" + type +
                ", dName='" + dName + '\'' +
                ", pName='" + pName + '\'' +
                '}';
    }
}
