package com.li.serviceImpl;

import com.li.dao.AttendanceDao;
import com.li.entity.Attendance;
import com.li.service.AttendanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 99234 on 2018/10/16.
 */
@Service("attendanceService")
public class AttendanceServiceImpl implements AttendanceService {
    @Autowired
    private AttendanceDao attendanceDao;
    @Override
    public void add(Attendance attendance) {
        attendanceDao.add(attendance);
    }

    @Override
    public void update(Attendance attendance) {
        attendanceDao.update(attendance);
    }

    @Override
    public void deleteById(int id) {
        attendanceDao.deleteById(id);
    }

    @Override
    public Attendance queryById(int id) {
        return attendanceDao.queryById(id);
    }

    @Override
    public List<Attendance> queryByEIdAndMonth(int eId, int month) {
        return attendanceDao.queryByEIdAndMonth(eId,month);
    }

    @Override
    public List<Attendance> queryAll() {
        return attendanceDao.queryAll();
    }
}
