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

    /**
     * 游客信息查询
     * @param modelMap
     * @return
     */
    @RequestMapping("info")
    public String queryUsers(ModelMap modelMap){
        List<User> users = userService.queryUsers();
        modelMap.addAttribute("users",users);
        return "user/show";
    }

    /**
     * 转入游客登陆界面
     * @return
     */
    @RequestMapping("loginInput")
    public String loginInput(){
        return "user/login";
    }

    /**
     * 转入游客注册界面
     * @return
     */
    @RequestMapping("registInput")
    public String registInput(){
        return "user/regist";
    }

    /**
     * 跳转招聘信息界面
     * @return
     */
    @RequestMapping("jobInfo")
    public String jobInfo(){
        return "redirect:/jobInfo.jsp";
    }

    /**
     * 登陆提交验证
     * @param name
     * @param password
     * @param modelMap
     * @return
     */
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

    /**
     * 注册提交验证
     * @param name
     * @param password
     * @param modelMap
     * @return
     */
    @RequestMapping("regist")
    public String regist(String name,String password,ModelMap modelMap){
        User user = new User(-1,name,password);
        userService.addUser(user);
        modelMap.addAttribute("userR",user);
        return "user/login";
    }

    /**
     * 账号内容验证
     * @param name
     * @return
     */
    @RequestMapping("ajaxName")
    @ResponseBody
    public String ajaxName(String name){
        if(name==""||name==null){
            return "null";
        }
        User user = userService.queryByName(name);
        if(user!=null){
            return "NG";
        }else {
            return "OK";
        }
    }


}
