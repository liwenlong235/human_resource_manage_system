package com.li.utils;

import java.util.Date;

/**
 * Created by 99234 on 2018/10/16.
 */
public class DateUtil {
    public static int compareDate(Date date1,Date date2){
        if(date1.getTime()>date2.getTime()){
            return 1;
        }else if(date1.getTime()<date2.getTime()){
            return -1;
        }else {
            return 0;
        }
    }
    public static double getDisTime(Date date1,Date date2){
        long time = Math.abs(date1.getTime()-date2.getTime());
        long day = time/(1000 * 60 * 60 * 24);
        long hour = time/(1000 * 60 * 60)- day * 24;
        long min = time / (1000 * 60) - day * 24 * 60 - hour * 60;
        double time1 = hour;
        if(min>=30){
            time1 = time1 + 0.5;
        }
        return time1;
    }
}
