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
}
