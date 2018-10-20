package com.li.service;

import com.li.entity.Attendance;
import org.apache.ibatis.annotations.Param;

import java.sql.Date;
import java.util.List;

/**
 * Created by 99234 on 2018/10/16.
 */
public interface AttendanceService {
    public void add(Attendance attendance);
    public void update(Attendance attendance);
    public void deleteById(int id);
    public Attendance queryById(int id);
    public Attendance queryByDayAndEId(Date date,int eId);
    public List<Attendance> queryByEId(int eId);
    public List<Attendance> queryByMonth(int month);
    public List<Attendance> queryByEIdAndMonth(@Param("eId") int eId, @Param("month")int month);
    public List<Attendance> queryAll();
}
