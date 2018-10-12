package com.li.handler;

import com.li.entity.User;
import com.li.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by 99234 on 2018/10/11.
 */
@Controller
@RequestMapping("user")
public class UserHandler {
    @Autowired
    @Qualifier("userService")
    private UserService userService;

    @RequestMapping("info")
    public String queryUsers(ModelMap modelMap){
        List<User> users = userService.queryUsers();
        modelMap.addAttribute("users",users);
        return "user/show";
    }

    @RequestMapping("loginInput")
    public String loginInput(){
        return "user/login";
    }

    @RequestMapping("registInput")
    public String registInput(){
        return "user/regist";
    }

    @RequestMapping("login")
    public String login(String name,String password,ModelMap modelMap){
        User user = userService.queryByNameAndPassword(name,password);
        if(user==null){
            User user1 = new User(-1,name,password);
            modelMap.addAttribute("userL1",user1);
            return "user/login";
        }
        modelMap.addAttribute("userL",user);
        return "forward:/user/jobInfo";
    }

    @RequestMapping("regist")
    public String regist(String name,String password,ModelMap modelMap){
        User user = userService.queryByNameAndPassword(name,password);
        if(user==null){
            User user1 = new User(-1,name,password);
            userService.addUser(user1);
            modelMap.addAttribute("userR1",user1);
            return "user/login";
        }
        modelMap.addAttribute("userR",user);
        return "user/regist";
    }

    @RequestMapping("jobInfo")
    public String jobInfo(){
        return "redirect:/jobInfo.jsp";
    }

}
