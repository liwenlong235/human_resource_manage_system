package com.li.test;

import com.li.dao.DepartmentDao;
import com.li.entity.*;
import com.li.service.JobService;
import com.li.service.ResumeService;
import com.li.service.UserService;
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
    @Test
    public void login(){
        User user = new User(9,"bbb","12345");
        String rTitle = "简历1";
        String uName = "bbb";
        Date uBirth = Date.valueOf("1995-10-20");
        String uGender = "男";
        Date firstWorktime = Date.valueOf("2017-10-11");
        String tel = "12345654321";
        String email = "123@163.com";
        Department department = departmentDao.queryById(2);
        Position position = department.getPositions().get(2);
        department = new Department(department.getId(),department.getName());
        String workExperience = "good";
        String education = "大专";
        double expectSalary = 10000;
        String hobbies = "健身运动";
        Resume resume = new Resume(-1,user,rTitle,uName,uBirth,uGender,firstWorktime,tel,email,department,position,
                workExperience,education,expectSalary,hobbies);
        resumeService.addResume(resume);
        System.out.println(resumeService.queryResumes());
    }
}
