package com.li.test;

import com.li.entity.User;
import com.li.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created by 99234 on 2018/10/12.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class Main {
    @Autowired
    private UserService userService;
    @Test
    public void login(){
        User user1 = new User(-1,"张三1","12345");
        //User user = userService.queryByNameAndPassword(user1.getName(),user1.getPassword());
        //System.out.println(user);
        userService.addUser(user1);
    }
}
