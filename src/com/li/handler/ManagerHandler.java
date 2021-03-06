package com.li.handler;


import com.li.entity.*;
import com.li.service.*;

import com.li.utils.DateUtil;
import com.li.utils.Md5Util;

import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    private SalaryService salaryService;
    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private InvitationService invitationService;
    @Autowired
    private DepartmentService departmentService;
    @Autowired
    private PositionService positionService;
    @Autowired
    private CommitRecordService commitRecordService;
    @Autowired
    private ResumeService resumeService;
    @Autowired
    private AwardService awardService;

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
        Manager manager = managerService.queryByNameAndPassword(name,password,type);
        if(manager==null){
            modelMap.addAttribute("flag","fail");
            return "manager/login";
        }
        if(type==1){
            session.removeAttribute("leader");
            session.setAttribute("leader",manager);
            List<Invitation> invitations = invitationService.queryAll();
            java.util.Date date = new java.util.Date();
            System.out.println(invitations);
            System.out.println("*****");
            for(int i=0;i<invitations.size();i++){
                int res = DateUtil.compareDate(invitations.get(i).getInviteTime(),date);
                if(res<0||invitations.get(i).getPass()!=0){
                    invitations.remove(i);
                }
            }
            System.out.println(invitations);
            modelMap.addAttribute("invitations",invitations);
            return "leader/leader";
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
        return "manager/manage";
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
        if(type==0){
            modelMap.addAttribute("flag","NO");
            return "manager/regist";
        }
        Department department = departmentService.queryById(dId);
        String dName = department.getName();
        Manager manager = new Manager(-1,name,password,type,dName,pName);
        password = Md5Util.md5(password);
        Manager manager1 = new Manager(-1,name,password,type,dName,pName);
        managerService.add(manager1);
        modelMap.addAttribute("managerR",manager);
        return "manager/login";
    }

    /**
     * 查看可入职员工
     * @param modelMap
     * @return
     */
    @RequestMapping("queryPass")
    public String queryPass(ModelMap modelMap){
        List<Invitation> invitations = invitationService.queryAll();
        List<CommitRecord> commitRecords = commitRecordService.queryCommitRecords();
        if(invitations!=null){
            for(int i=0;i<invitations.size();i++){
                if(invitations.get(i).getPass()!=1){
                    invitations.remove(i);
                    i--;
                }else {
                    int rId = commitRecordService.queryByCId(invitations.get(i).getcId()).getrId();
                    Employee employee = employeeService.queryByRId(rId);
                    if(employee!=null){
                        invitations.remove(i);
                        i--;
                    }
                }
            }
            System.out.println(invitations);
            modelMap.addAttribute("commitRecords",commitRecords);
            modelMap.addAttribute("invitations",invitations);
        }
        return "manager/queryPass";
    }
    /**
     * 查看管理员信息
     * @return
     */
    @RequestMapping("managerInfo")
    public String managerInfo(){
        return "manager/managerInfo";
    }

    /**
     * 跳转管理员更新界面
     * @param session
     * @param modelMap
     * @return
     */
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
    public String updateEmplInpu(Integer id,Integer rId,ModelMap modelMap){
        if(id==null){
            Resume resume = resumeService.queryById(rId);
            modelMap.addAttribute("resume",resume);
            return "manager/emplAdd";
        }
        Employee employee = employeeService.queryById(id);
        modelMap.addAttribute("employee",employee);
        return "manager/emplUpdate";
    }

    /**
     * 新增员工
     * @param rId
     * @param eName
     * @param gender
     * @param tel
     * @param email
     * @param dId
     * @param pId
     * @param entryTime
     * @param education
     * @param modelMap
     * @return
     */
    @RequestMapping("addEmpl")
    public String addEmpl(Integer rId,String eName,String gender,String tel,String email,int dId ,int pId,String entryTime,
                          String education,ModelMap modelMap){
        System.out.println(rId);
        Employee employee1 = employeeService.queryByName(eName);
        if(employee1!=null){
            modelMap.addAttribute("flagA","no");
            return "forward:/managers/emplInfo";
        }
        String ePassword = Md5Util.md5("000000");
        Date entryTime1 = Date.valueOf(entryTime);
        Date dimissionTime = Date.valueOf("1970-01-01");
        Employee employee = new Employee(-1,rId,eName,ePassword,gender,tel,email,dId,pId,entryTime1,dimissionTime,education);
        employeeService.addEmpl(employee);
        modelMap.addAttribute("flagA","ok");
        return "forward:/managers/emplInfo";
    }
    /**
     * 更新员工信息
     * @return
     */
    @RequestMapping("updateEmpl")
    public String updateEmpl(int eId,String eName,String ePassword,String gender,String tel,String email,int dId ,int pId,String entryTime,
                             String dimissionTime,String education,ModelMap modelMap,HttpSession session){
        Employee employee = employeeService.queryById(eId);
        ePassword = Md5Util.md5(ePassword);
        Date entryTime1 = Date.valueOf(entryTime);
        Date dimissionTime1 = Date.valueOf(dimissionTime);
        Employee employee1 = new Employee(eId,employee.getrId(),eName,ePassword,gender,tel,email,dId,pId,entryTime1,dimissionTime1,education);
        System.out.println(employee1);
        employeeService.updateEmpl(employee1);
        modelMap.addAttribute("flagU","Ok");
        return "forward:/managers/emplInfo";
    }

    /**
     * 跳转搜索部门员工界面
     * @param modelMap
     * @return
     */
    @RequestMapping("emplInfoByInput")
    public String emplInfoByInput(ModelMap modelMap){
        List<Department> departments = departmentService.queryAll();
        List<Position> positions = positionService.queryAll();
        modelMap.addAttribute("departments",departments);
        modelMap.addAttribute("positions",positions);
        return "manager/emplInfoByInput";
    }

    /**
     * 按照条件搜索部门员工
     * @param dId
     * @param pId
     * @param modelMap
     * @return
     */
    @RequestMapping("employeeInfo")
    public String employeeInfo(int dId,int pId,ModelMap modelMap){
        List<Employee> employees = employeeService.querySamePosition(dId,pId);
        modelMap.addAttribute("employees",employees);
        List<Department> departments = departmentService.queryAll();
        List<Position> positions = positionService.queryAll();
        modelMap.addAttribute("departments",departments);
        modelMap.addAttribute("positions",positions);
        modelMap.addAttribute("flag","OK");
        return "manager/emplInfoByInput";
    }

    /**
     * 跳转创建奖励界面
     * @param eId
     * @param modelMap
     * @return
     */
    @RequestMapping("addAwardInpu")
    public String addAwardInput(int eId,ModelMap modelMap){
        modelMap.addAttribute("eId",eId);
        return "manager/addAward";
    }

    /**
     *新增奖励表
     * @param eId
     * @param money
     * @param reason
     * @param modelMap
     * @return
     */
    @RequestMapping("addAward")
    public String addAward(int eId,double money,String reason,ModelMap modelMap){
        Date date = new Date(System.currentTimeMillis());
        Award award = new Award(-1,eId,money,reason,date);
        awardService.add(award);
        modelMap.addAttribute("award","OK");
        return "manager/manage";
    }

    /**
     * 跳转修改奖励界面
     * @param aId
     * @param modelMap
     * @return
     */
    @RequestMapping("updateAwardInput")
    public String updateAwardInput(int aId,ModelMap modelMap){
        Award award = awardService.queryById(aId);
        modelMap.addAttribute("award",award);
        return "manager/awardUpdate";
    }

    @RequestMapping("updateAward")
    public String updateAward(int aId,int eId,double money,String reason,ModelMap modelMap){
        Award award = awardService.queryById(aId);
        Award award1 = new Award(aId,eId,money,reason,award.getCreateTime());
        awardService.update(award1);
        modelMap.addAttribute("awardUpdate","OK");
        return "manager/manage";
    }
    /**
     * 查看奖励记录
     * @param modelMap
     * @return
     */
    @RequestMapping("awardInfo")
    public String awardInfo(ModelMap modelMap){
        List<Award> awards = awardService.queryAll();
        modelMap.addAttribute("awards",awards);
        return "manager/awardInfo";
    }

    /**
     * 删除奖励记录
     * @param aId
     * @return
     */
    @RequestMapping("deleteAward")
    @ResponseBody
    public String deleteAward(int aId){
        awardService.deleteById(aId);
        return "OK";
    }

}
