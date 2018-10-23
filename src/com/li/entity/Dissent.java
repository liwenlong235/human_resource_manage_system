package com.li.entity;

/**
 * Created by 99234 on 2018/10/23.
 */
public class Dissent {
    private int dId;
    private int sId;
    private String dissent;
    private int agree;

    public Dissent() {
    }

    public Dissent(int dId, int sId, String dissent, int agree) {
        this.dId = dId;
        this.sId = sId;
        this.dissent = dissent;
        this.agree = agree;
    }

    public int getdId() {
        return dId;
    }

    public void setdId(int dId) {
        this.dId = dId;
    }

    public int getsId() {
        return sId;
    }

    public void setsId(int sId) {
        this.sId = sId;
    }

    public String getDissent() {
        return dissent;
    }

    public void setDissent(String dissent) {
        this.dissent = dissent;
    }

    public int getAgree() {
        return agree;
    }

    public void setAgree(int agree) {
        this.agree = agree;
    }

    @Override
    public String toString() {
        return "Dissent{" +
                "dId=" + dId +
                ", sId=" + sId +
                ", dissent='" + dissent + '\'' +
                ", agree=" + agree +
                '}';
    }
}
