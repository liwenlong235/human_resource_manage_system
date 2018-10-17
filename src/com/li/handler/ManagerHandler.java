package com.li.handler;

import com.alibaba.fastjson.JSON;
import com.li.dao.PositionDao;
import com.li.entity.Department;
import com.li.entity.Manager;
import com.li.entity.Position;
import com.li.entity.Train;
import com.li.service.*;
import com.li.utils.Md5Util;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by 99234 on 2018/10/16.
 */
@Controller
@RequestMapping("managers")
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
    @Autowired
    private DepartmentService departmentService;
    @Autowired
    private PositionService positionService;

    /**
     * 跳转到管理员登陆界面
     * @return
     */
    @RequestMapping("loginInput")
    public String loginInout(HttpSession session){
        List<Department> departments = departmentService.queryDepartments();
        session.setAttribute("departments",departments);
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
        if(name==""||name==null){
            return "null";
        }
        Manager manager = managerService.queryByName(name);
        if(manager==null){
            return "OK";
        }else {
            return "NG";
        }
    }
    /**
     * 登陆验证
     * @param name
     * @param password
     * @param type
     * @param modelMap
     * @param session
     * @return
     */
    @RequestMapping("login")
    public String login(String name, String password, int type, ModelMap modelMap, HttpSession session){
        session.removeAttribute("manager");
        password = Md5Util.md5(password);
        Manager manager = managerService.queryByNameAndPassword(name,password);
        if(manager==null){
            modelMap.addAttribute("flag","fail");
            return "manager/login";
        }
        session.setAttribute("manager",manager);
        if(type==0){
            return "manager/manage";
        }else {
            return "manager/leader";
        }
    }

    /**
     * 注册验证
     * @param name
     * @param password
     * @param type
     * @param dId
     * @param pName
     * @param modelMap
     * @return
     */
    @RequestMapping("regist")
    public String regist(String name, String password, int type, int dId, String pName,ModelMap modelMap){
        Department department = departmentService.queryById(dId);
        String dName = department.getName();
        Manager manager = new Manager(-1,name,password,type,dName,pName);
        System.out.println(manager);
        password = Md5Util.md5(password);
        Manager manager1 = new Manager(-1,name,password,type,dName,pName);
        System.out.println(manager1);
        managerService.add(manager1);
        modelMap.addAttribute("managerR",manager);
        return "manager/login";
    }

    /**
     * 查看管理员信息
     * @return
     */
    @RequestMapping("managerInfo")
    public String managerInfo(){
        return "managerInfo";
    }
    @RequestMapping("managerUpdate")
    public String managerUpdate(){
        return "managerUpdate";
    }
}
