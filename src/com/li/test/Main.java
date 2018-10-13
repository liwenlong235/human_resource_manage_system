package com.li.test;

import com.li.dao.DepartmentDao;
import com.li.entity.Department;
import com.li.entity.User;
import com.li.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

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
    @Test
    public void login(){
        List<Department> departments = departmentDao.queryDepartments();
        for(Department d:departments){
            System.out.println(d);
        }
    }
}
