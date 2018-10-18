package com.li.handler;


import com.li.entity.*;
import com.li.service.*;

import com.li.utils.Md5Util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.servlet.http.HttpSession;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
        List<Position> positions = positionService.queryAll();
        List<Department> departments = departmentService.queryDepartments();
        session.setAttribute("positions",positions);
        session.setAttribute("departments",departments);
        List<String> educations = new ArrayList<>();
        educations.add("高中及以下");
        educations.add("大专");
        educations.add("本科");
        educations.add("硕士");
        educations.add("博士及以上");
        session.setAttribute("educations",educations);
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
        return "manager/managerInfo";
    }
    @RequestMapping("managerUpdateInput")
    public String managerUpdateInput(HttpSession session,ModelMap modelMap){
        Manager manager = (Manager) session.getAttribute("manager");
        Department department = departmentService.queryByName(manager.getdName());
        modelMap.addAttribute("mDepartment",department);
        return "manager/managerUpdate";
    }

    /**
     * 更新管理员信息
     * @param name
     * @param password
     * @param type
     * @param dId
     * @param pName
     * @param modelMap
     * @param session
     * @return
     */
    @RequestMapping("managerUpdate")
    public String managerUpdate(String name, String password, int type, int dId, String pName,ModelMap modelMap,HttpSession session){
        Manager manager = (Manager) session.getAttribute("manager");
        Department department = departmentService.queryById(dId);
        String dName = department.getName();
        if(!manager.getmPassword().equals(password)){
            password = Md5Util.md5(password);
        }
        Manager manager1 = new Manager(manager.getmId(),name,password,type,dName,pName);
        managerService.update(manager1);
        session.removeAttribute("manager");
        session.setAttribute("manager",manager1);
        return "forward:/managers/managerInfo";
    }

    /**
     * 员工信息查询
     * @param session
     * @return
     */
    @RequestMapping("emplInfo")
    public String emplInfo(HttpSession session){
        List<Employee> employees = employeeService.queryEmployees();
        session.setAttribute("employees",employees);
        return "manager/emplInfo";
    }

    /**
     * 删除员工
     * @param id
     * @return
     */
    @RequestMapping("deleteEmpl")
    @ResponseBody
    public String deleteEmpl(int id){
        Employee employee = employeeService.queryById(id);
        String date = new SimpleDateFormat("yyyy-MM-dd").format(employee.getDimissionTime());
        if("1970-01-01".equals(date)){
            return "NG";
        }
        employeeService.deleteById(id);
        return "OK";
    }

    /**
     *跳转员工更新页面
     * @param id
     * @param modelMap
     * @return
     */
    @RequestMapping("emplInput")
    public String updateEmplInpu(Integer id,ModelMap modelMap){
        if(id==null){
            return "manager/emplAdd";
        }
        Employee employee = employeeService.queryById(id);
        modelMap.addAttribute("employee",employee);
        return "manager/emplUpdate";
    }

    @RequestMapping("addEmpl")
    public String addEmpl(String eName,String gender,String tel,String email,int dId ,int pId,String entryTime,
                          String education,ModelMap modelMap){
        Employee employee1 = employeeService.queryByName(eName);
        if(employee1!=null){
            modelMap.addAttribute("flagA","no");
            return "manager/emplInfo";
        }
        String ePassword = "000000";
        Date entryTime1 = Date.valueOf(entryTime);
        Date dimissionTime = Date.valueOf("1970-01-01");
        Employee employee = new Employee(-1,eName,ePassword,gender,tel,email,dId,pId,entryTime1,dimissionTime,education);
        employeeService.addEmpl(employee);
        modelMap.addAttribute("flagA","ok");
        return "manager/emplInfo";
    }
    /**
     * 更新员工信息
     * @return
     */
    @RequestMapping("updateEmpl")
    public String updateEmpl(int eId,String eName,String ePassword,String gender,String tel,String email,int dId ,int pId,String entryTime,
                             String dimissionTime,String education,ModelMap modelMap){
        Employee employee = employeeService.queryById(eId);
        Date entryTime1 = Date.valueOf(entryTime);
        Date dimissionTime1 = Date.valueOf(dimissionTime);
        Employee employee1 = new Employee(eId,eName,ePassword,gender,tel,email,dId,pId,entryTime1,dimissionTime1,education);
        employeeService.updateEmpl(employee1);
        modelMap.addAttribute("flagU","Ok");
        return "manager/emplInfo";
    }
}
