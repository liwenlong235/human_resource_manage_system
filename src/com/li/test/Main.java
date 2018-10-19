package com.li.test;

import com.li.dao.DepartmentDao;
import com.li.dao.PositionDao;
import com.li.entity.*;
import com.li.service.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
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
    @Test
    public void login(){
        Department department = new Department(-1,"后勤部",new java.util.Date());
        departmentDao.add(department);
        System.out.println(departmentDao.queryByName("后勤部"));
    }
}
