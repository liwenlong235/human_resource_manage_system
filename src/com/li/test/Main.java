package com.li.test;

import com.li.dao.AttendanceDao;
import com.li.dao.DepartmentDao;
import com.li.dao.DissentDao;
import com.li.dao.PositionDao;
import com.li.entity.*;
import com.li.service.*;
import com.li.utils.DateUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * Created by 99234 on 2018/10/12.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class Main {
    @Autowired
    private UserService userService;
    @Autowired
    private DepartmentDao departmentDao;
    @Autowired
    private JobService jobService;
    @Autowired
    private ResumeService resumeService;
    @Autowired
    private CommitRecordService commitRecordService;
    @Autowired
    private ManagerService managerService;
    @Autowired
    private PositionDao positionDao;
    @Autowired
    private DissentDao dissentDao;
    @Autowired
    private AttendanceDao attendanceDao;
    @Autowired
    private DissentService dissentService;
    @Autowired
    private AwardService awardService;
    @Autowired
    private EmployeeService employeeService;
    @Test
    public void login(){

    }
}
