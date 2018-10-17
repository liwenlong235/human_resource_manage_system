package com.li.handler;

import com.li.entity.Manager;
import com.li.entity.Train;
import com.li.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by 99234 on 2018/10/16.
 */
@Controller
@RequestMapping("manager")
public class ManagerHandler {
    @Autowired
    private ManagerService managerService;
    @Autowired
    private TrainService trainService;
    @Autowired
    private AttendanceService attendanceService;
    @Autowired
    private AwardService awardService;
    @Autowired
    private SalaryService salaryService;
    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private InvitationService invitationService;

    /**
     * 跳转到管理员登陆界面
     * @return
     */
    @RequestMapping("loginInput")
    public String loginInout(){
        return "manager/login";
    }

    /**
     * 跳转到管理员注册界面
     * @return
     */
    @RequestMapping("registInput")
    public String registInput(){
        return "manager/regist";
    }

    /**
     * 验证姓名是否存在
     * @param name
     * @return
     */
    @RequestMapping("nameAjax")
    @ResponseBody
    public String nameAjax(String name){
        if(name==null||name==""){
            return "null";
        }
        Manager manager = managerService.queryByName(name);
        if(manager==null){
            return "NG";
        }else {
            return "OK";
        }
    }

    @RequestMapping("login")
    public String login(String name,String password,int type){
        Manager manager = managerService.queryByNameAndPassword(name,password);

        return "";
    }

}
