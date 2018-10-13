package com.li.entity;

/**
 * Created by 99234 on 2018/10/12.
 */
public class Salary {
    private int sId;
    private String sMonth;
    private int eId;
    private String eName;
    private double sBasic;
    private double bonus;
    private double overtimeWeekday;
    private double overtimeWeekend;
    private double overtimePay;
    private double leaveTime;
    private double absentTime;
    private double sDeduct;
    private double backPay;
    private double sReal;
    private String remarks;

    public Salary() {
    }

    public Salary(int sId, String sMonth, int eId, String eName, double sBasic, double bonus, double overtimeWeekday, double overtimeWeekend, double overtimePay, double leaveTime, double absentTime, double sDeduct, double backPay, double sReal, String remarks) {
        this.sId = sId;
        this.sMonth = sMonth;
        this.eId = eId;
        this.eName = eName;
        this.sBasic = sBasic;
        this.bonus = bonus;
        this.overtimeWeekday = overtimeWeekday;
        this.overtimeWeekend = overtimeWeekend;
        this.overtimePay = overtimePay;
        this.leaveTime = leaveTime;
        this.absentTime = absentTime;
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

    public String getsMonth() {
        return sMonth;
    }

    public void setsMonth(String sMonth) {
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

    public double getOvertimeWeekday() {
        return overtimeWeekday;
    }

    public void setOvertimeWeekday(double overtimeWeekday) {
        this.overtimeWeekday = overtimeWeekday;
    }

    public double getOvertimeWeekend() {
        return overtimeWeekend;
    }

    public void setOvertimeWeekend(double overtimeWeekend) {
        this.overtimeWeekend = overtimeWeekend;
    }

    public double getOvertimePay() {
        return overtimePay;
    }

    public void setOvertimePay(double overtimePay) {
        this.overtimePay = overtimePay;
    }

    public double getLeaveTime() {
        return leaveTime;
    }

    public void setLeaveTime(double leaveTime) {
        this.leaveTime = leaveTime;
    }

    public double getAbsentTime() {
        return absentTime;
    }

    public void setAbsentTime(double absentTime) {
        this.absentTime = absentTime;
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
                ", overtimeWeekday=" + overtimeWeekday +
                ", overtimeWeekend=" + overtimeWeekend +
                ", overtimePay=" + overtimePay +
                ", leaveTime=" + leaveTime +
                ", absentTime=" + absentTime +
                ", sDeduct=" + sDeduct +
                ", backPay=" + backPay +
                ", sReal=" + sReal +
                ", remarks='" + remarks + '\'' +
                '}';
    }
}
