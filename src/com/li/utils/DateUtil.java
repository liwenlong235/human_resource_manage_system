package com.li.utils;

import java.sql.Time;
import java.text.SimpleDateFormat;
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
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("HH:mm:ss");
        String a1 = simpleDateFormat.format(date1);
        String a2 = simpleDateFormat.format(date2);
        date1 = Time.valueOf(a1);
        date2 = Time.valueOf(a2);
        long time = Math.abs(date1.getTime()-date2.getTime());
        long day = time/(1000 * 60 * 60 * 24);
        long hour = time/(1000 * 60 * 60)- day * 24;
        long min = time / (1000 * 60) - day * 24 * 60 - hour * 60;
        double hour1 = hour;
        if(min<=30&&min>0){
            hour1 = hour + 0.5;
        }else if(min>30){
            hour1 = hour + 1;
        }
        return hour1;
    }

    public static int compareDay(Date date1,Date date2){
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
        return sf.format(date1).compareTo(sf.format(date2));
    }
    public static int compareTime(Date date1,Date date2){
        SimpleDateFormat sf = new SimpleDateFormat("HH:mm:ss");
        return sf.format(date1).compareTo(sf.format(date2));
    }
}
