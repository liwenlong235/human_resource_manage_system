package com.li.entity;

/**
 * Created by 99234 on 2018/10/12.
 */
public class Salary {
    private int sId;
    private int sMonth;
    private int eId;
    private String eName;
    private double sBasic;
    private double bonus;
    private double sDeduct;
    private double backPay;
    private double sReal;
    private String remarks;

    public Salary() {
    }

    public Salary(int sId, int sMonth, int eId, String eName, double sBasic, double bonus, double sDeduct, double backPay, double sReal, String remarks) {
        this.sId = sId;
        this.sMonth = sMonth;
        this.eId = eId;
        this.eName = eName;
        this.sBasic = sBasic;
        this.bonus = bonus;
        this.sDeduct = sDeduct;
        this.backPay = backPay;
        this.sReal = sReal;
        this.remarks = remarks;
    }

    public int getsId() {
        return sId;
    }

    public void setsId(int sId) {
        this.sId = sId;
    }

    public int getsMonth() {
        return sMonth;
    }

    public void setsMonth(int sMonth) {
        this.sMonth = sMonth;
    }

    public int geteId() {
        return eId;
    }

    public void seteId(int eId) {
        this.eId = eId;
    }

    public String geteName() {
        return eName;
    }

    public void seteName(String eName) {
        this.eName = eName;
    }

    public double getsBasic() {
        return sBasic;
    }

    public void setsBasic(double sBasic) {
        this.sBasic = sBasic;
    }

    public double getBonus() {
        return bonus;
    }

    public void setBonus(double bonus) {
        this.bonus = bonus;
    }

    public double getsDeduct() {
        return sDeduct;
    }

    public void setsDeduct(double sDeduct) {
        this.sDeduct = sDeduct;
    }

    public double getBackPay() {
        return backPay;
    }

    public void setBackPay(double backPay) {
        this.backPay = backPay;
    }

    public double getsReal() {
        return sReal;
    }

    public void setsReal(double sReal) {
        this.sReal = sReal;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    @Override
    public String toString() {
        return "Salary{" +
                "sId=" + sId +
                ", sMonth='" + sMonth + '\'' +
                ", eId=" + eId +
                ", eName='" + eName + '\'' +
                ", sBasic=" + sBasic +
                ", bonus=" + bonus +
                ", sDeduct=" + sDeduct +
                ", backPay=" + backPay +
                ", sReal=" + sReal +
                ", remarks='" + remarks + '\'' +
                '}';
    }
}
